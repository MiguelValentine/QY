#!/usr/bin/env python3
"""安全提取已解码的 FCC 资源，并生成逐文件校验清单。"""

from __future__ import annotations

import argparse
import hashlib
import json
import os
import re
import subprocess
import tempfile
import unicodedata
from pathlib import Path, PurePosixPath

from decode_fcc import CAB_MAGIC, MAGIC, RAW_MAGIC, decode_artifact


def sha256(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def contained(path: Path, root: Path) -> Path:
    resolved = path.resolve()
    if not resolved.is_relative_to(root):
        raise ValueError(f"path escapes output root: {path}")
    return resolved


def safe_member_name(name: str) -> str:
    normalized = name.replace("\\", "/")
    if not normalized or normalized.startswith("/") or re.match(r"^[A-Za-z]:", normalized):
        raise ValueError(f"absolute or empty CAB member path: {name!r}")
    if "\x00" in normalized or ":" in normalized:
        raise ValueError(f"unsafe CAB member path: {name!r}")

    parts = normalized.rstrip("/").split("/")
    if any(part in ("", ".", "..") for part in parts):
        raise ValueError(f"unsafe CAB member path: {name!r}")
    if any(part.endswith((".", " ")) for part in parts):
        raise ValueError(f"non-portable CAB member path: {name!r}")
    return PurePosixPath(*parts).as_posix()


def cab_entries(cab_path: Path) -> list[dict[str, object]]:
    result = subprocess.run(
        ["7z", "l", "-slt", str(cab_path)],
        check=True,
        capture_output=True,
        text=True,
    )
    listing = result.stdout.split("----------", 1)
    if len(listing) != 2:
        raise ValueError("7z did not return a CAB member listing")

    entries: list[dict[str, object]] = []
    seen: set[str] = set()
    for block in listing[1].strip().split("\n\n"):
        properties: dict[str, str] = {}
        for line in block.splitlines():
            if " = " in line:
                key, value = line.split(" = ", 1)
                properties[key] = value
        name = properties.get("Path")
        if not name or "Type" in properties:
            continue
        if any("link" in key.lower() for key in properties):
            raise ValueError(f"link-like CAB member is not allowed: {name!r}")

        safe_name = safe_member_name(name)
        folded = unicodedata.normalize("NFD", safe_name).casefold()
        if folded in seen:
            raise ValueError(f"duplicate CAB member path: {name!r}")
        seen.add(folded)
        entries.append(
            {
                "name": safe_name,
                "is_dir": properties.get("Folder") in ("+", "1"),
                "size": int(properties.get("Size", "0")),
            }
        )

    if not entries:
        raise ValueError("CAB contains no members")

    files = {str(entry["name"]) for entry in entries if not entry["is_dir"]}
    for entry in entries:
        name = str(entry["name"])
        if not entry["is_dir"] and any(other.startswith(name + "/") for other in files):
            raise ValueError(f"CAB file conflicts with a child path: {name!r}")
    return entries


def tree_hashes(root: Path) -> dict[str, tuple[int, str]]:
    records: dict[str, tuple[int, str]] = {}
    for current, dirs, files in os.walk(root, followlinks=False):
        current_path = Path(current)
        for name in dirs:
            path = current_path / name
            if path.is_symlink():
                raise ValueError(f"extracted symlink is not allowed: {path}")
        for name in files:
            path = current_path / name
            if path.is_symlink() or not path.is_file():
                raise ValueError(f"non-regular extracted member: {path}")
            rel = path.relative_to(root).as_posix()
            data = path.read_bytes()
            records[rel] = (len(data), sha256(data))
    return records


def verify_member_tree(stage: Path, entries: list[dict[str, object]]) -> dict[str, tuple[int, str]]:
    records = tree_hashes(stage)
    expected = {str(entry["name"]) for entry in entries if not entry["is_dir"]}
    if set(records) != expected:
        raise ValueError(
            f"extracted member set differs from CAB listing: "
            f"missing={sorted(expected - set(records))[:5]} "
            f"unexpected={sorted(set(records) - expected)[:5]}"
        )
    for entry in entries:
        if not entry["is_dir"] and records[str(entry["name"])][0] != int(entry["size"]):
            raise ValueError(f"extracted size differs from CAB listing: {entry['name']}")
    return records


def output_records(root: Path, files: dict[str, tuple[int, str]]) -> list[dict[str, object]]:
    return [
        {
            "path": (root / name).as_posix(),
            "size": size,
            "sha256": digest,
        }
        for name, (size, digest) in sorted(files.items())
    ]


def write_manifest(path: Path, manifest: dict[str, object]) -> None:
    temp_path = path.with_suffix(path.suffix + ".tmp")
    temp_path.write_text(json.dumps(manifest, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    temp_path.replace(path)


def extract_one(source: Path, source_root: Path, output_root: Path) -> dict[str, object]:
    source_rel = source.relative_to(source_root)
    source_bytes = source.read_bytes()
    decoded, artifact_format = decode_artifact(source_bytes)
    source_hash = sha256(source_bytes)
    decoded_hash = sha256(decoded)
    output_rel_root = output_root.relative_to(Path.cwd())

    if artifact_format == "cd1-raw":
        relative_output = source_rel.with_suffix(".cod")
        destination = contained(output_root / relative_output, output_root)
        destination.parent.mkdir(parents=True, exist_ok=True)
        contained(destination.parent, output_root)
        if destination.exists():
            if destination.is_symlink() or not destination.is_file():
                raise ValueError(f"existing output is not a regular file: {destination}")
            existing = destination.read_bytes()
            if existing != decoded:
                raise FileExistsError(f"existing output differs; refusing to overwrite: {destination}")
        else:
            with tempfile.NamedTemporaryFile(dir=destination.parent, prefix=".fcc-", delete=False) as temp:
                temp.write(decoded)
                temp_path = Path(temp.name)
            temp_path.replace(destination)
        outputs = [
            {
                "path": (output_rel_root / relative_output).as_posix(),
                "size": len(decoded),
                "sha256": decoded_hash,
            }
        ]
        return {
            "source": source_rel.as_posix(),
            "source_header": RAW_MAGIC.decode("ascii"),
            "source_size": len(source_bytes),
            "source_sha256": source_hash,
            "decoded_format": artifact_format,
            "decoded_size": len(decoded),
            "decoded_sha256": decoded_hash,
            "outputs": outputs,
            "status": "verified_extracted",
        }

    if artifact_format != "xy20-cab" or not decoded.startswith(CAB_MAGIC):
        raise ValueError(f"unexpected decoded format: {artifact_format}")
    relative_dir = source_rel.with_suffix("")
    if (source_root / relative_dir).is_dir():
        relative_dir = source_rel
    destination_dir = contained(output_root / relative_dir, output_root)
    entries: list[dict[str, object]]
    with tempfile.TemporaryDirectory(prefix=".fcc-stage-", dir=output_root) as temp_dir:
        temp_root = Path(temp_dir)
        cab_path = temp_root / "decoded.cab"
        cab_path.write_bytes(decoded)
        entries = cab_entries(cab_path)
        members_dir = temp_root / "members"
        members_dir.mkdir()
        subprocess.run(
            ["7z", "x", "-y", f"-o{members_dir}", str(cab_path)],
            check=True,
            capture_output=True,
            text=True,
        )
        member_hashes = verify_member_tree(members_dir, entries)

        destination_dir.parent.mkdir(parents=True, exist_ok=True)
        contained(destination_dir.parent, output_root)
        if destination_dir.exists():
            if destination_dir.is_symlink() or not destination_dir.is_dir():
                raise ValueError(f"existing output is not a directory: {destination_dir}")
            existing_hashes = tree_hashes(destination_dir)
            if existing_hashes != member_hashes:
                raise FileExistsError(
                    f"existing output differs; refusing to overwrite: {destination_dir}"
                )
        else:
            members_dir.rename(destination_dir)

    member_records = output_records(output_rel_root / relative_dir, member_hashes)
    return {
        "source": source_rel.as_posix(),
        "source_header": MAGIC.decode("ascii"),
        "source_size": len(source_bytes),
        "source_sha256": source_hash,
        "decoded_format": artifact_format,
        "decoded_size": len(decoded),
        "decoded_sha256": decoded_hash,
        "cab_members": len(member_hashes),
        "outputs": member_records,
        "status": "verified_extracted",
    }


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--source", type=Path, default=Path("CLIENT"))
    parser.add_argument("--output", type=Path, default=Path("analysis/decoded"))
    parser.add_argument(
        "--manifest",
        type=Path,
        default=Path("analysis/evidence/decode-verification.json"),
    )
    parser.add_argument(
        "--resume",
        action="store_true",
        help="retry only failed entries in an existing manifest",
    )
    args = parser.parse_args()

    source_root = args.source.resolve()
    output_root = args.output.resolve()
    manifest_path = args.manifest.resolve()
    if not source_root.is_dir():
        parser.error(f"source directory does not exist: {source_root}")
    if output_root.exists() and output_root.is_symlink():
        parser.error(f"output root must not be a symlink: {output_root}")
    output_root.mkdir(parents=True, exist_ok=True)
    if manifest_path.exists() and not args.resume:
        parser.error(f"manifest already exists; refusing to overwrite: {manifest_path}")
    if not manifest_path.parent.is_dir():
        parser.error(f"manifest directory does not exist: {manifest_path.parent}")

    if args.resume:
        if not manifest_path.is_file():
            parser.error(f"resume manifest does not exist: {manifest_path}")
        manifest = json.loads(manifest_path.read_text(encoding="utf-8"))
        if manifest.get("source_root") != source_root.as_posix():
            parser.error("resume manifest source_root does not match")
        if manifest.get("output_root") != output_root.relative_to(Path.cwd()).as_posix():
            parser.error("resume manifest output_root does not match")
        entries: list[dict[str, object]] = manifest["entries"]
        by_source = {str(entry["source"]): entry for entry in entries}
        failed_sources = {str(entry["source"]) for entry in entries if entry["status"] == "failed"}
        failures = 0
        for index, source_rel in enumerate(sorted(failed_sources), start=1):
            source = source_root / source_rel
            old_entry = by_source[source_rel]
            try:
                replacement = extract_one(source, source_root, output_root)
                entries[entries.index(old_entry)] = replacement
            except Exception as exc:
                failures += 1
                old_entry.update(
                    {
                        "source_header": source.read_bytes()[:4].decode("ascii", errors="replace"),
                        "source_sha256": sha256(source.read_bytes()),
                        "status": "failed",
                        "error": f"{type(exc).__name__}: {exc}",
                    }
                )
            manifest["summary"] = {
                "total": len(entries),
                "verified_extracted": sum(
                    entry["status"] == "verified_extracted" for entry in entries
                ),
                "skipped_unsupported_header": sum(
                    entry["status"] == "skipped_unsupported_header" for entry in entries
                ),
                "failed": sum(entry["status"] == "failed" for entry in entries),
            }
            write_manifest(manifest_path, manifest)
            if index % 25 == 0 or index == len(failed_sources):
                print(
                    f"[retry {index}/{len(failed_sources)}] "
                    f"extracted={manifest['summary']['verified_extracted']} "
                    f"failed={manifest['summary']['failed']}"
                )
        return 1 if manifest["summary"]["failed"] else 0

    paths = sorted(
        path
        for path in source_root.rglob("*")
        if path.is_file() and path.suffix.lower() == ".fcc"
    )
    manifest: dict[str, object] = {
        "format_version": 1,
        "source_root": source_root.as_posix(),
        "output_root": output_root.relative_to(Path.cwd()).as_posix(),
        "entries": [],
        "summary": {},
    }
    entries: list[dict[str, object]] = manifest["entries"]  # type: ignore[assignment]
    failures = 0
    write_manifest(manifest_path, manifest)

    for index, source in enumerate(paths, start=1):
        header = source.read_bytes()[:4]
        if header not in (MAGIC, RAW_MAGIC):
            entries.append(
                {
                    "source": source.relative_to(source_root).as_posix(),
                    "source_header": header.hex(),
                    "status": "skipped_unsupported_header",
                }
            )
        else:
            try:
                entries.append(extract_one(source, source_root, output_root))
            except Exception as exc:
                failures += 1
                entries.append(
                    {
                        "source": source.relative_to(source_root).as_posix(),
                        "source_header": header.decode("ascii", errors="replace"),
                        "source_sha256": sha256(source.read_bytes()),
                        "status": "failed",
                        "error": f"{type(exc).__name__}: {exc}",
                    }
                )

        summary = {
            "total": len(paths),
            "verified_extracted": sum(entry["status"] == "verified_extracted" for entry in entries),
            "skipped_unsupported_header": sum(
                entry["status"] == "skipped_unsupported_header" for entry in entries
            ),
            "failed": failures,
        }
        manifest["summary"] = summary
        write_manifest(manifest_path, manifest)
        if index % 25 == 0 or index == len(paths):
            print(
                f"[{index}/{len(paths)}] extracted={summary['verified_extracted']} "
                f"skipped={summary['skipped_unsupported_header']} failed={failures}"
            )

    return 1 if failures else 0


if __name__ == "__main__":
    raise SystemExit(main())

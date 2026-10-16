#!/usr/bin/env python3
"""为静态解码文件中的指定 ASCII 候选内容建立索引。"""

from __future__ import annotations

import argparse
import hashlib
import ipaddress
import json
import re
from pathlib import Path
from typing import Iterator


ROOT = Path(__file__).resolve().parents[2]
DEFAULT_INPUT = ROOT / "analysis/decoded"
DEFAULT_OUTPUT = ROOT / "analysis/evidence/decoded-content-index.json"
MIN_STRING_LENGTH = 4
CLASS_NAMES = (
    "CPacManItemSys",
    "CPacManMapSys",
    "CPacManCoinSys",
    "showdown",
)
PATH_RE = re.compile(r"(?i)(?:[A-Z0-9_.:-]*[\\/])*[A-Z0-9_.-]+\.(?:fcc|dll)\b")
URL_RE = re.compile(r"(?i)\bhttps?://[^\s\"'<>]+")
IP_PORT_RE = re.compile(r"(?<![A-Za-z0-9_.])(\d{1,3}(?:\.\d{1,3}){3}):(\d{1,5})(?!\d)")
CLASS_RE = re.compile(r"\b(?:" + "|".join(map(re.escape, CLASS_NAMES)) + r")\b")


def ascii_strings(data: bytes) -> Iterator[tuple[int, str]]:
    start: int | None = None
    for offset, value in enumerate(data):
        if 0x20 <= value <= 0x7E:
            if start is None:
                start = offset
        elif start is not None:
            if offset - start >= MIN_STRING_LENGTH:
                yield start, data[start:offset].decode("ascii")
            start = None
    if start is not None and len(data) - start >= MIN_STRING_LENGTH:
        yield start, data[start:].decode("ascii")


def candidates(text: str) -> list[dict[str, str]]:
    matches: list[dict[str, str]] = []
    for match in PATH_RE.finditer(text):
        matches.append({"type": "fcc_dll_path", "value": match.group(0)})
    for match in CLASS_RE.finditer(text):
        matches.append({"type": "plugin_class_name", "value": match.group(0)})
    for match in URL_RE.finditer(text):
        matches.append({"type": "url_candidate", "value": match.group(0)})
    for match in IP_PORT_RE.finditer(text):
        host, port_text = match.groups()
        try:
            ipaddress.IPv4Address(host)
        except ipaddress.AddressValueError:
            continue
        port = int(port_text)
        if 1 <= port <= 65535:
            matches.append({"type": "ip_port_candidate", "value": f"{host}:{port}"})
    return matches


def scan_file(path: Path, base: Path) -> tuple[dict, int]:
    data = path.read_bytes()
    hits = []
    string_count = 0
    for offset, text in ascii_strings(data):
        string_count += 1
        found = candidates(text)
        if found:
            hits.append({
                "offset": offset,
                "offset_hex": f"0x{offset:x}",
                "ascii": text,
                "matches": found,
            })
    return ({
        "path": path.relative_to(base).as_posix(),
        "size_bytes": len(data),
        "sha256": hashlib.sha256(data).hexdigest(),
        "ascii_string_count": string_count,
        "hits": hits,
    }, string_count)


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--input", type=Path, default=DEFAULT_INPUT,
                        help="decoded file or directory (default: analysis/decoded)")
    parser.add_argument("--output", type=Path, default=DEFAULT_OUTPUT,
                        help="JSON output path (default: analysis/evidence/decoded-content-index.json)")
    args = parser.parse_args()

    input_path = args.input.resolve()
    if not input_path.exists():
        parser.error(f"input does not exist: {input_path}")
    if input_path.is_file():
        files = [input_path]
        base = input_path.parent
    else:
        files = sorted(path for path in input_path.rglob("*") if path.is_file())
        base = input_path

    records = []
    total_strings = 0
    for path in files:
        record, string_count = scan_file(path, base)
        records.append(record)
        total_strings += string_count

    document = {
        "schema_version": 1,
        "scope": (
            "Static scan of decoded-file bytes for printable ASCII strings and selected candidates. "
            "A string match does not establish an executed import, loaded plugin, or network request."
        ),
        "input_root": (
            input_path.relative_to(ROOT).as_posix()
            if input_path.is_relative_to(ROOT)
            else str(input_path)
        ),
        "minimum_ascii_string_length": MIN_STRING_LENGTH,
        "files_scanned": len(records),
        "ascii_strings_scanned": total_strings,
        "candidate_counts": {
            kind: sum(
                1
                for record in records
                for hit in record["hits"]
                for match in hit["matches"]
                if match["type"] == kind
            )
            for kind in (
                "fcc_dll_path",
                "plugin_class_name",
                "url_candidate",
                "ip_port_candidate",
            )
        },
        "files": records,
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(document, ensure_ascii=False, indent=2) + "\n")
    print(
        f"Scanned {len(records)} file(s), {total_strings} ASCII string(s); "
        f"wrote {args.output}"
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())

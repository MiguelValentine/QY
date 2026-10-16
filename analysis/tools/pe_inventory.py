#!/usr/bin/env python3
"""构建 PE 可执行文件与 DLL 的静态清单。"""

from __future__ import annotations

import argparse
import hashlib
import json
import re
import sys
from pathlib import Path
from typing import Any

try:
    import pefile
except ImportError as exc:
    raise SystemExit(
        "Missing dependency: pefile. Run this script with the prepared REA "
        "analysis virtual environment."
    ) from exc


ASCII_RUN = re.compile(rb"[\x20-\x7e]{4,}")
PE_SUFFIXES = {".exe", ".dll"}


def decode_bytes(value: bytes | None) -> str | None:
    if value is None:
        return None
    return value.decode("utf-8", errors="replace")


def resource_label(entry: Any) -> str | int | None:
    name = getattr(entry, "name", None)
    if name is not None:
        raw_name = getattr(name, "string", None)
        if raw_name is not None:
            return decode_bytes(raw_name)
        return str(name)
    return getattr(entry, "id", None)


def resource_inventory(pe: pefile.PE) -> dict[str, Any]:
    resources: list[dict[str, Any]] = []

    def walk(entries: list[Any], labels: list[str | int | None]) -> None:
        for entry in entries:
            label = resource_label(entry)
            next_labels = [*labels, label]
            directory = getattr(entry, "directory", None)
            if directory is not None:
                walk(directory.entries, next_labels)
                continue

            data_entry = getattr(entry, "data", None)
            data_struct = getattr(data_entry, "struct", None)
            if data_struct is None:
                continue
            resources.append(
                {
                    "path": next_labels,
                    "rva": int(data_struct.OffsetToData),
                    "size": int(data_struct.Size),
                    "codepage": int(data_struct.CodePage),
                }
            )

    directory = getattr(pe, "DIRECTORY_ENTRY_RESOURCE", None)
    if directory is not None:
        walk(directory.entries, [])

    return {"count": len(resources), "entries": resources}


def section_inventory(pe: pefile.PE) -> list[dict[str, Any]]:
    sections = []
    for section in pe.sections:
        raw_start = int(section.PointerToRawData)
        raw_size = int(section.SizeOfRawData)
        virtual_start = int(section.VirtualAddress)
        virtual_size = int(section.Misc_VirtualSize)
        sections.append(
            {
                "name": section.Name.rstrip(b"\0").decode(
                    "ascii", errors="replace"
                ),
                "rva_start": virtual_start,
                "rva_end": virtual_start + max(virtual_size, raw_size),
                "virtual_size": virtual_size,
                "raw_offset_start": raw_start,
                "raw_offset_end": raw_start + raw_size,
                "raw_size": raw_size,
                "entropy": float(section.get_entropy()),
            }
        )
    return sections


def import_inventory(pe: pefile.PE) -> list[dict[str, Any]]:
    imports = []
    pointer_size = 8 if pe.PE_TYPE == pefile.OPTIONAL_HEADER_MAGIC_PE_PLUS else 4
    directories = getattr(pe, "DIRECTORY_ENTRY_IMPORT", [])
    for library in directories:
        library_name = decode_bytes(library.dll)
        first_thunk = int(library.struct.FirstThunk)
        for index, symbol in enumerate(library.imports):
            imports.append(
                {
                    "library": library_name,
                    "name": decode_bytes(symbol.name),
                    "ordinal": (
                        int(symbol.ordinal) if symbol.ordinal is not None else None
                    ),
                    "iat_va": int(pe.OPTIONAL_HEADER.ImageBase)
                    + first_thunk
                    + index * pointer_size,
                }
            )
    return imports


def export_inventory(pe: pefile.PE) -> list[dict[str, Any]]:
    exports = []
    directory = getattr(pe, "DIRECTORY_ENTRY_EXPORT", None)
    if directory is None:
        return exports

    image_base = int(pe.OPTIONAL_HEADER.ImageBase)
    for symbol in directory.symbols:
        rva = int(symbol.address)
        exports.append(
            {
                "name": decode_bytes(symbol.name),
                "ordinal": int(symbol.ordinal),
                "rva": rva,
                "va": image_base + rva,
                "forwarder": decode_bytes(symbol.forwarder),
            }
        )
    return exports


def string_inventory(blob: bytes, pe: pefile.PE) -> list[dict[str, Any]]:
    image_base = int(pe.OPTIONAL_HEADER.ImageBase)
    size_of_headers = int(pe.OPTIONAL_HEADER.SizeOfHeaders)
    sections = [
        (
            int(section.PointerToRawData),
            int(section.PointerToRawData) + int(section.SizeOfRawData),
            int(section.VirtualAddress),
        )
        for section in pe.sections
    ]

    strings = []
    for match in ASCII_RUN.finditer(blob):
        offset = match.start()
        rva = None
        if offset < size_of_headers:
            rva = offset
        else:
            for raw_start, raw_end, section_rva in sections:
                if raw_start <= offset < raw_end:
                    rva = section_rva + offset - raw_start
                    break
        strings.append(
            {
                "file_offset": offset,
                "rva": rva,
                "va": image_base + rva if rva is not None else None,
                "value": match.group().decode("ascii"),
            }
        )
    return strings


def inventory_file(path: Path, root: Path) -> dict[str, Any]:
    blob = path.read_bytes()
    record: dict[str, Any] = {
        "path": path.relative_to(root).as_posix(),
        "size": len(blob),
        "sha256": hashlib.sha256(blob).hexdigest(),
    }
    try:
        pe = pefile.PE(data=blob, fast_load=False)
        image_base = int(pe.OPTIONAL_HEADER.ImageBase)
        entry_rva = int(pe.OPTIONAL_HEADER.AddressOfEntryPoint)
        record.update(
            {
                "machine": int(pe.FILE_HEADER.Machine),
                "entry_rva": entry_rva,
                "entry_va": image_base + entry_rva,
                "imagebase": image_base,
                "sections": section_inventory(pe),
                "imports": import_inventory(pe),
                "exports": export_inventory(pe),
                "resources": resource_inventory(pe),
                "ascii_strings": string_inventory(blob, pe),
            }
        )
        pe.close()
    except pefile.PEFormatError as exc:
        record["parse_error"] = str(exc)
    return record


def parse_args() -> argparse.Namespace:
    project_root = Path(__file__).resolve().parents[2]
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--root",
        type=Path,
        default=project_root / "CLIENT",
        help="directory to scan recursively (default: ../CLIENT)",
    )
    parser.add_argument(
        "--output",
        type=Path,
        default=project_root / "analysis/evidence/pe-inventory.json",
        help="JSON output path (default: ../analysis/evidence/pe-inventory.json)",
    )
    return parser.parse_args()


def main() -> int:
    args = parse_args()
    root = args.root.expanduser().resolve()
    output = args.output.expanduser().resolve()
    if not root.is_dir():
        print(f"Root directory does not exist: {root}", file=sys.stderr)
        return 2

    targets = sorted(
        (
            path
            for path in root.rglob("*")
            if path.is_file() and path.suffix.lower() in PE_SUFFIXES
        ),
        key=lambda path: path.relative_to(root).as_posix().casefold(),
    )
    records = [inventory_file(path, root) for path in targets]
    document = {
        "schema_version": 1,
        "root": str(root),
        "file_count": len(records),
        "files": records,
    }
    output.parent.mkdir(parents=True, exist_ok=True)
    output.write_text(
        json.dumps(document, ensure_ascii=False, indent=2) + "\n",
        encoding="utf-8",
    )
    print(f"Wrote {len(records)} PE records to {output}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())

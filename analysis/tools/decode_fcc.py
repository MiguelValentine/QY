#!/usr/bin/env python3
"""解码以 XY20 封装的 Microsoft Cabinet（.fcc）文件。"""

from __future__ import annotations

import argparse
import struct
from pathlib import Path


MAGIC = b"XY20"
RAW_MAGIC = b"!CD1"
CAB_MAGIC = b"MSCF"
RAW_PAYLOAD_MAGIC = b"FC0A"
LFSR_MASK = 0xE7BD2160
UINT32_MASK = 0xFFFFFFFF


def _next_word(state: int) -> int:
    for _ in range(32):
        masked = state & LFSR_MASK
        mixed = int.from_bytes(masked.to_bytes(4, "little"), "big")
        mixed = ((mixed & 0xFFFF) ^ (masked & 0xFFFF)) & 0xFFFF
        odd_parity = (((mixed >> 8) ^ mixed) & 0xFF).bit_count() & 1
        state = (state << 1) & UINT32_MASK
        if odd_parity:
            state = (state + 1) & UINT32_MASK
    return state


def _xor_words(data: bytes, seed: int) -> bytearray:
    decoded = bytearray(data)
    state = seed & UINT32_MASK
    for offset in range(0, len(data) & ~3, 4):
        state = _next_word(state)
        word = struct.unpack_from("<I", data, offset)[0] ^ state
        struct.pack_into("<I", decoded, offset, word)
    return decoded


def decode_artifact(data: bytes) -> tuple[bytes, str]:
    if data.startswith(MAGIC):
        decoded = _xor_words(data, len(data))
        # 原始程序先验证变换后的内容，再恢复 CAB 文件标记。
        decoded[:4] = CAB_MAGIC
        if len(decoded) < 12 or struct.unpack_from("<I", decoded, 8)[0] != len(decoded):
            raise ValueError("decoded CAB length does not match the input size")
        return bytes(decoded), "xy20-cab"

    if data.startswith(RAW_MAGIC):
        payload = data[4:]
        decoded = _xor_words(payload, len(payload))
        if not decoded.startswith(RAW_PAYLOAD_MAGIC):
            raise ValueError("decoded !CD1 payload does not begin with FC0A")
        return bytes(decoded), "cd1-raw"

    raise ValueError("input does not begin with XY20 or !CD1")


def decode(data: bytes) -> bytes:
    return decode_artifact(data)[0]


def files_at(path: Path) -> list[Path]:
    if path.is_file():
        return [path]
    return sorted(candidate for candidate in path.rglob("*") if candidate.is_file() and candidate.suffix.lower() == ".fcc")


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("path", type=Path, help="FCC file or directory")
    parser.add_argument("--output", type=Path, help="write one decoded CAB to this path")
    parser.add_argument("--check", action="store_true", help="validate all FCC files under a directory without writing outputs")
    args = parser.parse_args()

    if args.output and args.check:
        parser.error("--output and --check are mutually exclusive")

    paths = files_at(args.path)
    if not paths:
        parser.error(f"no FCC files found at {args.path}")
    if args.output and len(paths) != 1:
        parser.error("--output requires a single input file")

    failures = 0
    skipped = 0
    formats: dict[str, int] = {}
    for path in paths:
        try:
            source = path.read_bytes()
            if args.check and not (source.startswith(MAGIC) or source.startswith(RAW_MAGIC)):
                skipped += 1
                print(f"SKIP {path} (unsupported header {source[:4].hex()})")
                continue
            data, artifact_format = decode_artifact(source)
            formats[artifact_format] = formats.get(artifact_format, 0) + 1
            if args.output:
                args.output.parent.mkdir(parents=True, exist_ok=True)
                args.output.write_bytes(data)
            print(f"OK {path} ({len(data)} bytes, {artifact_format})")
        except (OSError, ValueError, struct.error) as exc:
            failures += 1
            print(f"FAIL {path}: {exc}")

    print(
        f"Decoded {len(paths) - failures - skipped}/{len(paths)} FCC file(s); "
        f"formats={formats}; skipped {skipped} unsupported file(s); failed {failures}"
    )
    return 1 if failures else 0


if __name__ == "__main__":
    raise SystemExit(main())

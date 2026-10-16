#!/usr/bin/env python3
"""验证 FC0A 分段边界，并提取带长度前缀的字符串池。"""
import hashlib
import json
import struct
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
decoded_root = ROOT / "analysis/decoded"
records = []
other = []
for path in sorted(p for p in decoded_root.rglob("*") if p.is_file()):
    data = path.read_bytes()
    if data[:4] != b"FC0A":
        other.append({"path": path.relative_to(ROOT).as_posix(), "magic_hex": data[:4].hex()})
        continue
    if len(data) < 20:
        raise ValueError(f"short header: {path}")
    compatibility_a, compatibility_b, code_size, pool_size = struct.unpack_from("<4I", data, 4)
    if 20 + code_size + pool_size != len(data):
        raise ValueError(f"section size mismatch: {path}")
    offset = 20 + code_size
    pool_offset = offset
    strings = []
    while offset < len(data):
        if offset + 2 > len(data):
            raise ValueError(f"short string length: {path}:{offset}")
        size = struct.unpack_from("<H", data, offset)[0]
        length_offset = offset
        offset += 2
        if offset + size > len(data):
            raise ValueError(f"string exceeds pool: {path}:{offset}")
        raw = data[offset:offset + size]
        try:
            text = raw.decode("gb18030")
            decoding_lossless = True
        except UnicodeDecodeError:
            text = raw.decode("gb18030", errors="replace")
            decoding_lossless = False
        strings.append({
            "length_offset": length_offset, "data_offset": offset, "byte_length": size,
            "raw_hex": raw.hex(), "text": text, "text_decoding_lossless": decoding_lossless,
        })
        offset += size
    records.append({
        "path": path.relative_to(ROOT).as_posix(),
        "sha256": hashlib.sha256(data).hexdigest(),
        "size": len(data),
        "compatibility_a": compatibility_a, "compatibility_b": compatibility_b,
        "code_offset": 20, "code_size": code_size,
        "string_pool_offset": pool_offset, "string_pool_size": pool_size,
        "strings": strings,
    })
document = {
    "scope": "FC0A header and u16-length string-pool parsing; not a bytecode decompiler.",
    "evidence": {
        "header_reader": "objsys:0x10011990",
        "pool_reader": "objsys:0x10011a59-0x10011acf",
        "rea_evidence_id": "ev_79268ca8fa4f56c3fa122adeae94d4774f186500c9d5deb328525b66ac46cbaf",
    },
    "text_decoding": "GB18030 is an analyst-selected display encoding; raw bytes are preserved.",
    "fc0a_count": len(records), "other_formats": other,
    "string_count": sum(len(r["strings"]) for r in records),
    "files": records,
}
destination = ROOT / "analysis/evidence/fc0a-index.json"
destination.write_text(json.dumps(document, ensure_ascii=False, indent=2) + "\n")
print(f"Validated {len(records)} FC0A files and {document['string_count']} pool strings.")
print(f"Other formats: {len(other)}. Wrote {destination}")

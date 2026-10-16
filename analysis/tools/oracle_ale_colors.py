#!/usr/bin/env python3
"""用 Unicorn 仿真 FBase RGB565 到 32 位颜色的原生转换函数。"""

import argparse
import hashlib
import json
import struct
from pathlib import Path

import pefile
import unicorn
from unicorn import UC_ARCH_X86, UC_MODE_32, Uc
from unicorn.x86_const import UC_X86_REG_EIP, UC_X86_REG_ESP


FUNCTION_VA = 0x1001AB10
RETURN_SENTINEL = 0xDEADBEEF
STACK_BASE = 0x70000000
STACK_SIZE = 0x10000
SCRATCH_BASE = 0x71000000
SCRATCH_SIZE = 0x100000
VALUE_COUNT = 1 << 16
INSTRUCTION_LIMIT = 8_000_000


def expected_colors() -> bytes:
    """按反汇编中的位移与掩码构造预期的小端 BGRA 字节流。"""
    output = bytearray(VALUE_COUNT * 4)
    for raw in range(VALUE_COUNT):
        offset = raw * 4
        output[offset] = (raw << 3) & 0xF8
        output[offset + 1] = (raw >> 3) & 0xFC
        output[offset + 2] = (raw >> 8) & 0xF8
        output[offset + 3] = 0xFF
    return bytes(output)


def emulate(dll_path: Path) -> bytes:
    """映射原始 DLL，以 cdecl 调用格式4到格式7的纯转换函数。"""
    pe = pefile.PE(str(dll_path))
    base = pe.OPTIONAL_HEADER.ImageBase
    if base != 0x10000000:
        raise ValueError(f"意外的 PE 首选基址：{base:#x}")

    machine = Uc(UC_ARCH_X86, UC_MODE_32)
    machine.mem_map(base, pe.OPTIONAL_HEADER.SizeOfImage)
    machine.mem_write(base, pe.get_memory_mapped_image())
    machine.mem_map(STACK_BASE, STACK_SIZE)
    machine.mem_map(SCRATCH_BASE, SCRATCH_SIZE)

    source_address = SCRATCH_BASE + 0x1000
    destination_address = SCRATCH_BASE + 0x30000
    source = struct.pack(f"<{VALUE_COUNT}H", *range(VALUE_COUNT))
    machine.mem_write(source_address, source)

    stack_pointer = STACK_BASE + STACK_SIZE - 0x1000
    machine.mem_write(
        stack_pointer,
        struct.pack(
            "<7I",
            RETURN_SENTINEL,
            destination_address,
            0,  # 目标行余量
            source_address,
            0,  # 来源行余量
            VALUE_COUNT,
            1,
        ),
    )
    machine.reg_write(UC_X86_REG_ESP, stack_pointer)
    machine.emu_start(FUNCTION_VA, RETURN_SENTINEL, count=INSTRUCTION_LIMIT)
    address = machine.reg_read(UC_X86_REG_EIP)
    if address != RETURN_SENTINEL:
        raise RuntimeError(f"仿真未到达函数返回哨兵，停止于 {address:#x}")
    return bytes(machine.mem_read(destination_address, VALUE_COUNT * 4))


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "dll",
        nargs="?",
        type=Path,
        default=Path("CLIENT/fbase.dll"),
        help="原始 fbase.dll 路径",
    )
    parser.add_argument(
        "--output",
        type=Path,
        default=Path("analysis/evidence/ale-color-oracle.json"),
        help="JSON 证据输出路径",
    )
    args = parser.parse_args()

    native = emulate(args.dll)
    expected = expected_colors()
    mismatches = [
        {
            "raw_u16": value,
            "native_bgra_hex": native[value * 4 : value * 4 + 4].hex(),
            "expected_bgra_hex": expected[value * 4 : value * 4 + 4].hex(),
        }
        for value in range(VALUE_COUNT)
        if native[value * 4 : value * 4 + 4] != expected[value * 4 : value * 4 + 4]
    ]
    evidence = {
        "schema": "fbase-ale-color-oracle-v1",
        "dll": str(args.dll),
        "dll_sha256": hashlib.sha256(args.dll.read_bytes()).hexdigest(),
        "function_va": f"0x{FUNCTION_VA:08x}",
        "emulator": {
            "unicorn": unicorn.__version__,
            "pefile": pefile.__version__,
            "instruction_limit": INSTRUCTION_LIMIT,
        },
        "calling_convention": {
            "stack_args": [
                "目标指针",
                "目标行余量（字节）",
                "来源指针",
                "来源行余量（字节）",
                "每行像素数",
                "行数",
            ],
            "test_dimensions": [VALUE_COUNT, 1],
        },
        "conversion": {
            "source": "格式4，RGB565，小端u16",
            "destination": "格式7，32位颜色，小端BGRA",
            "expected_channels": {
                "red": "(raw_u16 >> 8) & 0xf8",
                "green": "(raw_u16 >> 3) & 0xfc",
                "blue": "(raw_u16 << 3) & 0xf8",
                "alpha": "0xff",
            },
            "low_bits_expanded_by_replication": False,
        },
        "verification": {
            "input_values": VALUE_COUNT,
            "all_values_match": not mismatches,
            "mismatch_count": len(mismatches),
            "native_output_sha256": hashlib.sha256(native).hexdigest(),
            "expected_output_sha256": hashlib.sha256(expected).hexdigest(),
            "mismatches": mismatches[:16],
            "samples": [
                {
                    "raw_u16": f"0x{value:04x}",
                    "native_bgra_hex": native[value * 4 : value * 4 + 4].hex(),
                }
                for value in (0x0000, 0x001F, 0x07E0, 0xF800, 0xFFFF)
            ],
        },
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(
        json.dumps(evidence, ensure_ascii=False, indent=2) + "\n",
        encoding="utf-8",
    )
    print(
        json.dumps(
            {
                "output": str(args.output),
                "dll_sha256": evidence["dll_sha256"],
                "input_values": VALUE_COUNT,
                "all_values_match": not mismatches,
                "native_output_sha256": evidence["verification"]["native_output_sha256"],
            },
            indent=2,
        )
    )
    if mismatches:
        raise SystemExit(1)


if __name__ == "__main__":
    main()

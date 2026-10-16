#!/usr/bin/env python3
"""用 Unicorn 仿真 FBase #72 的行编码器并导出可复验对照样本。"""

import argparse
import hashlib
import json
import struct
from pathlib import Path

import pefile
import unicorn
from unicorn import UC_ARCH_X86, UC_MODE_32, Uc
from unicorn.x86_const import (
    UC_X86_REG_EAX,
    UC_X86_REG_EBX,
    UC_X86_REG_EDX,
    UC_X86_REG_EIP,
    UC_X86_REG_ESP,
)


FUNCTION_VA = 0x1002D160
RETURN_SENTINEL = 0xDEADBEEF
STACK_BASE = 0x70000000
STACK_SIZE = 0x10000
SCRATCH_BASE = 0x71000000
SCRATCH_SIZE = 0x20000
OUTPUT_CAPACITY = 0x10000


def emulate_row(dll_path: Path, alpha_values: list[int], raw_values: list[int], mode: int) -> dict:
    """映射原始 DLL，调用单个行编码函数并读取返回值和命令字节。"""
    pe = pefile.PE(str(dll_path))
    base = pe.OPTIONAL_HEADER.ImageBase
    if base != 0x10000000:
        raise ValueError(f"意外的 PE 首选基址：{base:#x}")
    if len(alpha_values) != len(raw_values):
        raise ValueError("alpha 与 u16 输入数量不相等")

    machine = Uc(UC_ARCH_X86, UC_MODE_32)
    machine.mem_map(base, pe.OPTIONAL_HEADER.SizeOfImage)
    machine.mem_write(base, pe.get_memory_mapped_image())
    machine.mem_map(STACK_BASE, STACK_SIZE)
    machine.mem_map(SCRATCH_BASE, SCRATCH_SIZE)

    raw_address = SCRATCH_BASE + 0x1000
    alpha_address = SCRATCH_BASE + 0x4000
    output_address = SCRATCH_BASE + 0x8000
    length_address = SCRATCH_BASE + 0x18000
    stack_pointer = STACK_BASE + STACK_SIZE - 0x1000
    machine.mem_write(raw_address, struct.pack(f"<{len(raw_values)}H", *raw_values))
    machine.mem_write(alpha_address, bytes(alpha_values))
    machine.mem_write(length_address, b"\0\0\0\0")
    machine.mem_write(
        stack_pointer,
        struct.pack(
            "<IIIII",
            RETURN_SENTINEL,
            raw_address,
            alpha_address,
            output_address,
            mode,
        ),
    )
    machine.reg_write(UC_X86_REG_ESP, stack_pointer)
    machine.reg_write(UC_X86_REG_EBX, length_address)
    machine.reg_write(UC_X86_REG_EDX, len(alpha_values))

    machine.emu_start(FUNCTION_VA, RETURN_SENTINEL, count=1_000_000)
    address = machine.reg_read(UC_X86_REG_EIP)
    if address != RETURN_SENTINEL:
        raise RuntimeError(f"仿真未到达函数返回哨兵，停止于 {address:#x}")

    command_count = machine.reg_read(UC_X86_REG_EAX)
    encoded_length = struct.unpack("<I", machine.mem_read(length_address, 4))[0]
    if encoded_length > OUTPUT_CAPACITY:
        raise RuntimeError(f"编码输出超出缓冲区：{encoded_length}")
    encoded = bytes(machine.mem_read(output_address, encoded_length))
    return {
        "header": command_count,
        "length": encoded_length,
        "data_hex": encoded.hex(),
    }


def build_cases(dll_path: Path) -> list[dict]:
    """生成覆盖边界分支的确定性 alpha/u16 测试向量。"""
    definitions = [
        ("透明255扩展", [0] * 511 + [0x40], 0),
        ("高alpha恰好127后接普通组", [0xF6] * 127 + [0x40], 0),
        ("高alpha跨127分块", [0xF6] * 128 + [0x40], 0),
        ("特殊alpha恰好31", [0x11] * 31 + [0x40], 1),
        ("特殊alpha跨31分块", [0x11] * 32 + [0x40], 1),
        ("普通量化alpha连续终止", [0x08, 0x10, 0xF4], 0),
        ("透明尾省略", [0x40, 0, 0], 0),
    ]
    cases = []
    for index, (name, alpha_values, mode) in enumerate(definitions):
        raw_values = [((index + 1) * 0x123 + i * 0x101) & 0xFFFF for i in range(len(alpha_values))]
        encoded = emulate_row(dll_path, alpha_values, raw_values, mode)
        cases.append(
            {
                "name": name,
                "width": len(alpha_values),
                "mode": mode,
                "alpha_hex": bytes(alpha_values).hex(),
                "raw_u16": raw_values,
                **encoded,
            }
        )
    return cases


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
        default=Path("analysis/evidence/ale-row-oracle.json"),
        help="JSON 证据输出路径",
    )
    args = parser.parse_args()
    digest = hashlib.sha256(args.dll.read_bytes()).hexdigest()
    evidence = {
        "schema": "fbase-ale-row-oracle-v1",
        "dll": str(args.dll),
        "dll_sha256": digest,
        "function_va": f"0x{FUNCTION_VA:08x}",
        "emulator": {
            "unicorn": unicorn.__version__,
            "pefile": pefile.__version__,
            "instruction_limit": 1_000_000,
        },
        "calling_convention": {
            "edx": "输入项目数",
            "ebx": "输出长度指针",
            "stack_args": ["u16输入流指针", "alpha输入流指针", "输出缓冲区指针", "特殊alpha模式"],
        },
        "cases": build_cases(args.dll),
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(evidence, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    print(json.dumps({"output": str(args.output), "dll_sha256": digest, "cases": len(evidence["cases"])}, indent=2))


if __name__ == "__main__":
    main()

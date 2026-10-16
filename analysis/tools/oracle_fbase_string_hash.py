#!/usr/bin/env python3
"""用 Unicorn 仿真 FBase.dll #858 的原生指令，生成字符串表桶哈希对照结果。"""

import argparse
import json
import struct
from pathlib import Path

import pefile
from unicorn import UC_ARCH_X86, UC_HOOK_CODE, UC_MODE_32, Uc
from unicorn.x86_const import UC_X86_REG_EAX, UC_X86_REG_ESP


HASH_VA = 0x10003580
RETURN_SENTINEL = 0xDEADBEEF
STACK_BASE = 0x70000000
STACK_SIZE = 0x10000


def emulate_hash(dll_path: Path, name: str) -> int:
    """将 DLL 映射到首选基址，仅模拟 #858，并返回 EAX。"""
    pe = pefile.PE(str(dll_path))
    base = pe.OPTIONAL_HEADER.ImageBase
    if base != 0x10000000:
        raise ValueError(f"意外的 PE 首选基址：{base:#x}")

    uc = Uc(UC_ARCH_X86, UC_MODE_32)
    uc.mem_map(base, pe.OPTIONAL_HEADER.SizeOfImage)
    uc.mem_write(base, pe.get_memory_mapped_image())
    uc.mem_map(STACK_BASE, STACK_SIZE)

    string_address = STACK_BASE + 0x1000
    stack_pointer = STACK_BASE + STACK_SIZE - 0x1000
    uc.mem_write(string_address, name.encode("ascii") + b"\0")
    uc.mem_write(
        stack_pointer,
        struct.pack("<III", RETURN_SENTINEL, string_address, 0),
    )
    uc.reg_write(UC_X86_REG_ESP, stack_pointer)

    # #858 的零映射参数分支不调用外部 API；只在返回哨兵处停止模拟。
    uc.hook_add(
        UC_HOOK_CODE,
        lambda machine, address, size, data: machine.emu_stop()
        if address == RETURN_SENTINEL
        else None,
    )
    uc.emu_start(HASH_VA, RETURN_SENTINEL, count=100000)
    return uc.reg_read(UC_X86_REG_EAX)


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "dll",
        nargs="?",
        type=Path,
        default=Path("CLIENT/fbase.dll"),
        help="要映射的原始 fbase.dll 路径",
    )
    args = parser.parse_args()
    names = (
        "CPacManItemSys",
        "CPacManMapSys",
        "CPacManCoinSys",
        "showdown",
    )
    results = {
        name: f"{emulate_hash(args.dll, name):08x}"
        for name in names
    }
    print(json.dumps(results, ensure_ascii=False, indent=2))


if __name__ == "__main__":
    main()

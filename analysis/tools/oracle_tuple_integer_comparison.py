#!/usr/bin/env python3
"""用 Unicorn 执行原生 `>` handler，并隔离参数提取依赖。"""

import argparse
import hashlib
import json
import struct
from pathlib import Path

import pefile
import unicorn
from unicorn import UC_ARCH_X86, UC_HOOK_CODE, UC_MODE_32, Uc, UcError
from unicorn.x86_const import UC_X86_REG_EAX, UC_X86_REG_ECX, UC_X86_REG_EIP, UC_X86_REG_ESP


GREATER_THAN_VA = 0x10015770
EXTRACT_VALUE_VA = 0x10012B50
ERROR_CLEANUP_VA = 0x30002000
TYPE_QUERY_VA = 0x30003000
STACK_BASE = 0x70000000
STACK_SIZE = 0x10000
CONTEXT_BASE = 0x20000000
CONTEXT_SIZE = 0x2000
RETURN_SENTINEL = 0xDEADBEEF


def export_code(pe: pefile.PE, ordinal: int, size: int) -> bytes:
    """按 PE ordinal 读取指定导出函数的原始指令字节。"""
    symbol = next(
        item for item in pe.DIRECTORY_ENTRY_EXPORT.symbols if item.ordinal == ordinal
    )
    return pe.get_data(symbol.address, size)


def emulate_greater_than(
    dll_path: Path, fbase_path: Path, left_type: int, right_type: int
) -> dict[str, int]:
    """执行原生 handler；仅 stub #12b50 的两个 FVar 参数提取。"""
    pe = pefile.PE(str(dll_path))
    base = pe.OPTIONAL_HEADER.ImageBase
    if base != 0x10000000:
        raise ValueError(f"意外的 PE 首選基址：{base:#x}")

    uc = Uc(UC_ARCH_X86, UC_MODE_32)
    uc.mem_map(base, pe.OPTIONAL_HEADER.SizeOfImage)
    uc.mem_write(base, pe.get_memory_mapped_image())
    uc.mem_map(STACK_BASE, STACK_SIZE)
    uc.mem_map(CONTEXT_BASE, CONTEXT_SIZE)
    uc.mem_map(0x30000000, 0x4000)

    fbase = pefile.PE(str(fbase_path))
    # 两个 FBase 导出均为无相对引用的短函数，可原样放到独立仿真地址执行。
    uc.mem_write(TYPE_QUERY_VA, export_code(fbase, ordinal=779, size=3))
    uc.mem_write(ERROR_CLEANUP_VA, export_code(fbase, ordinal=661, size=14))
    uc.mem_write(0x1009D384, struct.pack("<I", TYPE_QUERY_VA))
    uc.mem_write(0x1009D354, struct.pack("<I", ERROR_CLEANUP_VA))

    extraction_count = 0
    recent_addresses: list[int] = []

    def trace_instruction(machine: Uc, address: int, size: int, data: object) -> None:
        recent_addresses.append(address)
        del recent_addresses[:-16]

    def extract_value(machine: Uc, address: int, size: int, data: object) -> None:
        nonlocal extraction_count
        stack_pointer = machine.reg_read(UC_X86_REG_ESP)
        return_address, destination = struct.unpack(
            "<II", machine.mem_read(stack_pointer, 8)
        )
        value_type = left_type if extraction_count == 0 else right_type
        machine.mem_write(destination, struct.pack("<I", value_type))
        extraction_count += 1
        machine.reg_write(UC_X86_REG_ESP, stack_pointer + 8)
        machine.reg_write(UC_X86_REG_EAX, 1)
        machine.reg_write(UC_X86_REG_EIP, return_address)

    uc.hook_add(UC_HOOK_CODE, extract_value, begin=EXTRACT_VALUE_VA, end=EXTRACT_VALUE_VA)
    uc.hook_add(UC_HOOK_CODE, trace_instruction)

    stack_pointer = STACK_BASE + STACK_SIZE - 0x100
    uc.mem_write(stack_pointer, struct.pack("<I", RETURN_SENTINEL))
    uc.reg_write(UC_X86_REG_ESP, stack_pointer)
    uc.reg_write(UC_X86_REG_ECX, CONTEXT_BASE)
    try:
        uc.emu_start(GREATER_THAN_VA, RETURN_SENTINEL, count=10000)
    except UcError as error:
        trail = ", ".join(f"{address:#x}" for address in recent_addresses)
        raise RuntimeError(f"仿真失败于 {uc.reg_read(UC_X86_REG_EIP):#x}；轨迹：{trail}") from error

    return {
        "left_type": left_type,
        "right_type": right_type,
        "handler_return": uc.reg_read(UC_X86_REG_EAX) & 0xFF,
        "context_status": struct.unpack(
            "<I", uc.mem_read(CONTEXT_BASE + 0xE0C, 4)
        )[0],
        "operand_extractions": extraction_count,
    }


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "dll",
        nargs="?",
        type=Path,
        default=Path("CLIENT/objsys.dll"),
        help="要映射的原始 objsys.dll 路径",
    )
    parser.add_argument(
        "--fbase",
        type=Path,
        default=Path("CLIENT/fbase.dll"),
        help="提供原生 #661/#779 指令的 fbase.dll 路径",
    )
    parser.add_argument(
        "--output",
        type=Path,
        default=Path("analysis/evidence/tuple-integer-comparison-oracle.json"),
        help="仿真证据 JSON 输出路径",
    )
    args = parser.parse_args()
    result = {
        "schema": "objsys-tuple-integer-comparison-oracle-v1",
        "binaries": {
            "objsys": {
                "path": str(args.dll),
                "sha256": hashlib.sha256(args.dll.read_bytes()).hexdigest(),
            },
            "fbase": {
                "path": str(args.fbase),
                "sha256": hashlib.sha256(args.fbase.read_bytes()).hexdigest(),
            },
        },
        "emulator": {
            "name": "Unicorn",
            "version": unicorn.__version__,
            "pefile_version": pefile.__version__,
        },
        "setup": {
            "native_handler_va": f"0x{GREATER_THAN_VA:08x}",
            "stubbed_function": {
                "va": f"0x{EXTRACT_VALUE_VA:08x}",
                "behavior": "依次将指定左右类型写入operand输出值并返回成功",
            },
            "native_fbase_ordinals": [779, 661],
            "execution_boundary": "不执行DateCmp调用桥、完整表达式求值器或游戏窗口流程",
        },
        "input": {"left_type": 6, "right_type": 1},
        "result": emulate_greater_than(
            args.dll, args.fbase, left_type=6, right_type=1
        ),
        "interpretation": (
            "该隔离输入使原生handler返回运算失败，并在上下文写入状态8；"
            "它不是完整客户端运行结果。"
        ),
    }
    rendered = json.dumps(result, ensure_ascii=False, indent=2) + "\n"
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(rendered, encoding="utf-8")
    print(rendered, end="")


if __name__ == "__main__":
    main()

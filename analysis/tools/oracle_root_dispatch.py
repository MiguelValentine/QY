#!/usr/bin/env python3
"""用 Unicorn 执行 objsys 的根对象分派，并记录 hook 边界。"""

import argparse
import hashlib
import json
import struct
from pathlib import Path

import pefile
import unicorn
from unicorn import UC_ARCH_X86, UC_HOOK_CODE, UC_MODE_32, Uc
from unicorn.x86_const import (
    UC_X86_REG_EAX,
    UC_X86_REG_ECX,
    UC_X86_REG_EIP,
    UC_X86_REG_ESI,
    UC_X86_REG_ESP,
)


DISPATCH_CALLER = 0x1005AD10
DISPATCHER = 0x10060DA0
TITLE_BRANCH = 0x10062136
ROOT_VTABLES = (0x100A39C0, 0x100A3BB0)
TITLE_HASH = 0xD53B302D
RETURN_SENTINEL = 0xDEADBEEF
STACK_BASE = 0x70000000
STACK_SIZE = 0x10000
SCRATCH_BASE = 0x71000000
SCRATCH_SIZE = 0x10000
STUB_BASE = 0x72000000

HOOK_KIND = STUB_BASE
HOOK_TO_TEMP = STUB_BASE + 0x10
HOOK_TEMP_DATA = STUB_BASE + 0x20
HOOK_SET_WINDOW_TEXT = STUB_BASE + 0x30
HOOK_CLEANUP = STUB_BASE + 0x40


def c_string(machine: Uc, address: int, limit: int = 4096) -> bytes:
    """读取有界的零结尾字节串。"""
    result = bytearray()
    for offset in range(limit):
        value = machine.mem_read(address + offset, 1)[0]
        if value == 0:
            return bytes(result)
        result.append(value)
    raise RuntimeError(f"字符串没有在 {limit} 字节内终止：{address:#x}")


def emulate(dll_path: Path, title: bytes, vtable: int) -> dict:
    """执行原生分派代码；仅将 FBase 与 USER32 边界替换为显式 hook。"""
    pe = pefile.PE(str(dll_path))
    base = pe.OPTIONAL_HEADER.ImageBase
    if base != 0x10000000:
        raise ValueError(f"意外的 PE 首选基址：{base:#x}")

    machine = Uc(UC_ARCH_X86, UC_MODE_32)
    machine.mem_map(0, 0x1000)
    machine.mem_map(base, pe.OPTIONAL_HEADER.SizeOfImage)
    machine.mem_write(base, pe.get_memory_mapped_image())
    machine.mem_map(STACK_BASE, STACK_SIZE)
    machine.mem_map(SCRATCH_BASE, SCRATCH_SIZE)
    machine.mem_map(STUB_BASE, 0x1000)

    slots = {
        646: HOOK_TEMP_DATA,
        808: HOOK_TO_TEMP,
        779: HOOK_KIND,
        637: HOOK_CLEANUP,
    }
    set_window_text_slot = None
    for descriptor in pe.DIRECTORY_ENTRY_IMPORT:
        for imported in descriptor.imports:
            if descriptor.dll.lower() == b"fbase.dll" and imported.ordinal in slots:
                machine.mem_write(imported.address, struct.pack("<I", slots[imported.ordinal]))
            if (
                descriptor.dll.lower() == b"user32.dll"
                and imported.name == b"SetWindowTextA"
            ):
                set_window_text_slot = imported.address
                machine.mem_write(imported.address, struct.pack("<I", HOOK_SET_WINDOW_TEXT))
    if set_window_text_slot is None:
        raise RuntimeError("objsys.dll 导入表中未找到 USER32!SetWindowTextA")

    root_address = SCRATCH_BASE
    vm_value_address = SCRATCH_BASE + 0x100
    text_address = SCRATCH_BASE + 0x200
    temp_object_address = SCRATCH_BASE + 0x300
    machine.mem_write(root_address, struct.pack("<I", vtable))
    machine.mem_write(root_address + 0x90, struct.pack("<I", 0))
    machine.mem_write(root_address + 0x1C68, struct.pack("<I", 0x12345678))
    machine.mem_write(text_address, title + b"\0")

    # 合成 VM 字符串只供 hook 读取，不代表目标程序中真实值对象的布局。
    machine.mem_write(
        vm_value_address,
        struct.pack("<II", 3, text_address),
    )
    machine.mem_write(temp_object_address, struct.pack("<I", text_address))

    # 绕过 0x1005ad10 的首次全局初始化，只初始化本次调用所需状态。
    machine.mem_write(0x10121CA0, b"\x01")
    machine.mem_write(0x10121448, struct.pack("<I", 0))

    stack_pointer = STACK_BASE + STACK_SIZE - 0x1000
    # 0x1005ad10 将第 2、3、4 个参数转发给虚方法；第 2 个参数是分派 hash。
    machine.mem_write(
        stack_pointer,
        struct.pack(
            "<5I",
            RETURN_SENTINEL,
            vm_value_address,
            TITLE_HASH,
            vm_value_address,
            0,
        ),
    )
    machine.reg_write(UC_X86_REG_ESP, stack_pointer)
    machine.reg_write(UC_X86_REG_ECX, root_address)

    observations = {
        "hook_calls": [],
        "set_window_text": [],
        "reached_dispatcher": False,
        "reached_title_branch": False,
        "dispatcher_hash": None,
        "last_addresses": [],
    }

    def return_from_hook(machine: Uc, return_bytes: int = 0) -> None:
        esp = machine.reg_read(UC_X86_REG_ESP)
        return_address = struct.unpack("<I", machine.mem_read(esp, 4))[0]
        machine.reg_write(UC_X86_REG_ESP, esp + 4 + return_bytes)
        machine.reg_write(UC_X86_REG_EIP, return_address)

    def on_code(machine: Uc, address: int, _size: int, _data: object) -> None:
        observations["last_addresses"].append(f"0x{address:08x}")
        del observations["last_addresses"][:-24]
        if address == DISPATCHER:
            observations["reached_dispatcher"] = True
        elif address == 0x10060DC5:
            observations["dispatcher_hash"] = f"0x{machine.reg_read(UC_X86_REG_ESI):08x}"
        elif address == TITLE_BRANCH:
            observations["reached_title_branch"] = True
        elif address == RETURN_SENTINEL:
            machine.emu_stop()
        elif address == HOOK_KIND:
            observations["hook_calls"].append(
                {"api": "FBase ordinal #779", "model": "固定返回合成值类型 3"}
            )
            machine.reg_write(UC_X86_REG_EAX, 3)
            return_from_hook(machine)
        elif address == HOOK_TO_TEMP:
            esp = machine.reg_read(UC_X86_REG_ESP)
            output_address = struct.unpack("<I", machine.mem_read(esp + 4, 4))[0]
            value_address = machine.reg_read(UC_X86_REG_ECX)
            modeled_text_address = struct.unpack(
                "<I", machine.mem_read(value_address + 4, 4)
            )[0]
            machine.mem_write(output_address, struct.pack("<I", modeled_text_address))
            machine.reg_write(UC_X86_REG_EAX, output_address)
            observations["hook_calls"].append(
                {
                    "api": "FBase ordinal #808",
                    "model": "将合成 VM 值中的字符串指针写入输出对象",
                    "output_object": f"0x{output_address:08x}",
                }
            )
            return_from_hook(machine, 4)
        elif address == HOOK_TEMP_DATA:
            object_address = machine.reg_read(UC_X86_REG_ECX)
            text_pointer = struct.unpack("<I", machine.mem_read(object_address, 4))[0]
            machine.reg_write(UC_X86_REG_EAX, text_pointer)
            observations["hook_calls"].append(
                {
                    "api": "FBase ordinal #646",
                    "model": "从合成临时对象返回字符串字节指针",
                }
            )
            return_from_hook(machine)
        elif address == HOOK_CLEANUP:
            observations["hook_calls"].append(
                {"api": "FBase ordinal #637", "model": "无操作清理 hook"}
            )
            return_from_hook(machine)
        elif address == HOOK_SET_WINDOW_TEXT:
            esp = machine.reg_read(UC_X86_REG_ESP)
            hwnd, text_pointer = struct.unpack(
                "<II", machine.mem_read(esp + 4, 8)
            )
            observations["set_window_text"].append(
                {
                    "hwnd": f"0x{hwnd:08x}",
                    "text": c_string(machine, text_pointer).decode(
                        "latin-1", errors="replace"
                    ),
                }
            )
            machine.reg_write(UC_X86_REG_EAX, 1)
            return_from_hook(machine, 8)

    machine.hook_add(UC_HOOK_CODE, on_code)
    try:
        machine.emu_start(DISPATCH_CALLER, RETURN_SENTINEL, count=500_000)
    except unicorn.UcError as exc:
        stopped_at = machine.reg_read(UC_X86_REG_EIP)
        raise RuntimeError(
            f"Unicorn 在 {stopped_at:#x} 停止：{exc}; "
            f"hooks={observations['hook_calls']!r}; "
            f"title_calls={observations['set_window_text']!r}; "
            f"hash={observations['dispatcher_hash']!r}; "
            f"trace={observations['last_addresses']!r}"
        ) from exc
    stopped_at = machine.reg_read(UC_X86_REG_EIP)
    if stopped_at != RETURN_SENTINEL:
        raise RuntimeError(f"仿真未到达返回哨兵，停止于 {stopped_at:#x}")

    return {
        "vtable": f"0x{vtable:08x}",
        "vtable_slot_0x24": f"0x{struct.unpack('<I', machine.mem_read(vtable + 0x24, 4))[0]:08x}",
        "return_eax": f"0x{machine.reg_read(UC_X86_REG_EAX):08x}",
        "stopped_at": f"0x{stopped_at:08x}",
        "synthetic_vm_value_before_hex": struct.pack("<II", 3, text_address).hex(),
        "synthetic_vm_value_after_hex": bytes(
            machine.mem_read(vm_value_address, 8)
        ).hex(),
        **observations,
    }


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "dll",
        nargs="?",
        type=Path,
        default=Path("CLIENT/objsys.dll"),
        help="原始 objsys.dll 路径",
    )
    parser.add_argument(
        "--output",
        type=Path,
        default=Path("analysis/evidence/root-dispatch-oracle.json"),
        help="JSON 证据输出路径",
    )
    parser.add_argument("--title", default="REA oracle title", help="合成 VM 字符串")
    args = parser.parse_args()

    results = [emulate(args.dll, args.title.encode("latin-1"), table) for table in ROOT_VTABLES]
    failures = [
        result
        for result in results
        if result["vtable_slot_0x24"] != f"0x{DISPATCHER:08x}"
        or not result["reached_dispatcher"]
        or not result["reached_title_branch"]
        or result["return_eax"] != "0x00000000"
        or len(result["set_window_text"]) != 1
    ]
    evidence = {
        "schema": "objsys-root-dispatch-oracle-v1",
        "dll": str(args.dll),
        "dll_sha256": hashlib.sha256(args.dll.read_bytes()).hexdigest(),
        "emulator": {
            "name": "Unicorn",
            "version": unicorn.__version__,
            "pefile_version": pefile.__version__,
            "executed_native_addresses": [
                f"0x{DISPATCH_CALLER:08x}",
                f"0x{DISPATCHER:08x}",
                f"0x{TITLE_BRANCH:08x}",
            ],
        },
        "setup": {
            "root_object": "在暂存区合成；首 DWORD 为选定 vtable，+0x1c68 为假 HWND 0x12345678",
            "global_initialization": "将 0x10121ca0 预置为 1，以跳过一次性初始化路径",
            "synthetic_vm_value": "测试专用布局 [kind=3, text_pointer]，不声称是真实 VM 对象布局",
            "native_instruction_execution": "执行 0x1005ad10、虚调用及 0x10060da0 的原始指令",
            "hook_model": [
                "FBase ordinal #779 固定返回 3",
                "FBase ordinal #808 按测试专用合成值布局填充临时对象",
                "FBase ordinal #646 从测试专用临时对象取字符串指针",
                "USER32!SetWindowTextA 只记录 HWND/文本并模拟 BOOL TRUE",
            ],
        },
        "calling_convention": {
            "this": "合成根对象指针放入 ECX",
            "0x1005ad10_stack_arguments": [
                "VM 值指针（由 0x10060da0 从原始调用栈读取）",
                f"hash 0x{TITLE_HASH:08x}（转发为虚方法第 1 参数）",
                "VM 值指针（非零以走显式值分支）",
                "0（转发为虚方法第 3 参数）",
            ],
            "return_cleanup": "0x1005ad10 原生 ret 0x10",
        },
        "results": results,
        "conclusion": {
            "verified": not failures,
            "failures": failures,
            "vm_value_unchanged_in_test_model": all(
                result["synthetic_vm_value_before_hex"]
                == result["synthetic_vm_value_after_hex"]
                for result in results
            ),
            "dispatcher_returned_zero": all(
                result["return_eax"] == "0x00000000" for result in results
            ),
            "scope_limit": "证明该输入下原生分派指令到达标题分支；不证明完整 VM 兼容，也未创建真实 Windows 窗口。",
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
                "verified": not failures,
                "results": results,
            },
            ensure_ascii=False,
            indent=2,
        )
    )
    if failures:
        raise SystemExit(1)


if __name__ == "__main__":
    main()

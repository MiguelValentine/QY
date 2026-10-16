#!/usr/bin/env python3
"""用 Unicorn 仿真 atomsys 粒子初始化、加速和未分裂推进例程。"""

import argparse
import hashlib
import json
import struct
from pathlib import Path

import pefile
import unicorn
from unicorn import UC_ARCH_X86, UC_HOOK_CODE, UC_MODE_32, Uc, UcError
from unicorn.x86_const import (
    UC_X86_REG_EAX,
    UC_X86_REG_ECX,
    UC_X86_REG_EIP,
    UC_X86_REG_ESP,
    UC_X86_REG_FPCW,
)


INIT_VA = 0x1001F940
ADD_VELOCITY_VA = 0x1001FC50
ADVANCE_VA = 0x10020630
RANDOM_VA = 0x1008787F
ALLOC_PARTICLE_VA = 0x1001FD60
REGISTER_CHILD_IAT_VA = 0x1009D4F0
PARTICLE_BASE = 0x20000000
CHILD_POOL_BASE = 0x21000000
HOOK_BASE = 0x30000000
STACK_BASE = 0x70000000
STACK_SIZE = 0x10000
RETURN_SENTINEL = 0xDEADBEEF


def call_native(machine: Uc, address: int, args: list[int]) -> None:
    stack = STACK_BASE + STACK_SIZE - 0x100
    machine.mem_write(
        stack,
        struct.pack("<I" + "i" * len(args), RETURN_SENTINEL, *args),
    )
    machine.reg_write(UC_X86_REG_ESP, stack)
    machine.reg_write(UC_X86_REG_ECX, PARTICLE_BASE)
    try:
        machine.emu_start(address, RETURN_SENTINEL, count=100_000)
    except UcError as error:
        raise RuntimeError(
            f"原生调用 {address:#x} 在 {machine.reg_read(UC_X86_REG_EIP):#x} 失败"
        ) from error


def read_particle(machine: Uc, address: int = PARTICLE_BASE) -> dict[str, float | int]:
    raw = machine.mem_read(address, 0x1C)
    x, y, vx, vy = struct.unpack_from("<ffff", raw)
    life, split = struct.unpack_from("<ii", raw, 0x10)
    drag = struct.unpack_from("<f", raw, 0x18)[0]
    return {
        "x": x,
        "y": y,
        "vx": vx,
        "vy": vy,
        "life": life,
        "split": split,
        "drag": drag,
    }


def emulate(dll_path: Path, random_values: list[int]) -> dict[str, object]:
    pe = pefile.PE(str(dll_path))
    base = pe.OPTIONAL_HEADER.ImageBase
    if base != 0x10000000:
        raise ValueError(f"意外的 PE 首选基址：{base:#x}")

    machine = Uc(UC_ARCH_X86, UC_MODE_32)
    machine.mem_map(0, 0x1000)
    machine.mem_map(base, pe.OPTIONAL_HEADER.SizeOfImage)
    machine.mem_write(base, pe.get_memory_mapped_image())
    machine.mem_map(PARTICLE_BASE, 0x1000)
    machine.mem_map(CHILD_POOL_BASE, 0x10000)
    machine.mem_map(HOOK_BASE, 0x1000)
    machine.mem_map(STACK_BASE, STACK_SIZE)
    initial_fpu_control_word = machine.reg_read(UC_X86_REG_FPCW)

    random_index = 0
    active_random_values = random_values
    consumed_random_values: list[int] = []
    allocated_children: list[int] = []
    registered_children: list[int] = []

    def deterministic_random(uc: Uc, address: int, size: int, data: object) -> None:
        nonlocal random_index
        if random_index >= len(active_random_values):
            raise RuntimeError("原生推进请求了超出 fixture 提供数量的随机数")
        stack = uc.reg_read(UC_X86_REG_ESP)
        return_address = struct.unpack("<I", uc.mem_read(stack, 4))[0]
        uc.reg_write(UC_X86_REG_ESP, stack + 4)
        value = active_random_values[random_index]
        consumed_random_values.append(value)
        uc.reg_write(UC_X86_REG_EAX, value & 0xFFFFFFFF)
        uc.reg_write(UC_X86_REG_EIP, return_address)
        random_index += 1

    def allocate_particle(uc: Uc, address: int, size: int, data: object) -> None:
        stack = uc.reg_read(UC_X86_REG_ESP)
        return_address = struct.unpack("<I", uc.mem_read(stack, 4))[0]
        child_address = CHILD_POOL_BASE + len(allocated_children) * 0x1000
        if child_address + 0x1C > CHILD_POOL_BASE + 0x10000:
            raise RuntimeError("原生请求的独立粒子分配数量超出仿真池")
        allocated_children.append(child_address)
        uc.mem_write(child_address, bytes(0x1C))
        uc.reg_write(UC_X86_REG_EAX, child_address)
        uc.reg_write(UC_X86_REG_ESP, stack + 4)
        uc.reg_write(UC_X86_REG_EIP, return_address)

    def register_child(uc: Uc, address: int, size: int, data: object) -> None:
        stack = uc.reg_read(UC_X86_REG_ESP)
        return_address, child_address = struct.unpack(
            "<II", uc.mem_read(stack, 8)
        )
        registered_children.append(child_address)
        uc.reg_write(UC_X86_REG_ESP, stack + 12)
        uc.reg_write(UC_X86_REG_EIP, return_address)

    machine.hook_add(
        UC_HOOK_CODE, deterministic_random, begin=RANDOM_VA, end=RANDOM_VA
    )
    machine.hook_add(
        UC_HOOK_CODE,
        allocate_particle,
        begin=ALLOC_PARTICLE_VA,
        end=ALLOC_PARTICLE_VA,
    )
    machine.mem_write(REGISTER_CHILD_IAT_VA, struct.pack("<I", HOOK_BASE))
    machine.hook_add(
        UC_HOOK_CODE, register_child, begin=HOOK_BASE, end=HOOK_BASE
    )

    # 初始化参数按原生栈顺序：x、y、speed、angle、life、drag、split。
    call_native(machine, INIT_VA, [12, -7, 30, 37, 100, 85, 10])
    initialized = read_particle(machine)
    call_native(machine, ADD_VELOCITY_VA, [14, 123])
    accelerated = read_particle(machine)
    call_native(machine, ADVANCE_VA, [0, 0, 0])
    advanced = read_particle(machine)

    if random_index != len(active_random_values):
        raise RuntimeError(
            f"原生仅消费 {random_index} 个随机数，fixture 提供 {len(active_random_values)} 个"
        )
    baseline_random_values_consumed = random_index

    split_values = [0, 0, 200, 3, 45, 5, 90, 7]
    active_random_values = split_values
    random_index = 0
    consumed_random_values = []
    allocated_children.clear()
    registered_children.clear()
    call_native(machine, INIT_VA, [12, -7, 0, 0, 100, 85, 93])
    split_parent_initial = read_particle(machine)
    call_native(machine, ADVANCE_VA, [0, 0, 0])
    if random_index != len(active_random_values):
        raise RuntimeError(
            f"分裂场景原生仅消费 {random_index} 个随机数，"
            f"fixture 提供 {len(active_random_values)} 个"
        )
    if registered_children != allocated_children:
        raise RuntimeError(
            "原生登记的子粒子指针与独立预分配地址不一致："
            f"{registered_children!r} != {allocated_children!r}"
        )
    split_scenario = {
        "initialize_arguments": [12, -7, 0, 0, 100, 85, 93],
        "random_values": split_values,
        "random_values_consumed": consumed_random_values,
        "parent_initial": split_parent_initial,
        "parent_after_advance": read_particle(machine),
        "children": [
            {"address": f"0x{address:08x}", **read_particle(machine, address)}
            for address in registered_children
        ],
        "allocated_child_addresses": [
            f"0x{address:08x}" for address in allocated_children
        ],
        "registered_child_addresses": [
            f"0x{address:08x}" for address in registered_children
        ],
    }

    acceleration_values = [0]
    active_random_values = acceleration_values
    random_index = 0
    consumed_random_values = []
    acceleration_x = 0.12345679
    acceleration_y = -0.9876543
    call_native(machine, INIT_VA, [12, -7, 30, 37, 100, 85, 10])
    acceleration_initial = read_particle(machine)
    acceleration_args = [
        struct.unpack("<i", struct.pack("<f", acceleration_x))[0],
        struct.unpack("<i", struct.pack("<f", acceleration_y))[0],
    ]
    call_native(machine, ADVANCE_VA, [0, *acceleration_args])
    if random_index != len(active_random_values):
        raise RuntimeError(
            f"加速度场景原生仅消费 {random_index} 个随机数，"
            f"fixture 提供 {len(active_random_values)} 个"
        )
    acceleration_scenario = {
        "initialize_arguments": [12, -7, 30, 37, 100, 85, 10],
        "advance_acceleration": [acceleration_x, acceleration_y],
        "random_values": acceleration_values,
        "random_values_consumed": consumed_random_values,
        "initial": acceleration_initial,
        "after_advance": read_particle(machine),
    }

    fpu_control_word_comparison = []
    for control_word in (0x027F, 0x037F):
        machine.reg_write(UC_X86_REG_FPCW, control_word)
        active_random_values = acceleration_values
        random_index = 0
        consumed_random_values = []
        call_native(machine, INIT_VA, [12, -7, 30, 37, 100, 85, 10])
        call_native(machine, ADVANCE_VA, [0, *acceleration_args])
        compared_particle = read_particle(machine)
        fpu_control_word_comparison.append(
            {
                "control_word": f"0x{control_word:04x}",
                "random_values_consumed": consumed_random_values,
                "after_advance": compared_particle,
                "same_as_default_output": compared_particle
                == acceleration_scenario["after_advance"],
            }
        )
    return {
        "initial": initialized,
        "after_add_velocity": accelerated,
        "after_advance": advanced,
        "random_values_consumed": baseline_random_values_consumed,
        "initial_fpu_control_word": f"0x{initial_fpu_control_word:04x}",
        "split_scenario": split_scenario,
        "acceleration_scenario": acceleration_scenario,
        "fpu_control_word_comparison": fpu_control_word_comparison,
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
        "--output",
        type=Path,
        default=Path("analysis/evidence/atomsys-particle-oracle.json"),
        help="仿真证据 JSON 输出路径",
    )
    args = parser.parse_args()
    random_values = [0]
    result = {
        "schema": "objsys-atomsys-particle-oracle-v1",
        "binary": {
            "path": str(args.dll),
            "sha256": hashlib.sha256(args.dll.read_bytes()).hexdigest(),
        },
        "emulator": {
            "name": "Unicorn",
            "version": unicorn.__version__,
            "pefile_version": pefile.__version__,
        },
        "fpu_control_word": {
            "new_uc_initial_value": "由本次新建 Unicorn 实例读取",
            "comparison_values": ["0x027f", "0x037f"],
            "scope": (
                "仅比较显式仿真控制字条件；原始 CRT 未初始化控制字，"
                "Unicorn 初值不代表原版 Windows 进程的实际 FPU 状态。"
            ),
        },
        "setup": {
            "native_functions": {
                "initialize": f"0x{INIT_VA:08x}",
                "add_velocity": f"0x{ADD_VELOCITY_VA:08x}",
                "advance": f"0x{ADVANCE_VA:08x}",
            },
            "advance_stack_convention": (
                "advance 接收三个栈参数；首参数在推进代码中未使用，"
                "加速度 x/y 分别位于第二、第三参数。"
            ),
            "random_hook": {
                "va": f"0x{RANDOM_VA:08x}",
                "values": random_values,
                "behavior": "按序返回给定整数并模拟 ret",
            },
            "split_hooks": {
                "particle_pool_allocator": f"0x{ALLOC_PARTICLE_VA:08x}",
                "register_child_iat": f"0x{REGISTER_CHILD_IAT_VA:08x}",
                "behavior": (
                    "粒子池分配 hook 返回独立预分配内存；IAT #513 hook 记录新粒子指针"
                    "并模拟 ret 8"
                ),
            },
            "execution_boundary": (
                "执行原生初始化、加速、未分裂推进、一次分裂推进及非零加速度推进；"
                "用粒子池分配和 IAT #513 hook 隔离新子粒子，未覆盖 atomsys 完整更新循环。"
            ),
        },
        "input": {
            "initialize_arguments": [12, -7, 30, 37, 100, 85, 10],
            "add_velocity_arguments": [14, 123],
            "advance_acceleration": [0, 0],
        },
        "result": emulate(args.dll, random_values),
    }
    rendered = json.dumps(result, ensure_ascii=False, indent=2) + "\n"
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(rendered, encoding="utf-8")
    print(rendered, end="")


if __name__ == "__main__":
    main()

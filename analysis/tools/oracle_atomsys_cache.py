#!/usr/bin/env python3
"""仿真 FBase #893 缓存绘制路径并导出 RGB565 像素证据。"""

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
    UC_X86_REG_ESP,
    UC_X86_REG_FPCW,
)


DRAW_VA = 0x10020A30
PACK_RGB_VA = 0x1001A9C0
ADD_PIXEL_VA = 0x1001B780
WRITE_PIXEL_VA = 0x1001D0C0
INTERPOLATE_VA = 0x1001C260
SURFACE_BASE = 0x71000000
PIXELS_BASE = 0x71010000
STACK_BASE = 0x70000000
STACK_SIZE = 0x10000
RETURN_SENTINEL = 0xDEADBEEF
COLORS = (0x00FFD250, 0x00FFD2B4, 0x00000000, 0xFFFFFFFF)
DEFAULT_FPCW = 0x027F


def emulate(
    dll_path: Path, size: int, color: int, radius_x: int, radius_y: int, trace=False
):
    pe = pefile.PE(str(dll_path))
    base = pe.OPTIONAL_HEADER.ImageBase
    if base != 0x10000000:
        raise ValueError(f"意外的 PE 首选基址：{base:#x}")

    machine = Uc(UC_ARCH_X86, UC_MODE_32)
    machine.mem_map(0, 0x1000)
    machine.mem_map(base, pe.OPTIONAL_HEADER.SizeOfImage)
    machine.mem_write(base, pe.get_memory_mapped_image())
    machine.mem_map(SURFACE_BASE, 0x1000)
    machine.mem_map(PIXELS_BASE, 0x10000)
    machine.mem_map(STACK_BASE, STACK_SIZE)
    machine.reg_write(UC_X86_REG_FPCW, DEFAULT_FPCW)

    stride = (size * 2 + 3) & ~3
    pixels_size = stride * size
    machine.mem_write(PIXELS_BASE, b"\0" * pixels_size)
    descriptor = bytearray(0x680)
    struct.pack_into(
        "<8I",
        descriptor,
        0,
        0,
        4,
        2,
        stride,
        size,
        size,
        pixels_size,
        PIXELS_BASE,
    )
    struct.pack_into("<4I", descriptor, 0x24, 0, 0, size, size)
    struct.pack_into("<2i", descriptor, 0x678, 0, 0)
    machine.mem_write(SURFACE_BASE, bytes(descriptor))
    calls = []

    if trace:
        def record_call(uc, address, instruction_size, data):
            sp = uc.reg_read(UC_X86_REG_ESP)
            words = struct.unpack("<4I", uc.mem_read(sp, 16))
            calls.append(
                {
                    "function": f"0x{address:08x}",
                    "return": f"0x{words[0]:08x}",
                    "arguments": [f"0x{value:08x}" for value in words[1:]],
                }
            )

        machine.hook_add(UC_HOOK_CODE, record_call, begin=PACK_RGB_VA, end=PACK_RGB_VA)
        machine.hook_add(UC_HOOK_CODE, record_call, begin=ADD_PIXEL_VA, end=ADD_PIXEL_VA)

    # #893 is cdecl: surface, x offset, y offset, x radius, y radius, color.
    stack = STACK_BASE + STACK_SIZE - 0x100
    machine.mem_write(
        stack,
        struct.pack(
            "<II4iI",
            RETURN_SENTINEL,
            SURFACE_BASE,
            size // 2,
            size // 2,
            radius_x,
            radius_y,
            color,
        ),
    )
    machine.reg_write(UC_X86_REG_ESP, stack)
    machine.reg_write(UC_X86_REG_ECX, 0)
    machine.emu_start(DRAW_VA, RETURN_SENTINEL, count=2_000_000)
    if machine.reg_read(UC_X86_REG_ESP) != stack + 4:
        raise RuntimeError("FBase #893 未按 cdecl 返回")

    raw = bytes(machine.mem_read(PIXELS_BASE, pixels_size))
    rows = [
        list(struct.unpack_from(f"<{size}H", raw, y * stride))
        for y in range(size)
    ]
    result = {"stride": stride, "pixels": rows, "sha256": hashlib.sha256(raw).hexdigest()}
    if trace:
        result["calls"] = calls
    return result


def invoke(machine, address, args, ecx=0, cleanup=0):
    stack = STACK_BASE + STACK_SIZE - 0x400
    words = [RETURN_SENTINEL, *(value & 0xFFFFFFFF for value in args)]
    machine.mem_write(stack, struct.pack(f"<{len(words)}I", *words))
    machine.reg_write(UC_X86_REG_ESP, stack)
    machine.reg_write(UC_X86_REG_ECX, ecx)
    machine.emu_start(address, RETURN_SENTINEL, count=2_000_000)
    expected_esp = stack + 4 + cleanup
    actual_esp = machine.reg_read(UC_X86_REG_ESP)
    if actual_esp != expected_esp:
        raise RuntimeError(
            f"{address:#x} 栈清理错误：ESP={actual_esp:#x}，期望 {expected_esp:#x}"
        )
    return machine.reg_read(UC_X86_REG_EAX)


def emulate_full_cache(dll_path: Path, colors, fpcw=DEFAULT_FPCW):
    pe = pefile.PE(str(dll_path))
    base = pe.OPTIONAL_HEADER.ImageBase
    machine = Uc(UC_ARCH_X86, UC_MODE_32)
    machine.mem_map(0, 0x1000)
    machine.mem_map(base, pe.OPTIONAL_HEADER.SizeOfImage)
    machine.mem_write(base, pe.get_memory_mapped_image())
    machine.mem_map(SURFACE_BASE, 0x1000)
    machine.mem_map(PIXELS_BASE, 0x10000)
    machine.mem_map(STACK_BASE, STACK_SIZE)
    machine.reg_write(UC_X86_REG_FPCW, fpcw)

    sprites = []
    for index in range(32):
        a = 57 - 3 * index
        s = index if a >= 0 else int(a / 4) + 19
        size = 5 + int(int(s * s * 16 / 19) / 19)
        center = size // 2
        stride = (size * 2 + 3) & ~3
        pixels_size = stride * size
        machine.mem_write(PIXELS_BASE, b"\0" * pixels_size)
        descriptor = bytearray(0x680)
        struct.pack_into(
            "<8I",
            descriptor,
            0,
            0,
            4,
            2,
            stride,
            size,
            size,
            pixels_size,
            PIXELS_BASE,
        )
        struct.pack_into("<4I", descriptor, 0x24, 0, 0, size, size)
        struct.pack_into("<2i", descriptor, 0x678, 0, 0)
        machine.mem_write(SURFACE_BASE, bytes(descriptor))

        center_color = invoke(
            machine, INTERPOLATE_VA, [colors[2], colors[1], index, 32], cleanup=0
        )
        center_pixel = (
            ((center_color >> 8) & 0xF800)
            | ((center_color >> 5) & 0x07E0)
            | ((center_color >> 3) & 0x001F)
        )
        invoke(
            machine,
            WRITE_PIXEL_VA,
            [center, center, center_pixel],
            ecx=SURFACE_BASE,
            cleanup=12,
        )
        glow = invoke(machine, INTERPOLATE_VA, [0, colors[0], 7, 10])
        invoke(
            machine,
            DRAW_VA,
            [SURFACE_BASE, center, center, center + 1, center + 1, glow],
        )
        edge_color = invoke(
            machine, INTERPOLATE_VA, [0, colors[2], index + 16, 96]
        )
        edge_pixel = (
            ((edge_color >> 8) & 0xF800)
            | ((edge_color >> 5) & 0x07E0)
            | ((edge_color >> 3) & 0x001F)
        )
        for x, y in (
            (center + 1, center + 1),
            (center - 1, center - 1),
            (center - 1, center + 1),
            (center + 1, center - 1),
        ):
            invoke(
                machine,
                ADD_PIXEL_VA,
                [x, y, edge_pixel],
                ecx=SURFACE_BASE,
                cleanup=12,
            )

        raw = bytes(machine.mem_read(PIXELS_BASE, pixels_size))
        rows = [
            list(struct.unpack_from(f"<{size}H", raw, y * stride))
            for y in range(size)
        ]
        sprites.append({"size": size, "pixels": rows})

    palette = []
    for index in range(1, 9):
        value = invoke(machine, INTERPOLATE_VA, [0, colors[1], index, 10])
        palette.append(
            ((value >> 8) & 0xF800)
            | ((value >> 5) & 0x07E0)
            | ((value >> 3) & 0x001F)
        )
    return {"sprites": sprites, "palette": palette, "fpcw": f"0x{fpcw:04x}"}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("dll", nargs="?", type=Path, default=Path("CLIENT/fbase.dll"))
    parser.add_argument(
        "--output",
        type=Path,
        default=Path("analysis/evidence/atomsys-cache-oracle.json"),
    )
    args = parser.parse_args()

    cases = []
    for size in (5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 16, 17, 19, 21):
        for color in COLORS:
            cases.append(
                {
                    "size": size,
                    "color": f"0x{color:08x}",
                    "result": emulate(
                        args.dll,
                        size,
                        color,
                        size // 2 + 1,
                        size // 2 + 1,
                        trace=(size == 5 and color == COLORS[0]),
                    ),
                }
            )
    evidence = {
        "schema": "fbase-atomsys-cache-oracle-v1",
        "dll": {
            "path": str(args.dll),
            "sha256": hashlib.sha256(args.dll.read_bytes()).hexdigest(),
        },
        "emulator": {"name": "Unicorn", "version": unicorn.__version__, "pefile": pefile.__version__},
        "scope": "仅执行 FBase #893 及缓存构造实际调用的 #910/#396/#387/#400；不运行客户端。",
        "function_va": f"0x{DRAW_VA:08x}",
        "fpcw": {
            "unicorn_initial": "0x0000",
            "explicit": f"0x{DEFAULT_FPCW:04x}",
            "note": "Unicorn 初始 x87 控制字为 0；证据用 0x027f 显式设为 53 位精度、最近舍入，不能据此宣称等同完整 Windows CRT 进程。",
        },
        "color_inputs": [f"0x{color:08x}" for color in COLORS],
        "native_cache": emulate_full_cache(args.dll, COLORS[:3]),
        "cases": cases,
    }
    rendered = json.dumps(evidence, ensure_ascii=False, indent=2) + "\n"
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(rendered, encoding="utf-8")
    print(
        json.dumps(
            {
                "schema": evidence["schema"],
                "dll_sha256": evidence["dll"]["sha256"],
                "emulator": evidence["emulator"],
                "case_count": len(cases),
                "output": str(args.output),
                "sample": cases[0],
            },
            ensure_ascii=False,
            indent=2,
        )
    )


if __name__ == "__main__":
    main()

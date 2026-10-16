#!/usr/bin/env python3
"""仿真 FBase #428 的格式1灰度写入，验证三通道整数平均。"""

import hashlib
import json
import struct
from pathlib import Path

import pefile
import unicorn
from unicorn import UC_ARCH_X86, UC_MODE_32, Uc
from unicorn.x86_const import UC_X86_REG_ECX, UC_X86_REG_EIP, UC_X86_REG_ESP


def main():
    dll = Path("CLIENT/fbase.dll")
    pe = pefile.PE(str(dll))
    machine = Uc(UC_ARCH_X86, UC_MODE_32)
    base = pe.OPTIONAL_HEADER.ImageBase
    machine.mem_map(base, pe.OPTIONAL_HEADER.SizeOfImage)
    machine.mem_write(base, pe.get_memory_mapped_image())
    machine.mem_map(0x70000000, 0x10000)
    machine.mem_map(0x71000000, 0x100000)
    target, pixels, stack, sentinel = 0x71000000, 0x71001000, 0x70008000, 0xDEADBEEF
    machine.mem_write(target, struct.pack("<8I", 0, 1, 1, 4096, 4096, 1, 4096, pixels))
    samples = [(145, 145, 144), (1, 2, 3), (0, 0, 255), (255, 0, 0)]
    samples += [(v, v, v) for v in range(256)]
    # 每种可能的通道和都有一个样本，覆盖除法的全部输入值。
    samples += [(min(s, 255), min(max(s - 255, 0), 255), max(s - 510, 0))
                for s in range(766)]
    output = bytearray()
    for index, (red, green, blue) in enumerate(samples):
        machine.mem_write(stack, struct.pack(
            "<4I", sentinel, index, 0, 0xFF000000 | red << 16 | green << 8 | blue))
        machine.reg_write(UC_X86_REG_ECX, target)
        machine.reg_write(UC_X86_REG_ESP, stack)
        machine.emu_start(0x1001AB60, sentinel, count=100)
        if machine.reg_read(UC_X86_REG_EIP) != sentinel:
            raise RuntimeError("原生函数未正常返回")
        output.extend(machine.mem_read(pixels + index, 1))
    expected = bytes(sum(rgb) // 3 for rgb in samples)
    # 连续执行 #344 的格式4到格式1路径，核验量化后的所有16位颜色。
    source, source_pixels, gray_pixels = 0x71003000, 0x71010000, 0x71040000
    count = 65536
    machine.mem_write(source, struct.pack(
        "<8I", 4, 2, count * 2, count, 1, count * 2, source_pixels, 0))
    machine.mem_write(source_pixels, struct.pack("<65536H", *range(count)))
    machine.mem_write(target, struct.pack(
        "<8I", 0, 1, 1, count, count, 1, count, gray_pixels))
    machine.mem_write(target + 0x24, struct.pack("<4I", 0, 0, count, 1))
    machine.mem_write(stack, struct.pack("<5I", sentinel, source, 0, 0, 0))
    machine.reg_write(UC_X86_REG_ECX, target)
    machine.reg_write(UC_X86_REG_ESP, stack)
    machine.emu_start(0x1001DC10, sentinel, count=8_000_000)
    if machine.reg_read(UC_X86_REG_EIP) != sentinel:
        raise RuntimeError("原生格式4到格式1转换未正常返回")
    gray = bytes(machine.mem_read(gray_pixels, count))
    gray_expected = bytes(
        (((v >> 8) & 248) + ((v >> 3) & 252) + ((v << 3) & 248)) // 3
        for v in range(count))
    evidence = {
        "schema": "fbase-aex-gray-oracle-v1",
        "dll_sha256": hashlib.sha256(dll.read_bytes()).hexdigest(),
        "function_va": "0x1001ab60",
        "format1_branch_va": "0x1001ab8e",
        "emulator": {"unicorn": unicorn.__version__, "pefile": pefile.__version__},
        "scope": "仅仿真格式1像素写入，不执行GIF加载或原版客户端",
        "formula": "(R+G+B)//3",
        "sample_count": len(samples),
        "all_channel_sums_covered": [0, 765],
        "all_values_match": output == expected,
        "native_output_sha256": hashlib.sha256(output).hexdigest(),
        "samples": [{"rgb": list(rgb), "native_gray": output[i]}
                    for i, rgb in enumerate(samples[:4])],
        "rgb565_to_gray": {
            "function_va": "0x1001dc10",
            "input_count": count,
            "all_values_match": gray == gray_expected,
            "native_output_sha256": hashlib.sha256(gray).hexdigest(),
            "formula": "(((v>>8)&248)+((v>>3)&252)+((v<<3)&248))//3",
        },
    }
    destination = Path("analysis/evidence/aex-gray-oracle.json")
    destination.write_text(json.dumps(evidence, ensure_ascii=False, indent=2) + "\n",
                           encoding="utf-8")
    print(json.dumps(evidence, ensure_ascii=False, indent=2))
    if output != expected or gray != gray_expected:
        raise SystemExit(1)


if __name__ == "__main__":
    main()

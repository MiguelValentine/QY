#!/usr/bin/env python3
"""为 REA 的反汇编文本添加 PE 导入、导出和字面量注释。"""
import json
import re
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
inventory = json.loads((ROOT / "analysis/evidence/pe-inventory.json").read_text())
labels = {
    "fcruner.exe": "fcruner", "fbase.dll": "fbase", "objsys.dll": "objsys",
    "service/templeflower/bin/showdown.dll": "showdown",
    "service/onepusonenew/game/pacman/bin/pacmandll.dll": "pacmandll",
    "\u5e05\u54e5\u5947\u57df.EXE": "launcher",
}
for module in inventory["files"]:
    label = labels[module["path"]]
    source = ROOT / f"analysis/disassembly/{label}.asm"
    if not source.exists():
        continue
    symbols = {}
    for item in module["imports"]:
        symbols[item["iat_va"]] = f'{item["library"]}!{item["name"] or "#" + str(item["ordinal"])}'
    for item in module["exports"]:
        symbols.setdefault(item["va"], f'export {item["name"] or "#" + str(item["ordinal"])}')
    for item in module["ascii_strings"]:
        if item["va"] is None:
            continue
        section = next((s for s in module["sections"] if s["rva_start"] <= item["rva"] < s["rva_end"]), None)
        if section and section["name"] != ".text":
            symbols.setdefault(item["va"], repr(item["value"][:240]))
    lines = []
    for line in source.read_text().splitlines():
        match = re.match(r"\s*([0-9a-f]+):", line)
        if match and int(match[1], 16) in symbols:
            lines.append(f"; {symbols[int(match[1], 16)]}")
        references = dict.fromkeys(int(s, 16) for s in re.findall(r"0x([0-9a-f]+)", line))
        hints = [f"{hex(address)}={symbols[address]}" for address in references if address in symbols]
        lines.append(line + ("  ; " + ", ".join(hints) if hints else ""))
    source.with_suffix(".annotated.asm").write_text("\n".join(lines) + "\n")
    print(label, "annotated")

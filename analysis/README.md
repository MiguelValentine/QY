# REA 分析产物

先阅读 [实现分析报告](REA-fcruner-analysis.md)。

- `evidence/`：18 份完整 REA 返回、样本结构清单、依赖解析和验证记录。
- `disassembly/`：REA objdump 原始输出及附有导入/导出/字符串注释的版本。
- `decoded/`：FCC 外层解码与 CAB 成员提取结果；FC0A 文件仍为字节码。
- `tools/`：复查和提取工具。

目标 EXE/DLL 没有执行，原始 CLIENT 文件没有修改。静态字符串命中只表示字节存在，不证明运行时使用。

## 本机复查

已有 Python 环境为 `/Users/miguel/.cache/rea-qy-analysis-venv/bin/python`，包含 pefile 2024.8.26、capstone 5.0.9。FCC 位流变换脚本本身仅使用 Python 标准库，CAB 提取另需本机 7-Zip。

在 `/Users/miguel/Desktop/QY` 执行：

```sh
/Users/miguel/.cache/rea-qy-analysis-venv/bin/python analysis/tools/pe_inventory.py
/Users/miguel/.cache/rea-qy-analysis-venv/bin/python analysis/tools/annotate_assembly.py
/Users/miguel/.cache/rea-qy-analysis-venv/bin/python analysis/tools/build_evidence_index.py
/Users/miguel/.cache/rea-qy-analysis-venv/bin/python analysis/tools/decode_fcc.py CLIENT --check
/Users/miguel/.cache/rea-qy-analysis-venv/bin/python analysis/tools/extract_fcc.py --resume
/Users/miguel/.cache/rea-qy-analysis-venv/bin/python analysis/tools/index_decoded.py
/Users/miguel/.cache/rea-qy-analysis-venv/bin/python analysis/tools/inspect_fc0a.py
```

`collect_rea.mjs` 使用当前机器已安装的 REA 6.5.0 与 Node 24 绝对路径；它会复用已有结果。若换机器，需要先调整路径并准备 REA / objdump。不要把补充 pefile/字符串分析误称为 REA 反编译证据。

# `SYSTEM.FCC` 纯色背景语句静态证据

## 范围与来源

本文核对 `CLIENT/objsys.dll` 内嵌的 `FCC/SYSTEM.FCC` 首条有效脚本语句 `bk:=color(#003366);`，并追踪对应 `SYSTEM.COD` FC0A 标记与 `objsys.dll` 的颜色分派分支。证据来自 PE 资源清单、按现有 `decode_fcc.py` 解码的 `SYSTEM.COD`、本地 `internal/symbol` 哈希实现及 `analysis/disassembly/objsys.annotated.asm`。没有运行原版客户端；下文是静态分析，不代表已观察到运行时背景绘制。

资源快照曾提取到 `/tmp/qy-system-resources/SYSTEM.FCC.utf8` 和 `/tmp/qy-system-resources/SYSTEM.COD`。资源身份及加载边界见 [SYSTEM 脚本启动路径](system-script-startup.md)：静态入口 `0x10060080` 明确读取、编译并执行 `SYSTEM.COD`，但没有闭合 `SYSTEM.FCC` 与该编译入口的加载关系。因此源码和编译产物在此用于语句/标记交叉核对，不据此推断它们启动时必然同时执行。

## FC0A 对应标记

`SYSTEM.COD` 为 XY20 容器；使用仓库脚本解码后，CAB 中唯一成员为 `tmp.cod`，长度 30,405 字节，FC0A 代码段从文件偏移 `0x14` 起。首三项是系统宏定义，随后偏移 `0x68` 开始出现目标语句：

| FC0A 文件偏移 | kind | value | 对应解释 |
|---:|---:|---:|---|
| `0x68` | 6 | `0x4d18dd80` | `StringTableHash("bk")` |
| `0x6e` | 1212 | `0x79` | `:=` |
| `0x74` | 6 | `0x7d69d3c0` | `StringTableHash("color")` |
| `0x7a` | 101 | `0x0a` | `(` |
| `0x80` | 2 | `0x00003366` | 内联整数 `0x3366`，对应源码颜色实参 `#003366` |
| `0x86` | 980 | `0x62` | `)` |
| `0x8c` | 1230 | `0x7b` | `;` |

因此标记 kind `206` 不属于这条语句；`:=' 的标记 kind 是 `1212`。此处哈希映射由 `StringTableHash` 验证，不是根据变量/函数拼写直接推断。FC0A 布局与读取器边界见 [标记字段与链接笔记](fc0a-token-links.md)。

## 原生 `color` 分支

`objsys:0x100435f0` 是一个原生对象哈希分派处理器。它从当前对象 `+0x28` 调用虚表槽，释放旧 `+0x24` 值、清零该字段后，从栈参数 `[ESP+0x5c]` 取得待分派哈希（`0x10043608–0x10043642`）。处理器先初始化多个对象状态字段，再按哈希分派。

分派树后段在 `0x10043cfd` 比较 `EAX` 与 `0x7d69d3c0`；相等时跳至 `0x10043de8`。该常量与 `StringTableHash("color")` 一致。成功分支：

- 将 `[ESP+0x60]` 作为待验证值传给 `FBase.dll!#779`，要求返回值为 `1`；否则走失败分支 `0x10043a7d`（`0x10043de8–0x10043df7`）。
- 将同一值传给 `FBase.dll!#778` 取得整数（`0x10043dfd–0x10043e04`）。
- 按 RGB565 位布局转换整数：红通道位形成 `0xf800`，绿通道位形成 `0x07e0`，蓝通道位形成 `0x001f`；结果写入对象 `+0xc4`。同时对象 `+0x20` 写入 `0`，随后汇入处理器的成功完成路径（`0x10043e05–0x10043e2d`）。

对 `#003366` 对应的实参整数 `0x003366` 应用该位转换，结果为 `0x018c`。这是由 FC0A 实参与原生指令计算得出的静态结果，支持“`color` 分支接受整数并构造纯色 RGB565 状态”。它不是对屏幕实际绘制或颜色视觉输出的运行时验证。

## `bk` 绑定边界

- FC0A 确认脚本形态是 `bk := color(0x3366)`；`:=` 与 RHS 的 `color` 哈希是不同标记，不能将 `color` 哈希当成左值 `bk`。
- `0x1005f5c3–0x1005f5e5` 将名称字符串 `0x100a3620` 登记到工厂表 `0x10121e6c`；该字符串在 PE 中为 `bk`，表项对应工厂 `0x10045f40`。这不是之前检查到的 `bktile`、`bkicon` 登记片段（`0x1005f253–0x1005f29d`）。
- `bk` 工厂 `0x10045f40` 调用 `0x10045eb0` 取得/创建对象。新对象路径在 `0x10045ef8` 将分配块偏移 `+8` 的地址作为 `ECX` 调用构造器 `0x10043560`；构造器在 `0x1004358c` 将对象首字段设为 vtable 地址 `0x100a1b58`。
- 对 `CLIENT/objsys.dll` 的 `.rdata` 静态字节转储显示，vtable `0x100a1b58` 的第一个 DWORD 是小端 `f0 35 04 10`，即函数指针 `0x100435f0`。该函数从接收对象取分派上下文、清理旧状态并按参数哈希处理；其 `color` 分支直接命中前述 RGB565 转换。因此原生静态链已经闭合为：`bk` 名称登记 → `bk` 工厂 → 构造器创建并设置该 vtable → 首槽进入 `0x100435f0` → `color` 哈希分支写纯色状态。
- FC0A 中 `bk`、kind `1212` 的 `:=`、`color` 调用及整数实参的连续顺序，与上述工厂对象及其 `color` 分派器相吻合。这支持该系统脚本以 `bk` 对象接收 `color` 初始化操作；不过现有静态证据尚未恢复解释器如何把 `:=` 的语法树具体降低为工厂查询/对象调用的全部步骤，也未动态观察该语句。
- `0x1005f775` 登记的是名称 `autopos` 与工厂 `0x100434b0`，与 `bk` 无关；不将其作为本链证据。`color` 分支明确保存 RGB565 值到 `+0xc4`，但该状态后续由哪个绘制例程消费、最终如何显示仍未闭合。

因此，`bk`→原生工厂→纯色处理对象的关联有名称表、工厂代码、构造器和 vtable 原始字节交叉支持，不再是未知项；仍未知的是 `:=` 的完整解释器桥接步骤及纯色状态后续绘制消费者。

## 复核命令

```sh
python3 analysis/tools/decode_fcc.py /tmp/qy-system-resources/SYSTEM.COD --output /tmp/qy-system-resources/SYSTEM.CAB
bsdtar -tf /tmp/qy-system-resources/SYSTEM.CAB
bsdtar -xOf /tmp/qy-system-resources/SYSTEM.CAB tmp.cod
go run ./analysis/tools/symbol_lookup 0x7d69d3c0 CLIENT/objsys.dll CLIENT/fbase.dll
objdump -s -j .rdata CLIENT/objsys.dll
```

`symbol_lookup` 的空结果只表示该工具扫描的可打印字符串范围没有给出候选，不能推翻 FC0A/SYSTEM.FCC 中已核实的名称哈希或原生分派比较指令。

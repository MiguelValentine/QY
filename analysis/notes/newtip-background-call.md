# ToolTips 背景绑定与资源加载

系统 `SYSTEM.COD:0x3560` 和入口包含的 `com/newtip.fcc` 都使用 `bk:=himgtile("res$ToolTips.ale")`。`StringTableHash("himgtile")` 为 `0x8d663526`，对应 objsys 背景处理器 `0x10043d13` 的分派。`bk` 工厂与绑定调用语义见 [背景颜色](system-background-color.md) 和 [绑定赋值](binding-assignment.md)。

`0x10043d1e–0x10043d7c` 调用 FBase `#768` 抽取路径及可选参数；默认写入背景 `+0xd8=255`、`+0xc4=0x64646464`。抽取至少一个参数后，`0x10043d81–0x10043da5` 把路径交给 `0x1005fc30`，将背景模式写成 `0x13`，保存返回的图片资源引用。`0x1005fc30` 转发至 `0x10019b00`，经 FBase `#32/#63` 的资源路径装入图片。默认参数的完整绘制消费仍需单独恢复。

`.ale` 的读取分支是 FBase `#63 -> #484 -> #68 -> #69`；不是此前误认的 `#449` 通用 OLE 图片路径。`#68` 检查 `ALE\0`，`#69` 检查 `AEX\0`。本资源为后者：`objsys.dll` 的 `IMG/TOOLTIPS.ALE/2052`、文件偏移842104、长度990、SHA-256 `03600b4d0c9c8ebc222a8092479841dfab92e29adf680222b621d9207c5a4b04`。

Go 启动现在从 DLL 读取这份资源数据，经 `ParseAEX` 解密出两张42×30的 GIF 平面并保留三个六 DWORD 记录，保存为背景状态。没有调用原始 DLL 函数。该状态不证明图片已经绘制；原生平面转换、透明度特殊值、帧裁剪和横向拼接的绘制消费尚未完整恢复。更多字段证据见 [资源验证](tooltips-resource.md)。

静态依据：REA FBase 反汇编证据 `ev_5fc95fa046397bf605b945fbf373993a52efed99a223a6fc52164b61aa8a1e0a`、objsys 本地反汇编及 PE 资源清单 `ev_39c4876f1d896585d3fc56f35416264c4e08b1475ab3ba32789f18878133b5cd`。这些是静态证据，不代表原版运行观测。

# 普通 `img` 构造、帧矩形与更新路径

## 结论

普通 `img` 的类哈希为 `0x0aa80ccc`，其工厂为 `0x1002ca80`，分配
`0x110` 字节并调用共享构造函数 `0x1002bb60`。普通 `img` 与 `imgex` 的
`src` setter/getter 最终共用 `0x1002bee0` / `0x1002c330`；差异之一是
共享构造时对象 `+0x108` 的默认值：普通 `img` 为 100，`imgex` 构造随后
改为 98。该初值作为 `src` 参数抽取的默认整数参与资源加载参数，不应解释
为尺寸或缩放比例。

FBase `#50` 按当前帧索引取帧块中的 offset 和 width/height，构造
`RECT=(offsetX, offsetY, offsetX+width, offsetY+height)`。普通图像的
`0x1002bc90` 将此 RECT 写入对象 `+0x24..+0x30`，并在 `+0xfc` 非零时
再走 `#409`。所以矩形宽高是右减左、下减上；有非零帧偏移时，左/上坐标
并不必然为零。对 `CLIENT/in/img/logo.ale`，AEX 第一条记录可见前四个
DWORD 为 `275, 223, 0, 0`，但目前仅凭本地文件字节不能把该记录与某次
运行中的 `img` 构造/绘制绑定。

`0x1002c5f0` 在 `+0x10c` 非零且 `+8` 的 `0x1000` 位有效时，经
`0x1002c62e–0x1002c634` 调用事件 helper `0x1005ab90`，事件哈希为
`0x1a406c75`（真实入口的 `OnLoaded`），随后清零 `+0x10c`。这属于更新期
事件，src setter 不立即执行脚本回调。其末尾 `0x1002c6aa` 调用
`0x1005daa0`，后者先处理本对象绑定，再处理子对象。该顺序不证明首帧像素。

## 类、工厂与默认值

- `analysis/disassembly/objsys.annotated.asm` 第 126529 行附近，
  `0x1005f1ad` 将工厂地址 `0x1002ca80` 写入工厂表。普通 `img` 类哈希
  `0x0aa80ccc` 在对象构造分派的 `0x1002cc0a` 命中该类型分支。
- 工厂 `0x1002ca80`（第 58271 行起）分配 `0x110` 字节，将所属对象作为
  参数传给构造函数 `0x1002bb60`。共享构造先调用 `wnd` 构造函数
  `0x1005d720`，设置基础 vtable `0x100a0b38`，并初始化图像成员。
- `0x1002bb60` 在 `0x1002bbf4` 清零 `+0x10c`，在 `0x1002bbfb` 写入
  `+0x108 = 0x64`（100）。`imgex` 构造 `0x1002e070` 也先调用
  `0x1002bb60`，再在 `0x1002e0c9` 将自己的 `+0x108` 改成 `0x62`（98）。
- `imgex` 的 setter/getter 跳板 `0x1002e150`、`0x1002e160` 分别跳到
  `0x1002bee0`、`0x1002c330`。普通 `img` 使用的基础图像 vtable 同样是
  `0x100a0b38`；setter `0x1002bee0` 内 `src` 哈希
  `0xa06413cf` 的分支为 `0x1002c1e3`，读取 `+0x108` 作为 FBase
  `#768` 参数解包器的整数初值，并将所得字符串/整数传至资源查找路径。
- `src` 名称的字符串候选及 `(string, int)` 的参数形态、整数乘二传入资源
  查找的细节，见 [`imgex-startup.md`](imgex-startup.md)。该共享路径中的
  `+0x108` 是资源路径的加载参数，不等同缩放大小。

## 帧 RECT 到窗口矩形

FBase `#50` 位于 `analysis/disassembly/fbase.annotated.asm` 第 57613 行
起，VA `0x100261f0`。其行为由直接读写指令支持：

- 验证帧表存在（对象 `+0x7c` 非零）且当前索引满足 `0 <= index < +0x84`；
  从帧指针表 `+0x90` 取 `frame[index]`。
- 将帧块 `+0x10`、`+0x14` 写到输出 RECT 的 `left`、`top`；将帧块
  `+0x08`、`+0x0c` 分别加到 `left`、`top` 后写入 `right`、`bottom`。
  因而 RECT 几何为
  `left=offsetX`、`top=offsetY`、`right=offsetX+width`、
  `bottom=offsetY+height`。条件不满足时输出四个零。
- 图像更新函数 `0x1002bc90`（`objsys.annotated.asm` 第 57089 行起）只在
  `+0x69` 有资源且 `+0x58` 状态为零时调用 `#50`，帧索引取对象 `+0x6d`，
  输出缓冲区指向 `+0x24`。这直接把 RECT 四个 DWORD 写入 `wnd` 矩形字段。
  如果对象 `+0xfc` 非零，之后另将 `+0xfc` 和 RECT 指针传给 FBase
  `#409`；当前证据不足以在这里进一步命名其行为。

FBase AEX `#69 -> #77` 的既有字段映射见
[`aex-frame-mapping.md`](aex-frame-mapping.md)：记录中的宽高、位置和两个
偏移经帧构造路径落到帧块字段。`logo.ale` 文件开头为 `AEX\0`；其头部的
帧数、模式和两段长度位于文件偏移 `0x0c..0x1b`，偏移 `0x20` 起的首条记录
前四个 DWORD 字节为 `275,223,0,0`。这与 AEX 描述符所用的
`[width,height,x,y,...]` 顺序相符，但仅作为静态资源字节与既有字段映射的
对照；其余记录字段的实际渲染语义、原生客户端是否在特定启动流程中加载该
文件、以及最终绘制坐标均未由本次核对确认。

## 更新尾部与 `ctrl` 的关系

- 普通图像更新调用点 `0x100212a7`（`objsys.annotated.asm` 第 42996 行）
  位于 `0x100210e0` 例程的公共尾部。无待处理更新量的分支跳到
  `0x1002129e`，也会顺序到达对此函数的调用；动画帧更新路径先修改帧索引、
  调用 vtable `+0x84`，随后也合流至此尾部。
- `0x1002c5f0` 的 `+0x10c` 路径调用事件 helper，而非 vtable `+0x84`；
  后者是后续帧切换路径 `0x1002c67f` 的独立调用。事件返回后清零加载标志。
- `0x1005daa0` 的 `0x1005dada–0x1005db1c` 遍历 `+0x9c` 绑定列表，
  对未结束且启用的绑定调用 vtable `+8`，之后 `0x1005db1e` 起遍历子对象。
  因此图像自身加载事件先于其基类处理本对象 ctrl 绑定。跨对象顺序还依赖
  父子列表，不得把所有图像事件统一置于所有控制器之前。
- Go 调度按对象树处理加载事件、本对象控制器、子对象；本轮新增对象从下次
  更新开始。这一快照策略是移植选择，未宣称完全复现原生列表迭代时的增删行为。

## 主要证据与验证边界

- `analysis/disassembly/objsys.annotated.asm`：普通 `img` 工厂登记
  `0x1005f1ad`、工厂 `0x1002ca80`、共享构造 `0x1002bb60`、`src`
  dispatcher `0x1002bee0` / `0x1002c330`、矩形更新 `0x1002bc90`、
  更新尾部 `0x1002c5f0`。
- `analysis/disassembly/fbase.annotated.asm`：FBase `#50`
  `0x100261f0`；AEX 帧参数/字段映射见 [`aex-frame-mapping.md`](aex-frame-mapping.md)。
- `CLIENT/in/img/logo.ale`：本地 AEX 文件字节；FC0A 字符串索引中存在
  `in/img/logo.ale` 候选（`analysis/evidence/fc0a-index.json` 第 43740 行）。

本记录基于静态反汇编和资源字节检查，不是原版客户端运行观察。帧 RECT
写入对象字段不证明该矩形已绘制到屏幕；AEX 帧 offset 的最终坐标基准、事件
后的输入响应和最终像素混色仍未恢复。

## Go 运行边界

Go 已加载真实 `logo.ale`：AEX 颜色平面解密后以 `FF D8` 开头，按 JPEG
解码；透明度平面按灰度 GIF 解码，再沿既有模式3准备帧，得到一帧275×223。
真实地图 `land_02.ale` 的颜色平面与透明度平面均为 JPEG，透明度平面逐像素
确认是灰度后准备为两帧 `130×99` 和 `275×202`，第二帧偏移 `(-79,-57)`。
标准库 JPEG 解码与原版解码器逐像素舍入是否完全一致尚未验证。

真实入口测试已越过 `index.fcc:0x1acc` 的带参数 `new land(...)`，进入 land
类体并设置 `pointmode`、位置 `(272,206)` 及 `src` `in/img/map/root/land_02.ale`；
之后推进到 `index.fcc:0x1670` 的 `CreateObj` 调用（哈希 `0x0e9c89f6`）。
这记录的是资源和属性初始化，不是场景像素。单独推进已建立的 Logo 图像对象时，
`OnLoaded` 设置位置 `(27,590)` 后仍停于 `index.fcc:0xf38` 的未恢复移动绑定
`0x403e4ac8`；没有完整绘制、登录或进入游戏证据。

# FCRUNNER 的 Go 重建

这是从 `CLIENT/fcruner.exe`、`objsys.dll`、`FBase.dll` 和两个游戏插件逐步恢复的 Go 实现。**已能运行桌面启动链并继续恢复真实入口脚本，但尚未进入游戏，不能替代原版客户端。**

## 使用

需要 Go 1.20 或更高版本。在项目目录执行：

```sh
go run . check
go run . inspect index.fcc
go run . tokens index.fcc
go run . preprocess index.fcc
go run . compile index.fcc
go run . compile lobby/lobby.fcc
go run . prepare
go run . image act/img/bullet/bullet.ale /tmp/bullet-preview.png 0
go run . -client /path/to/CLIENT inspect com/client.fcc
go test ./...
go build -o /tmp/fcrunner-go .
go run ./cmd/fcrunner -client CLIENT -entry index.fcc
go run ./cmd/fcrunner -client CLIENT -entry index.fcc -network
go build -o /tmp/fcrunner-desktop ./cmd/fcrunner
```

`check` 直接读取客户端中的全部 FCC，完成外层还原、CAB/LZX 解包、FC0A 标记与字符串池解析、嵌入 LZW 数据块解压。`inspect` 输出完整结构 JSON；字符串与数据块按原始字节保留，在 JSON 中使用 Base64，避免字符集转换损失。

`tokens` 输出带原始偏移、类型和值的可读标记表。87 个关键字和运算符逐项对照 `objsys.dll` 静态表；字符串按 FBase #627/#858 的哈希匹配本文件字符串池，保留冲突候选及原始字节转义。标识符哈希可能对应其他文件或系统符号，匹配结果只能视为候选；这不是完整源码还原。

`prepare [入口.fcc]` 默认读取 `index.fcc`，列出字符串池中的 FCC/DLL 路径候选与本地文件状态，以及尚缺的运行能力。路径暂以入口所在目录为候选基准；字符串出现不能证明资源会被加载，也不能确定实际加载顺序。

`preprocess` 展开对象宏、函数宏、条件和活动的包含文件，保留每个标记的来源及偏移。路径常量采用客户端相对路径；`_MAIN` 仅在根入口定义。该命令保留 `#system` 和 `#import`，不执行宿主初始化。真实 `index.fcc` 当前展开五个包含文件。

`compile` 输出语法树，支持当前启动样本中的类、对象、样式、函数、闭包及控制流结构。入口、登录、主客户端、大厅和注册角色脚本有真实资源回归测试。解析成功只证明标记可建立结构，不证明类系统、优先级和所有语法已与原程序完全一致。

批量编译审计覆盖全部 626 个 FCC 入口，当前 550 个通过、76 个失败（36 个语法问题、39 个缺失或越界包含资源、1 个 FCTB）。这些文件也包含被其他脚本使用的数据资源，不能把逐份入口编译的通过比例视为游戏功能完成比例。明细见 `analysis/evidence/script-compile-coverage.json`；运行 `go run analysis/tools/script_compile_coverage.go` 可重新生成。

运行程序不依赖 Python、7z 或分析阶段生成的 `analysis/decoded`。启动会从原始 `CLIENT/objsys.dll` 读取内嵌系统脚本和图片资源数据，所有解析和执行由 Go 完成，不调用原始 DLL 函数。纯 Go LZX 库放在 `third_party/lzx`，保留上游许可证；构建无需另行安装解包工具。测试使用分析清单和原始 CLIENT 资源进行回归比较。

当前验证结果：626 份 FCC 的外层解码和全部成员解包哈希均与分析清单匹配，625 份 FC0A 的结构解析及 177 个嵌入 LZW 压缩块测试通过。LZX 已修复未压缩块字典更新、奇数填充、块头对齐和跨块 E8 地址转换；另外对两个曾失败的地图以多种读取粒度验证结果一致。这些结果覆盖当前样本，尚不能证明完整客户端已移植。

资源启动已接入 `0x112e4b8f` 路径映射与 `0xaf665c57` 资源目录读取：目录通过 HTTP 最多重试 10 次，成功后写入独立的 `os.UserCacheDir()/qy-fcrunner` 缓存；目前每次启动仍重新请求，缓存命中校验和有效期尚未恢复。FC0A 编译数据保留原字节、不拆成文本行；XY20 CAB 的多个成员按原顺序拼接后再判定内容类型。目录记录使用原生规范化哈希键覆盖，包括大小写规范化导致的同键，不做完整路径二次比较；非 ASCII 目录路径哈希明确返回不支持。`imgex` 已接入工厂与 `src` string / string,int 两种形态、JPEG 资源加载及 800×600 源尺寸读取；AEX 灰度 JPEG 透明度平面也已接入，资源名按小写处理，整数参数乘 2 后传入资源查找，尚未将该参数解释为缩放比例。

## 已实现

| 原生职责 | Go 实现 | 范围 |
| --- | --- | --- |
| FCC 外层变换与 CAB 提取 | `internal/fcc` | XY20、!CD1、CAB 文件表、LZX、成员路径与大小校验 |
| FC0A 读取 | `internal/fc0a` | 文件头、标记流、字符串池、内嵌数据、词法名称和字符串候选；未知标记保留原值 |
| FBase #882 | `internal/lzw` | 9–12 位变宽 LZW、清表、字典扩展、长度验证 |
| FBase 网络字节变换 | `internal/fbase` | B/L 模式和流状态；仅验证握手固定前缀 |
| FBase #858 字符串表桶哈希 | `internal/symbol` | 按原生指令验证；该值与插件注册类 ID 不同 |
| 对象系统资源加载 | `internal/objsys` | 直接 Go 调用、Windows 资源名匹配、客户端目录边界、入口准备报告 |
| 脚本预处理、语法与部分求值 | `internal/script` | 宏、包含文件、语法树；整数、原始字节字符串、变量、函数、闭包、条件、循环与 switch，未恢复行为明确报错 |
| 部分 objsys 纯内置函数 | `internal/script/builtins.go` | 按哈希登记 strlen、left、right、mid、atoi、str、整数 abs/min/max、RGB；沿原生调用恢复的边界见分析笔记 |
| 系统初始化与本机设置 | `internal/objsys/system.go`、`internal/fbase/registry_windows.go` | `#system devcode` 列表比较和字体字符集状态；Windows 只读原注册表位置，非 Windows 保持没有开发配置的状态 |
| 对象宿主调用与属性桥 | `internal/script/runtime.go`、`internal/objsys/desktop.go` | 隐式/显式对象调用、宿主属性读写、只读 `pdesktop`、桌面标题、字体字符集重建和逻辑窗口尺寸 |
| 类定义与对象构造 | `internal/script/runtime.go`、`internal/script/construct.go` | 保存类名、基类、初始化体和声明环境；已接入带参数 `new`、同名构造方法及 `OnCreate`，并支持部分内置对象 |
| 实际窗口与字体后端 | `internal/gamewindow`、`internal/display`、`cmd/fcrunner` | Ebitengine 桌面窗口、图像提交与事件循环，系统中文字体、GBK/Big5 解码；已接入场景更新回调，绘制和输入分派尚未完成 |
| 图片和属性动画 | `internal/objsys/imgex.go`、`internal/objsys/controller.go` | img/imgex、本地 JPEG 与 AEX 帧准备（含灰度 JPEG alpha）、延迟加载事件、ctrl:loop 计时步进与脚本完成回调；未知移动绑定明确拒绝 |
| ALE v3 解码与帧预览 | `internal/ale` | 帧/行边界、跳行、透明和量化 alpha、RGB565颜色；`image` 导出PNG，未知特殊绘制命令明确拒绝 |

所有自有源代码注释使用中文；函数名、格式名、指令名及原生地址保留原样。

## 未恢复部分

- 完整脚本语言执行语义、类系统、系统内置对象、宿主指令和其余预处理行为。
- 图形/ALE 渲染、窗口事件、音频与游戏更新循环。
- PacMan、Showdown 插件中的完整玩法。注册信息已取得，但尚未将玩法函数移植到 Go。
- 登录协议的完整分帧、种子配置和服务器交互。
- FCTB 的内部结构，以及启动器更新清单和下载验证。
- 插件类 ID 的生成规则；保留已观察到的注册常量，不将字符串表桶哈希用作类 ID。

`run [入口.fcc]` 执行真实启动链并报告首个尚未恢复的能力。图形入口为 `go run ./cmd/fcrunner`；默认不启用网络。运行 `go run ./cmd/fcrunner -client CLIENT -entry index.fcc -network` 可启用 HTTP 资源获取，单次请求超时为 5 秒。启动先执行 DLL 内嵌 `SYSTEM.COD`，再执行入口；两份程序共享系统宏和宿主对象。系统脚本已恢复背景、类和样式登记、ToolTips 子对象、AEX 帧准备及提示窗口注册。DateCmp 的空回调沿用参数 tuple，随后与整数比较产生原生错误 8；桌面构造器忽略此已知错误并继续入口。

2026-10-16 当前真实入口测试与 macOS 桌面运行已越过 `view`（类哈希 `0x771f6e8b`）和两个 `atomsys` 粒子系统，推进到 `com/ctrl.fcc:0xb2a` 的未定义名称 `0x1bc7abd3`。`CreateObj`、事件签名选择、`autopos` 自动排列、命名 `ctrl` 绑定、粒子缓存和粒子更新已接入；入口已构造背景、Logo、六张地图的两帧子图和三个按钮，共17个图片对象。完整帧循环、场景绘制、输入、登录和玩法尚未完成，没有进入游戏的证据；桌面实跑与网络结果见 [启动记录](analysis/notes/startup-progress.md)。

图形入口使用兼容当前 Go 1.20 的 Ebitengine 2.7.10，需要可用的桌面显示会话。已在本机 macOS 执行到上述脚本边界，Windows 386 图形程序已交叉构建，尚未在 Windows 上运行。显示器休眠时本机曾触发依赖库初始化崩溃，唤醒显示器后可执行；该环境问题仍需进一步处理。资源检查命令不导入窗口后端，不受其初始化影响。

字体后端从已安装的系统中文字体加载 TTF/TTC，以 Go 字体栅格器创建实际字形；本机已用宋体绘制验证“中文”。这是跨平台替代，不能声称与 GDI 的字体选择、字宽、hinting 和像素输出一致。标题按宿主选定的 GBK 显示字符集解码，字体属性写入可切换 GBK、Big5 或默认单字节编码；未知字符集与非法文本明确报错。详见 [桌面绑定证据](analysis/notes/pdesktop-binding.md)。

`image` 的帧序号从0开始，输出路径已存在时拒绝覆盖。预览使用量化 alpha 的代表值，不能代替原生混色和特殊绘制模式；完整颜色证据见 [ale-colors.md](analysis/notes/ale-colors.md)。

原生证据、入口地址与剩余问题见 [REA 分析报告](analysis/REA-fcruner-analysis.md)。静态解析与样本一致性测试不能代替原版客户端的运行时行为对照。

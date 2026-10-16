# Go 图形入口启动验证

## 2026-10-16 当前状态

原生桌面构造先装入 DLL 内嵌 `SYSTEM.COD`、编译并执行，再运行入口。Go 已接入此阶段，两份程序共享宏和桌面对象；`ZTOP=0x6fffffff` 从真实系统脚本展开。相关证据见 [系统启动](system-script-startup.md)。

系统脚本已执行背景、类和样式登记，构造 `ToolTips:wnd` 与 `tptext:text`，并接入 AEX 帧准备。AEX 两 GIF 平面均为42×30，准备结果含20×30、8×30、14×30三帧及偏移，并保留43个特殊像素；最终混色和特殊像素呈现尚未恢复，帧加载不等于已绘制背景。

`date` 初始化、`GetLocalTime` 与 `MakeDate` 已实现；DateCmp 的空回调沿用 tuple 实参，原生 `>` handler 对 tuple/int 返回错误8。原版桌面构造器不检查系统脚本执行返回值，Go 对此已知错误继续构造桌面。证据见 [系统启动](system-script-startup.md) 和 [比较链](tuple-integer-comparison.md)。

资源路径映射 `0x112e4b8f`、资源目录读取 `0xaf665c57` 已接入。目录读取最多执行十次 HTTP 请求；成功结果写入独立的 `os.UserCacheDir()/qy-fcrunner`，当前每次启动仍会重新获取，尚未恢复缓存命中校验或有效期。FC0A 编译数据保持完整字节、不拆行为行；XY20 CAB 多成员按顺序无分隔拼接后解码。目录记录按原生规范化哈希键覆盖；目录哈希对非 ASCII 输入明确返回不支持。

最新图形运行由 macOS 桌面进程实际执行，命令如下：

```sh
go build -o /tmp/qy-fcrunner-desktop ./cmd/fcrunner
caffeinate -u -t 60 /tmp/qy-fcrunner-desktop -client CLIENT -entry index.fcc -network
```

最新运行对真实资源目录 `http://118.190.38.92/world/kele8/files_dir.dz` 请求十次后超时，按原生读取失败继续路径，已登记 `view` 与 `atomsys`，停止于 `com/ctrl.fcc:0xb2a` 的未定义名称 `0x1bc7abd3`。资源服务器本次没有成功响应，进程没有进入游戏。

此前 `0x1acc` 的带参数 `new land(...)` 已恢复：先在调用者环境求实参，再完成工厂/基类/派生类初始化，仅带括号形式调用最终类同名方法，返回实例而非构造函数返回值；已登记的 `OnCreate` 随后执行。Go 仍传播构造方法错误，避免把缺项当作成功。详见 [构造调用](new-constructor-call.md)。

`land` 类体所需的 `pointmode` 已接入整数状态，默认0，setter不标记 Dirty；输入命中尚未恢复。真实构造参数已将第一个 land 设为 `(272,206)`、pointmode=1，并装入 `in/img/map/root/land_02.ale`。该 AEX 的两个平面均为550×202 JPEG，第二平面的全部像素为灰度；准备出130×99和275×202两帧，第二帧偏移(-79,-57)。`CreateObj` 已完成六个地图对象各两帧的子图构造，三个按钮随后完成初始化，共17个图片对象。详见 [属性](window-pointmode.md) 和 [JPEG透明度](aex-jpeg-alpha.md)。

ctrl 已恢复属性往返与定时事件两种模式。命名绑定使用成员哈希与实例 ID 双键；不同名称的控制器共存，同名覆盖与清除只结束目标实例。真实入口的音乐定时器保存事件 `OnPlayMid`、次数-1、初次延迟0和间隔120000ms。窗口 alpha 保存完整 int32，默认255，setter 不先钳制。窗口主线程已登记 Desktop.Update 回调，但本次初始化报错后退出，尚无完整场景持续更新或呈现证据。

普通 img 与 imgex 共用资源加载成员，分别使用默认参数100和98。真实背景 JPEG 为800×600；Logo 的 AEX 颜色平面是 JPEG，透明度平面是灰度 GIF，准备得到275×223的一帧。保留原有特殊像素标记，不套用未经验证的普通 RGBA 混色。JPEG 标准库解码尚未与原版解码器逐像素比较。

Logo 的 OnLoaded、移动路径及完成事件已有隔离测试：起点 `(27,790)`，相对位移 `(0,-200)`，完成后位置为 `(27,590)`。自动排列 autopos 接受2–5个整数参数，已覆盖隐藏子对象、图片偏移、尺寸调整、清除/替换和子列表变化。这些是子系统测试，不意味着初始化完成或出现游戏画面。

对初始化中断后已有对象执行诊断性首帧更新，最初到达 `index.fcc:0x42ec` 的 `CallSub`。现在已恢复无附加参数的整数属性筛选和直属子对象事件派发，该诊断更新进入 `index.fcc:0x4238`，因后续全局对象 `0x9975bdf1` 尚未构造而停止。初始化未完成前的此结果不能作为完整帧循环运行证据。

atomsys 的运动计算、发射、轨迹逻辑和32张 RGB565 特效缓存已有 Go 实现及 DLL 单函数仿真对照。场景绘制尚未接入窗口。见 [粒子缓存](atomsys-cache.md)。

较早的两个边界仅保留为历史过程：默认关闭网络的图形运行在 `com/kele8com.fcc:0x39e` 因 `ErrResourceNetworkUnavailable` 停止；此前联网运行到 `index.fcc:0xc38` 的 `halign`。本地真实脚本和失败 transport 测试后来经过 `0xc38`，再到 `index.fcc:0xcc8` 的未登记成员 `imgex02078624`，并非当前图形运行边界。主容器、标题/字体/尺寸、`bk := null` 绑定标记、自动尺寸、RegInterface、对齐 setter 等另有真实入口脚本状态或 transport 测试覆盖；这些不等于服务器成功响应或进入游戏。

`0xd7c` 的 ctrl 和 `0x1acc` 的构造语法缺项也属于已越过的历史边界。图像资源名转小写，整数参数乘 2 后保留为资源查找参数，不解释成缩放比例。尚无证据证明图像已绘制到屏幕。AEX/JPEG 完整绘制、登录、输入和插件玩法仍未验证。

此前阶段的 `go test -race -count=1 ./...`、`go vet ./...`、Windows 386 交叉构建通过；本轮新增实现仍需重新运行这些检查。Windows 产物尚未在 Windows 运行，测试不替代进入游戏验证。

运行方式：

```sh
go run ./cmd/fcrunner -client CLIENT -entry index.fcc
go run ./cmd/fcrunner -client CLIENT -entry index.fcc -network
```

网络默认关闭；`-network` 为资源 HTTP 请求配置单次5秒超时。

## 2026-10-15 历史记录

在 macOS arm64、Go 1.20.3 上构建：

```sh
go build -o /tmp/qy-fcrunner-desktop ./cmd/fcrunner
caffeinate -u -t 10 /tmp/qy-fcrunner-desktop -client CLIENT -entry index.fcc
```

进程通过实际 Ebitengine 初始化并进入 Update 回调，执行真实入口的系统配置、标题、字体、两项字符串配置和800×600逻辑窗口尺寸设置，再登记 `com/newtip.fcc` 的类定义。最后退出码1：

```text
脚本执行器、图形/ALE 和插件玩法尚未完整恢复：入口 "index.fcc"：script: com/newtip.fcc:0x7c4: 尚未恢复的执行结构 object
```

这说明 Go 图形入口已到达真实对象创建节点，不代表已进入游戏。类体初始化、游戏场景、输入分派和登录没有由本次运行验证。

`size` 的 Go 测试覆盖宽高顺序、实际后端委派、读写错误、无后端错误和非法形态。仅支持两个整数的tuple；原生对额外元素的行为尚未确定，因此明确拒绝，见 [参数抽取笔记](fbase-argument-extraction.md)。图形后端对正数、尺寸和像素总数作显式上限检查，这是宿主资源限制，不声称与原生错误行为一致。

类定义测试覆盖保留名称、基类、初始化体和声明环境；类声明期间不执行初始化体；不同宿主的类表独立；重复名称替换记录。该次验证时对象实例化未实现；当前已恢复通用类构造和部分内置对象，上方记录为最新执行边界。

2026-10-15 历史阶段的验证结果：

```sh
go test -race -count=1 ./...
go vet ./...
GOOS=windows GOARCH=386 CGO_ENABLED=0 go build -o /tmp/qy-fcrunner-go-windows-386.exe ./cmd/fcrunner
```

Windows产物只验证构建，尚未在Windows运行。竞态测试不覆盖真实桌面窗口的绘制、尺寸变化或输入。

显示器休眠时直接启动曾在 Ebitengine v2.7.10 包初始化阶段因主显示器为空而panic。上述命令在同一 `caffeinate` 调用期间运行程序，可到达脚本边界；这是本机验证条件，不是对该依赖初始化问题的修复。未执行原版Windows客户端，未验证Windows窗口像素一致性。

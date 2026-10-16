# FCRUNNER 继续开发进度

更新时间：2026-10-16

## 当前真实状态

Go 版本的 FCRUNNER 已能创建真实桌面窗口，并执行 `CLIENT` 中的入口脚本和 DLL 内嵌 `SYSTEM.COD`。最近一次 macOS 桌面运行命令：

```sh
go build -o /tmp/qy-fcrunner-desktop ./cmd/fcrunner
caffeinate -u -t 30 /tmp/qy-fcrunner-desktop -client CLIENT -entry index.fcc -network
```

资源目录请求 `http://118.190.38.92/world/kele8/files_dir.dz` 重试 10 次后超时，程序按原生失败继续路径运行。当前最新阻塞点已经推进到：

```text
script: com/ctrl.fcc:0x1d78:
尚未实现的宿主调用 0xfbb44f92
```

这不是“已经进入游戏”。当前仍缺少完整场景绘制、窗口输入、登录协议、服务器成功响应和后续玩法执行。

## 本轮已完成

- 新增 `view` 对象工厂，类哈希为 `0x771f6e8b`，并接入入口启动注册。
- 完成 `atomsys` 粒子系统工厂、粒子运动、普通发射、轨迹发射和 RGB565 粒子缓存。
- 粒子缓存和粒子更新已通过 Unicorn 原生函数逐位对照测试。
- 通过原生反汇编确认 `0x1bc7abd3` 是 `view.cache`：
  - 默认值为 `1`；
  - 脚本在 `com/ctrl.fcc:0xb2a` 写入 `0`；
  - 已在 `Wnd` 中加入 `Cache int32` 的读写属性。
- 图片资源读取支持真实 GIF 资源，包括 DLL 内置的 `res$scrollh`。
- 图片路径后缀切片参数已能解析，例如：
  `res$scrollh#3,1,11,11,0,0`、`mask,8,1`。
  当前只保存基础资源和数值切片参数，切片绘制仍需接入。
- 已根据 `SYSTEM.COD` 反汇编登记几个背景模式哈希：
  `0x9f4d12ca`、`0x5a3017d8`、`0x586b6d92`。
  这些模式的透明度、渐变和纹理参数还没有完整绘制实现。
- 已更新 README、启动记录和内置对象注册说明。

## 关键文件

- `internal/objsys/view.go`
- `internal/objsys/wnd.go`
- `internal/objsys/atomsys.go`
- `internal/objsys/atomsys_particle.go`
- `internal/objsys/atomsys_cache.go`
- `internal/objsys/image_resource.go`
- `internal/objsys/background.go`
- `internal/script/runtime.go`
- `analysis/notes/ctrl-cache-name.md`
- `analysis/notes/startup-progress.md`

## 下一步优先级

### 1. 定位宿主调用 `0xfbb44f92`

`com/ctrl.fcc` 的 AST 显示它是带一个字符串参数的函数调用：

```text
com/ctrl.fcc:0xce6  fbb44f92("...")
com/ctrl.fcc:0xda0  fbb44f92("...")
```

需要从 `CLIENT/objsys.dll`、`CLIENT/FBase.dll` 的导出分派表和反汇编确认它对应的真实函数。不要直接把未知调用统一返回 0；应先确认参数和副作用，再在 Go 中实现。

### 2. 继续跑入口边界

修复 `0xfbb44f92` 后重新运行：

```sh
go test ./internal/objsys -run TestRealStartupContinuesAfterResourceDownloadFailure -count=1
caffeinate -u -t 60 /tmp/qy-fcrunner-desktop -client CLIENT -entry index.fcc -network
```

每次只记录新的真实边界，更新 `analysis/notes/startup-progress.md`。

### 3. 恢复真实绘制链

目前 `gamewindow.Window.Present` 只能显示已经合成好的 `image.Image`，`Desktop.Update` 还没有把 Wnd、ImgEx、Text、Background、AtomSystem 按 Z 序合成为画面。下一阶段需要：

- GIF/JPEG/ALE/AEX 帧的实际像素绘制；
- `view.cache` 分支；
- 背景模式和透明度混合；
- 窗口父子坐标、Alpha、ZOrder；
- 鼠标和键盘事件分派。

### 4. 登录与游戏入口

网络目录请求失败时只能证明失败分支。要证明“进入游戏”，必须在可用资源服务器或本地完整资源缓存下观察：

- 登录请求成功；
- 登录后场景对象构造完成；
- 服务器返回的游戏状态被消费；
- 窗口显示可交互游戏场景。

## 验证结果

最近完整验证通过：

```sh
go test ./...
go test -race -count=1 ./...
go vet ./...
GOOS=windows GOARCH=386 CGO_ENABLED=0 go build -o /tmp/qy-fcrunner-go-windows-386.exe ./cmd/fcrunner
```

这些检查证明当前 Go 代码可测试、可交叉构建，但不能证明已经进入游戏。

## 注意事项

- 工作树中 `CLIENT/`、`.idea/`、`.DS_Store` 属于本地资源或环境文件，不要加入 Git。
- 新增源码注释继续使用中文。
- 不要把测试边界改成“成功”；测试应记录真实未实现哈希。
- 当前目标仍保持 active，完成标准是实际进入游戏并有运行证据。

# `~` 命名绑定的双键记录

## 脚本与执行参数

`CLIENT/index.fcc:0x3f2c` 的 token 序列为 `ctrl ~ 0x23a3d969 := 0xf77272f2(...)`。
因此绑定成员哈希为 `0x11b4b1fa`（`ctrl`），`~` 后的实例标识为
`0x23a3d969`，调用 selector 为 `0xf77272f2`（`OnPlayMid`）。
该语句的具体实参由脚本调用节点提供。

编译器 `objsys!0x100101a9` 对 `:=` 和 `~` 进入 `0x10010428`。该分支
接受 `~` 后的标识符或整数字面值，并把绑定目标与第二 payload 编入执行节点；
静态名称保留 token 哈希，整数保留 token 值，不会在这里读取同名词法变量。
这是编译器路径观察，不是运行时执行观察。参见
[`objsys.annotated.asm`](../disassembly/objsys.annotated.asm#L20463)。

## 记录匹配与创建

opcode `0x0e` 的绑定执行路径最终调用 `0x10065750`。调用点
`0x10066796` 将三个 DWORD 值和 payload 上下文传入该 helper。按
`0x10065750` 的栈帧偏移，前两个显式 DWORD 分别是记录 key1 与 key2；
它遍历宿主 `+0x9c` 容器，并要求 `record+0x0c == key1` 且
`record+0x10 == key2` 才复用该记录（`0x10065780–0x1006578c`）。

未找到匹配记录时，helper 调用 `0x1005f110(host,key1)`。后者以 key1
查询全局工厂表 `0x10121e6c`，调用对应工厂创建记录，并把 key1 写入新记录
`+0x0c`（`0x1005f110–0x1005f149`）。返回后，`0x100657b1–0x100657bb`
把 key2 写到记录 `+0x10`。`ctrl` 工厂由 `0x1005f6db` 登记，工厂回调为
`0x10048430`。因此，对该绑定形态，key1 是选择宿主 handler/工厂的成员
selector，key2 是 `~` 提供的实例标识。

创建或复用后，`0x100657c6` / `0x100657eb` 调用记录 vtable 首槽处理 selector
和实参。handler 成功时 helper 将 `record+0x1c` 置零；失败时置一。
已有 key1 而 key2 不同的记录不会被覆盖，查找会继续遍历；不匹配时会新建
另一条记录。因此不同实例 ID 可在同一宿主、同一成员 selector 下共存；同一
双键的重新绑定则复用既有记录，再次调用 handler 更新它。

opcode `5`（空绑定）的通用路径 `0x10065820` 使用相同的 `+0x0c/+0x10`
双键查找，并在命中时将 `+0x1c` 置一。它不在该处直接删除记录；后续由宿主
更新路径消费该标记。具体记录的 `+0x14` 回调行为取决于记录类型，不能仅据
通用 helper 推断所有命名绑定的资源析构行为。背景对象的独立路径见
[`background-null-binding.md`](background-null-binding.md)。

## Go 覆盖边界

脚本层把 `~` 后标识符的哈希或整数字面值保存在 `script.Binding.Instance`；
命名实例只用于静态 slot 标识，不进行词法变量读取。`Wnd` 的命名 timer
按该实例 ID 独立登记；替换或 clear 只结束相同实例的 controller。
新增测试验证了解析、宿主分派和当前 Go controller 隔离行为。这些测试验证
移植实现，不是原版客户端动态对照，也不证明其它宿主类型的命名绑定已经恢复。

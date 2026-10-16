# 日期参数 tuple 与整数比较

## 范围与结论

本文追踪 `SYSTEM.FCC` 中 `DateCmp(m_dStartDate,MakeDate(2005,12,1))>0` 的 `>` 运算。依据 `analysis/decoded`、`analysis/disassembly/objsys.annotated.asm`、`analysis/disassembly/fbase.annotated.asm` 及 `analysis/notes/date-builtins.md` 的静态证据；没有运行原版客户端。

在当前静态调用路径中，`DateCmp` 登记到的入口 `objsys.dll!0x10053e90` 是 `xor eax,eax; ret`，不改写参数值。回调桥将输入参数 tuple 留在原值槽，因此该表达式的 `DateCmp(...)` 结果仍是类型6参数 tuple。`>` 右侧 `0` 是类型1整数。须注意：`MakeDate(...)` 创建的脚本日期值类型为2；它是 `DateCmp` 的第二个参数，不是 `>0` 的右操作数。

`>` 的原生 handler 要求左右值均为数值类型1或8。类型6 tuple 与类型1整数不符合该要求，handler 设置错误码8并返回运算失败；不会逐项比较 tuple，也不会生成普通布尔 `false`。错误状态之后的脚本控制流是否以特定错误提示结束，取决于其上层错误处理路径。

## 证据链

- `objsys.annotated.asm:0x100165c0–0x10016635` 接收表达式项的 token：在项结构的 `+4` 保存 token，调用 `0x10016030` 查表后将返回地址缓存在项的 `+8`。因此，分析中的 token 到 handler 链路不是只依赖初始化表中的孤立写入。
- 表分派器 `0x10016030` 以 token 编号读取 `0x1011d1d0` 起始的 handler 表。初始化函数 `0x10016220–0x1001638e` 清零并填充该表；`0x10016333` 将 `0x10015770` 写入槽位 `0x1011db38`，即表基址 `0x1011d1d0 + 602*4`。FC0A kind `602` 对应 `>`，故 token `602` 的 handler 为 `0x10015770`。组合起来是 `0x100165c0` 保存/解析 token → `0x10016030` 查表 → 初始化表映射到 `0x10015770`。
- 表达式执行路径 `0x10017130` 对运算符记录调用缓存的函数指针；该函数返回 AL=0 时，执行器走失败处理分支（`0x100171b1–0x100171c1`），而不是将其当作正常布尔结果。
- `0x10015770–0x10015790` 先调用 `0x10012b50` 分别取出左右 operand；该辅助函数负责取值并调用比较运算 handler，不决定类型兼容规则。
- `0x10015797–0x100157ba` 仅在右值类型为1或8时进入数值路径；`0x100157bc–0x100157d9` 又要求左值类型为1或8。类型6不会进入整数/浮点比较实现。
- 其他类型的处理见 `0x100157db–0x10015818`：检查两侧是否为类型2的日期专用路径；若均非类型2，则在 `0x100157fb` 将状态码8写入执行上下文 `+0xe0c`，调用 FBase #661 处理该错误状态，并在 `0x10015813–0x10015818` 返回 AL=0。故类型6/类型1组合没有进入任何 tuple 字段比较或整数比较指令。
- 类型2专用分支从 `0x10015819` 开始：FBase #765 对两个类型2值进行比较，随后从 `0x1001584b` 起尝试整数或浮点取值。这条路径不能套用于类型6 tuple。
- `FBase #795`（`fbase.annotated.asm:0x100135d0`）构造的日期 VM 值标签为2。DateCmp 参数 tuple 的标签6属于调用参数容器层；两者不是同一类型编号。

## Unicorn 隔离仿真

使用项目已有虚拟环境运行 `analysis/tools/oracle_tuple_integer_comparison.py`，其依赖版本为 Unicorn 2.1.4、pefile 2024.8.26。结果保存在 `analysis/evidence/tuple-integer-comparison-oracle.json`：

```json
{
  "left_type": 6,
  "right_type": 1,
  "handler_return": 0,
  "context_status": 8,
  "operand_extractions": 2
}
```

该脚本将原始 `CLIENT/objsys.dll` 映射到 PE 首选基址并执行原生 `0x10015770`。只 stub 了 `0x10012b50`，将测试指定的两个类型标签写入 handler 的 operand 输出值；FBase ordinal 779（类型读取）和 ordinal 661（错误状态清理）则从原始 `CLIENT/fbase.dll` 复制机器码执行。仿真确认 handler 读完两侧类型后，返回 AL=0 并将状态8写入上下文。证据 JSON 同时记录输入 DLL 的 SHA-256、仿真器版本和替换边界。它是对该类型组合的隔离 oracle，不模拟 DateCmp 调用桥、完整表达式求值器或游戏窗口流程。

## 边界

结论对应当前 `CLIENT/objsys.dll` 和 `CLIENT/fbase.dll` 静态字节。没有证据表明该版本启动时会重写运算符 handler、替换 DateCmp 登记入口，或将 handler 的错误状态改成别的语义；若运行时补丁或不同版本改变这些路径，需重新验证。

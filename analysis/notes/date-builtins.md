# 日期内建函数静态证据

## 范围与来源

本文核对 `FC0A` 原生类型 `date`、`objsys.dll` 的 `GetLocalTime`、`MakeDate`、`DateCmp` 登记和实现，以及 FBase 日期值构造路径。依据 `analysis/decoded`、`analysis/disassembly/objsys.annotated.asm`、`analysis/disassembly/fbase.annotated.asm`、`analysis/notes/builtin-registry.md` 和 `CLIENT/objsys.dll` 原始字节。反汇编地址是模块装载基址 `0x10000000` 下的静态 VA；本文没有原版运行时观察。

## 类型与日期值表示

- `internal/fc0a/kinds.go` 将 FC0A 类型编号 `1535` 登记为 `date`。
- `FBase.dll` 导出 #795 位于 `0x100135d0`。它先初始化目标 VM 值，再写入类型号 `2`、附加字段 `0`，并调用 `0x10013350` 将传入的 16 字节时间结构复制进日期存储对象；返回的存储对象指针写在 VM 值 `+8`。
- `0x10013350` 取得或分配一个 `0x20` 字节的池块，在其数据起始处写入长度 `0x18` 与标志/链接字段，然后在数据区 `+8` 复制四个 DWORD，即 16 字节。结合调用者把 Windows `SYSTEMTIME` 地址交给 #795，可确认日期有效载荷保存完整的 `SYSTEMTIME` 字节布局。
- 因而 `date` 的 FC0A 类型编号 `1535` 与脚本 VM 值类型号 `2` 是不同编号体系；不能将二者混为一谈。

## `GetLocalTime`

- 登记代码 `objsys.annotated.asm:0x100577b2–0x100577bc` 将名称 `GetLocalTime` 绑定到 `0x10053c10`；登记清单亦列出该地址。
- 回调 `0x10053c10` 调用 `KERNEL32!GetLocalTime` 填充本地 `SYSTEMTIME`，再调用 `FBase.dll!#795` 将其转为 VM 日期值；随后返回 `EAX=0`。该回调没有读取脚本实参的路径。
- 这是静态调用链结论，不是对某次实际系统时间或客户端执行结果的观察。

## 回调状态与 VM 值

- 全局回调调度器 `0x1005a770` 从登记记录取回调地址并调用。以 `strlen` (`0x1004f860`) 为交叉检查：成功路径先通过 FBase #748 将长度整数写回传入的 VM 值，再清零 EAX 返回；参数类型不符时则返回 `EAX=2`。这说明回调的 EAX 是状态码，不能直接解读为脚本表达式的整数结果。
- `GetLocalTime` 与 `MakeDate` 的成功路径通过 FBase #795 写入日期 VM 值后返回 `EAX=0`；失败状态也属于回调/执行状态。
- 表达式调用器 `0x10013f20` 将当前值栈记录中的参数 VM 值指针传给 `0x1005ad10`；对象分派未命中后，根对象/桌面回调 `0x10060da0` 再把同一值传给 `0x1005a770` 及已登记回调。没有另建回调结果 VM 槽。调用器将分派状态 `0` 作为成功路径处理（`0x1001410c–0x1001412e`），而非把它写成脚本数值。
- 因此对 `DateCmp(a,b)` 的静态调用路径，登记桩不改写输入参数 VM 值；按该二参数调用形式，输入 tuple 保留在原值槽中，不能把回调状态 `0` 当作脚本整数 `0`。该 tuple 与整数参与 `>` 时的原生行为已通过独立仿真验证：`objsys.dll!0x10015770` 对类型6与类型1设置上下文状态8并返回运算失败，不会产生普通布尔 `false`。详见 `analysis/notes/tuple-integer-comparison.md` 与 `analysis/evidence/tuple-integer-comparison-oracle.json`。

## `MakeDate`

- 登记代码 `0x1005780f–0x10057819` 将名称 `MakeDate` 绑定到 `0x10053df0`。
- 回调将传入参数交给 `FBase.dll!#770`，使用格式串 `dddd(0)d(0)d(0)`，并提供六个 16 位输出槽。解析失败分支直接返回 `EAX=2`；成功分支将解析输出写入本地 `SYSTEMTIME` 缓冲区，再调用 `FBase.dll!#795` 构造日期 VM 值，最终返回 `EAX=0`。
- `SYSTEM.FCC` 静态资源含调用 `MakeDate(2005,12,1)` 的示例（`/tmp/qy-system-resources/SYSTEM.FCC.utf8` 第 660–667 行）。这确认了该脚本调用形式，但不是独立运行时测试。
- 当前证据没有闭合 #770 中各个 `d`、`(0)` 格式令牌的完整语法，也不足以断言月份/日期的取值边界、无效日期归一化方式或每个输出槽和脚本实参的逐项对应。不能仅凭该格式串声称它等价于某种标准日期解析 API。

## `DateCmp`：登记入口是零状态桩

- 登记代码 `0x1005781e–0x10057828` 将名称 `DateCmp` 绑定到 `0x10053e90`。
- `CLIENT/objsys.dll` 文件偏移 `0x53e90` 的原始字节为 `33 c0 c3`；对应指令是 `xor eax,eax; ret`。因此从这个登记入口调用时，静态文件中的实际回调立即返回状态 `0`，不读取或改写传入的参数 VM 值。
- 从 `0x10053e93` 开始确有后续代码，形状上包含日期值检查、`SYSTEMTIME`/`FILETIME` 转换和比较路径；但它不属于登记入口可顺序执行的函数体，不能据此把 `DateCmp` 描述为比较实现。
- 当前静态材料没有证明启动时会重定向登记指针、改写这三个字节或转入 `0x10053e93`。因此可确认的是原始静态二进制的登记行为；运行时补丁、其他版本或其他调用入口仍未排除。

## `SYSTEM.FCC` 中的比较表达式

静态 `SYSTEM.FCC` 资源在第 660–667 行写有：

```text
date m_dStartDate=GetLocalTime();
if (DateCmp(m_dStartDate,MakeDate(2005,12,1))>0) { ... }
```

资源证明该表达式存在。当前登记回调是返回状态 `0` 且不改写 VM 值的桩；静态调用桥把输入参数 tuple 留在原值槽。隔离仿真表明它随后与整数 `0` 执行 `>` 时进入类型错误路径，状态为8且 handler 返回失败，不是条件为假的普通结果。该仿真只执行原生比较 handler，未执行完整表达式求值器或原版游戏窗口流程；因此不推断上层如何呈现/处理错误，也不声称观察到了原版客户端的最终运行时分支。本文不改动或规避该脚本条件。

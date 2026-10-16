# `0x81e69173` 的用途与未决名称

## 已确认的资源上下文

使用当前 Go 加载器逐一解析 `CLIENT` 下全部 626 个 `.fcc`，检查通过：625 个 FC0A 文档、1 个 FCTB、共 1,949,042 个标记。对所有标记扫描类型 6、值为 `0x81e69173` 的 token，共得到 199 次命中，分布于 89 个文件。逐个核对 token 邻接关系后，199 次命中的前一项都是赋值符 `=`，左值哈希都是 `0xd7c9873d`。例如 `com/newtip.fcc`：

```text
0x56  类型6  0xd7c9873d
0x5c  =
0x62  类型6  0x81e69173
0x68  +
0x6e  整数 8000
```

因此在该脚本中可确认 `0x81e69173` 是赋给左值的表达式部分，并与整数 `8000` 相加；不能将这条语句化简为 `zorder = 8000`。原生对象成员登记在 `objsys.dll` 静态反汇编 VA `0x1004f247–0x1004f264` 登记了名称 `zorder` 的 getter `0x1004dc10` 与 setter `0x1004e330`。这支持 `0xd7c9873d` 对应 `zorder` 左值，但不揭示 RHS 哈希代表的名称或值。

## 嵌入系统脚本中的定义

前面的客户端 DLL/EXE 字符串扫描没有覆盖解码后的 PE 资源。资源清单显示 `CLIENT/objsys.dll` 的 `FCC/SYSTEM.FCC/2052` 与 `FCC/SYSTEM.COD/2052` 两项，分别为 14,960 和 4,936 字节。通过仓库现有 PE 资源读取器按类型、名称和语言提取后，`SYSTEM.FCC` 是 GBK 编码的源码文本，不是 XY20/FCC 外壳；开头为 `//系统脚本 2004`，包含：

```text
#define true 1
#define false 0
#define ZTOP #6FFFFFFF
```

使用同一原生字符串表哈希实现验证 `StringTableHash("ZTOP") = 0x81e69173`。因此目标哈希对应的名称和宏值均已确认：`ZTOP` 展开为整数 `0x6fffffff`（十进制 `1879048191`）。

同资源的 `SYSTEM.COD` 以 `XY20` 开始，解码并解 CAB 后只有成员 `tmp.cod`，长度 30,405 字节，FC0A 解析成功。该成员偏移 `0x4a` 是 `#define` 标记，`0x50` 是类型 6 哈希 `0x81e69173`，`0x56` 是整数 `0x6fffffff`；这与 `SYSTEM.FCC` 源码的 `#define ZTOP #6FFFFFFF` 一致。`SYSTEM.COD` 中该哈希另有 6 次出现，全部作为哈希 `0xd7c9873d`（`zorder`）赋值的 RHS，例如 `zorder = ZTOP + 80`、`zorder = ZTOP + 8000`，及单独的 `zorder = ZTOP`。初始 `com/newtip.fcc` 中对应语句为 `zorder = ZTOP + 8000`，即宏展开后表达式为 `0x6fffffff + 8000`。

静态初始化链也包含系统脚本的加载和执行：两个 root 初始化调用点 `0x10063550`、`0x10063b1c` 均调用 `0x10060080`；后者在 `0x100600fc–0x10060128` 以资源类型 `FCC`、名称 `SYSTEM.COD`、模块名 `0x100a3760` 调 FBase #222 并读入模块，`0x10060180` 调 `0x1000ffa0` 编译，成功后在 `0x100601a4` 将结果交给 `0x10065fa0` 执行。地址和控制流来自 `analysis/disassembly/objsys.annotated.asm`，属于静态证据，不是原版运行观察。

提取的资源快照曾临时写到 `/tmp/qy-system-resources/SYSTEM.COD` 和 `/tmp/qy-system-resources/SYSTEM.FCC`；源码按 GBK 解码后的临时展示文件为 `/tmp/qy-system-resources/SYSTEM.FCC.utf8`。它们不是仓库内的新增产物；可由 `CLIENT/objsys.dll` 资源类型/名称/语言三元组重新提取。

## 有界搜索

- FCC 全量边界是扫描时 `CLIENT` 下 626 个 `.fcc` 文件，均由当前 loader 成功解析；结论仅覆盖该目录快照。
- PE 原始字符串候选查询曾扫描 `CLIENT` 下 DLL/EXE 的 NUL 结束 ASCII 可打印后缀，并尝试大小写变体；未找到 `0x81e69173` 的候选。对 PE 字节中的该哈希也检查了小端/大端 DWORD 形式，反汇编文本未找到该数值。静态未命中不排除分段拼接、运行时变换或由资源/数据表提供名称。
- 补充按 `symbol.StringTableHash` 对 `objsys.dll`、`fbase.dll` 中每个 NUL 终止的非零字节分段，逐一哈希最长 256 字节的原始字节后缀；包含 GBK/非 ASCII 字节，针对 `0x81e69173` 和 `0x8d663526` 均无命中。该补充扫描不覆盖其它 DLL/EXE 的非 ASCII 后缀，也不覆盖 UTF-16 字符串、非 NUL 终止片段、拼接或变换后的名称。
- 先前的字符串和预处理表扫描未提取 PE 的 `FCC/SYSTEM.FCC` 资源，因此当时的“无名称候选”结论不覆盖该系统脚本。内嵌源码及对应 FC0A 定义已将该哈希闭合为 `ZTOP`；不能把一般用户变量缺失时的行为套用到这里。

## 剩余边界

`0x81e69173` 已有常量定义证据，不是本例中的未定义名称。更一般的未定义类型 6 名称在原生解释器中的查找失败行为，以及完整的 `zorder` 排序/渲染效果，仍未由本次静态路径确认；本笔记不据此概括为零值或某个固定层级规则。

## 复查命令

在仓库根目录可运行：

```sh
go run . check
go run . tokens com/newtip.fcc
go run ./analysis/tools/symbol_lookup 0x81e69173 CLIENT/objsys.dll CLIENT/fbase.dll
```

其中内置 `symbol_lookup` 仅扫描可打印 ASCII 字符串，不会自动检查 PE 资源。资源证据来自 `CLIENT/objsys.dll` 内 `FCC/SYSTEM.FCC/2052` 与 `FCC/SYSTEM.COD/2052`，任意字节后缀补充扫描使用的一次性探针不保留在仓库中。

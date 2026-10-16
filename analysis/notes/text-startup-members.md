# `SYSTEM.FCC` ToolTips 文本对象成员证据

## 范围与来源

本笔记核对 `objsys.dll` 内嵌 `FCC/SYSTEM.FCC` 中 `ToolTips.tptext:text` 的创建、`pos=8,2`、`color=0` 和继承字体默认状态。资源清单 Evidence 为 `ev_39c4876f1d896585d3fc56f35416264c4e08b1475ab3ba32789f18878133b5cd`：资源 index 3，文件偏移 `874424`，大小 `14960`，SHA-256 `0b261d72ced503932bba0fae7d3112907645a389b2f26a3534db67f1c3d188d3`。按该范围提取的字节与清单 SHA-256 一致；内容是带 CRLF 的脚本文本，无需再解包。临时提取物仅保存在 `/tmp`。

地址均为 `objsys.dll` 装载基址 `0x10000000` 下的静态 VA。本文依据 DLL 反汇编和静态资源，不代表原版运行时观察。

## 脚本证据

资源文本的第 338–355 行（字节偏移约 `0x1c32–0x1d4e`）为：

```text
class ToolTips:wnd{
 class tptext:text{
  pos=8,2;
  color=0;
  ...
 }
 obj m_pText;
 m_pText=new tptext;
}
```

这直接确认 `tptext` 以 `text` 为基类，脚本对它写入 `pos=8,2` 与 `color=0`，随后创建该类实例。它本身不证明原生对 `pos` 的具体解释。

## 首次启动文本路径：字体与文本源

`index.fcc` 在 `0x140` include `com/newtip.fcc`；启动类创建 `pttext:text`，并在构造脚本中设置 `font=pdesktop.m_sSysBtnFontName,pid.width-1,pid.height-1,400`。首次 `SysBtn` 初始化时执行 `m_pTxt=new pttext`，随后 `m_pTxt.src=btnname`；因此 `pttext` 先接收字体参数，再接收按钮文字。`src` 此处是文本字符串成员，不是由同名 DLL 字符串候选推出的属性名。

- `font` 是 `text` 成员分派器中的哈希 `0x153aaff2`。getter `0x10033509–0x10033546` 从 `+0xc8` 取字体名，并读取 `+0x19d`、`+0x19f`、`+0x1a1` 三个 16 位字段组装返回值。setter `0x10034568–0x100345e8` 用 FBase #768 解析字体名及三个数值参数，写入 `+0xc8`、`+0x19d`、`+0x19f`、`+0x1a1`；字体大小归一化路径还可能调整前两个数值字段。由此可确认 `pttext` 的脚本设置会提供显式字体名并覆盖数值默认值。它不单独证明最终 Windows 字体选择或绘制结果。
- `src` 对应成员哈希 `0xa06413cf`。getter `0x1003365b–0x10033677` 对接收对象 `+0xdc` 调 FBase #646 取字符串，再经 #749 写入返回值。setter `0x10034787–0x1003485c` 调 #808 读取输入字符串，以 #638 替换接收对象 `+0xdc` 的字符串内容，并经 #637 清理临时值。故 `this.text=src` / `m_pTxt.src=btnname` 的字段落点是文本源字符串槽 `+0xdc`；字体名单独存于 `+0xc8`。

## `text` 工厂与构造器

- `objsys.annotated.asm:0x1005f1db–0x1005f203` 将名称 `"text"` 登记到对象工厂表，回调地址为 `0x100339f0`。
- `0x100339f0` 分配 `0x1a8` 字节并调用构造器 `0x10033130`。该构造器先调用基类初始化 `0x1005d720`，再设置 vtable 为 `0x100a1278`。
- 构造器通过 FBase #636 初始化 `+0xc8` 字符串槽；没有给该槽写入任何字体名称。它还把 `+0x18c` 设为 `0x00faf0c8`，并把 `+0x19d`、`+0x19f`、`+0x1a1` 分别设为 `6`、`12`、`400`。
- text 成员读取分派器 `0x100334b0` 的 `font` 分支（哈希 `0x153aaff2`，`0x10033509`）读取 `+0xc8` 字符串和上述三个数值槽；写入分派器 `0x100344dc` 的对应分支从 `0x10034568` 开始，调用 FBase #768 解析字体名及数值参数并更新这些槽。字段和调用路径见上节。
- `color` 读取分支（哈希 `0x7d69d3c0`，`0x10033582–0x100335c9`）从 `+0x18c` 返回整数；写入分支 `0x10034696–0x10034703` 接受整数并写回 `+0x18c`。因此脚本的 `color=0` 与 text 原生颜色字段有直接静态路径；构造时未覆盖前的字段值是 `0x00faf0c8`。

`SYSTEM.FCC` 的 `ToolTips.tptext` 没有在该类体内设置 `font`，因此它保留 `text` 构造默认字体参数槽；这与 `com/newtip.fcc` 中 `pttext` 显式设置字体是两条不同脚本路径。默认空字体名如何被后续字体创建路径解析，仍未闭合。

## `SYSTEM.FCC` 日期条件之后的脚本尾部

解码的 `SYSTEM.FCC` 在日期声明后只有一个 `DateCmp(...)>0` 条件语句，随后是条件编译分支；`#endif` 后即资源文本结尾，没有其他顶层语句。`_DEMO` 分支与 `#else` 分支各自唯一的立即语句都是 `new SysDlg(...)`：前者创建“Demo已经超过使用期”对话框，后者创建“引擎已经超过使用期”对话框。二者都传入延迟关闭脚本 `{pdesktop.Exit()}` 和 `8000` 毫秒参数；`SysDlg(string,script,int)` 构造路径会调用 `TimerCall(autoclose,"OnClick")`。因此日期条件为真时，后续首个脚本级对象/宿主交互候选是 `SysDlg` 实例化及其定时器注册；`pdesktop.Exit()` 位于延迟回调脚本中，不是该条件块内立即执行的顶层语句。若条件为假，则此处没有后续顶层调用。

`SYSTEM.COD` 是同 DLL 资源表中的编译态 `FC0A` 资源，`SYSTEM.FCC` 是配对源码资源。当前笔记核对的是 `SYSTEM.FCC` 解码文本尾部；虽已确认 `SYSTEM.COD` 资源可解析并包含系统宏/脚本内容，本次没有把二进制 token 尾部逐项反编译成与该条件分支一一对应的语句。因此不能把源码文本的尾部逐字结论冒充为对 `SYSTEM.COD` 每个后置 token 的独立核验。系统资源装载边界见 [system-script-startup.md](system-script-startup.md)；`DateCmp` 登记入口的边界见 [date-builtins.md](date-builtins.md)。

## `pos` 与未确认项

`pos` 的 getter/setter 登记、分量读写及与 `xpos`、`ypos` 共用位置状态的证据已闭合；`SYSTEM.FCC` 中 `ToolTips.tptext:text` 的 `pos=8,2` 静态赋值可对应二分量位置。详情见 [position-alias.md](position-alias.md)。

字体槽数值 `6/12/400` 是构造器直接写入的默认状态；数值字段到原生字体 API 参数的完整映射，以及未设置字体名时的具体默认字体，仍待进一步反汇编或运行时证据。

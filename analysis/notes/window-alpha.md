# `wnd` / `imgex` 的 `alpha` 属性静态核对

## 结论

`CLIENT/objsys.dll` 中名称 `alpha` 的成员登记回调为 getter
`0x1004dc30` 和 setter `0x1004e3c0`，字符串哈希为 `0x399aa54d`。getter
读取对象偏移 `+0x44`；setter 将传入值按 FBase `#778` 的整数抽取结果写入
`+0x44`，仅当值变化时写入，并置对象 `+0x48` 的 `0x800` 位。setter 自身
没有范围比较、钳制或按字节截断。

`imgex` 构造链先调用 `wnd` 构造，再安装 `imgex` vtable；其成员 setter/
getter 对未识别名称分别转交通用成员分派。因此 `imgex` 对 `alpha` 的访问
可能经通用分派到 `wnd` 成员，但当前静态证据没有闭合通用分派对基类表的
查找规则。也未找到足以确认绘制端如何限制该整数的证据；不能据此断言最终
渲染 alpha 的有效范围。

## 登记、读取和写入

- 在 `analysis/disassembly/objsys.annotated.asm` 第 104672–104677 行，
  `0x1004f27a–0x1004f297` 将字符串 `0x100a21a4`（注释标为 `alpha`）
  分别交给 getter 登记函数 `0x1004d4d0`、setter 登记函数 `0x1004d470`；
  对应回调地址为 `0x1004dc30` 和 `0x1004e3c0`。仓库字符串哈希工具给出
  `StringTableHash("alpha") = 0x399aa54d`，符号查找在 `objsys.dll` 中命中
  该名称。登记序列位于 `0x1004f000` 例程中，附近还登记 `width`、
  `height`、`center`、`zorder` 等窗口属性；将这组成员登记称为 `wnd`
  属性表与 `imgex` 基类链一致，但不单凭例程偏移推定完整运行时表继承方式。
- getter `0x1004dc30`（第 102541–102546 行）从接收对象 `+0x44` 取
  DWORD，再经 FBase `#748` 封装结果返回。
- setter `0x1004e3c0`（第 103389 行起）调用 FBase `#778` 获取整数。若
  新值不同于对象 `+0x44`，则完整 DWORD 写入 `+0x44`，并执行
  `object[+0x48] |= 0x800`；相同值不写入。此处无 `cmp` 范围判断或窄化写
  指令，故只能说存储字段没有在此 setter 内钳制/截断，不能据此指定绘制时
  的有效 alpha 范围。

## `imgex` 分派关系与边界

- `imgex` 构造函数 `0x1002e070`（第 59835 行起）先调用
  `0x1002bb60`，再安装 `imgex` vtable `0x100a0cd8`。已核对的基类构造链
  中，`0x1002bb60` 调用 `wnd` 构造函数 `0x1005d720`。
- `imgex` 的 setter/getter 跳板 `0x1002e150`、`0x1002e160` 分别到
  `0x1002bee0`、`0x1002c330`。当 `imgex` 自身属性分支均未命中时，setter
  在 `0x1002c2a1` 转到通用 setter `0x1004d5f0`，getter 在
  `0x1002c556` 转到通用 getter `0x1004d6b0`。
- 通用 setter/getter 会从对象 `+0xb0` 取得属性表并调用 FBase `#817`
  查找，但现有反汇编未证明该表对基类 `wnd` 的属性表递归查询，或
  `imgex` 构造是否将 `wnd` 的 `alpha` 回调合并进该表。因此这里将
  `imgex.alpha` 可访问性记为待运行时或更深入表构造证据确认，不把构造继承
  本身当作成员表继承的证明。
- 当前查找范围内没有闭合 `+0x44` 从写入到最终绘制混合的完整消费路径，也
  没有证据确认负值或大于 255 的值是保留、钳制还是以其他方式解释。

## 主要证据

- `analysis/disassembly/objsys.annotated.asm`：alpha 登记第 104672–104677
  行；getter 第 102541 行起；setter 第 103389 行起；通用分派
  `0x1004d5f0`、`0x1004d6b0`；`imgex` 未命中回退
  `0x1002c2a1`、`0x1002c556`；`imgex` 构造第 59835 行起。
- `analysis/notes/imgex-startup.md`：`imgex` 构造、基类构造链及自身属性
  getter/setter 跳板的交叉记录。

以上是静态反汇编结论，不代表已运行原版客户端或观察到实际混合结果。

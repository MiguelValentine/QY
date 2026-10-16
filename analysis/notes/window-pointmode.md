# `wnd.pointmode` 属性证据

`pointmode` 的字符串位于 `CLIENT/objsys.dll` 文件偏移 `663960`。仓库符号查找工具确认其哈希为 `0x012be321`。

`analysis/disassembly/objsys.annotated.asm` 中，`0x1004f29c–0x1004f2a8` 将名称 `pointmode` 与 getter `0x1004dc50` 登记；`0x1004f2ad–0x1004f2b9` 将同名属性与 setter `0x1004e3f0` 登记。

getter `0x1004dc50` 从接收对象偏移 `+0x5d` 读取 DWORD，并交给 FBase `#748` 写入结果值。setter `0x1004e3f0` 将传入值交给 FBase `#778` 转换，再把返回的 DWORD 直接写到接收对象 `+0x5d`。该 setter 没有比较新旧值，也没有设置对象 Dirty 标志。

窗口基类构造函数 `0x1005d720` 在 `0x1005d792–0x1005d79c` 清零从对象 `+0x14` 开始的连续区域，其中包含 `+0x5d`；随后 `0x1005d7b8` 又明确将 `+0x5d` 写零。因此默认 `pointmode` 为零。

Go 逻辑窗口目前只保存和读写这个整数属性；非整数转换尚未恢复。上述代码没有证明该值如何影响鼠标命中、指针坐标或绘制，也没有实现相应行为。

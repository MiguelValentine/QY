package objsys

import (
	"testing"

	"QY/internal/script"
	"QY/internal/symbol"
)

func TestWindowPositionAliasesAndInvalidWrites(t *testing.T) {
	wnd := NewWnd(nil)
	position, handled, err := wnd.Object.ReadMember(0x6a953fb0)
	if err != nil || !handled || position.Kind != "tuple" || len(position.Items) != 2 ||
		position.Items[0].Integer != 0 || position.Items[1].Integer != 0 {
		t.Fatalf("默认位置=%+v handled=%t err=%v", position, handled, err)
	}

	wnd.Dirty = false
	if handled, err := wnd.Object.WriteMember(0x6a953fb0, script.Value{
		Kind: "tuple",
		Items: []script.Value{
			{Kind: "int", Integer: -17},
			{Kind: "int", Integer: 29},
		},
	}); err != nil || !handled || !wnd.Dirty {
		t.Fatalf("元组位置写入：handled=%t dirty=%t err=%v", handled, wnd.Dirty, err)
	}
	assertWindowPosition(t, wnd, -17, 29)

	wnd.Dirty = false
	if handled, err := wnd.Object.WriteMember(0xb1daeb5b, script.Value{Kind: "int", Integer: 41}); err != nil ||
		!handled || !wnd.Dirty {
		t.Fatalf("xpos 写入：handled=%t dirty=%t err=%v", handled, wnd.Dirty, err)
	}
	assertWindowPosition(t, wnd, 41, 29)

	wnd.Dirty = false
	if handled, err := wnd.Object.WriteMember(0x2e538c98, script.Value{Kind: "int", Integer: -53}); err != nil ||
		!handled || !wnd.Dirty {
		t.Fatalf("ypos 写入：handled=%t dirty=%t err=%v", handled, wnd.Dirty, err)
	}
	assertWindowPosition(t, wnd, 41, -53)

	wnd.Dirty = false
	invalidValues := []script.Value{
		{Kind: "string"},
		{Kind: "tuple", Items: []script.Value{{Kind: "int", Integer: 1}}},
		{Kind: "tuple", Items: []script.Value{
			{Kind: "int", Integer: 1},
			{Kind: "string"},
		}},
	}
	for _, value := range invalidValues {
		if handled, err := wnd.Object.WriteMember(0x6a953fb0, value); !handled || err == nil {
			t.Fatalf("非法位置元组未拒绝：value=%+v handled=%t err=%v", value, handled, err)
		}
		if wnd.X != 41 || wnd.Y != -53 || wnd.Dirty {
			t.Fatalf("非法元组改变了先前位置：x=%d y=%d dirty=%t", wnd.X, wnd.Y, wnd.Dirty)
		}
	}
	for _, key := range []uint32{0xb1daeb5b, 0x2e538c98} {
		if handled, err := wnd.Object.WriteMember(key, script.Value{Kind: "tuple"}); !handled || err == nil {
			t.Fatalf("非法坐标类型未拒绝：key=0x%08x handled=%t err=%v", key, handled, err)
		}
		if wnd.X != 41 || wnd.Y != -53 || wnd.Dirty {
			t.Fatalf("非法坐标改变了先前位置：x=%d y=%d dirty=%t", wnd.X, wnd.Y, wnd.Dirty)
		}
	}
	assertWindowPosition(t, wnd, 41, -53)
}

func TestSystemStartupCreatesRegisteredTooltipsBeforeDate(t *testing.T) {
	loader, err := NewLoader("../../CLIENT")
	if err != nil {
		t.Fatal(err)
	}
	programs, err := loader.compileStartup("index.fcc")
	if err != nil {
		t.Fatal(err)
	}
	if len(programs) == 0 {
		t.Fatal("启动编译没有生成 SYSTEM.COD 程序")
	}

	dateIndex := -1
	for i, node := range programs[0].Body {
		if node.Token.Kind == 1535 {
			dateIndex = i
			break
		}
	}
	if dateIndex < 0 {
		t.Fatal("SYSTEM.COD AST 中未找到 kind=1535 的 date 声明")
	}

	runtime := script.NewRuntime()
	system := NewSystemState()
	runtime.HandleDirective = system.HandleDirective
	desktop := NewDesktop(nil, system)
	desktop.Background.loadImage = loader.loadImageResource
	runtime.CurrentObject = desktop.Object
	RegisterWindowFactory(runtime, desktop)
	RegisterTextFactory(runtime, desktop)
	script.RegisterCoreBuiltins(runtime)
	if err := runtime.Execute(&script.Program{
		Body:       programs[0].Body[:dateIndex],
		Directives: programs[0].Directives,
	}); err != nil {
		t.Fatalf("执行 SYSTEM.COD 的 date 前缀：%v", err)
	}

	tptextHash := symbol.StringTableHash("tptext")
	var tooltipText *Text
	for _, text := range desktop.Texts {
		if text.Object.ClassName == tptextHash {
			tooltipText = text
			break
		}
	}
	if tooltipText == nil {
		t.Fatalf("真实启动路径未创建 tptext；文字对象数=%d", len(desktop.Texts))
	}
	var tooltipWindow *Wnd
	for _, wnd := range desktop.Windows {
		if wnd.Object == desktop.ToolTips {
			tooltipWindow = wnd
			break
		}
	}
	if tooltipWindow == nil {
		t.Fatalf("桌面 ToolTips 对象未登记为窗口：%p", desktop.ToolTips)
	}
	if tooltipWindow.Height != 26 {
		t.Fatalf("ToolTips 高度=%d，预期 26", tooltipWindow.Height)
	}
	if tooltipWindow.Background.Kind != "himgtile" || tooltipWindow.Background.Image == nil ||
		tooltipWindow.Background.Image.AEX == nil {
		t.Fatalf("ToolTips 提示图像资源未加载：背景=%+v", tooltipWindow.Background)
	}
	if len(tooltipWindow.Object.Children) != 1 || tooltipWindow.Object.Children[0] != tooltipText.Object {
		t.Fatalf("ToolTips 子对象=%v，预期只包含 tptext=%p",
			tooltipWindow.Object.Children, tooltipText.Object)
	}
	if tooltipText.X != 8 || tooltipText.Y != 2 || tooltipText.Color != 0 {
		t.Fatalf("tptext 状态与系统脚本不符：x=%d y=%d color=%d",
			tooltipText.X, tooltipText.Y, tooltipText.Color)
	}
	if desktop.ToolTips != tooltipWindow.Object {
		t.Fatalf("桌面 ToolTips=%p，预期已创建的 ToolTips 窗口=%p", desktop.ToolTips, tooltipWindow.Object)
	}
}

func assertWindowPosition(t *testing.T, wnd *Wnd, x, y int32) {
	t.Helper()
	position, handled, err := wnd.Object.ReadMember(0x6a953fb0)
	if err != nil || !handled || position.Kind != "tuple" || len(position.Items) != 2 ||
		position.Items[0].Integer != x || position.Items[1].Integer != y {
		t.Fatalf("pos=%+v，预期 (%d,%d)，handled=%t err=%v", position, x, y, handled, err)
	}
	xpos, xHandled, xErr := wnd.Object.ReadMember(0xb1daeb5b)
	ypos, yHandled, yErr := wnd.Object.ReadMember(0x2e538c98)
	if xErr != nil || yErr != nil || !xHandled || !yHandled ||
		xpos.Integer != x || ypos.Integer != y {
		t.Fatalf("别名坐标 xpos=%+v ypos=%+v，预期 (%d,%d)，err=(%v,%v)",
			xpos, ypos, x, y, xErr, yErr)
	}
}

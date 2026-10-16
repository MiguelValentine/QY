package objsys

import (
	"testing"

	"QY/internal/script"
)

func TestTextNativeColorAndWindowProperties(t *testing.T) {
	text := NewText(nil)
	value, handled, err := text.Object.ReadMember(0x7d69d3c0)
	if err != nil || !handled || value.Kind != "int" || value.Integer != 0x00faf0c8 {
		t.Fatalf("文字默认颜色=%+v handled=%t err=%v", value, handled, err)
	}
	if handled, err := text.Object.WriteMember(0x7d69d3c0, script.Value{Kind: "int", Integer: -1}); err != nil || !handled {
		t.Fatalf("文字颜色写入：handled=%t err=%v", handled, err)
	}
	if text.Color != -1 || !text.Dirty {
		t.Fatalf("文字颜色状态未保存：%+v", text)
	}
	if handled, err := text.Object.WriteMember(0x7d69d3c0, script.Value{Kind: "string"}); !handled || err == nil || text.Color != -1 {
		t.Fatalf("错误颜色覆盖已有状态：handled=%t color=%d err=%v", handled, text.Color, err)
	}
	if handled, err := text.Object.WriteMember(0x96712ccc, script.Value{Kind: "tuple", Items: []script.Value{
		{Kind: "int", Integer: 20}, {Kind: "int", Integer: 30},
	}}); err != nil || !handled || text.Width != 20 || text.Height != 30 {
		t.Fatalf("文字没有继承窗口尺寸：handled=%t text=%+v err=%v", handled, text, err)
	}
}

func TestTooltipsRegistrationValidatesNativeObject(t *testing.T) {
	desktop := NewDesktop(nil, nil)
	wnd := NewWnd(desktop)
	desktop.Windows = append(desktop.Windows, wnd)
	argument := script.Value{Kind: "object", Object: wnd.Object}
	if _, handled, err := desktop.Object.CallMember(0x2dc090dd, []script.Value{argument}); err != nil || !handled ||
		desktop.ToolTips != wnd.Object {
		t.Fatalf("已登记对象注册失败：handled=%t tips=%p err=%v", handled, desktop.ToolTips, err)
	}
	if _, _, err := desktop.Object.CallMember(0x2dc090dd, []script.Value{{Kind: "string"}}); err == nil ||
		desktop.ToolTips != wnd.Object {
		t.Fatalf("非对象参数未拒绝或覆盖已有状态：%v", err)
	}
	if _, handled, err := desktop.Object.CallMember(0x2dc090dd,
		[]script.Value{{Kind: "object", Object: &script.Object{}}}); err != nil || !handled || desktop.ToolTips != nil {
		t.Fatalf("未登记对象没有清除注册：handled=%t tips=%p err=%v", handled, desktop.ToolTips, err)
	}
}

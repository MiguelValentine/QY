package objsys

import (
	"strings"
	"testing"

	"QY/internal/script"
)

func TestNewWndDefaultsAndPropertyRoundTrips(t *testing.T) {
	wnd := NewWnd(nil)
	self, handled, err := wnd.Object.ReadMember(0xdbb6c77b)
	if err != nil || !handled || self.Kind != "object" || self.Object != wnd.Object {
		t.Fatalf("this 未指向当前逻辑窗口：%+v %t %v", self, handled, err)
	}
	for _, test := range []struct {
		key  uint32
		want int32
	}{
		{key: 0x4f7d48c6, want: 0},
		{key: 0x55e750c5, want: 0},
		{key: 0xd7c9873d, want: 1},
		{key: 0x012be321, want: 0},
		{key: 0xe2a6c0a6, want: -1},
	} {
		if got := readWndInt(t, wnd.Object, test.key); got != test.want {
			t.Errorf("属性 %#08x = %d，期望 %d", test.key, got, test.want)
		}
	}

	for _, test := range []struct {
		key   uint32
		value int32
	}{
		{key: 0x4f7d48c6, value: 800},
		{key: 0x55e750c5, value: 600},
		{key: 0xd7c9873d, value: 4},
		{key: 0x012be321, value: -3},
		{key: 0xe2a6c0a6, value: 0},
	} {
		handled, err := wnd.Object.WriteMember(test.key, script.Value{Kind: "int", Integer: test.value})
		if err != nil || !handled {
			t.Fatalf("写入属性 %#08x 失败：handled=%t err=%v", test.key, handled, err)
		}
		if got := readWndInt(t, wnd.Object, test.key); got != test.value {
			t.Errorf("属性 %#08x 写后读回 %d，期望 %d", test.key, got, test.value)
		}
	}
	if wnd.Dirty != true || wnd.Width != 800 || wnd.Height != 600 || wnd.ZOrder != 4 ||
		wnd.PointMode != -3 || wnd.Visible {
		t.Fatalf("逻辑窗口状态没有同步：%+v", wnd)
	}
	handled, err = wnd.Object.WriteMember(0xe2a6c0a6, script.Value{Kind: "int", Integer: 1})
	if err != nil || !handled || readWndInt(t, wnd.Object, 0xe2a6c0a6) != -1 {
		t.Fatalf("show 写回可见状态失败：handled=%t err=%v", handled, err)
	}
}

func TestWndPointModeWriteDoesNotMarkWindowDirty(t *testing.T) {
	wnd := NewWnd(nil)
	if handled, err := wnd.Object.WriteMember(0x012be321, script.Value{Kind: "int", Integer: 1}); err != nil || !handled {
		t.Fatalf("写入 pointmode 失败：handled=%t err=%v", handled, err)
	}
	if wnd.PointMode != 1 || wnd.Dirty {
		t.Fatalf("pointmode 写入后的状态不符原生 setter：值=%d Dirty=%t", wnd.PointMode, wnd.Dirty)
	}

	if handled, err := wnd.Object.WriteMember(0x012be321, script.Value{Kind: "string", Text: []byte("2")}); !handled || err == nil {
		t.Fatalf("pointmode 接受了未实现的非整数转换：handled=%t err=%v", handled, err)
	}
	if wnd.PointMode != 1 || wnd.Dirty {
		t.Fatalf("拒绝非整数写入时改动了状态：值=%d Dirty=%t", wnd.PointMode, wnd.Dirty)
	}
}

func TestWndPIDReadWriteReparentsAndRejectsCycles(t *testing.T) {
	root := NewWnd(nil)
	parent := NewWnd(nil)
	child := NewWnd(nil)

	if handled, err := parent.Object.WriteMember(0x356a8f52, script.Value{Kind: "object", Object: root.Object}); !handled || err != nil {
		t.Fatalf("设置父窗口失败：handled=%t err=%v", handled, err)
	}
	if handled, err := child.Object.WriteMember(0x356a8f52, script.Value{Kind: "object", Object: parent.Object}); !handled || err != nil {
		t.Fatalf("设置子窗口父节点失败：handled=%t err=%v", handled, err)
	}
	value, handled, err := child.Object.ReadMember(0x356a8f52)
	if err != nil || !handled || value.Kind != "object" || value.Object != parent.Object {
		t.Fatalf("pid 读回错误：%+v handled=%t err=%v", value, handled, err)
	}
	if len(root.Object.Children) != 1 || root.Object.Children[0] != parent.Object ||
		len(parent.Object.Children) != 1 || parent.Object.Children[0] != child.Object {
		t.Fatal("pid 写入未维护父子 Children")
	}

	if handled, err := root.Object.WriteMember(0x356a8f52, script.Value{Kind: "object", Object: child.Object}); !handled || err == nil {
		t.Fatalf("形成父子循环时未拒绝：handled=%t err=%v", handled, err)
	}
	if parent.Object.Owner != root.Object || child.Object.Owner != parent.Object ||
		len(root.Object.Children) != 1 || root.Object.Children[0] != parent.Object ||
		len(parent.Object.Children) != 1 || parent.Object.Children[0] != child.Object {
		t.Fatal("拒绝 pid 循环时改动了既有对象树")
	}
}

func TestWndSizeIsLogicalAndDoesNotCallDesktopSize(t *testing.T) {
	window := &titleRecorder{}
	desktop := NewDesktop(window, NewSystemState())
	child := NewWnd(desktop)
	value := script.Value{Kind: "tuple", Items: []script.Value{
		{Kind: "int", Integer: 320},
		{Kind: "int", Integer: 240},
	}}
	if handled, err := child.Object.WriteMember(0x96712ccc, value); !handled || err != nil {
		t.Fatalf("子窗口逻辑尺寸写入失败：handled=%t err=%v", handled, err)
	}
	if child.Width != 320 || child.Height != 240 || window.sizeCalls != 0 {
		t.Fatalf("子窗口尺寸状态=%dx%d，桌面SetSize调用数=%d", child.Width, child.Height, window.sizeCalls)
	}
	read, handled, err := child.Object.ReadMember(0x96712ccc)
	if err != nil || !handled || read.Kind != "tuple" || len(read.Items) != 2 ||
		read.Items[0].Integer != 320 || read.Items[1].Integer != 240 {
		t.Fatalf("逻辑尺寸读回错误：%+v handled=%t err=%v", read, handled, err)
	}
}

func TestWndAutoSizeUsesParentDimensionsAndStaysLogical(t *testing.T) {
	parent := NewWnd(nil)
	parent.Width, parent.Height = 320, 240
	child := NewWnd(nil)
	if err := child.Object.Reparent(parent.Object); err != nil {
		t.Fatal(err)
	}
	child.Dirty = false

	for _, test := range []struct {
		key      uint32
		percent  int32
		wantSize int32
	}{
		{key: 0x924240e8, percent: 50, wantSize: 160},
		{key: 0x8d603feb, percent: 50, wantSize: 120},
		{key: 0x924240e8, percent: 306, wantSize: 160},
	} {
		if handled, err := child.Object.WriteMember(test.key, script.Value{Kind: "int", Integer: test.percent}); err != nil || !handled {
			t.Fatalf("自动尺寸属性 %#08x 写入失败：handled=%t err=%v", test.key, handled, err)
		}
		got := child.Width
		if test.key == 0x8d603feb {
			got = child.Height
		}
		if got != test.wantSize || !child.Dirty {
			t.Fatalf("自动尺寸 %#08x=%d，Dirty=%t，期望尺寸 %d 且 Dirty", test.key, got, child.Dirty, test.wantSize)
		}
		child.Dirty = false
	}
}

func TestWndAutoSizeClampsAndDoesNotSetDesktopSize(t *testing.T) {
	window := &titleRecorder{width: 20000, height: 20000}
	desktop := NewDesktop(window, NewSystemState())
	child := NewWnd(desktop)
	if err := child.Object.Reparent(desktop.Object); err != nil {
		t.Fatal(err)
	}

	for _, key := range []uint32{0x924240e8, 0x8d603feb} {
		if handled, err := child.Object.WriteMember(key, script.Value{Kind: "int", Integer: 100}); err != nil || !handled {
			t.Fatalf("自动尺寸属性 %#08x 写入失败：handled=%t err=%v", key, handled, err)
		}
	}
	if child.Width != 16000 || child.Height != 12800 || window.sizeCalls != 0 {
		t.Fatalf("逻辑尺寸=%dx%d，桌面 SetSize 调用数=%d", child.Width, child.Height, window.sizeCalls)
	}
}

func TestWndAutoSizeAppliesMinimumAndRejectsUnsupportedInputs(t *testing.T) {
	parent := NewWnd(nil)
	child := NewWnd(nil)
	if err := child.Object.Reparent(parent.Object); err != nil {
		t.Fatal(err)
	}
	child.Dirty = false

	for _, key := range []uint32{0x924240e8, 0x8d603feb} {
		if handled, err := child.Object.WriteMember(key, script.Value{Kind: "int", Integer: 100}); err != nil || !handled {
			t.Fatalf("自动尺寸属性 %#08x 写入失败：handled=%t err=%v", key, handled, err)
		}
	}
	if child.Width != 1 || child.Height != 1 {
		t.Fatalf("父尺寸为零时未应用最小值：%dx%d", child.Width, child.Height)
	}

	child.Width, child.Height = 7, 9
	child.Dirty = false
	for _, key := range []uint32{0x924240e8, 0x8d603feb} {
		for _, invalid := range []script.Value{
			{Kind: "tuple"},
			{Kind: "tuple", Items: []script.Value{
				{Kind: "int", Integer: 100},
				{Kind: "string", Text: []byte("invalid")},
			}},
			{Kind: "string", Text: []byte("100")},
		} {
			if handled, err := child.Object.WriteMember(key, invalid); !handled || err == nil {
				t.Fatalf("自动尺寸属性 %#08x 接受了非单整数值：handled=%t err=%v", key, handled, err)
			}
			if child.Width != 7 || child.Height != 9 || child.Dirty {
				t.Fatalf("拒绝非单整数值时改变了尺寸或 Dirty：%dx%d dirty=%t", child.Width, child.Height, child.Dirty)
			}
		}
	}
	for _, key := range []uint32{0x924240e8, 0x8d603feb} {
		if _, handled, err := child.Object.ReadMember(key); err != nil || handled {
			t.Fatalf("自动尺寸属性 %#08x 不应提供 getter：handled=%t err=%v", key, handled, err)
		}
	}
}

func TestWndAutoSizeRequiresParent(t *testing.T) {
	child := NewWnd(nil)
	for _, key := range []uint32{0x924240e8, 0x8d603feb} {
		if handled, err := child.Object.WriteMember(key, script.Value{Kind: "int", Integer: 100}); !handled || err == nil {
			t.Fatalf("无父对象时自动尺寸属性 %#08x 未报错：handled=%t err=%v", key, handled, err)
		}
		if child.Width != 0 || child.Height != 0 || child.Dirty {
			t.Fatalf("无父对象写入改变了状态：%dx%d dirty=%t", child.Width, child.Height, child.Dirty)
		}
	}
}

func TestWndUnknownMembersRemainUnhandled(t *testing.T) {
	wnd := NewWnd(nil)
	if _, handled, err := wnd.Object.ReadMember(0xdeadbeef); err != nil || handled {
		t.Fatalf("未知属性读取结果：handled=%t err=%v", handled, err)
	}
	if handled, err := wnd.Object.WriteMember(0xdeadbeef, script.Value{Kind: "int", Integer: 1}); err != nil || handled {
		t.Fatalf("未知属性写入结果：handled=%t err=%v", handled, err)
	}
}

func TestWndForwardsPDesktopAndFontCharsetToDesktop(t *testing.T) {
	window := &titleRecorder{}
	system := NewSystemState()
	desktop := NewDesktop(window, system)
	wnd := NewWnd(desktop)

	value, handled, err := wnd.Object.ReadMember(0x9eea611e)
	if err != nil || !handled || value.Kind != "object" || value.Object != desktop.Object {
		t.Fatalf("pdesktop 未转发到桌面对象：%+v handled=%t err=%v", value, handled, err)
	}
	value, handled, err = wnd.Object.ReadMember(0x6f297615)
	if err != nil || !handled || value.Integer != 134 {
		t.Fatalf("字体字符集初值未转发：%+v handled=%t err=%v", value, handled, err)
	}
	if handled, err := wnd.Object.WriteMember(0x6f297615, script.Value{Kind: "int", Integer: 136}); !handled || err != nil {
		t.Fatalf("字体字符集写入未转发：handled=%t err=%v", handled, err)
	}
	value, handled, err = wnd.Object.ReadMember(0x6f297615)
	if err != nil || !handled || value.Integer != 136 ||
		system.FontCharset != 136 || window.fontCharset != 136 || window.fontCalls != 1 {
		t.Fatalf("字体状态未通过桌面共享：%+v handled=%t err=%v system=%+v window=%+v", value, handled, err, system, window)
	}
}

func TestRealEntryRegistersWndFactoryAndRecordsWindows(t *testing.T) {
	loader, err := NewLoader("../../CLIENT")
	if err != nil {
		t.Fatal(err)
	}
	program, err := loader.Compile("index.fcc")
	if err != nil {
		t.Fatal(err)
	}
	window := &titleRecorder{}
	system := NewSystemState()
	runtime := script.NewRuntime()
	runtime.HandleDirective = system.HandleDirective
	desktop := NewDesktop(window, system)
	runtime.CurrentObject = desktop.Object
	RegisterWindowFactory(runtime, desktop)
	script.RegisterCoreBuiltins(runtime)

	err = runtime.Execute(program)
	if err == nil || !strings.Contains(err.Error(), "com/newtip.fcc:0x62") ||
		!strings.Contains(err.Error(), "0x81e69173") {
		t.Fatalf("真实入口未停在预期的未实现名称：%v", err)
	}
	if len(desktop.Windows) == 0 {
		t.Fatal("真实入口没有触发已登记的 wnd 工厂")
	}
	for index, wnd := range desktop.Windows {
		if wnd == nil || wnd.Object == nil {
			t.Fatalf("Desktop.Windows[%d] 为空", index)
		}
	}
}

func readWndInt(t *testing.T, object *script.Object, key uint32) int32 {
	t.Helper()
	value, handled, err := object.ReadMember(key)
	if err != nil || !handled || value.Kind != "int" {
		t.Fatalf("读取 wnd 属性 %#08x 失败：value=%+v handled=%t err=%v", key, value, handled, err)
	}
	return value.Integer
}

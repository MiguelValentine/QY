package objsys

import (
	"testing"

	"QY/internal/script"
)

func TestSystemInitialBackgroundBinding(t *testing.T) {
	loader, err := NewLoader("../../CLIENT")
	if err != nil {
		t.Fatal(err)
	}
	programs, err := loader.compileStartup("index.fcc")
	if err != nil {
		t.Fatal(err)
	}
	runtime := script.NewRuntime()
	desktop := NewDesktop(nil, nil)
	runtime.CurrentObject = desktop.Object
	if err := runtime.Execute(&script.Program{Body: programs[0].Body[:1]}); err != nil {
		t.Fatal(err)
	}
	if desktop.Background.Kind != "color" || desktop.Background.Color565 != 0x018c {
		t.Fatalf("系统背景未按真实脚本设置：%+v", desktop.Background)
	}
}

func TestBackgroundBindingColorsAndInvalidInputs(t *testing.T) {
	for _, test := range []struct {
		input uint32
		want  uint16
	}{
		{0, 0}, {0xff0000, 0xf800}, {0x00ff00, 0x07e0},
		{0x0000ff, 0x001f}, {0xffffff, 0xffff}, {0xff003366, 0x018c},
	} {
		wnd := NewWnd(nil)
		_, handled, err := wnd.Object.BindMember(0x4d18dd80, script.Binding{
			Name: 0x7d69d3c0, Arguments: []script.Value{{Kind: "int", Integer: int32(test.input)}},
		})
		if err != nil || !handled || !wnd.Dirty ||
			wnd.Background.Kind != "color" || wnd.Background.Color565 != test.want {
			t.Fatalf("颜色 %#x：背景=%+v handled=%t err=%v", test.input, wnd.Background, handled, err)
		}
	}
	desktop := NewDesktop(nil, nil)
	valid := script.Binding{Name: 0x7d69d3c0, Arguments: []script.Value{{Kind: "int", Integer: 0x3366}}}
	if _, _, err := desktop.Object.BindMember(0x4d18dd80, valid); err != nil {
		t.Fatal(err)
	}
	previousKind, previousColor := desktop.Background.Kind, desktop.Background.Color565
	for _, binding := range []script.Binding{
		{Name: 0x8d663526},
		{Name: 0x7d69d3c0},
		{Name: 0x7d69d3c0, Arguments: []script.Value{{Kind: "string"}}},
		{Name: 0x7d69d3c0, Arguments: []script.Value{{Kind: "int"}, {Kind: "int"}}},
	} {
		if _, handled, err := desktop.Object.BindMember(0x4d18dd80, binding); !handled || err == nil {
			t.Fatalf("无效背景绑定未拒绝：%+v handled=%t err=%v", binding, handled, err)
		}
		if desktop.Background.Kind != previousKind || desktop.Background.Color565 != previousColor ||
			desktop.Background.Image != nil {
			t.Fatalf("失败覆盖已有背景：%+v", desktop.Background)
		}
	}
	if _, handled, err := desktop.Object.BindMember(0xffffffff, valid); handled || err != nil {
		t.Fatalf("错误接管未知绑定成员：handled=%t err=%v", handled, err)
	}
}

func TestWndBackgroundLoadsImageAndPreservesStateOnFailure(t *testing.T) {
	loader, err := NewLoader("../../CLIENT")
	if err != nil {
		t.Fatal(err)
	}
	desktop := NewDesktop(nil, nil)
	desktop.Background.loadImage = loader.loadImageResource
	wnd := NewWnd(desktop)

	imageBinding := script.Binding{
		Name:      0x8d663526,
		Arguments: []script.Value{{Kind: "string", Text: []byte("res$ToolTips.ale")}},
	}
	if _, handled, err := wnd.Object.BindMember(0x4d18dd80, imageBinding); err != nil || !handled {
		t.Fatalf("himgtile 加载失败：handled=%t err=%v", handled, err)
	}
	if !wnd.Dirty || wnd.Background.Kind != "himgtile" || wnd.Background.Image == nil ||
		wnd.Background.Image.AEX == nil {
		t.Fatalf("窗口背景没有绑定到 AEX 资源：dirty=%t background=%+v", wnd.Dirty, wnd.Background)
	}
	previous := wnd.Background.Image

	wnd.Dirty = false
	failedBinding := script.Binding{
		Name:      0x8d663526,
		Arguments: []script.Value{{Kind: "string", Text: []byte("res$MISSING.ale")}},
	}
	if _, handled, err := wnd.Object.BindMember(0x4d18dd80, failedBinding); !handled || err == nil {
		t.Fatalf("无效背景资源未失败：handled=%t err=%v", handled, err)
	}
	if wnd.Dirty || wnd.Background.Kind != "himgtile" || wnd.Background.Image != previous {
		t.Fatalf("失败加载改变了先前背景：dirty=%t background=%+v", wnd.Dirty, wnd.Background)
	}

	colorBinding := script.Binding{
		Name:      0x7d69d3c0,
		Arguments: []script.Value{{Kind: "int", Integer: 0x3366}},
	}
	if _, handled, err := wnd.Object.BindMember(0x4d18dd80, colorBinding); err != nil || !handled {
		t.Fatalf("切换纯色背景失败：handled=%t err=%v", handled, err)
	}
	if !wnd.Dirty || wnd.Background.Kind != "color" || wnd.Background.Image != nil {
		t.Fatalf("纯色背景未清空图像资源：dirty=%t background=%+v", wnd.Dirty, wnd.Background)
	}
}

func TestNullBackgroundBindingPreservesRecordAndCanRebind(t *testing.T) {
	wnd := NewWnd(nil)
	clear := script.Binding{Clear: true}
	if _, handled, err := wnd.Object.BindMember(0x4d18dd80, clear); err != nil || !handled {
		t.Fatalf("无既有背景时空绑定失败：handled=%t err=%v", handled, err)
	}
	if wnd.Background.Kind != "" || wnd.Background.NullBound {
		t.Fatalf("空绑定创建了背景记录：%+v", wnd.Background)
	}
	resource := &ImageResource{}
	wnd.Background.Kind, wnd.Background.Image = "himgtile", resource
	wnd.Background.Color565 = 0x018c
	for i := 0; i < 2; i++ {
		wnd.Dirty = false
		if _, handled, err := wnd.Object.BindMember(0x4d18dd80, clear); err != nil || !handled {
			t.Fatalf("既有背景空绑定失败：handled=%t err=%v", handled, err)
		}
		if !wnd.Background.NullBound || wnd.Background.Image != resource ||
			wnd.Background.Kind != "himgtile" || wnd.Background.Color565 != 0x018c || !wnd.Dirty {
			t.Fatalf("空绑定未保留既有记录：%+v", wnd.Background)
		}
	}
	invalid := script.Binding{Clear: true, Name: 0x7d69d3c0}
	if _, _, err := wnd.Object.BindMember(0x4d18dd80, invalid); err == nil {
		t.Fatal("混合空绑定与调用应明确拒绝")
	}
	if !wnd.Background.NullBound || wnd.Background.Image != resource {
		t.Fatal("失败改变了空绑定记录")
	}
	color := script.Binding{Name: 0x7d69d3c0, Arguments: []script.Value{{Kind: "int", Integer: 0xff0000}}}
	if _, handled, err := wnd.Object.BindMember(0x4d18dd80, color); err != nil || !handled {
		t.Fatalf("重新绑定失败：handled=%t err=%v", handled, err)
	}
	if wnd.Background.NullBound || wnd.Background.Kind != "color" ||
		wnd.Background.Image != nil || wnd.Background.Color565 != 0xf800 {
		t.Fatalf("重新绑定没有恢复背景状态：%+v", wnd.Background)
	}
}

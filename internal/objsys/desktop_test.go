package objsys

import (
	"bytes"
	"errors"
	"testing"

	"QY/internal/fc0a"
	"QY/internal/script"
)

type titleRecorder struct {
	title       []byte
	err         error
	calls       int
	fontCharset uint32
	fontCalls   int
	fontErr     error
	width       int32
	height      int32
	sizeCalls   int
	sizeErr     error
}

func (w *titleRecorder) SetSize(width, height int32) error {
	w.sizeCalls++
	if w.sizeErr != nil {
		return w.sizeErr
	}
	w.width, w.height = width, height
	return nil
}

func (w *titleRecorder) Size() (int32, int32, error) {
	return w.width, w.height, w.sizeErr
}

func TestDesktopSizeUsesLogicalDimensionsAndPropagatesErrors(t *testing.T) {
	window := &titleRecorder{width: 640, height: 480}
	object := NewDesktopObject(window)
	value, handled, err := object.ReadMember(0x96712ccc)
	if err != nil || !handled || value.Kind != "tuple" || len(value.Items) != 2 ||
		value.Items[0].Integer != 640 || value.Items[1].Integer != 480 {
		t.Fatalf("尺寸读取错误：%+v %t %v", value, handled, err)
	}
	for key, want := range map[uint32]int32{0x4f7d48c6: 640, 0x55e750c5: 480} {
		dimension, handled, err := object.ReadMember(key)
		if err != nil || !handled || dimension.Kind != "int" || dimension.Integer != want {
			t.Fatalf("桌面维度 %#x 没有读取实际后端：%+v %t %v", key, dimension, handled, err)
		}
	}
	for _, invalid := range []script.Value{
		{Kind: "int", Integer: 800},
		{Kind: "tuple", Items: []script.Value{{Kind: "int"}}},
		{Kind: "tuple", Items: []script.Value{{Kind: "int"}, {Kind: "string"}}},
		{Kind: "tuple", Items: []script.Value{{Kind: "int"}, {Kind: "int"}, {Kind: "int"}}},
	} {
		if handled, err := object.WriteMember(0x96712ccc, invalid); !handled || err == nil || window.sizeCalls != 0 {
			t.Fatalf("非法尺寸没有在调用后端前拒绝：%t %v", handled, err)
		}
	}
	value.Items = []script.Value{{Kind: "int", Integer: 800}, {Kind: "int", Integer: 600}}
	if handled, err := object.WriteMember(0x96712ccc, value); !handled || err != nil ||
		window.width != 800 || window.height != 600 || window.sizeCalls != 1 {
		t.Fatalf("未按顺序提取两个尺寸：%t %v", handled, err)
	}
	sentinel := errors.New("尺寸调整失败")
	window.sizeErr = sentinel
	if _, err := object.WriteMember(0x96712ccc, value); !errors.Is(err, sentinel) || window.width != 800 {
		t.Fatalf("尺寸后端失败没有传播：%v", err)
	}
	if _, _, err := object.ReadMember(0x96712ccc); !errors.Is(err, sentinel) {
		t.Fatalf("尺寸读取失败没有传播：%v", err)
	}
	if _, _, err := object.ReadMember(0x4f7d48c6); !errors.Is(err, sentinel) {
		t.Fatalf("宽度读取失败没有传播：%v", err)
	}
	object = NewDesktopObject(nil)
	if _, err := object.WriteMember(0x96712ccc, value); !errors.Is(err, ErrWindowUnavailable) {
		t.Fatalf("缺少尺寸后端却报告成功：%v", err)
	}
	if _, _, err := object.ReadMember(0x96712ccc); !errors.Is(err, ErrWindowUnavailable) {
		t.Fatalf("缺少尺寸后端却返回虚构尺寸：%v", err)
	}
}

func (w *titleRecorder) SetFontCharset(charset uint32) error {
	w.fontCalls++
	if w.fontErr != nil {
		return w.fontErr
	}
	w.fontCharset = charset
	return nil
}

func (w *titleRecorder) SetTitle(text []byte) error {
	w.calls++
	w.title = text
	return w.err
}

func TestDesktopPropertiesBindIdentityAndRebuildFonts(t *testing.T) {
	system := NewSystemState()
	window := &titleRecorder{}
	object := NewDesktopObjectWithSystem(window, system)
	value, handled, err := object.ReadMember(0x9eea611e)
	if err != nil || !handled || value.Kind != "object" || value.Object != object {
		t.Fatalf("pdesktop 未指向当前桌面：%+v %t %v", value, handled, err)
	}
	value, handled, err = object.ReadMember(0xdbb6c77b)
	if err != nil || !handled || value.Kind != "object" || value.Object != object {
		t.Fatalf("this 未指向当前桌面：%+v %t %v", value, handled, err)
	}
	if _, err := object.WriteMember(0x9eea611e, value); err == nil {
		t.Fatal("只读 pdesktop 被写入")
	}
	if _, err := object.WriteMember(0x6f297615, script.Value{Kind: "string"}); err == nil || window.fontCalls != 0 {
		t.Fatalf("非整数字符集未拒绝：%v", err)
	}
	for _, charset := range []int32{134, 136, 136} {
		if handled, err := object.WriteMember(0x6f297615, script.Value{Kind: "int", Integer: charset}); !handled || err != nil {
			t.Fatalf("字体写入失败：%t %v", handled, err)
		}
		value, handled, err := object.ReadMember(0x6f297615)
		if err != nil || !handled || value.Integer != charset || system.FontCharset != uint32(charset) || window.fontCharset != uint32(charset) {
			t.Fatalf("字体状态没有共享：%+v %t %v", value, handled, err)
		}
	}
	if window.fontCalls != 3 {
		t.Fatalf("相同字符集写入也应重建字体：%d", window.fontCalls)
	}
	sentinel := errors.New("字体创建失败")
	window.fontErr = sentinel
	if _, err := object.WriteMember(0x6f297615, script.Value{Kind: "int", Integer: 1}); !errors.Is(err, sentinel) || system.FontCharset != 136 {
		t.Fatalf("重建失败未传播或破坏了旧状态：%v", err)
	}
	if _, handled, err := object.ReadMember(7); err != nil || handled {
		t.Fatalf("未知属性读取被当作已恢复：%t %v", handled, err)
	}
	if handled, err := object.WriteMember(7, value); err != nil || handled {
		t.Fatalf("未知属性写入被当作已恢复：%t %v", handled, err)
	}
	object = NewDesktopObject(nil)
	if _, err := object.WriteMember(0x6f297615, script.Value{Kind: "int", Integer: 134}); !errors.Is(err, ErrFontUnavailable) {
		t.Fatalf("没有实际字体后端却报告成功：%v", err)
	}
}

func TestSystemCharsetUsesDesktopFontBackend(t *testing.T) {
	system := NewSystemState()
	window := &titleRecorder{}
	object := NewDesktopObjectWithSystem(window, system)
	directive := script.Directive{Kind: 1650, Arguments: []script.Lexeme{
		{Token: fc0a.Token{Kind: 6, Value: 0xa62cb624}},
		{Token: fc0a.Token{Kind: 6, Value: 0x28de5016}},
	}}
	if err := system.HandleDirective(directive); err != nil {
		t.Fatal(err)
	}
	value, _, err := object.ReadMember(0x6f297615)
	if err != nil || value.Integer != 136 || window.fontCalls != 1 || window.fontCharset != 136 || system.DisplayCharset != 134 {
		t.Fatalf("系统字体指令未同步到实际后端或改变了显示字符集：%+v %v", value, err)
	}
	sentinel := errors.New("字体加载失败")
	window.fontErr = sentinel
	directive.Arguments[1].Value = 0xc58f8d39
	if err := system.HandleDirective(directive); !errors.Is(err, sentinel) || system.FontCharset != 136 {
		t.Fatalf("系统指令失败没有保留旧字体状态：%v", err)
	}
}

func TestDesktopAboutCallsCopyCStringAndPreserveResult(t *testing.T) {
	desktop := NewDesktop(nil, nil)
	for _, key := range []uint32{0x780aea8e, 0x2afbfe28} {
		raw := []byte{'a', 0, 0xd6, 0xd0}
		argument := script.Value{Kind: "string", Text: raw}
		result, handled, err := desktop.Object.CallMember(key, []script.Value{argument})
		if err != nil || !handled || !bytes.Equal(result.Text, raw) {
			t.Fatalf("关于配置赋值错误：%x %+v %t %v", key, result, handled, err)
		}
		stored := desktop.AboutImagePath
		if key == 0x2afbfe28 {
			stored = desktop.AboutText
		}
		if !bytes.Equal(stored, raw[:1]) {
			t.Fatalf("关于配置未按C字符串截断：%x", stored)
		}
		raw[0] = 'b'
		if stored[0] != 'a' {
			t.Fatal("关于配置与脚本共享可变缓冲区")
		}
		if _, handled, err := desktop.Object.CallMember(key, []script.Value{{Kind: "int"}}); !handled || err == nil {
			t.Fatalf("非字符串关于配置未拒绝：%t %v", handled, err)
		}
	}
}

func TestDesktopTitleRequiresRealBackendAndValidArguments(t *testing.T) {
	object := NewDesktopObject(nil)
	argument := script.Value{Kind: "string", Text: []byte{0xc4, 0xe3, 0, 'x'}}
	if _, handled, err := object.CallMember(0xd53b302d, []script.Value{argument}); !handled || !errors.Is(err, ErrWindowUnavailable) {
		t.Fatalf("缺少窗口时未报告真实边界：%t %v", handled, err)
	}
	window := &titleRecorder{}
	object = NewDesktopObject(window)
	for _, args := range [][]script.Value{nil, {{Kind: "int"}}, {argument, argument}} {
		if _, handled, err := object.CallMember(0xd53b302d, args); !handled || err == nil {
			t.Fatalf("无效实参未拒绝：%+v %t %v", args, handled, err)
		}
	}
	if window.calls != 0 {
		t.Fatal("无效参数触发了窗口操作")
	}
	result, handled, err := object.CallMember(0xd53b302d, []script.Value{argument})
	if err != nil || !handled || !bytes.Equal(window.title, argument.Text[:2]) || !bytes.Equal(result.Text, argument.Text) {
		t.Fatalf("标题原始字节、NUL边界或返回值错误：%+v %t %v", result, handled, err)
	}
	argument.Text[0] = 0
	if window.title[0] != 0xc4 {
		t.Fatal("窗口与脚本共享可变标题缓冲区")
	}
	sentinel := errors.New("窗口已关闭")
	window.err = sentinel
	if _, _, err := object.CallMember(0xd53b302d, []script.Value{argument}); !errors.Is(err, sentinel) {
		t.Fatalf("窗口错误未传播：%v", err)
	}
	if _, handled, err := object.CallMember(77, nil); handled || err != nil {
		t.Fatalf("未知调用被当作已实现：%t %v", handled, err)
	}
}

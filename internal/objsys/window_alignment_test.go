package objsys

import (
	"errors"
	"testing"

	"QY/internal/script"
)

func TestWindowAlignmentCentersAgainstParentDimensions(t *testing.T) {
	parent := alignmentParent(800, 600)
	wnd := NewWnd(nil)
	if err := wnd.Object.Reparent(parent); err != nil {
		t.Fatal(err)
	}

	for _, test := range []struct {
		name    string
		width   int32
		height  int32
		xOffset int32
		yOffset int32
		wantX   int32
		wantY   int32
	}{
		{"同尺寸窗口", 800, 600, -400, -300, 0, 0},
		{"较小窗口", 200, 100, -100, -50, 300, 250},
	} {
		t.Run(test.name, func(t *testing.T) {
			wnd.Width, wnd.Height = test.width, test.height
			wnd.Dirty = false
			if handled, err := wnd.Object.WriteMember(0xf256cedf, alignmentTuple(50, test.xOffset)); !handled || err != nil {
				t.Fatalf("写入水平对齐失败：handled=%t err=%v", handled, err)
			}
			if handled, err := wnd.Object.WriteMember(0x7725fd91, alignmentTuple(50, test.yOffset)); !handled || err != nil {
				t.Fatalf("写入垂直对齐失败：handled=%t err=%v", handled, err)
			}
			if wnd.X != test.wantX || wnd.Y != test.wantY || !wnd.Dirty {
				t.Fatalf("中心位置错误：位置=(%d,%d) 期望=(%d,%d) dirty=%t",
					wnd.X, wnd.Y, test.wantX, test.wantY, wnd.Dirty)
			}
		})
	}
}

func TestWindowAlignmentCastsNegativePercentToByte(t *testing.T) {
	wnd := NewWnd(nil)
	if err := wnd.Object.Reparent(alignmentParent(800, 600)); err != nil {
		t.Fatal(err)
	}
	for _, test := range []struct {
		key  uint32
		want int32
	}{
		{0xf256cedf, 2040},
		{0x7725fd91, 1530},
	} {
		handled, err := wnd.Object.WriteMember(test.key, script.Value{Kind: "int", Integer: -1})
		if !handled || err != nil {
			t.Fatalf("负百分比对齐失败：handled=%t err=%v", handled, err)
		}
		alignment := wnd.HorizontalAlignment
		position := wnd.X
		if test.key == 0x7725fd91 {
			alignment = wnd.VerticalAlignment
			position = wnd.Y
		}
		if alignment == nil || alignment.Percent != uint8(255) || alignment.Offset != 0 || position != test.want {
			t.Fatalf("负百分比没有按字节转换：alignment=%+v position=%d want=%d", alignment, position, test.want)
		}
	}
}

func TestWindowAlignmentZeroStoresConfigWithoutMoving(t *testing.T) {
	wnd := NewWnd(nil)
	if err := wnd.Object.Reparent(alignmentParent(800, 600)); err != nil {
		t.Fatal(err)
	}
	wnd.X, wnd.Y, wnd.Dirty = 71, -22, false
	if handled, err := wnd.Object.WriteMember(0xf256cedf, alignmentTuple(0, 19)); !handled || err != nil {
		t.Fatalf("写入零水平对齐失败：handled=%t err=%v", handled, err)
	}
	if handled, err := wnd.Object.WriteMember(0x7725fd91, alignmentTuple(0, -31)); !handled || err != nil {
		t.Fatalf("写入零垂直对齐失败：handled=%t err=%v", handled, err)
	}
	if wnd.X != 71 || wnd.Y != -22 || wnd.Dirty {
		t.Fatalf("零百分比改变了当前位置或 Dirty：位置=(%d,%d) dirty=%t", wnd.X, wnd.Y, wnd.Dirty)
	}
	if wnd.HorizontalAlignment == nil || wnd.HorizontalAlignment.Percent != 0 || wnd.HorizontalAlignment.Offset != 19 ||
		wnd.VerticalAlignment == nil || wnd.VerticalAlignment.Percent != 0 || wnd.VerticalAlignment.Offset != -31 {
		t.Fatalf("零百分比配置没有保存：horizontal=%+v vertical=%+v", wnd.HorizontalAlignment, wnd.VerticalAlignment)
	}
}

func TestWindowAlignmentSingleIntegerDefaultsOffsetToZero(t *testing.T) {
	wnd := NewWnd(nil)
	if err := wnd.Object.Reparent(alignmentParent(800, 600)); err != nil {
		t.Fatal(err)
	}
	if handled, err := wnd.Object.WriteMember(0xf256cedf, script.Value{Kind: "int", Integer: 25}); !handled || err != nil {
		t.Fatalf("写入单整数对齐失败：handled=%t err=%v", handled, err)
	}
	if wnd.HorizontalAlignment == nil || wnd.HorizontalAlignment.Percent != 25 ||
		wnd.HorizontalAlignment.Offset != 0 || wnd.X != 200 {
		t.Fatalf("单整数对齐的默认偏移错误：alignment=%+v x=%d", wnd.HorizontalAlignment, wnd.X)
	}
}

func TestWindowAlignmentErrorsAreAtomic(t *testing.T) {
	oldHorizontal := &WindowAlignment{Percent: 11, Offset: 12}
	for _, test := range []struct {
		name   string
		parent *script.Object
		value  script.Value
	}{
		{"缺少父对象", nil, alignmentTuple(50, 0)},
		{"空参数", alignmentParent(800, 600), script.Value{Kind: "tuple"}},
		{"多余参数", alignmentParent(800, 600), script.Value{Kind: "tuple", Items: []script.Value{
			{Kind: "int", Integer: 50}, {Kind: "int"}, {Kind: "int"},
		}}},
		{"错误类型", alignmentParent(800, 600), script.Value{Kind: "tuple", Items: []script.Value{
			{Kind: "int", Integer: 50}, {Kind: "string"},
		}}},
		{"父尺寸读取失败", alignmentParentWithReadError(), alignmentTuple(50, 0)},
	} {
		t.Run(test.name, func(t *testing.T) {
			wnd := NewWnd(nil)
			wnd.X, wnd.Y, wnd.Dirty = 31, 47, false
			wnd.HorizontalAlignment = oldHorizontal
			if test.parent != nil {
				if err := wnd.Object.Reparent(test.parent); err != nil {
					t.Fatal(err)
				}
			}
			handled, err := wnd.Object.WriteMember(0xf256cedf, test.value)
			if !handled || err == nil {
				t.Fatalf("无效对齐没有失败：handled=%t err=%v", handled, err)
			}
			if wnd.X != 31 || wnd.Y != 47 || wnd.Dirty || wnd.HorizontalAlignment != oldHorizontal {
				t.Fatalf("失败写入部分修改了窗口：x=%d y=%d dirty=%t alignment=%+v",
					wnd.X, wnd.Y, wnd.Dirty, wnd.HorizontalAlignment)
			}
		})
	}
}

func TestWindowAlignmentGetterRemainsUnhandled(t *testing.T) {
	wnd := NewWnd(NewDesktop(nil, nil))
	for _, key := range []uint32{0xf256cedf, 0x7725fd91} {
		value, handled, err := wnd.Object.ReadMember(key)
		if handled || err != nil || value.Kind != "" {
			t.Fatalf("对齐 getter 应保持未处理：key=%08x value=%+v handled=%t err=%v",
				key, value, handled, err)
		}
	}
}

func alignmentParent(width, height int32) *script.Object {
	parent := &script.Object{}
	parent.ReadMember = func(key uint32) (script.Value, bool, error) {
		switch key {
		case 0x4f7d48c6:
			return script.Value{Kind: "int", Integer: width}, true, nil
		case 0x55e750c5:
			return script.Value{Kind: "int", Integer: height}, true, nil
		default:
			return script.Value{}, false, nil
		}
	}
	return parent
}

func alignmentParentWithReadError() *script.Object {
	parent := &script.Object{}
	parent.ReadMember = func(uint32) (script.Value, bool, error) {
		return script.Value{}, true, errors.New("尺寸读取失败")
	}
	return parent
}

func alignmentTuple(percent, offset int32) script.Value {
	return script.Value{Kind: "tuple", Items: []script.Value{
		{Kind: "int", Integer: percent},
		{Kind: "int", Integer: offset},
	}}
}

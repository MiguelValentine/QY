package objsys

import (
	"testing"

	"QY/internal/script"
)

func TestWndAutoSizeTupleAppliesPercentOffsetAndDefaults(t *testing.T) {
	parent := NewWnd(nil)
	parent.Width, parent.Height = 30, 20
	child := NewWnd(nil)
	if err := child.Object.Reparent(parent.Object); err != nil {
		t.Fatal(err)
	}

	for _, test := range []struct {
		name string
		key  uint32
		want int32
	}{
		{name: "宽度", key: 0x924240e8, want: 24},
		{name: "高度", key: 0x8d603feb, want: 14},
	} {
		child.Dirty = false
		value := script.Value{Kind: "tuple", Items: []script.Value{
			{Kind: "int", Integer: 100},
			{Kind: "int", Integer: -6},
		}}
		if handled, err := child.Object.WriteMember(test.key, value); !handled || err != nil {
			t.Fatalf("%s自动尺寸元组写入：handled=%t err=%v", test.name, handled, err)
		}
		got := child.Width
		if test.key == 0x8d603feb {
			got = child.Height
		}
		if got != test.want || !child.Dirty {
			t.Fatalf("%s自动尺寸=%d Dirty=%t，期望 %d 且 Dirty", test.name, got, child.Dirty, test.want)
		}
	}
}

func TestWndAutoSizeTupleUsesExplicitBounds(t *testing.T) {
	parent := NewWnd(nil)
	parent.Width = 30
	child := NewWnd(nil)
	if err := child.Object.Reparent(parent.Object); err != nil {
		t.Fatal(err)
	}
	value := script.Value{Kind: "tuple", Items: []script.Value{
		{Kind: "int", Integer: 50},
		{Kind: "int", Integer: -6},
		{Kind: "int", Integer: 5},
		{Kind: "int", Integer: 9},
	}}
	if handled, err := child.Object.WriteMember(0x924240e8, value); !handled || err != nil {
		t.Fatalf("带边界的自动宽度写入：handled=%t err=%v", handled, err)
	}
	if child.Width != 9 || child.autoWidth != (autoSizeConfig{
		percent: 50, offset: -6, minimum: 5, maximum: 9,
	}) {
		t.Fatalf("自动宽度结果=%d 配置=%+v，期望宽度 9 并保留调用参数", child.Width, child.autoWidth)
	}
}

func TestWndAutoSizeIntegerInputRemainsSupported(t *testing.T) {
	parent := NewWnd(nil)
	parent.Width, parent.Height = 320, 240
	child := NewWnd(nil)
	if err := child.Object.Reparent(parent.Object); err != nil {
		t.Fatal(err)
	}

	for _, test := range []struct {
		key  uint32
		want int32
	}{
		{key: 0x924240e8, want: 160},
		{key: 0x8d603feb, want: 120},
	} {
		if handled, err := child.Object.WriteMember(test.key, script.Value{Kind: "int", Integer: 50}); !handled || err != nil {
			t.Fatalf("整数自动尺寸写入 %#08x：handled=%t err=%v", test.key, handled, err)
		}
		got := child.Width
		if test.key == 0x8d603feb {
			got = child.Height
		}
		if got != test.want {
			t.Fatalf("整数自动尺寸 %#08x=%d，期望 %d", test.key, got, test.want)
		}
	}
}

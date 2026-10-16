package objsys

import (
	"fmt"

	"QY/internal/script"
)

// Text 保存已恢复的文字对象状态，共用窗口的布局及父子关系。
type Text struct {
	*Wnd
	Color int32
}

// NewText 对应 objsys:0x100339f0 工厂；颜色由 0x10033130 构造器初始化。
func NewText(desktop *Desktop) *Text {
	text := &Text{Wnd: NewWnd(desktop), Color: 0x00faf0c8}
	readMember := text.Object.ReadMember
	writeMember := text.Object.WriteMember
	text.Object.ReadMember = func(key uint32) (script.Value, bool, error) {
		if key == 0x7d69d3c0 {
			return script.Value{Kind: "int", Integer: text.Color}, true, nil
		}
		return readMember(key)
	}
	text.Object.WriteMember = func(key uint32, value script.Value) (bool, error) {
		if key != 0x7d69d3c0 {
			return writeMember(key, value)
		}
		if value.Kind != "int" {
			return true, fmt.Errorf("文字颜色需要整数")
		}
		text.Color = value.Integer
		text.Dirty = true
		return true, nil
	}
	return text
}

// RegisterTextFactory 登记文字构造器，并保留文字对象供场景绘制使用。
func RegisterTextFactory(runtime *script.Runtime, desktop *Desktop) {
	runtime.RegisterObjectFactory(0xb8d6865e, func(*script.Object) (*script.Object, error) {
		text := NewText(desktop)
		desktop.Texts = append(desktop.Texts, text)
		desktop.Windows = append(desktop.Windows, text.Wnd)
		return text.Object, nil
	})
}

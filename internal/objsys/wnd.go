package objsys

import (
	"fmt"

	"QY/internal/script"
)

// Wnd 保存原生 wnd 的逻辑布局；场景绘制和事件处理仍需单独接入。
type Wnd struct {
	Object              *script.Object
	X, Y                int32
	Width, Height       int32
	ZOrder              int32
	Alpha               int32
	PointMode           int32
	Cache               int32
	Visible             bool
	Dirty               bool
	Background          Background
	Interfaces          map[uint32]InterfaceEntry
	HorizontalAlignment *WindowAlignment
	VerticalAlignment   *WindowAlignment
	Controller          *Controller
	namedControllers    map[uint32]*Controller
	Path                *PathController
	AutoPosition        *AutoPosition
	autoWidth           autoSizeConfig
	autoHeight          autoSizeConfig
}

// NewWnd 对应登记在 objsys:0x1005f185 的内置工厂。
func NewWnd(desktop *Desktop) *Wnd {
	wnd := &Wnd{ZOrder: 1, Alpha: 255, Visible: true, Cache: 1}
	if desktop != nil {
		wnd.Background.loadImage = desktop.Background.loadImage
	}
	object := &script.Object{Members: make(map[uint32]*script.Value)}
	wnd.Object = object
	object.CallMember = func(key uint32, arguments []script.Value) (script.Value, bool, error) {
		return callInterface(desktop, &wnd.Interfaces, key, arguments)
	}
	object.BindMember = func(key uint32, binding script.Binding) (script.Value, bool, error) {
		if binding.Instance != 0 && key != 0x11b4b1fa {
			return script.Value{}, true, fmt.Errorf("成员 0x%08x 的命名绑定尚未恢复", key)
		}
		if key == autoposMemberHash {
			return wnd.bindAutoPosition(desktop, binding)
		}
		if key == 0x403e4ac8 {
			return wnd.bindPath(binding)
		}
		if key == 0x11b4b1fa {
			return wnd.bindController(desktop, binding)
		}
		value, handled, err := wnd.Background.bind(key, binding)
		if handled && err == nil {
			wnd.Dirty = true
		}
		return value, handled, err
	}
	object.ReadMember = func(key uint32) (script.Value, bool, error) {
		value := script.Value{Kind: "int"}
		switch key {
		case 0xdbb6c77b:
			return script.Value{Kind: "object", Object: object}, true, nil
		case 0x356a8f52:
			return script.Value{Kind: "object", Object: object.Owner}, true, nil
		case 0x6a953fb0:
			return script.Value{Kind: "tuple", Items: []script.Value{
				{Kind: "int", Integer: wnd.X},
				{Kind: "int", Integer: wnd.Y},
			}}, true, nil
		case 0xb1daeb5b:
			value.Integer = wnd.X
		case 0x2e538c98:
			value.Integer = wnd.Y
		case 0x96712ccc:
			return script.Value{Kind: "tuple", Items: []script.Value{
				{Kind: "int", Integer: wnd.Width},
				{Kind: "int", Integer: wnd.Height},
			}}, true, nil
		case 0x4f7d48c6:
			value.Integer = wnd.Width
		case 0x55e750c5:
			value.Integer = wnd.Height
		case 0xd7c9873d:
			value.Integer = wnd.ZOrder
		case 0x399aa54d:
			value.Integer = wnd.Alpha
		case 0x012be321:
			value.Integer = wnd.PointMode
		case 0x1bc7abd3:
			value.Integer = wnd.Cache
		case 0xe2a6c0a6:
			if wnd.Visible {
				// 原生 getter 对显示位算术右移，真值为 -1。
				value.Integer = -1
			}
		case 0x9eea611e, 0x6f297615:
			if desktop != nil {
				return desktop.Object.ReadMember(key)
			}
			return script.Value{}, true, fmt.Errorf("逻辑窗口缺少桌面宿主")
		default:
			return desktop.readInterface(object, key)
		}
		return value, true, nil
	}
	object.WriteMember = func(key uint32, value script.Value) (bool, error) {
		switch key {
		case 0x399aa54d:
			if value.Kind != "int" {
				return true, fmt.Errorf("逻辑窗口透明度的非整数转换尚未恢复")
			}
			if wnd.Alpha != value.Integer {
				wnd.Alpha = value.Integer
				wnd.Dirty = true
			}
			return true, nil
		case 0x012be321:
			if value.Kind != "int" {
				return true, fmt.Errorf("逻辑窗口 pointmode 的非整数转换尚未恢复")
			}
			wnd.PointMode = value.Integer
			return true, nil
		case 0x1bc7abd3:
			if value.Kind != "int" {
				return true, fmt.Errorf("逻辑窗口 cache 属性需要整数")
			}
			wnd.Cache = value.Integer
			wnd.Dirty = true
			return true, nil
		case 0xf256cedf, 0x7725fd91:
			return true, wnd.setAlignment(key, value)
		case 0x6a953fb0:
			if value.Kind != "tuple" || len(value.Items) != 2 ||
				value.Items[0].Kind != "int" || value.Items[1].Kind != "int" {
				return true, fmt.Errorf("逻辑窗口位置需要两个整数")
			}
			wnd.X, wnd.Y = value.Items[0].Integer, value.Items[1].Integer
			wnd.Dirty = true
			return true, nil
		case 0xb1daeb5b, 0x2e538c98:
			if value.Kind != "int" {
				return true, fmt.Errorf("逻辑窗口坐标需要整数")
			}
			if key == 0xb1daeb5b {
				wnd.X = value.Integer
			} else {
				wnd.Y = value.Integer
			}
			wnd.Dirty = true
			return true, nil
		case 0x356a8f52:
			if value.Kind != "object" || value.Object == nil {
				return true, fmt.Errorf("pid 的非对象解析方式尚未恢复")
			}
			if err := object.Reparent(value.Object); err != nil {
				return true, err
			}
			wnd.Dirty = true
			return true, nil
		case 0x96712ccc:
			if value.Kind != "tuple" || len(value.Items) != 2 ||
				value.Items[0].Kind != "int" || value.Items[1].Kind != "int" {
				return true, fmt.Errorf("逻辑窗口尺寸需要宽和高两个整数")
			}
			wnd.Width, wnd.Height = value.Items[0].Integer, value.Items[1].Integer
			wnd.Dirty = true
			return true, nil
		case 0x4f7d48c6, 0x55e750c5, 0xd7c9873d, 0xe2a6c0a6:
			if value.Kind != "int" {
				return true, fmt.Errorf("逻辑窗口属性 0x%08x 的非整数写入尚未恢复", key)
			}
			switch key {
			case 0x4f7d48c6:
				wnd.Width = value.Integer
			case 0x55e750c5:
				wnd.Height = value.Integer
			case 0xd7c9873d:
				wnd.ZOrder = value.Integer
			case 0xe2a6c0a6:
				wnd.Visible = value.Integer != 0
			}
			wnd.Dirty = true
			return true, nil
		case 0x924240e8, 0x8d603feb:
			return true, wnd.setAutoSize(key, value)
		case 0x6f297615:
			if desktop != nil {
				return desktop.Object.WriteMember(key, value)
			}
			return true, ErrFontUnavailable
		default:
			return false, nil
		}
	}
	return wnd
}

// RegisterWindowFactory 将已恢复的逻辑窗口构造接入脚本内置工厂。
func RegisterWindowFactory(runtime *script.Runtime, desktop *Desktop) {
	runtime.RegisterObjectFactory(0xb77e2e86, func(*script.Object) (*script.Object, error) {
		wnd := NewWnd(desktop)
		desktop.Windows = append(desktop.Windows, wnd)
		return wnd.Object, nil
	})
}

package objsys

import (
	"fmt"

	"QY/internal/script"
)

// WindowAlignment 保存原生自动布局记录中的百分比字节和有符号偏移。
type WindowAlignment struct {
	Percent uint8
	Offset  int32
}

// setAlignment 对应 objsys!0x1004ebc0 与 0x1004eca0 的即时位置更新。
func (wnd *Wnd) setAlignment(key uint32, value script.Value) error {
	parent := wnd.Object.Owner
	if parent == nil {
		return fmt.Errorf("窗口对齐需要父对象")
	}
	items := []script.Value{value}
	if value.Kind == "tuple" {
		items = value.Items
	}
	if len(items) < 1 || len(items) > 2 {
		return fmt.Errorf("窗口对齐需要百分比及可选偏移，额外参数行为尚未恢复")
	}
	for _, item := range items {
		if item.Kind != "int" {
			return fmt.Errorf("窗口对齐参数需要整数")
		}
	}
	alignment := &WindowAlignment{Percent: uint8(items[0].Integer)}
	if len(items) == 2 {
		alignment.Offset = items[1].Integer
	}
	horizontal := key == 0xf256cedf
	var position int32
	if alignment.Percent != 0 {
		if parent.ReadMember == nil {
			return fmt.Errorf("父对象没有对齐所需的尺寸读取器")
		}
		dimensionKey := uint32(0x4f7d48c6)
		if !horizontal {
			dimensionKey = 0x55e750c5
		}
		dimension, handled, err := parent.ReadMember(dimensionKey)
		if err != nil {
			return err
		}
		if !handled || dimension.Kind != "int" {
			return fmt.Errorf("父对象未提供整数尺寸")
		}
		// 先按原生 32 位乘法回绕，再执行有符号整数除法。
		position = dimension.Integer*int32(alignment.Percent)/100 + alignment.Offset
	}
	if horizontal {
		wnd.HorizontalAlignment = alignment
		if alignment.Percent != 0 {
			wnd.X = position
			wnd.Dirty = true
		}
	} else {
		wnd.VerticalAlignment = alignment
		if alignment.Percent != 0 {
			wnd.Y = position
			wnd.Dirty = true
		}
	}
	return nil
}

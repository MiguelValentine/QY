package objsys

import (
	"fmt"

	"QY/internal/script"
)

type autoSizeConfig struct {
	percent uint8
	offset  int32
	minimum int32
	maximum int32
}

func (wnd *Wnd) setAutoSize(key uint32, value script.Value) error {
	parent := wnd.Object.Owner
	if parent == nil {
		return fmt.Errorf("逻辑窗口自动宽高属性需要父对象")
	}

	width := key == 0x924240e8
	dimensionKey := uint32(0x4f7d48c6)
	maximum := int32(16000)
	if !width {
		dimensionKey = 0x55e750c5
		maximum = 12800
	}

	parameters := [4]int32{0, 0, 1, maximum}
	switch value.Kind {
	case "int":
		parameters[0] = value.Integer
	case "tuple":
		if len(value.Items) == 0 || len(value.Items) > len(parameters) {
			return fmt.Errorf("逻辑窗口自动宽高需要一至四个整数参数")
		}
		for index, item := range value.Items {
			if item.Kind != "int" {
				return fmt.Errorf("逻辑窗口自动宽高参数 %d 需要整数", index+1)
			}
			parameters[index] = item.Integer
		}
	default:
		return fmt.Errorf("逻辑窗口自动宽高需要整数或整数元组")
	}

	config := autoSizeConfig{
		percent: uint8(parameters[0]),
		offset:  parameters[1],
		minimum: parameters[2],
		maximum: parameters[3],
	}
	if width {
		wnd.autoWidth = config
	} else {
		wnd.autoHeight = config
	}
	if config.percent != 0 {
		if parent.ReadMember == nil {
			return fmt.Errorf("父对象没有自动尺寸所需的尺寸读取器")
		}
		parentDimension, handled, err := parent.ReadMember(dimensionKey)
		if err != nil {
			return err
		}
		if !handled || parentDimension.Kind != "int" {
			return fmt.Errorf("父对象属性 0x%08x 未提供整数尺寸", dimensionKey)
		}
		scaled := int32(parentDimension.Integer*int32(config.percent)) / 100
		dimension := scaled + config.offset
		if dimension < config.minimum {
			dimension = config.minimum
		}
		if dimension > config.maximum {
			dimension = config.maximum
		}
		if width {
			wnd.Width = dimension
		} else {
			wnd.Height = dimension
		}
	}
	wnd.Dirty = true
	return nil
}

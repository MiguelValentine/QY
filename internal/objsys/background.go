package objsys

import (
	"fmt"

	"QY/internal/script"
)

// Background 保存 bk 绑定产生的背景状态，绘制时使用原生 RGB565 颜色。
type Background struct {
	Kind     string
	Color565 uint16
	Image    *ImageResource
	// NullBound 对应原生绑定记录 +0x1c；空绑定保留既有资源数据。
	NullBound bool
	loadImage func([]byte) (*ImageResource, error)
}

func (b *Background) bind(key uint32, binding script.Binding) (script.Value, bool, error) {
	if key != 0x4d18dd80 {
		return script.Value{}, false, nil
	}
	if binding.Instance != 0 {
		return script.Value{}, true, fmt.Errorf("背景的命名绑定尚未恢复")
	}
	if binding.Clear {
		if binding.Name != 0 || len(binding.Arguments) != 0 {
			return script.Value{}, true, fmt.Errorf("空背景绑定不能包含调用名称或参数")
		}
		// 原生 0x10065820 只标记已找到的记录，未命中时不创建背景。
		if b.Kind != "" {
			b.NullBound = true
		}
		return script.Value{Kind: "null"}, true, nil
	}
	if binding.Name == 0x8d663526 {
		if len(binding.Arguments) != 1 || binding.Arguments[0].Kind != "string" {
			return script.Value{}, true, fmt.Errorf("bk himgtile 当前需要一个图片路径参数")
		}
		if b.loadImage == nil {
			return script.Value{}, true, fmt.Errorf("bk himgtile 缺少图片资源加载器")
		}
		resource, err := b.loadImage(binding.Arguments[0].Text)
		if err != nil {
			return script.Value{}, true, err
		}
		b.Kind, b.Image = "himgtile", resource
		b.NullBound = false
		return script.Value{Kind: "null"}, true, nil
	}
	if binding.Name == 0x9f4d12ca || binding.Name == 0x5a3017d8 || binding.Name == 0x586b6d92 {
		// 原生分支会建立带透明度的渐变背景；参数布局仍需继续核对。
		b.Kind = "gradient"
		b.Image = nil
		b.NullBound = false
		return script.Value{Kind: "null"}, true, nil
	}
	if binding.Name != 0x7d69d3c0 {
		return script.Value{}, true, fmt.Errorf("bk 尚未恢复背景模式 0x%08x", binding.Name)
	}
	if len(binding.Arguments) != 1 || binding.Arguments[0].Kind != "int" {
		return script.Value{}, true, fmt.Errorf("bk color 需要一个整数颜色参数")
	}
	color := uint32(binding.Arguments[0].Integer)
	// objsys:0x10043e05–0x10043e24 丢弃低位后保存到背景对象 +0xc4。
	b.Color565 = uint16((color>>8)&0xf800 | (color>>5)&0x07e0 | (color>>3)&0x001f)
	b.Kind = "color"
	b.Image = nil
	b.NullBound = false
	return script.Value{Kind: "null"}, true, nil
}

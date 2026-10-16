package objsys

import (
	"bytes"
	"fmt"

	"QY/internal/script"
)

// ImgEx 保存 img 与 imgex 共享的图片状态；拉伸绘制缓存仍需独立恢复。
type ImgEx struct {
	*Wnd
	Source           []byte
	Resource         *ImageResource
	LoadFlags        int32
	Stretch          bool
	FrameIndex       int32
	FrameOffsetX     int32
	FrameOffsetY     int32
	defaultParameter int32
	loaded           bool
}

const imageFrameMemberHash uint32 = 0x6c181c97

// NewImgEx 对应 0x1002e070，经图片基类复用 wnd 的布局与父子关系。
func NewImgEx(desktop *Desktop) *ImgEx {
	img := newImageWindow(desktop, 98)
	img.Stretch = true
	return img
}

// NewImg 对应 0x1002ca80 工厂使用的基类构造器，加载默认参数为100。
func NewImg(desktop *Desktop) *ImgEx {
	return newImageWindow(desktop, 100)
}

func newImageWindow(desktop *Desktop, parameter int32) *ImgEx {
	img := &ImgEx{Wnd: NewWnd(desktop), defaultParameter: parameter}
	read := img.Object.ReadMember
	write := img.Object.WriteMember
	img.Object.ReadMember = func(key uint32) (script.Value, bool, error) {
		if key == imageFrameMemberHash {
			return script.Value{Kind: "int", Integer: img.FrameIndex}, true, nil
		}
		if key == 0xa06413cf {
			return script.Value{Kind: "string", Text: bytes.Clone(img.Source)}, true, nil
		}
		return read(key)
	}
	img.Object.WriteMember = func(key uint32, value script.Value) (bool, error) {
		if key == imageFrameMemberHash {
			if value.Kind != "int" {
				return true, fmt.Errorf("imgex frame 需要整数")
			}
			if img.FrameIndex == value.Integer {
				return true, nil
			}
			img.FrameIndex = value.Integer
			if img.Resource != nil {
				img.updateFrameBounds()
			}
			img.Dirty = true
			return true, nil
		}
		if key != 0xa06413cf {
			return write(key, value)
		}
		return true, img.setSource(value)
	}
	return img
}

func (img *ImgEx) updateFrameBounds() {
	width, height, offsetX, offsetY, ok := imageFrameBounds(img.Resource, img.FrameIndex)
	if !ok {
		width, height, offsetX, offsetY = 0, 0, 0, 0
	}
	img.Width, img.Height = width, height
	img.FrameOffsetX, img.FrameOffsetY = offsetX, offsetY
}

func imageFrameBounds(resource *ImageResource, index int32) (width, height, offsetX, offsetY int32, ok bool) {
	if resource == nil || index < 0 {
		return 0, 0, 0, 0, false
	}
	if resource.Bitmap != nil {
		if index != 0 {
			return 0, 0, 0, 0, false
		}
		bounds := resource.Bitmap.Bounds()
		return int32(bounds.Dx()), int32(bounds.Dy()), 0, 0, true
	}
	if int64(index) < int64(len(resource.Frames)) {
		frame := resource.Frames[index]
		return int32(frame.Width), int32(frame.Height), frame.OffsetX, frame.OffsetY, true
	}
	if resource.ALE != nil && int64(index) < int64(len(resource.ALE.Frames)) {
		frame := resource.ALE.Frames[index]
		return int32(frame.Width), int32(frame.Height), frame.OffsetX, frame.OffsetY, true
	}
	return 0, 0, 0, 0, false
}

func (img *ImgEx) setSource(value script.Value) error {
	items := []script.Value{value}
	if value.Kind == "tuple" {
		items = value.Items
	}
	if len(items) < 1 || len(items) > 2 || items[0].Kind != "string" {
		return fmt.Errorf("imgex src 需要图片路径及可选整数参数")
	}
	// 默认值来自构造器 +0x108；显式参数只覆盖本次加载的局部槽。
	parameter := img.defaultParameter
	if len(items) == 2 {
		if items[1].Kind != "int" {
			return fmt.Errorf("imgex src 的第二个参数需要整数")
		}
		parameter = items[1].Integer
	}
	source := bytes.Clone(nulBytes(items[0].Text))
	for index, value := range source {
		if value >= 0x80 {
			return fmt.Errorf("imgex src 的非 ASCII 路径大小写规则尚未恢复")
		}
		if value >= 'A' && value <= 'Z' {
			source[index] = value + ('a' - 'A')
		}
	}
	if len(source) == 0 {
		img.Source, img.Resource = source, nil
		img.loaded = false
		img.LoadFlags = parameter * 2
		img.Dirty = true
		return nil
	}
	if img.Background.loadImage == nil {
		return fmt.Errorf("imgex 缺少图片资源加载器")
	}
	resource, err := img.Background.loadImage(source)
	if err != nil {
		return err
	}
	if resource == nil {
		return fmt.Errorf("图片资源加载器返回空资源")
	}
	width, height, offsetX, offsetY, ok := imageFrameBounds(resource, 0)
	if !ok {
		return fmt.Errorf("图片资源没有可用帧")
	}
	img.Source, img.Resource = source, resource
	img.LoadFlags = parameter * 2
	img.FrameIndex = 0
	img.Width, img.Height = width, height
	img.FrameOffsetX, img.FrameOffsetY = offsetX, offsetY
	img.loaded = true
	img.Dirty = true
	return nil
}

// RegisterImageFactory 登记真实 imgex 类型，并将窗口保留在桌面对象树中。
func RegisterImageFactory(runtime *script.Runtime, desktop *Desktop) {
	runtime.RegisterObjectFactory(0x02078624, func(*script.Object) (*script.Object, error) {
		img := NewImgEx(desktop)
		desktop.Images = append(desktop.Images, img)
		desktop.Windows = append(desktop.Windows, img.Wnd)
		return img.Object, nil
	})
	runtime.RegisterObjectFactory(0x0aa80ccc, func(*script.Object) (*script.Object, error) {
		img := NewImg(desktop)
		desktop.Images = append(desktop.Images, img)
		desktop.Windows = append(desktop.Windows, img.Wnd)
		return img.Object, nil
	})
}

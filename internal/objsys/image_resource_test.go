package objsys

import (
	"image"
	"testing"

	"QY/internal/ale"
)

func TestLoadRealLoginBackgroundJPEG(t *testing.T) {
	loader, err := NewLoader("../../CLIENT")
	if err != nil {
		t.Fatal(err)
	}
	resource, err := loader.loadImageResource([]byte("in/img/bk.jpg"))
	if err != nil {
		t.Fatal(err)
	}
	if resource.Bitmap == nil || resource.Bitmap.Bounds() != image.Rect(0, 0, 800, 600) ||
		resource.AEX != nil || resource.ALE != nil {
		t.Fatalf("真实登录背景未解码为800x600位图：%+v", resource)
	}
}

func TestLoadImageResourceTooltipsAEX(t *testing.T) {
	loader, err := NewLoader("../../CLIENT")
	if err != nil {
		t.Fatal(err)
	}

	for _, name := range []string{"res$ToolTips.ale", "RES$TOOLTIPS.ALE", "Res$tooltips.Ale"} {
		resource, err := loader.loadImageResource([]byte(name))
		if err != nil {
			t.Fatalf("%q 加载失败：%v", name, err)
		}
		if resource.Name != name || resource.AEX == nil || resource.ALE != nil {
			t.Fatalf("%q 资源类型或名称错误：%+v", name, resource)
		}
		if want := [8]byte{'C', 'A', ':', 'B', 'B', 'L', ':', '<'}; resource.AEX.Key != want {
			t.Errorf("%q AEX key = %q，期望 %q", name, resource.AEX.Key, want)
		}
		if want := [5]uint32{3, 3, 498, 388, 0}; resource.AEX.Metadata != want {
			t.Errorf("%q AEX 元数据 = %v，期望 %v", name, resource.AEX.Metadata, want)
		}
		wantDescriptors := []ale.AEXDescriptor{
			{Values: [6]uint32{20, 30, 0, 0, 0xffffffff, 0}},
			{Values: [6]uint32{8, 30, 20, 0, 0, 0}},
			{Values: [6]uint32{14, 30, 28, 0, 0, 0}},
		}
		if len(resource.AEX.Descriptors) != len(wantDescriptors) {
			t.Fatalf("%q 描述符数量 = %d，期望 %d", name, len(resource.AEX.Descriptors), len(wantDescriptors))
		}
		for i, want := range wantDescriptors {
			if got := resource.AEX.Descriptors[i]; got != want {
				t.Errorf("%q 描述符 %d = %v，期望 %v", name, i, got, want)
			}
		}
		for slot := 0; slot < 2; slot++ {
			plane := resource.AEX.Planes[slot]
			if plane == nil {
				t.Fatalf("%q GIF 平面 %d 缺失", name, slot)
			}
			if plane.Config.Width != 42 || plane.Config.Height != 30 || len(plane.GIF.Image) == 0 {
				t.Errorf("%q GIF 平面 %d：尺寸=%dx%d 帧数=%d",
					name, slot, plane.Config.Width, plane.Config.Height, len(plane.GIF.Image))
			}
		}
		if resource.AEX.Planes[2] != nil {
			t.Errorf("%q 意外包含第三 GIF 平面", name)
		}
		if len(resource.Frames) != 3 {
			t.Fatalf("%q 缺少可用的背景帧：%d", name, len(resource.Frames))
		}
		special := 0
		for i, frame := range resource.Frames {
			want := wantDescriptors[i].Values
			if frame.Width != want[0] || frame.Height != want[1] ||
				frame.OffsetX != int32(want[4]) || frame.OffsetY != int32(want[5]) ||
				len(frame.Pixels) != int(frame.Width*frame.Height) {
				t.Fatalf("%q 第%d帧尺寸、偏移或像素不匹配：%+v", name, i, frame)
			}
			for _, pixel := range frame.Pixels {
				if pixel.Special {
					special++
				}
			}
		}
		if special != 43 {
			t.Fatalf("%q 帧切分丢失特殊像素：%d", name, special)
		}
	}
}

func TestLoadImageResourceRejectsUnsupportedNames(t *testing.T) {
	loader, err := NewLoader("../../CLIENT")
	if err != nil {
		t.Fatal(err)
	}
	for _, name := range []string{
		"res$NO_SUCH_RESOURCE.ale",
		"../CLIENT/objsys.dll",
		"ToolTips.ale#0",
	} {
		t.Run(name, func(t *testing.T) {
			if resource, err := loader.loadImageResource([]byte(name)); err == nil {
				t.Fatalf("路径 %q 未被拒绝：%+v", name, resource)
			}
		})
	}

}

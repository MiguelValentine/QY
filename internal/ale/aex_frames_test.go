package ale

import (
	"errors"
	"image"
	"image/color"
	"image/gif"
	"reflect"
	"testing"
)

func TestPrepareTooltipsAEXFrames(t *testing.T) {
	file, err := ParseAEX(tooltipsAEXResource(t))
	if err != nil {
		t.Fatal(err)
	}
	frames, err := file.PrepareFrames()
	if err != nil {
		t.Fatal(err)
	}
	want := []struct {
		size   image.Point
		offset image.Point
	}{
		{size: image.Pt(20, 30), offset: image.Pt(-1, 0)},
		{size: image.Pt(8, 30), offset: image.Pt(0, 0)},
		{size: image.Pt(14, 30), offset: image.Pt(0, 0)},
	}
	if len(frames) != len(want) {
		t.Fatalf("帧数=%d，期望%d", len(frames), len(want))
	}
	for i, frame := range frames {
		if got := image.Pt(int(frame.Width), int(frame.Height)); got != want[i].size {
			t.Errorf("第%d帧尺寸=%v，期望%v", i, got, want[i].size)
		}
		if got := image.Pt(int(frame.OffsetX), int(frame.OffsetY)); got != want[i].offset {
			t.Errorf("第%d帧偏移=%v，期望%v", i, got, want[i].offset)
		}
		if len(frame.Pixels) != want[i].size.X*want[i].size.Y {
			t.Errorf("第%d帧像素数=%d", i, len(frame.Pixels))
		}
	}

	fullPixels, canvas, err := file.PreparePixels()
	if err != nil {
		t.Fatal(err)
	}
	if canvas != image.Pt(42, 30) {
		t.Fatalf("AEX 画布尺寸=%v", canvas)
	}
	for frameIndex, frame := range frames {
		sourceX := int(file.Descriptors[frameIndex].Values[2])
		width := int(frame.Width)
		for y := 0; y < int(frame.Height); y++ {
			start := y * width
			sourceStart := y*canvas.X + sourceX
			if !reflect.DeepEqual(frame.Pixels[start:start+width], fullPixels[sourceStart:sourceStart+width]) {
				t.Fatalf("第%d帧第%d行像素与原始画布不一致", frameIndex, y)
			}
		}
	}
}

func TestPrepareAEXFramesClipsAndAdjustsOffset(t *testing.T) {
	file, err := ParseAEX(tooltipsAEXResource(t))
	if err != nil {
		t.Fatal(err)
	}
	file.Descriptors = []AEXDescriptor{{
		Values: [6]uint32{4, 3, 0xffffffff, 0xffffffff, 10, 20},
	}}
	frames, err := file.PrepareFrames()
	if err != nil {
		t.Fatal(err)
	}
	frame := frames[0]
	if frame.Width != 3 || frame.Height != 2 || frame.OffsetX != 11 || frame.OffsetY != 21 {
		t.Fatalf("裁剪帧=%+v，期望尺寸3x2、偏移11,21", frame)
	}
	fullPixels, _, err := file.PreparePixels()
	if err != nil {
		t.Fatal(err)
	}
	want := []AEXPixel{
		fullPixels[0], fullPixels[1], fullPixels[2],
		fullPixels[42], fullPixels[43], fullPixels[44],
	}
	if !reflect.DeepEqual(frame.Pixels, want) {
		t.Fatal("裁剪后的像素与源画布区域不一致")
	}
}

func TestPrepareAEXFramesRejectsInvalidGeometry(t *testing.T) {
	tests := []struct {
		name   string
		values [6]uint32
	}{
		{name: "零宽度", values: [6]uint32{0, 1, 0, 0, 0, 0}},
		{name: "尺寸超限", values: [6]uint32{maxAEXGIFDimension + 1, 1, 0, 0, 0, 0}},
		{name: "无交集", values: [6]uint32{2, 2, 100, 0, 0, 0}},
		{name: "偏移溢出", values: [6]uint32{1, 1, 0xffffffff, 0, 0x7fffffff, 0}},
	}
	for _, test := range tests {
		t.Run(test.name, func(t *testing.T) {
			file, err := ParseAEX(tooltipsAEXResource(t))
			if err != nil {
				t.Fatal(err)
			}
			file.Descriptors = []AEXDescriptor{{Values: test.values}}
			if _, err := file.PrepareFrames(); !errors.Is(err, ErrInvalid) {
				t.Fatalf("错误=%v，期望 ErrInvalid", err)
			}
		})
	}
}

func TestPrepareAEXFramesRejectsTotalPixelLimit(t *testing.T) {
	const dimension = 4096
	palette := make([]color.Color, 256)
	for i := range palette {
		palette[i] = color.RGBA{uint8(i), uint8(i), uint8(i), 255}
	}
	primary := image.NewPaletted(image.Rect(0, 0, dimension, dimension), color.Palette(palette))
	secondary := image.NewPaletted(image.Rect(0, 0, dimension, dimension), color.Palette(palette))
	file := &AEXFile{
		Metadata:    [5]uint32{2, 3},
		Descriptors: []AEXDescriptor{{Values: [6]uint32{dimension, dimension, 0, 0, 0, 0}}, {Values: [6]uint32{dimension, dimension, 0, 0, 0, 0}}},
	}
	file.Planes[0] = &AEXPlane{
		Config: image.Config{Width: dimension, Height: dimension},
		GIF:    &gif.GIF{Image: []*image.Paletted{primary}},
	}
	file.Planes[1] = &AEXPlane{
		Config: image.Config{Width: dimension, Height: dimension},
		GIF:    &gif.GIF{Image: []*image.Paletted{secondary}},
	}
	if _, err := file.PrepareFrames(); !errors.Is(err, ErrInvalid) {
		t.Fatalf("总像素上限错误=%v，期望 ErrInvalid", err)
	}
}

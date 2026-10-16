package ale

import (
	"image"
	"image/color"
	"image/gif"
	"os"
	"testing"
)

func TestPrepareTooltipsPixelsPreservesSpecialCommands(t *testing.T) {
	file, err := ParseAEX(tooltipsAEXResource(t))
	if err != nil {
		t.Fatal(err)
	}
	pixels, size, err := file.PreparePixels()
	if err != nil {
		t.Fatal(err)
	}
	if size != image.Pt(42, 30) || len(pixels) != 1260 {
		t.Fatalf("像素尺寸=%v 数量=%d", size, len(pixels))
	}
	special := 0
	for _, pixel := range pixels {
		if pixel.Special {
			special++
			if pixel.Alpha != 0x11 {
				t.Fatalf("特殊标记没有保留0x11：%+v", pixel)
			}
		} else if pixel.Alpha == 0x11 {
			t.Fatalf("普通像素误用特殊透明度：%+v", pixel)
		}
	}
	if special != 43 {
		t.Fatalf("特殊像素=%d，期望43", special)
	}
}

func TestPrepareAEXPixelsNativeThresholds(t *testing.T) {
	alphaValues := []uint8{0, 0x14, 0x70, 0x74, 0x8f, 0x90, 0xf0, 0xf4, 0x71}
	palette := color.Palette{}
	for _, a := range alphaValues {
		palette = append(palette, color.RGBA{a, a, a, 255})
	}
	rect := image.Rect(0, 0, len(alphaValues), 1)
	primary := image.NewPaletted(rect, color.Palette{color.Black, color.White})
	secondary := image.NewPaletted(rect, palette)
	for x := range alphaValues {
		secondary.SetColorIndex(x, 0, uint8(x))
	}
	primary.SetColorIndex(len(alphaValues)-1, 0, 1)
	file := &AEXFile{Metadata: [5]uint32{1, 3}}
	file.Planes[0] = &AEXPlane{Config: image.Config{Width: rect.Dx(), Height: 1}, GIF: &gif.GIF{Image: []*image.Paletted{primary}}}
	file.Planes[1] = &AEXPlane{Config: image.Config{Width: rect.Dx(), Height: 1}, GIF: &gif.GIF{Image: []*image.Paletted{secondary}}}
	pixels, _, err := file.PreparePixels()
	if err != nil {
		t.Fatal(err)
	}
	want := []uint8{0, 0x10, 0x70, 0x11, 0x11, 0x90, 0xf0, 0xff, 0x70}
	for i, pixel := range pixels {
		if pixel.Alpha != want[i] || pixel.Special != (i == 3 || i == 4) {
			t.Fatalf("像素%d=%+v，期望alpha=%#x", i, pixel, want[i])
		}
	}
	if pixels[len(pixels)-1].Color565 != 0xffff {
		t.Fatalf("白色量化=%#x", pixels[len(pixels)-1].Color565)
	}
}

func TestPrepareAEXPixelsAllowsColorAndRejectsTransparentBitmapAlpha(t *testing.T) {
	rect := image.Rect(0, 0, 1, 1)
	primary := image.NewRGBA(rect)
	primary.Set(0, 0, color.White)
	secondary := image.NewNRGBA(rect)
	secondary.SetNRGBA(0, 0, color.NRGBA{R: 1, G: 2, B: 3, A: 255})
	file := &AEXFile{Metadata: [5]uint32{1, 3}}
	file.Planes[0] = &AEXPlane{Config: image.Config{Width: 1, Height: 1}, Bitmap: primary}
	file.Planes[1] = &AEXPlane{Config: image.Config{Width: 1, Height: 1}, Bitmap: secondary}
	if _, _, err := file.PreparePixels(); err != nil {
		t.Fatalf("不透明彩色位图应可作为透明度平面：%v", err)
	}
	secondary.SetNRGBA(0, 0, color.NRGBA{R: 100, G: 100, B: 100, A: 128})
	if _, _, err := file.PreparePixels(); err == nil {
		t.Fatal("未拒绝半透明位图")
	}
}

func TestPrepareLand04PixelsQuantizesColorBeforeAlphaAverage(t *testing.T) {
	data, err := os.ReadFile("../../CLIENT/in/img/map/root/land_04.ale")
	if err != nil {
		t.Fatal(err)
	}
	file, err := ParseAEX(data)
	if err != nil {
		t.Fatal(err)
	}
	pixels, size, err := file.PreparePixels()
	if err != nil {
		t.Fatal(err)
	}
	if size != image.Pt(566, 254) || len(pixels) != 566*254 {
		t.Fatalf("真实地图画布尺寸=%v 像素数=%d", size, len(pixels))
	}
	frames, err := file.PrepareFrames()
	if err != nil {
		t.Fatal(err)
	}
	if len(frames) != 2 || len(frames) != len(file.Descriptors) {
		t.Fatalf("真实地图帧数=%d 描述符数=%d", len(frames), len(file.Descriptors))
	}
	wantFrames := []struct {
		width, height    uint32
		offsetX, offsetY int32
	}{
		{width: 167, height: 147},
		{width: 283, height: 254, offsetX: -48, offsetY: -85},
	}
	for i, frame := range frames {
		want := wantFrames[i]
		if frame.Width != want.width || frame.Height != want.height ||
			frame.OffsetX != want.offsetX || frame.OffsetY != want.offsetY ||
			uint64(frame.Width)*uint64(frame.Height) != uint64(len(frame.Pixels)) {
			t.Fatalf("真实地图第%d帧=%+v，期望尺寸%dx%d 偏移(%d,%d)",
				i, frame, want.width, want.height, want.offsetX, want.offsetY)
		}
	}

	alphaPlane := file.Planes[1]
	if alphaPlane == nil || alphaPlane.GIF == nil || alphaPlane.Bitmap != nil ||
		len(alphaPlane.GIF.Image) != 1 || alphaPlane.Config.Width != size.X ||
		alphaPlane.Config.Height != size.Y {
		t.Fatalf("真实地图透明度平面不是预期的单帧 GIF")
	}
	alphaImage := alphaPlane.GIF.Image[0]
	offColorPixels := 0
	for y := 0; y < size.Y; y++ {
		for x := 0; x < size.X; x++ {
			index := alphaImage.ColorIndexAt(x, y)
			r, g, b, _ := alphaImage.Palette[index].RGBA()
			if r == g && g == b {
				continue
			}
			if r>>8 != 145 || g>>8 != 145 || b>>8 != 144 {
				t.Fatalf("非预期偏色调色板项：%d,%d,%d", r>>8, g>>8, b>>8)
			}
			offColorPixels++
			if got := pixels[y*size.X+x].Alpha; got != 144 {
				t.Fatalf("偏色像素(%d,%d) alpha=%d，期望144；原通道=%d,%d,%d",
					x, y, got, r>>8, g>>8, b>>8)
			}
		}
	}
	if offColorPixels != 891 {
		t.Fatalf("偏色像素数=%d，期望891", offColorPixels)
	}
}

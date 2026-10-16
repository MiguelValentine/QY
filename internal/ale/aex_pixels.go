package ale

import (
	"fmt"
	"image"
)

// AEXPixel 保留原生行编码之前的颜色与透明度；特殊值需要绘制器另行处理。
type AEXPixel struct {
	Color565 uint16
	Alpha    uint8
	Special  bool
}

// PreparePixels 恢复模式3的颜色量化与透明度平面预处理，不执行有损行编码或混色。
// 两个平面可来自完整单帧 GIF 或 JPEG，沿用原生默认格式4的加载路径。
func (f *AEXFile) PreparePixels() ([]AEXPixel, image.Point, error) {
	if f == nil || f.Metadata[1] != 3 {
		return nil, image.Point{}, fmt.Errorf("%w: AEX 当前仅恢复模式3的像素预处理", ErrUnsupported)
	}
	var planes [2]image.Image
	for i := range planes {
		plane := f.Planes[i]
		if plane == nil {
			return nil, image.Point{}, fmt.Errorf("%w: AEX 缺少图像平面", ErrUnsupported)
		}
		if plane.Bitmap != nil {
			planes[i] = plane.Bitmap
		} else if plane.GIF != nil && len(plane.GIF.Image) == 1 && plane.GIF.Image[0] != nil {
			planes[i] = plane.GIF.Image[0]
		} else {
			return nil, image.Point{}, fmt.Errorf("%w: AEX 需要单帧颜色图像及灰度透明度平面", ErrUnsupported)
		}
		if planes[i] == nil || planes[i].Bounds() != image.Rect(0, 0, plane.Config.Width, plane.Config.Height) {
			return nil, image.Point{}, fmt.Errorf("%w: AEX 图像未覆盖整个平面", ErrUnsupported)
		}
	}
	size := planes[0].Bounds().Size()
	if size != planes[1].Bounds().Size() || size.X <= 0 || size.Y <= 0 ||
		uint64(size.X)*uint64(size.Y) > maxPreviewPixels {
		return nil, image.Point{}, fmt.Errorf("%w: AEX 平面尺寸不一致或超出上限", ErrInvalid)
	}
	if palette, ok := planes[0].(*image.Paletted); ok {
		for _, entry := range palette.Palette {
			_, _, _, alpha := entry.RGBA()
			if alpha != 0xffff {
				return nil, image.Point{}, fmt.Errorf("%w: AEX 颜色平面的 GIF 透明色尚未恢复", ErrUnsupported)
			}
		}
	}
	if palette, ok := planes[1].(*image.Paletted); ok {
		for _, entry := range palette.Palette {
			_, _, _, alpha := entry.RGBA()
			if alpha != 0xffff {
				return nil, image.Point{}, fmt.Errorf("%w: AEX 透明度平面的 GIF 透明色尚未恢复", ErrUnsupported)
			}
		}
	} else {
		for y := 0; y < size.Y; y++ {
			for x := 0; x < size.X; x++ {
				_, _, _, alpha := planes[1].At(x, y).RGBA()
				if alpha != 0xffff {
					return nil, image.Point{}, fmt.Errorf("%w: AEX 透明度平面需要不透明像素", ErrUnsupported)
				}
			}
		}
	}
	result := make([]AEXPixel, size.X*size.Y)
	for y := 0; y < size.Y; y++ {
		for x := 0; x < size.X; x++ {
			r, g, b, _ := planes[0].At(x, y).RGBA()
			color := uint16((r>>8)&0xf8)<<8 | uint16((g>>8)&0xfc)<<3 | uint16(b>>11)
			ar, ag, ab, _ := planes[1].At(x, y).RGBA()
			// #448 先装入默认 RGB565，#439(1) 经 #344/#428 取量化通道的整数平均。
			a := uint8(((ar>>8)&0xf8 + (ag>>8)&0xfc + (ab>>8)&0xf8) / 3)
			special := false
			// FBase:0x100299b3–0x10029a08 在量化颜色上检测暗色特殊透明度。
			if a > 0xf0 {
				a = 0xff
			} else if a == 0x11 {
				a = 0x10
			} else if a > 0x70 && a < 0x90 {
				c := Color565(color)
				if uint16(c.R)+uint16(c.G)+uint16(c.B) < 0x50 {
					a, special = 0x11, true
				}
			}
			result[y*size.X+x] = AEXPixel{Color565: color, Alpha: a, Special: special}
		}
	}
	return result, size, nil
}

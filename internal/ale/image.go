package ale

import (
	"fmt"
	"image"
	"image/color"
)

const maxPreviewPixels = 1 << 24

// Color565 还原 FBase:0x1001ab10 的格式4到格式7转换，低位按原生补零。
// 该路径生成不透明颜色；行命令携带的透明度由调用者另行处理。
func Color565(raw uint16) color.NRGBA {
	return color.NRGBA{
		R: uint8((raw >> 8) & 0xf8),
		G: uint8((raw >> 3) & 0xfc),
		B: uint8((raw << 3) & 0xf8),
		A: 255,
	}
}

// Preview 生成单帧资源预览；量化透明度采用 DecodeRow 的代表值。
// 它不模拟原生绘制器的混色；没有原始颜色的特殊命令明确返回错误。
// 帧偏移仍保留在 Frame 中，预览画布只包含帧自身的宽高。
func (f Frame) Preview() (*image.NRGBA, error) {
	if f.Width == 0 || f.Height == 0 || f.Width > maxDimension || f.Height > maxDimension ||
		uint64(f.Width)*uint64(f.Height) > maxPreviewPixels {
		return nil, fmt.Errorf("%w: 预览尺寸超出支持范围", ErrInvalid)
	}
	table, err := f.ParseRows()
	if err != nil {
		return nil, err
	}
	result := image.NewNRGBA(image.Rect(0, 0, int(f.Width), int(f.Height)))
	y := 0
	for _, row := range table.Rows {
		if row.SkipHeader != 0 {
			y += int(-int32(int16(row.SkipHeader)))
		}
		samples, err := DecodeRow(row, f.Width)
		if err != nil {
			return nil, fmt.Errorf("ale: 第%d行：%w", y, err)
		}
		for x, sample := range samples {
			if sample.Alpha == 0 {
				continue
			}
			if !sample.HasRawU16 {
				return nil, fmt.Errorf("%w: 第%d行第%d列特殊命令没有可恢复的原始颜色", ErrUnsupported, y, x)
			}
			value := Color565(sample.RawU16)
			value.A = sample.Alpha
			result.SetNRGBA(x, y, value)
		}
		y++
	}
	return result, nil
}

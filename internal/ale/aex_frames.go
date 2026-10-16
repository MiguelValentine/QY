package ale

import (
	"fmt"
	"math"
)

// AEXFrame 保存经画布边界裁剪后的帧像素和绘制偏移。
type AEXFrame struct {
	Width   uint32
	Height  uint32
	OffsetX int32
	OffsetY int32
	Pixels  []AEXPixel
}

// PrepareFrames 将 AEX 记录转换为裁剪后的帧；不进行绘制或有损行编码。
func (f *AEXFile) PrepareFrames() ([]AEXFrame, error) {
	pixels, canvas, err := f.PreparePixels()
	if err != nil {
		return nil, err
	}
	if canvas.X <= 0 || canvas.Y <= 0 ||
		uint64(canvas.X)*uint64(canvas.Y) > maxPreviewPixels ||
		uint64(canvas.X)*uint64(canvas.Y) != uint64(len(pixels)) {
		return nil, fmt.Errorf("%w: AEX 像素画布尺寸无效", ErrInvalid)
	}
	if len(f.Descriptors) == 0 || len(f.Descriptors) > maxAEXDescriptors {
		return nil, fmt.Errorf("%w: AEX 帧记录数量超出支持范围", ErrInvalid)
	}

	frames := make([]AEXFrame, 0, len(f.Descriptors))
	var totalPixels uint64
	for index, descriptor := range f.Descriptors {
		values := descriptor.Values
		width, height := uint64(values[0]), uint64(values[1])
		if width == 0 || height == 0 ||
			width > maxAEXGIFDimension || height > maxAEXGIFDimension ||
			width > maxPreviewPixels/height {
			return nil, fmt.Errorf("%w: AEX 第%d帧尺寸超出支持范围", ErrInvalid, index)
		}

		left, top := int64(int32(values[2])), int64(int32(values[3]))
		right, bottom := left+int64(width), top+int64(height)
		clippedLeft := maxInt64(left, 0)
		clippedTop := maxInt64(top, 0)
		clippedRight := minInt64(right, int64(canvas.X))
		clippedBottom := minInt64(bottom, int64(canvas.Y))
		if clippedLeft >= clippedRight || clippedTop >= clippedBottom {
			return nil, fmt.Errorf("%w: AEX 第%d帧与像素画布无交集", ErrInvalid, index)
		}

		clippedWidth := uint64(clippedRight - clippedLeft)
		clippedHeight := uint64(clippedBottom - clippedTop)
		framePixels := clippedWidth * clippedHeight
		if framePixels > maxPreviewPixels || totalPixels > maxPreviewPixels-framePixels {
			return nil, fmt.Errorf("%w: AEX 裁剪后总像素数超出上限", ErrInvalid)
		}

		offsetX := int64(int32(values[4])) + clippedLeft - left
		offsetY := int64(int32(values[5])) + clippedTop - top
		if offsetX < math.MinInt32 || offsetX > math.MaxInt32 ||
			offsetY < math.MinInt32 || offsetY > math.MaxInt32 {
			return nil, fmt.Errorf("%w: AEX 第%d帧偏移溢出", ErrInvalid, index)
		}

		cropped := make([]AEXPixel, int(framePixels))
		for y := uint64(0); y < clippedHeight; y++ {
			sourceY := uint64(clippedTop) + y
			sourceX := uint64(clippedLeft)
			sourceStart := sourceY*uint64(canvas.X) + sourceX
			targetStart := y * clippedWidth
			copy(cropped[int(targetStart):int(targetStart+clippedWidth)],
				pixels[int(sourceStart):int(sourceStart+clippedWidth)])
		}
		frames = append(frames, AEXFrame{
			Width:   uint32(clippedWidth),
			Height:  uint32(clippedHeight),
			OffsetX: int32(offsetX),
			OffsetY: int32(offsetY),
			Pixels:  cropped,
		})
		totalPixels += framePixels
	}
	return frames, nil
}

func minInt64(a, b int64) int64 {
	if a < b {
		return a
	}
	return b
}

func maxInt64(a, b int64) int64 {
	if a > b {
		return a
	}
	return b
}

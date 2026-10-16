package ale

import (
	"bytes"
	"encoding/binary"
	"errors"
	"image"
	"os"
	"path/filepath"
	"reflect"
	"testing"
)

const (
	tooltipsResourceOffset = 842104
	tooltipsResourceLength = 990
)

func tooltipsAEXResource(t *testing.T) []byte {
	t.Helper()
	root := filepath.Clean(filepath.Join("..", ".."))
	data, err := os.ReadFile(filepath.Join(root, "CLIENT", "objsys.dll"))
	if err != nil {
		t.Fatal(err)
	}
	end := tooltipsResourceOffset + tooltipsResourceLength
	if len(data) < end {
		t.Fatalf("objsys.dll 长度 %d，小于 TOOLTIPS.ALE 资源结束位置 %d", len(data), end)
	}
	return bytes.Clone(data[tooltipsResourceOffset:end])
}

func TestParseAEXTooltipsResource(t *testing.T) {
	data := tooltipsAEXResource(t)
	file, err := ParseAEX(data)
	if err != nil {
		t.Fatal(err)
	}

	if file.Key != [8]byte{'C', 'A', ':', 'B', 'B', 'L', ':', '<'} {
		t.Fatalf("AEX key = %q", file.Key)
	}
	if want := [5]uint32{3, 3, 498, 388, 0}; file.Metadata != want {
		t.Fatalf("AEX 元数据 = %v，期望 %v", file.Metadata, want)
	}
	wantDescriptors := []AEXDescriptor{
		{Values: [6]uint32{20, 30, 0, 0, 0xffffffff, 0}},
		{Values: [6]uint32{8, 30, 20, 0, 0, 0}},
		{Values: [6]uint32{14, 30, 28, 0, 0, 0}},
	}
	if !reflect.DeepEqual(file.Descriptors, wantDescriptors) {
		t.Fatalf("AEX 描述符 = %#v，期望 %#v", file.Descriptors, wantDescriptors)
	}
	for slot := 0; slot < 2; slot++ {
		plane := file.Planes[slot]
		if plane == nil {
			t.Fatalf("AEX 平面 %d 缺失", slot)
		}
		if plane.Config.Width != 42 || plane.Config.Height != 30 ||
			len(plane.GIF.Image) == 0 || len(plane.Payload) != int(file.Metadata[2+slot]) {
			t.Errorf("AEX 平面 %d: 尺寸=%dx%d 帧数=%d 载荷=%d",
				slot, plane.Config.Width, plane.Config.Height, len(plane.GIF.Image), len(plane.Payload))
		}
	}
	if file.Planes[2] != nil {
		t.Fatalf("零长度平面被解析为图像：%+v", file.Planes[2])
	}
	if string(file.Planes[0].Payload[:6]) != "GIF89a" || string(file.Planes[1].Payload[:6]) != "GIF89a" {
		t.Fatal("解密后的两个平面均未保留 GIF89a 标记")
	}
}

func TestParseAEXLogoJPEGColorPlane(t *testing.T) {
	data, err := os.ReadFile("../../CLIENT/in/img/logo.ale")
	if err != nil {
		t.Fatal(err)
	}
	file, err := ParseAEX(data)
	if err != nil {
		t.Fatal(err)
	}
	plane := file.Planes[0]
	if plane == nil || plane.Bitmap == nil || plane.GIF != nil ||
		!bytes.HasPrefix(plane.Payload, []byte{0xff, 0xd8}) {
		t.Fatalf("真实 Logo 的 JPEG 颜色平面未被解码：%+v", plane)
	}
	frames, err := file.PrepareFrames()
	if err != nil {
		t.Fatal(err)
	}
	if len(frames) != 1 || frames[0].Width != 275 || frames[0].Height != 223 ||
		len(frames[0].Pixels) != 275*223 {
		t.Fatalf("真实 Logo 的帧尺寸错误：%+v", frames)
	}
	pixels, size, err := file.PreparePixels()
	if err != nil {
		t.Fatal(err)
	}
	for _, point := range []image.Point{{0, 0}, {50, 100}, {274, 222}} {
		r, g, b, _ := plane.Bitmap.At(point.X, point.Y).RGBA()
		want := uint16((r>>8)&0xf8)<<8 | uint16((g>>8)&0xfc)<<3 | uint16(b>>11)
		if got := pixels[point.Y*size.X+point.X].Color565; got != want {
			t.Fatalf("JPEG 像素 %v 的颜色量化=%#x，期望 %#x", point, got, want)
		}
	}
	if _, err := decodeAEXPlane([]byte{0xff, 0xd8, 0xff}); err == nil {
		t.Fatal("损坏的 JPEG 平面未被拒绝")
	}
}

func TestParseAEXLandJPEGAlphaPlane(t *testing.T) {
	data, err := os.ReadFile("../../CLIENT/in/img/map/root/land_02.ale")
	if err != nil {
		t.Fatal(err)
	}
	file, err := ParseAEX(data)
	if err != nil {
		t.Fatal(err)
	}
	alpha := file.Planes[1]
	if alpha == nil || alpha.Bitmap == nil || alpha.GIF != nil ||
		alpha.Config.Width != 550 || alpha.Config.Height != 202 {
		t.Fatalf("真实地图的 JPEG 透明度平面无效：%+v", alpha)
	}
	for y := 0; y < alpha.Config.Height; y++ {
		for x := 0; x < alpha.Config.Width; x++ {
			r, g, b, a := alpha.Bitmap.At(x, y).RGBA()
			if r != g || r != b || a != 0xffff {
				t.Fatalf("透明度平面像素(%d,%d)不是不透明灰度：%d,%d,%d,%d", x, y, r, g, b, a)
			}
		}
	}
	pixels, size, err := file.PreparePixels()
	if err != nil || size != image.Pt(550, 202) || len(pixels) != 550*202 {
		t.Fatalf("真实地图像素未准备成功：size=%v count=%d err=%v", size, len(pixels), err)
	}
	frames, err := file.PrepareFrames()
	if err != nil || len(frames) != 2 {
		t.Fatalf("真实地图双帧未准备成功：count=%d err=%v", len(frames), err)
	}
	if frames[0].Width != 130 || frames[0].Height != 99 ||
		frames[1].Width != 275 || frames[1].Height != 202 ||
		frames[1].OffsetX != -79 || frames[1].OffsetY != -57 {
		t.Fatal("真实地图双帧的尺寸或偏移不匹配")
	}
}

func TestParseAEXRejectsMalformedContainer(t *testing.T) {
	valid := tooltipsAEXResource(t)
	tests := []struct {
		name   string
		mutate func([]byte)
	}{
		{
			name: "签名损坏",
			mutate: func(data []byte) {
				data[0] = 'X'
			},
		},
		{
			name: "描述符数量越界",
			mutate: func(data []byte) {
				binary.LittleEndian.PutUint32(data[12:16], maxAEXDescriptors+1)
			},
		},
		{
			name: "平面长度与文件长度不符",
			mutate: func(data []byte) {
				binary.LittleEndian.PutUint32(data[20:24], 499)
			},
		},
		{
			name: "密钥损坏",
			mutate: func(data []byte) {
				data[4] ^= 1
			},
		},
		{
			name: "平面数据损坏",
			mutate: func(data []byte) {
				data[len(data)-1] ^= 0xff
			},
		},
	}

	for _, test := range tests {
		t.Run(test.name, func(t *testing.T) {
			data := bytes.Clone(valid)
			test.mutate(data)
			if _, err := ParseAEX(data); err == nil {
				t.Fatal("损坏的 AEX 容器未被拒绝")
			}
		})
	}
	if _, err := ParseAEX(valid[:20]); !errors.Is(err, ErrInvalid) {
		t.Fatalf("截断的 AEX 头错误 = %v", err)
	}
}

func TestParseAEXKeepsUnknownFormatSeparateFromMalformedData(t *testing.T) {
	if _, err := ParseAEX([]byte("ALE\x00")); !errors.Is(err, ErrUnknownFormat) {
		t.Fatalf("非 AEX 签名错误 = %v", err)
	}
	if _, err := ParseAEX([]byte("AEX\x00")); !errors.Is(err, ErrInvalid) {
		t.Fatalf("截断的 AEX 头错误 = %v", err)
	}
}

func TestParseAEXRejectsUnconfirmedThirdPayload(t *testing.T) {
	data := tooltipsAEXResource(t)
	binary.LittleEndian.PutUint32(data[28:32], 1)
	if _, err := ParseAEX(data); !errors.Is(err, ErrUnsupported) {
		t.Fatalf("第三段数据错误 = %v，期望 ErrUnsupported", err)
	}
}

func TestParseAEXTooltipsPlaneSemantics(t *testing.T) {
	file, err := ParseAEX(tooltipsAEXResource(t))
	if err != nil {
		t.Fatal(err)
	}
	colorFrame, alphaFrame := tooltipsSingleFrame(t, file.Planes[0], 0), tooltipsSingleFrame(t, file.Planes[1], 1)
	if colorFrame.Bounds() != image.Rect(0, 0, 42, 30) ||
		alphaFrame.Bounds() != image.Rect(0, 0, 42, 30) ||
		colorFrame.Bounds() != alphaFrame.Bounds() {
		t.Fatalf("TOOLTIPS 平面帧区域不匹配：color=%v alpha=%v", colorFrame.Bounds(), alphaFrame.Bounds())
	}

	alphaPaletteValues := make(map[uint8]struct{}, len(alphaFrame.Palette))
	for index, entry := range alphaFrame.Palette {
		r, g, b, a := entry.RGBA()
		if r != g || g != b {
			t.Fatalf("alpha palette[%d] 不是灰度：%v", index, entry)
		}
		if a != 0xffff {
			t.Fatalf("alpha palette[%d] 不是不透明色：%v", index, entry)
		}
		alphaPaletteValues[uint8(r>>8)] = struct{}{}
	}
	alphaCounts := make(map[uint8]int)
	alphaIndexCounts := make(map[uint8]int)
	pixelCount := 0
	for y := alphaFrame.Bounds().Min.Y; y < alphaFrame.Bounds().Max.Y; y++ {
		for x := alphaFrame.Bounds().Min.X; x < alphaFrame.Bounds().Max.X; x++ {
			index := alphaFrame.Pix[(y-alphaFrame.Rect.Min.Y)*alphaFrame.Stride+(x-alphaFrame.Rect.Min.X)]
			alphaIndexCounts[index]++
			r, _, _, _ := alphaFrame.Palette[index].RGBA()
			alphaCounts[uint8(r>>8)]++
			pixelCount++
		}
	}
	if pixelCount != 42*30 {
		t.Fatalf("alpha 有效像素数=%d，期望 %d", pixelCount, 42*30)
	}
	wantAlphaCounts := map[uint8]int{
		0: 368, 3: 35, 9: 14, 13: 13, 15: 24, 18: 2, 22: 10, 26: 7,
		35: 5, 38: 6, 41: 5, 45: 24, 51: 5, 54: 2, 57: 4, 63: 1,
		66: 3, 73: 4, 75: 3, 83: 4, 85: 5, 90: 23, 95: 5, 103: 2,
		110: 7, 116: 4, 120: 23, 121: 3, 127: 4, 129: 3, 132: 6, 255: 636,
	}
	if !reflect.DeepEqual(alphaCounts, wantAlphaCounts) {
		t.Fatalf("alpha 像素灰度计数=%v，期望 %v", alphaCounts, wantAlphaCounts)
	}
	t.Logf("alpha palette 灰度值集合=%v；alpha 像素灰度计数=%v；palette 索引计数=%v",
		alphaPaletteValues, alphaCounts, alphaIndexCounts)

	alphaRangePixels, specialAlphaPixels := 0, 0
	for y := alphaFrame.Bounds().Min.Y; y < alphaFrame.Bounds().Max.Y; y++ {
		for x := alphaFrame.Bounds().Min.X; x < alphaFrame.Bounds().Max.X; x++ {
			offset := (y-alphaFrame.Rect.Min.Y)*alphaFrame.Stride + (x - alphaFrame.Rect.Min.X)
			alphaIndex := alphaFrame.Pix[offset]
			alpha16, _, _, _ := alphaFrame.Palette[alphaIndex].RGBA()
			alpha := uint8(alpha16 >> 8)
			if alpha <= 0x70 || alpha >= 0x90 {
				continue
			}
			alphaRangePixels++
			colorIndex := colorFrame.Pix[(y-colorFrame.Rect.Min.Y)*colorFrame.Stride+(x-colorFrame.Rect.Min.X)]
			r16, g16, b16, _ := colorFrame.Palette[colorIndex].RGBA()
			r, g, b := uint8(r16>>8), uint8(g16>>8), uint8(b16>>8)
			rgb565 := uint16(r>>3)<<11 | uint16(g>>2)<<5 | uint16(b>>3)
			red := ((rgb565 >> 11) & 0x1f) << 3
			green := ((rgb565 >> 5) & 0x3f) << 2
			blue := (rgb565 & 0x1f) << 3
			if red+green+blue < 0x50 {
				specialAlphaPixels++
			}
		}
	}
	t.Logf("#69 预处理输入：0x70<alpha<0x90 像素数=%d；满足 RGB565 通道和<0x50、会写0x11的像素数=%d",
		alphaRangePixels, specialAlphaPixels)
	if alphaRangePixels != 43 || specialAlphaPixels != 43 {
		t.Fatalf("#69 alpha 特殊值像素数=%d/%d，期望 43/43", alphaRangePixels, specialAlphaPixels)
	}
}

func tooltipsSingleFrame(t *testing.T, plane *AEXPlane, slot int) *image.Paletted {
	t.Helper()
	if plane == nil {
		t.Fatalf("TOOLTIPS 平面 %d 缺失", slot)
	}
	if len(plane.GIF.Image) != 1 {
		t.Fatalf("TOOLTIPS 平面 %d 帧数=%d，期望 1", slot, len(plane.GIF.Image))
	}
	frame := plane.GIF.Image[0]
	if frame == nil {
		t.Fatalf("TOOLTIPS 平面 %d 帧为空", slot)
	}
	return frame
}

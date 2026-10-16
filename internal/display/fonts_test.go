package display

import (
	"errors"
	"image"
	"image/color"
	"image/draw"
	"testing"

	"golang.org/x/image/font"
	"golang.org/x/image/font/gofont/goregular"
	"golang.org/x/image/math/fixed"
)

func TestNewFontsRendersLatinAndRebuildsFaces(t *testing.T) {
	fonts, err := NewFonts(goregular.TTF, CharsetDefault)
	if err != nil {
		t.Fatal(err)
	}
	defer fonts.Close()

	firstFace, firstSmall := fonts.Face(), fonts.SmallFace()
	if firstFace == nil || firstSmall == nil {
		t.Fatal("字体 face 未创建")
	}
	if firstFace == firstSmall {
		t.Fatal("常规字体与小字体意外共用同一 face")
	}
	if err := renderAndCheck(t, firstFace, "Game launcher"); err != nil {
		t.Fatal(err)
	}

	if err := fonts.SetCharset(CharsetDefault); err != nil {
		t.Fatal(err)
	}
	if fonts.Face() == firstFace || fonts.SmallFace() == firstSmall {
		t.Fatal("相同 charset 设置后没有重建字体 face")
	}
	if fonts.Charset() != CharsetDefault {
		t.Fatalf("charset = %d，期望 %d", fonts.Charset(), CharsetDefault)
	}
}

func TestDecodeTextCharsetsAndNUL(t *testing.T) {
	gbk := []byte{0xd6, 0xd0, 0xce, 0xc4, 0, 0xff}
	got, err := DecodeText(gbk, CharsetGBK)
	if err != nil {
		t.Fatal(err)
	}
	if got != "中文" {
		t.Fatalf("GBK 解码结果 = %q，期望 %q", got, "中文")
	}

	big5 := []byte{0xa4, 0xa4, 0xa4, 0xe5}
	got, err = DecodeText(big5, CharsetBig5)
	if err != nil {
		t.Fatal(err)
	}
	if got != "中文" {
		t.Fatalf("Big5 解码结果 = %q，期望 %q", got, "中文")
	}

	got, err = DecodeText([]byte{0x63, 0x61, 0x66, 0xe9}, CharsetDefault)
	if err != nil {
		t.Fatal(err)
	}
	if got != "café" {
		t.Fatalf("Windows-1252 解码结果 = %q，期望 %q", got, "café")
	}
}

func TestDecodeTextRejectsInvalidInputAndCharset(t *testing.T) {
	for _, test := range []struct {
		name    string
		data    []byte
		charset uint32
	}{
		{name: "GBK", data: []byte{0x81}, charset: CharsetGBK},
		{name: "Big5", data: []byte{0x81}, charset: CharsetBig5},
		{name: "Windows1252", data: []byte{0x81}, charset: CharsetDefault},
	} {
		t.Run(test.name, func(t *testing.T) {
			if _, err := DecodeText(test.data, test.charset); err == nil {
				t.Fatal("非法字节序列没有返回错误")
			}
		})
	}
	if _, err := DecodeText([]byte("text"), 999); !errors.Is(err, ErrUnsupportedCharset) {
		t.Fatalf("未知 charset 错误 = %v", err)
	}
}

func TestSetCharsetFailurePreservesCurrentFaces(t *testing.T) {
	fonts, err := NewFonts(goregular.TTF, CharsetGBK)
	if err != nil {
		t.Fatal(err)
	}
	defer fonts.Close()
	face, small := fonts.Face(), fonts.SmallFace()

	if err := fonts.SetCharset(999); !errors.Is(err, ErrUnsupportedCharset) {
		t.Fatalf("未知 charset 错误 = %v", err)
	}
	if fonts.Face() != face || fonts.SmallFace() != small || fonts.Charset() != CharsetGBK {
		t.Fatal("失败的重建改动了现有字体状态")
	}
}

func TestNewFontsRejectsMissingOrInvalidData(t *testing.T) {
	if _, err := NewFonts(nil, CharsetDefault); err == nil {
		t.Fatal("空字体数据没有返回错误")
	}
	if _, err := NewFonts([]byte("not a font"), CharsetDefault); err == nil {
		t.Fatal("无效字体数据没有返回错误")
	}
}

func TestLoadSystemFontCanRenderChineseWhenInstalled(t *testing.T) {
	data, err := LoadSystemFont()
	if err != nil {
		t.Skipf("当前系统未安装候选中文字体：%v", err)
	}
	fonts, err := NewFonts(data, CharsetGBK)
	if err != nil {
		t.Fatalf("解析系统中文字体失败：%v", err)
	}
	defer fonts.Close()
	bounds, advance, ok := fonts.Face().GlyphBounds('中')
	if !ok || advance <= 0 || bounds.Empty() {
		t.Fatalf("系统字体没有可用的“中”字形：bounds=%v advance=%v ok=%v", bounds, advance, ok)
	}
	if err := renderAndCheck(t, fonts.Face(), "中文"); err != nil {
		t.Fatal(err)
	}
}

func renderAndCheck(t *testing.T, face font.Face, text string) error {
	t.Helper()
	img := image.NewRGBA(image.Rect(0, 0, 240, 48))
	draw.Draw(img, img.Bounds(), image.NewUniform(color.White), image.Point{}, draw.Src)
	drawer := font.Drawer{
		Dst:  img,
		Src:  image.NewUniform(color.Black),
		Face: face,
		Dot:  fixed.P(2, 30),
	}
	drawer.DrawString(text)
	for i := 0; i < len(img.Pix); i += 4 {
		if img.Pix[i] != 0xff || img.Pix[i+1] != 0xff || img.Pix[i+2] != 0xff {
			return nil
		}
	}
	return errors.New("绘制结果没有非白色像素")
}

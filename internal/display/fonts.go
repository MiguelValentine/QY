package display

import (
	"errors"
	"fmt"
	"os"
	"path/filepath"
	"runtime"
	"strings"
	"unicode/utf8"

	"golang.org/x/image/font"
	"golang.org/x/image/font/opentype"
	"golang.org/x/text/encoding"
	"golang.org/x/text/encoding/charmap"
	"golang.org/x/text/encoding/simplifiedchinese"
	"golang.org/x/text/encoding/traditionalchinese"
)

const (
	CharsetDefault uint32 = 1
	CharsetGBK     uint32 = 134
	CharsetBig5    uint32 = 136
)

var ErrUnsupportedCharset = errors.New("不支持的字体字符集")

// Fonts 保存字体数据、当前字符集及两种字号的字体 face。
// face 使用跨平台字体栅格器，不保证与原生 GDI 像素等价。
type Fonts struct {
	data      []byte
	charset   uint32
	face      font.Face
	smallFace font.Face
}

// NewFonts 从 TTF、OTF 或 TTC 数据创建字体；集合文件使用首个 face。
func NewFonts(data []byte, charset uint32) (*Fonts, error) {
	if len(data) == 0 {
		return nil, errors.New("字体数据为空")
	}
	f := &Fonts{data: append([]byte(nil), data...)}
	if err := f.SetCharset(charset); err != nil {
		return nil, err
	}
	return f, nil
}

// SetCharset 更新字符集并重建字体 face，即使字符集未变化也会重建。
func (f *Fonts) SetCharset(charset uint32) error {
	if f == nil {
		return errors.New("字体对象为空")
	}
	if _, err := charsetEncoding(charset); err != nil {
		return err
	}
	if len(f.data) == 0 {
		return errors.New("字体数据为空")
	}

	collection, err := opentype.ParseCollection(f.data)
	if err != nil {
		return fmt.Errorf("解析字体数据失败：%w", err)
	}
	if collection.NumFonts() == 0 {
		return errors.New("字体集合中没有字体")
	}
	first, err := collection.Font(0)
	if err != nil {
		return fmt.Errorf("读取字体集合首个字体失败：%w", err)
	}
	face, err := opentype.NewFace(first, &opentype.FaceOptions{Size: 12, DPI: 72, Hinting: font.HintingNone})
	if err != nil {
		return fmt.Errorf("创建常规字体失败：%w", err)
	}
	small, err := opentype.NewFace(first, &opentype.FaceOptions{Size: 10, DPI: 72, Hinting: font.HintingNone})
	if err != nil {
		_ = face.Close()
		return fmt.Errorf("创建小字体失败：%w", err)
	}

	oldFace, oldSmall := f.face, f.smallFace
	f.face, f.smallFace, f.charset = face, small, charset
	if oldFace != nil {
		_ = oldFace.Close()
	}
	if oldSmall != nil {
		_ = oldSmall.Close()
	}
	return nil
}

// Charset 返回当前字体字符集。
func (f *Fonts) Charset() uint32 {
	if f == nil {
		return 0
	}
	return f.charset
}

// Face 返回 12 像素的常规字体 face。
func (f *Fonts) Face() font.Face {
	if f == nil {
		return nil
	}
	return f.face
}

// SmallFace 返回小字号字体 face。
func (f *Fonts) SmallFace() font.Face {
	if f == nil {
		return nil
	}
	return f.smallFace
}

// DecodeText 使用当前字体字符集解码文本。
func (f *Fonts) DecodeText(data []byte) (string, error) {
	if f == nil {
		return "", errors.New("字体对象为空")
	}
	return DecodeText(data, f.charset)
}

// DecodeText 按指定字符集解码文本，并在首个 NUL 字节处截断。
func DecodeText(data []byte, charset uint32) (string, error) {
	end := len(data)
	for i, b := range data {
		if b == 0 {
			end = i
			break
		}
	}
	enc, err := charsetEncoding(charset)
	if err != nil {
		return "", err
	}
	decoded, err := enc.NewDecoder().Bytes(data[:end])
	if err != nil {
		return "", fmt.Errorf("文本解码失败：%w", err)
	}
	if !utf8.Valid(decoded) || strings.ContainsRune(string(decoded), utf8.RuneError) {
		return "", errors.New("文本包含非法字符序列")
	}
	return string(decoded), nil
}

// Close 释放并清空当前字体 face。
func (f *Fonts) Close() error {
	if f == nil {
		return nil
	}
	var errs []error
	if f.face != nil {
		if err := f.face.Close(); err != nil {
			errs = append(errs, err)
		}
		f.face = nil
	}
	if f.smallFace != nil {
		if err := f.smallFace.Close(); err != nil {
			errs = append(errs, err)
		}
		f.smallFace = nil
	}
	return errors.Join(errs...)
}

func charsetEncoding(charset uint32) (encoding.Encoding, error) {
	switch charset {
	case CharsetGBK:
		return simplifiedchinese.GBK, nil
	case CharsetBig5:
		return traditionalchinese.Big5, nil
	case CharsetDefault:
		return charmap.Windows1252, nil
	default:
		return nil, fmt.Errorf("%w：%d", ErrUnsupportedCharset, charset)
	}
}

// LoadSystemFont 从当前操作系统的固定候选路径读取中文字体，不会安装字体。
func LoadSystemFont() ([]byte, error) {
	candidates, err := systemFontCandidates()
	if err != nil {
		return nil, err
	}
	var failures []string
	for _, path := range candidates {
		data, readErr := os.ReadFile(path)
		if readErr == nil && len(data) != 0 {
			return data, nil
		}
		if readErr != nil && !os.IsNotExist(readErr) {
			failures = append(failures, fmt.Sprintf("%s：%v", path, readErr))
		}
	}
	if len(failures) > 0 {
		return nil, fmt.Errorf("未找到可读的系统中文字体（%s）", strings.Join(failures, "；"))
	}
	return nil, fmt.Errorf("未找到系统中文字体，检查过：%s", strings.Join(candidates, "、"))
}

func systemFontCandidates() ([]string, error) {
	switch runtime.GOOS {
	case "darwin":
		return []string{
			"/System/Library/Fonts/Supplemental/Songti.ttc",
			"/System/Library/Fonts/STHeiti Medium.ttc",
			"/System/Library/Fonts/STHeiti Light.ttc",
		}, nil
	case "windows":
		windir := os.Getenv("WINDIR")
		if windir == "" {
			return nil, errors.New("未设置 WINDIR，无法查找系统中文字体")
		}
		fontDir := filepath.Join(windir, "Fonts")
		return []string{
			filepath.Join(fontDir, "simsun.ttc"),
			filepath.Join(fontDir, "msyh.ttc"),
		}, nil
	case "linux":
		return []string{
			"/usr/share/fonts/opentype/noto/NotoSansCJK-Regular.ttc",
			"/usr/share/fonts/truetype/noto/NotoSansCJK-Regular.ttc",
			"/usr/share/fonts/opentype/noto/NotoSerifCJK-Regular.ttc",
			"/usr/share/fonts/truetype/wqy/wqy-zenhei.ttc",
			"/usr/share/fonts/truetype/wqy/wqy-zenhei.ttf",
			"/usr/share/fonts/truetype/arphic/uming.ttc",
		}, nil
	default:
		return nil, fmt.Errorf("当前系统 %s 没有配置中文字体候选路径", runtime.GOOS)
	}
}

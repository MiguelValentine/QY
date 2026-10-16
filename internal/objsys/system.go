package objsys

import (
	"bytes"
	"errors"
	"fmt"

	"QY/internal/fbase"
	"QY/internal/script"
)

// SystemState 保存系统显示字符集、字体字符集及 devcode 比较结果。
// 原生 FBase #424 与 #421 分别保存前两个值，不能将其混为同一个宏。
type SystemState struct {
	DisplayCharset    uint32
	FontCharset       uint32
	DevCodeMatch      bool
	RegistryAvailable bool
	readRegistry      func(subkey, name string) ([]byte, error)
	rebuildFonts      func(charset uint32) error
}

// NewSystemState 沿用当前 Go 宿主明确选择的 GB2312 显示环境。
// 图形字体的创建与更新由绘图宿主负责。
func NewSystemState() *SystemState {
	return &SystemState{
		DisplayCharset: 134,
		FontCharset:    134,
		readRegistry:   fbase.ReadMachineString,
	}
}

// HandleDirective 恢复 objsys:0x1000bcb0 已确认的系统指令分支。
// 原程序还接受未知系统名称；当前宿主保留错误，避免掩盖尚未恢复的功能。
func (s *SystemState) HandleDirective(directive script.Directive) error {
	if directive.Kind != 1650 {
		return fmt.Errorf("宿主尚未处理指令 kind=%d", directive.Kind)
	}
	args := directive.Arguments
	if len(args) == 0 || args[0].Kind != 6 {
		return fmt.Errorf("#system 需要名称")
	}
	switch args[0].Value {
	case 0xa62cb624:
		if len(args) < 2 || args[1].Kind != 6 {
			return fmt.Errorf("#system charset 需要 GB2312、BIG5 或 DEFAULT")
		}
		var charset uint32
		switch args[1].Value {
		case 0xc58f8d39:
			charset = 134
		case 0x28de5016:
			charset = 136
		case 0x280d5f92:
			charset = 1
		default:
			return fmt.Errorf("#system charset 不支持名称哈希 %#08x", args[1].Value)
		}
		return s.setFontCharset(charset)
	case 0xdc331502:
		if len(args) < 2 || args[1].Kind != 3 {
			return fmt.Errorf("#system devcode 需要字符串常量")
		}
		// 原生分支先清零标志，无匹配也正常返回；不能将它改成启动许可。
		s.DevCodeMatch = false
		s.RegistryAvailable = false
		if s.readRegistry == nil {
			return fmt.Errorf("#system devcode 没有配置本机设置读取器")
		}
		codes, err := s.readRegistry("fc2dev", "devcode")
		if errors.Is(err, fbase.ErrRegistryUnavailable) {
			// 非 Windows 宿主没有该配置存储，保持未安装开发配置的状态。
			return nil
		}
		if err != nil {
			return fmt.Errorf("#system devcode 读取本机设置：%w", err)
		}
		s.RegistryAvailable = true
		codes = nulBytes(codes)
		if len(codes) <= 1 {
			return nil
		}
		for {
			word, rest, ok := fbase.NextWord(codes, ';')
			if !ok {
				return nil
			}
			// 两项比较分别对应原生 #642 常量比较和 #641 字符串比较。
			if bytes.Equal(word, []byte("xuegodsongyu")) || bytes.Equal(word, nulBytes(args[1].Text)) {
				s.DevCodeMatch = true
				return nil
			}
			codes = rest
		}
	default:
		return fmt.Errorf("#system 尚未恢复名称哈希 %#08x", args[0].Value)
	}
}

func (s *SystemState) setFontCharset(charset uint32) error {
	if s.rebuildFonts != nil {
		if err := s.rebuildFonts(charset); err != nil {
			return err
		}
	}
	s.FontCharset = charset
	return nil
}

func nulBytes(value []byte) []byte {
	if index := bytes.IndexByte(value, 0); index >= 0 {
		return value[:index]
	}
	return value
}

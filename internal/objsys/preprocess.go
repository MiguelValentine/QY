package objsys

import (
	"fmt"
	"path"
	"strings"

	"QY/internal/fc0a"
	"QY/internal/script"
	"QY/internal/symbol"
)

// Compile 将真实资源展开并解析为语法树，尚不创建游戏窗口或执行语句。
func (l *Loader) Compile(entry string) (*script.Program, error) {
	input, err := l.Preprocess(entry)
	if err != nil {
		return nil, err
	}
	return script.Parse(input)
}

// Preprocess 将真实入口及活动的包含文件展开为语法解析器输入。
// 宿主暂采用客户端相对路径、接口版本 209 和 GB2312 字符集常量。
func (l *Loader) Preprocess(entry string) (*script.Preprocessed, error) {
	source, err := l.scriptSource(entry, true)
	if err != nil {
		return nil, err
	}
	return script.Preprocess(source, l.resolveScriptInclude)
}

func (l *Loader) resolveScriptInclude(from, requested string) (script.Source, error) {
	requested = strings.ReplaceAll(requested, "\\", "/")
	if strings.HasPrefix(requested, "/") || strings.Contains(requested, ":") {
		return script.Source{}, fmt.Errorf("objsys: 包含路径不在客户端目录内 %q", requested)
	}
	return l.scriptSource(path.Join(path.Dir(from), requested), false)
}

func (l *Loader) scriptSource(name string, main bool) (script.Source, error) {
	name = path.Clean(strings.ReplaceAll(name, "\\", "/"))
	module, err := l.Load(name)
	if err != nil {
		return script.Source{}, err
	}
	if len(module.Members) != 1 || module.Members[0].Document == nil {
		return script.Source{}, fmt.Errorf("objsys: 脚本输入 %q 需要且仅支持一个 FC0A 成员", name)
	}
	source, err := script.ReadSource(name, module.Members[0].Document)
	if err != nil {
		return script.Source{}, err
	}
	directory := path.Dir(name)
	if directory == "." {
		directory = ""
	} else {
		directory += "/"
	}
	text := func(raw string) script.Lexeme {
		return script.Lexeme{
			Token:  fc0a.Token{Kind: 3, Value: symbol.StringTableHash(raw)},
			Source: name, Text: []byte(raw),
		}
	}
	number := func(value uint32) script.Lexeme {
		return script.Lexeme{Token: fc0a.Token{Kind: 2, Value: value}, Source: name}
	}
	// 哈希和作用来自 objsys:0x1000d1ea–0x1000d2c8，路径分割来自 FBase #216。
	source.Constants = map[uint32]script.Lexeme{
		0x2dc4903a: text(directory),
		0xc25d0866: text(path.Base(name)),
		0x332d0004: text(name),
		0x2c17a53c: number(1),
		0xb9102668: number(209),
		0x044f70fd: number(134),
		0x0c030dba: number(1),
	}
	if main {
		source.Constants[0x60b53ad3] = number(1)
	} else {
		source.Undefines = []uint32{0x60b53ad3}
	}
	return source, nil
}

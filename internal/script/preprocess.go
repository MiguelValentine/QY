// script 包逐步恢复 FC0A 标记流的预处理和执行语义。
package script

import (
	"bytes"
	"fmt"

	"QY/internal/fc0a"
)

const (
	lineEnd         = 1900
	maxMacroDepth   = 64
	maxIncludeDepth = 64
	maxOutputTokens = 4 << 20
)

// Lexeme 在展开宏和包含文件后仍保留原始文件、偏移及字符串字节。
type Lexeme struct {
	fc0a.Token
	Source string `json:"source"`
	Text   []byte `json:"text,omitempty"`
}

// Source 是一份已完成 FCC 解包的 FC0A 输入。
type Source struct {
	Name      string
	Tokens    []Lexeme
	Constants map[uint32]Lexeme
	Undefines []uint32
}

// ReadSource 将字符串常量绑定到原始字节，哈希冲突不能任意取第一项。
func ReadSource(name string, document *fc0a.Document) (Source, error) {
	source := Source{Name: name}
	if document == nil {
		return source, fmt.Errorf("script: %s 没有 FC0A 文档", name)
	}
	for _, token := range document.Tokens {
		value := Lexeme{Token: token, Source: name}
		if token.Kind == 3 {
			candidates := document.StringCandidates(token.Value)
			if len(candidates) == 0 {
				return source, fmt.Errorf("script: %s:%#x 字符串哈希 %#x 未命中", name, token.Offset, token.Value)
			}
			for _, candidate := range candidates[1:] {
				if !bytes.Equal(candidates[0], candidate) {
					return source, fmt.Errorf("script: %s:%#x 字符串哈希 %#x 存在冲突", name, token.Offset, token.Value)
				}
			}
			value.Text = candidates[0]
		}
		source.Tokens = append(source.Tokens, value)
	}
	return source, nil
}

// Resolver 按当前来源解析包含文件；文件系统和目录边界由调用方负责。
type Resolver func(from, requested string) (Source, error)

// Directive 保留需要宿主处理的 #system 和 #import，预处理器不加载 DLL。
type Directive struct {
	Kind      uint16   `json:"kind"`
	Source    string   `json:"source"`
	Offset    int      `json:"offset"`
	Arguments []Lexeme `json:"arguments"`
}

// Preprocessed 是提供给语法解析器的有效标记及宿主初始化指令。
type Preprocessed struct {
	Tokens     []Lexeme    `json:"tokens"`
	Directives []Directive `json:"directives"`
	Includes   []string    `json:"includes"`
}

type macro struct {
	function bool
	params   []uint32
	body     []Lexeme
}

type condition struct {
	parent   bool
	active   bool
	seenElse bool
}

type preprocessor struct {
	resolve Resolver
	macros  map[uint32]macro
	saved   []map[uint32]macro
	result  Preprocessed
}

// Preprocess 展开已确认的宏和条件包含；未恢复的指令或失效输入返回定位错误。
// 指令布局依据 objsys:0x1000c470、0x1000ca80、0x1000d2cd–0x1000db6d。
func Preprocess(source Source, resolve Resolver) (*Preprocessed, error) {
	results, err := PreprocessSequence([]Source{source}, resolve)
	if err != nil {
		return nil, err
	}
	return results[0], nil
}

// PreprocessSequence 按启动顺序共享宏定义，每份脚本保留独立的执行指令和标记。
func PreprocessSequence(sources []Source, resolve Resolver) ([]*Preprocessed, error) {
	p := &preprocessor{resolve: resolve, macros: make(map[uint32]macro)}
	results := make([]*Preprocessed, 0, len(sources))
	for _, source := range sources {
		p.result = Preprocessed{}
		if err := p.process(source, 0); err != nil {
			return nil, err
		}
		result := p.result
		results = append(results, &result)
	}
	return results, nil
}

func (p *preprocessor) process(source Source, depth int) error {
	if depth > maxIncludeDepth {
		return fmt.Errorf("script: %s 包含文件深度超过 %d", source.Name, maxIncludeDepth)
	}
	// 包含文件只临时覆盖来源相关宏，其余用户宏继续共享。
	previous := make(map[uint32]macro)
	present := make(map[uint32]bool)
	for name := range source.Constants {
		previous[name], present[name] = p.macros[name]
	}
	for _, name := range source.Undefines {
		previous[name], present[name] = p.macros[name]
	}
	defer func() {
		for name, value := range previous {
			if present[name] {
				p.macros[name] = value
			} else {
				delete(p.macros, name)
			}
		}
	}()
	for name, value := range source.Constants {
		p.macros[name] = macro{body: []Lexeme{value}}
	}
	for _, name := range source.Undefines {
		delete(p.macros, name)
	}
	var conditions []condition
	active := func() bool {
		return len(conditions) == 0 || conditions[len(conditions)-1].active
	}
	tokens := source.Tokens
	for index := 0; index < len(tokens); {
		token := tokens[index]
		if token.Kind < 1600 || token.Kind > 1650 {
			end := index + 1
			for end < len(tokens) && (tokens[end].Kind < 1600 || tokens[end].Kind > 1650) {
				end++
			}
			if active() {
				expanded, err := p.expand(tokens[index:end], nil, 0)
				if err != nil {
					return err
				}
				if len(p.result.Tokens)+len(expanded) > maxOutputTokens {
					return locationError(token, "展开后的标记数量超过限制")
				}
				p.result.Tokens = append(p.result.Tokens, expanded...)
			}
			index = end
			continue
		}
		end := index + 1
		for end < len(tokens) && tokens[end].Kind != lineEnd {
			end++
		}
		args := tokens[index+1 : end]
		index = end
		switch token.Kind {
		case 1601, 1602, 1606:
			parent := active()
			match := false
			if parent {
				if len(args) == 0 || args[0].Kind != 6 {
					return locationError(token, "条件指令需要宏名称")
				}
				_, match = p.macros[args[0].Value]
				if token.Kind == 1602 {
					match = !match
				}
				if token.Kind == 1606 {
					var err error
					match, err = p.compare(args)
					if err != nil {
						return err
					}
				} else if len(args) != 1 {
					return locationError(token, "条件宏名称后存在多余标记")
				}
			}
			conditions = append(conditions, condition{parent: parent, active: parent && match})
		case 1603:
			if len(conditions) == 0 {
				return locationError(token, "#else 没有对应条件")
			}
			top := &conditions[len(conditions)-1]
			if top.seenElse {
				return locationError(token, "同一条件重复 #else")
			}
			top.seenElse = true
			top.active = top.parent && !top.active
		case 1604:
			if len(conditions) == 0 {
				return locationError(token, "#endif 没有对应条件")
			}
			conditions = conditions[:len(conditions)-1]
		default:
			if !active() {
				continue
			}
			switch token.Kind {
			case 1600:
				if err := p.define(token, args); err != nil {
					return err
				}
			case 1605:
				if len(args) == 0 || args[0].Kind != 6 {
					return locationError(token, "#undef 需要一个宏名称")
				}
				delete(p.macros, args[0].Value)
			case 1630:
				snapshot := make(map[uint32]macro, len(p.macros))
				for name, value := range p.macros {
					snapshot[name] = value
				}
				p.saved = append(p.saved, snapshot)
			case 1640:
				if len(p.saved) == 0 {
					return locationError(token, "#pop 没有对应 #push")
				}
				p.macros = p.saved[len(p.saved)-1]
				p.saved = p.saved[:len(p.saved)-1]
			case 1610, 1620, 1650:
				expanded, err := p.expand(args, nil, 0)
				if err != nil {
					return err
				}
				if token.Kind != 1610 {
					p.result.Directives = append(p.result.Directives, Directive{
						Kind: token.Kind, Source: token.Source, Offset: token.Offset, Arguments: expanded,
					})
					continue
				}
				if len(expanded) == 0 || expanded[0].Kind != 3 {
					return locationError(token, "#include 需要字符串路径")
				}
				if p.resolve == nil {
					return locationError(token, "没有配置包含文件解析器")
				}
				included, err := p.resolve(source.Name, string(expanded[0].Text))
				if err != nil {
					return fmt.Errorf("script: %s:%#x 包含 %q: %w", token.Source, token.Offset, expanded[0].Text, err)
				}
				p.result.Includes = append(p.result.Includes, included.Name)
				if err := p.process(included, depth+1); err != nil {
					return err
				}
			default:
				return locationError(token, fmt.Sprintf("预处理指令 kind=%d 尚未恢复", token.Kind))
			}
		}
	}
	if len(conditions) != 0 {
		return fmt.Errorf("script: %s 条件指令缺少 #endif", source.Name)
	}
	return nil
}

func (p *preprocessor) define(token Lexeme, args []Lexeme) error {
	if len(args) == 0 || args[0].Kind != 6 {
		return locationError(token, "#define 需要宏名称")
	}
	name := args[0].Value
	value := macro{}
	start := 1
	if len(args) > 1 && args[1].Kind == 101 {
		value.function = true
		start = 2
		for {
			if start >= len(args) {
				return locationError(token, "宏参数缺少右括号")
			}
			if args[start].Kind == 980 {
				start++
				break
			}
			if args[start].Kind != 6 {
				return locationError(args[start], "宏参数必须是名称")
			}
			for _, param := range value.params {
				if param == args[start].Value {
					return locationError(args[start], "重复宏参数")
				}
			}
			value.params = append(value.params, args[start].Value)
			start++
			if start < len(args) && args[start].Kind == 213 {
				start++
				if start < len(args) && args[start].Kind == 980 {
					return locationError(args[start], "宏参数末尾多余逗号")
				}
			} else if start >= len(args) || args[start].Kind != 980 {
				return locationError(token, "宏参数缺少逗号或右括号")
			}
		}
	}
	value.body = append([]Lexeme(nil), args[start:]...)
	p.macros[name] = value
	return nil
}

func (p *preprocessor) expand(tokens []Lexeme, expanding map[uint32]bool, depth int) ([]Lexeme, error) {
	if depth > maxMacroDepth {
		return nil, fmt.Errorf("script: 宏展开深度超过 %d", maxMacroDepth)
	}
	var result []Lexeme
	for index := 0; index < len(tokens); index++ {
		token := tokens[index]
		value, exists := p.macros[token.Value]
		if token.Kind != 6 || !exists {
			result = append(result, token)
			continue
		}
		if expanding[token.Value] {
			return nil, locationError(token, "宏递归引用")
		}
		body := value.body
		if value.function {
			if index+1 >= len(tokens) || tokens[index+1].Kind != 101 {
				return nil, locationError(token, "函数宏调用缺少左括号")
			}
			arguments, end, err := macroArguments(tokens, index+1)
			if err != nil {
				return nil, err
			}
			if len(arguments) != len(value.params) {
				return nil, locationError(token, "函数宏实参数量不符")
			}
			substitutions := make(map[uint32][]Lexeme, len(arguments))
			for i, argument := range arguments {
				argument, err := p.expand(argument, expanding, depth+1)
				if err != nil {
					return nil, err
				}
				substitutions[value.params[i]] = argument
			}
			body = nil
			for _, item := range value.body {
				argument, ok := substitutions[item.Value]
				if item.Kind == 6 && ok {
					body = append(body, argument...)
				} else {
					body = append(body, item)
				}
			}
			index = end
		}
		next := make(map[uint32]bool, len(expanding)+1)
		for name, state := range expanding {
			next[name] = state
		}
		next[token.Value] = true
		expanded, err := p.expand(body, next, depth+1)
		if err != nil {
			return nil, err
		}
		if len(result)+len(expanded) > maxOutputTokens {
			return nil, locationError(token, "宏展开后的标记数量超过限制")
		}
		result = append(result, expanded...)
	}
	return result, nil
}

func macroArguments(tokens []Lexeme, opening int) ([][]Lexeme, int, error) {
	start := opening + 1
	var arguments [][]Lexeme
	var stack []uint16
	for index := start; index < len(tokens); index++ {
		kind := tokens[index].Kind
		if kind == 980 && len(stack) == 0 {
			if index != start || len(arguments) != 0 {
				arguments = append(arguments, tokens[start:index])
			}
			return arguments, index, nil
		}
		switch kind {
		case 101:
			stack = append(stack, 980)
		case 102:
			stack = append(stack, 970)
		case 1100:
			stack = append(stack, 1101)
		case 980, 970, 1101:
			if len(stack) == 0 || stack[len(stack)-1] != kind {
				return nil, 0, locationError(tokens[index], "宏实参括号不匹配")
			}
			stack = stack[:len(stack)-1]
		case 213:
			if len(stack) == 0 {
				arguments = append(arguments, tokens[start:index])
				start = index + 1
			}
		}
	}
	return nil, 0, locationError(tokens[opening], "宏调用缺少右括号")
}

func (p *preprocessor) compare(args []Lexeme) (bool, error) {
	if len(args) != 3 {
		return false, locationError(args[0], "#if 当前只接受 宏名 比较符 常量")
	}
	value, ok := p.macros[args[0].Value]
	if !ok {
		return false, nil
	}
	if value.function || len(value.body) != 1 || value.body[0].Kind != args[2].Kind {
		return false, locationError(args[0], "#if 需要同类型的单个整数或字符串常量")
	}
	comparison := 0
	switch value.body[0].Kind {
	case 2:
		left, right := int32(value.body[0].Value), int32(args[2].Value)
		if left < right {
			comparison = -1
		} else if left > right {
			comparison = 1
		}
	case 3:
		comparison = bytes.Compare(value.body[0].Text, args[2].Text)
	default:
		return false, locationError(args[0], "#if 常量类型尚未恢复")
	}
	switch args[1].Kind {
	case 500:
		return comparison == 0, nil
	case 501:
		return comparison != 0, nil
	case 600:
		return comparison >= 0, nil
	case 601:
		return comparison <= 0, nil
	case 602:
		return comparison > 0, nil
	case 603:
		return comparison < 0, nil
	default:
		return false, locationError(args[1], "#if 比较符尚未恢复")
	}
}

func locationError(token Lexeme, message string) error {
	return fmt.Errorf("script: %s:%#x: %s", token.Source, token.Offset, message)
}

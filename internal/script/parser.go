package script

import (
	"fmt"
)

// Node 保存语法结构和原始标记；名称仍使用原生哈希，不依赖反查名称。
type Node struct {
	Form      string   `json:"form"`
	Token     Lexeme   `json:"token"`
	Header    []Lexeme `json:"header,omitempty"`
	Modifiers []Lexeme `json:"modifiers,omitempty"`
	Children  []*Node  `json:"children,omitempty"`
}

// Program 是尚待运行器求值的语法树与宿主初始化指令。
type Program struct {
	Body       []*Node     `json:"body"`
	Directives []Directive `json:"directives"`
	Includes   []string    `json:"includes"`
}

type parser struct {
	tokens []Lexeme
	index  int
	depth  int
}

// Parse 将预处理后的标记按声明、语句和表达式建立结构，未知语法返回具体位置。
// 表达式优先级按原生词法类别及已观察的运算符表恢复，求值行为由运行器实现。
func Parse(input *Preprocessed) (*Program, error) {
	if input == nil {
		return nil, fmt.Errorf("script: 缺少预处理输入")
	}
	p := &parser{}
	for _, token := range input.Tokens {
		if token.Kind != lineEnd {
			p.tokens = append(p.tokens, token)
		}
	}
	program := &Program{Directives: input.Directives, Includes: input.Includes}
	for p.index < len(p.tokens) {
		node, err := p.statement()
		if err != nil {
			return nil, err
		}
		program.Body = append(program.Body, node)
	}
	return program, nil
}

func (p *parser) current() Lexeme {
	if p.index < len(p.tokens) {
		return p.tokens[p.index]
	}
	if len(p.tokens) != 0 {
		return Lexeme{Token: p.tokens[len(p.tokens)-1].Token, Source: p.tokens[len(p.tokens)-1].Source}
	}
	return Lexeme{}
}

func (p *parser) kind() uint16 {
	if p.index >= len(p.tokens) {
		return 0
	}
	return p.tokens[p.index].Kind
}

func (p *parser) take(kind uint16) (Lexeme, error) {
	if p.kind() != kind {
		return Lexeme{}, locationError(p.current(), fmt.Sprintf("需要 kind=%d，实际 kind=%d", kind, p.kind()))
	}
	token := p.current()
	p.index++
	return token, nil
}

func (p *parser) statement() (*Node, error) {
	p.depth++
	defer func() { p.depth-- }()
	if p.depth > 512 {
		return nil, locationError(p.current(), "语法嵌套超过限制")
	}
	token := p.current()
	node := &Node{Token: token}
	switch p.kind() {
	case 1230:
		p.index++
		node.Form = "empty"
	case 1100:
		return p.block()
	case 850, 1210, 1515, 1525, 1526, 1553:
		p.index++
		child, err := p.statement()
		if err != nil {
			return nil, err
		}
		child.Modifiers = append([]Lexeme{token}, child.Modifiers...)
		return child, nil
	case 1520, 1521:
		p.index++
		node.Form = "class"
		if token.Kind == 1521 {
			node.Form = "style"
			if p.kind() == 1220 {
				p.index++
				name, err := p.take(6)
				if err != nil {
					return nil, err
				}
				node.Form = "apply-style"
				node.Header = []Lexeme{name}
				_, err = p.take(1230)
				return node, err
			}
		}
		for p.kind() != 1100 && p.kind() != 0 && p.kind() != 1230 {
			node.Header = append(node.Header, p.current())
			p.index++
		}
		if len(node.Header) == 0 || node.Header[0].Kind != 6 {
			return nil, locationError(token, "类或样式缺少名称")
		}
		body, err := p.block()
		if err != nil {
			return nil, err
		}
		node.Children = []*Node{body}
		if p.kind() == 1230 {
			p.index++
		}
	case 603:
		p.index++
		node.Form = "object"
		for p.kind() != 602 && p.kind() != 0 && p.kind() != 1100 {
			node.Header = append(node.Header, p.current())
			p.index++
		}
		if _, err := p.take(602); err != nil {
			return nil, err
		}
		if len(node.Header) == 0 {
			return nil, locationError(token, "对象声明缺少目标")
		}
		if p.kind() == 1100 {
			body, err := p.block()
			if err != nil {
				return nil, err
			}
			node.Children = []*Node{body}
		} else if _, err := p.take(1230); err != nil {
			return nil, err
		}
	case 1530, 1531, 1532, 1533, 1534, 1535, 1536, 1537, 1538, 1539:
		return p.declaration()
	case 1500, 1504, 1510:
		p.index++
		node.Form = map[uint16]string{1500: "if", 1504: "while", 1510: "switch"}[token.Kind]
		condition, err := p.parenthesized()
		if err != nil {
			return nil, err
		}
		body, err := p.statement()
		if err != nil {
			return nil, err
		}
		node.Children = []*Node{condition, body}
		if token.Kind == 1500 && p.kind() == 1501 {
			p.index++
			other, err := p.statement()
			if err != nil {
				return nil, err
			}
			node.Children = append(node.Children, other)
		}
	case 1502:
		return p.forStatement()
	case 1511, 1513:
		p.index++
		node.Form = "default"
		if token.Kind == 1511 {
			node.Form = "case"
			value, err := p.expression(0)
			if err != nil {
				return nil, err
			}
			node.Children = []*Node{value}
		}
		if _, err := p.take(1220); err != nil {
			return nil, err
		}
	case 1503, 1512, 1514:
		p.index++
		node.Form = map[uint16]string{1503: "continue", 1512: "break", 1514: "return"}[token.Kind]
		if token.Kind == 1514 && p.kind() != 1230 {
			value, err := p.expression(0)
			if err != nil {
				return nil, err
			}
			node.Children = []*Node{value}
		}
		// 原生 break/continue 分支直接结束，只有可选的分号由后续扫描消耗。
		if token.Kind == 1514 {
			if _, err := p.take(1230); err != nil {
				return nil, err
			}
		} else if p.kind() == 1230 {
			p.index++
		}
	default:
		node.Form = "expression"
		value, err := p.expression(0)
		if err != nil {
			return nil, err
		}
		node.Children = []*Node{value}
		if err := p.terminate(); err != nil {
			return nil, err
		}
	}
	return node, nil
}

func (p *parser) terminate() error {
	if p.kind() == 1101 || p.kind() == 0 {
		return nil
	}
	_, err := p.take(1230)
	return err
}

func (p *parser) block() (*Node, error) {
	token, err := p.take(1100)
	if err != nil {
		return nil, err
	}
	node := &Node{Form: "block", Token: token}
	for p.kind() != 1101 && p.kind() != 0 {
		item, err := p.statement()
		if err != nil {
			return nil, err
		}
		node.Children = append(node.Children, item)
	}
	_, err = p.take(1101)
	return node, err
}

func (p *parser) declaration() (*Node, error) {
	token := p.current()
	p.index++
	node := &Node{Form: "declaration", Token: token}
	for {
		name, err := p.take(6)
		if err != nil {
			return nil, err
		}
		item := &Node{Form: "variable", Token: name}
		if p.kind() == 101 {
			node.Form = "function"
			node.Header = append(node.Header, name)
			p.index++
			for p.kind() != 980 && p.kind() != 0 {
				param := &Node{Form: "parameter", Token: p.current()}
				if p.kind() == 1540 {
					p.index++
				} else {
					if p.kind() < 1530 || p.kind() > 1539 {
						return nil, locationError(p.current(), "函数参数类型尚未恢复")
					}
					p.index++
					paramName, err := p.take(6)
					if err != nil {
						return nil, err
					}
					param.Header = []Lexeme{paramName}
					if p.kind() == 200 {
						p.index++
						value, err := p.expression(12)
						if err != nil {
							return nil, err
						}
						param.Children = []*Node{value}
					}
				}
				node.Children = append(node.Children, param)
				if p.kind() != 213 {
					break
				}
				p.index++
			}
			if _, err := p.take(980); err != nil {
				return nil, err
			}
			if p.kind() == 1230 {
				p.index++
				return node, nil
			}
			body, err := p.block()
			if err != nil {
				return nil, err
			}
			node.Children = append(node.Children, body)
			return node, nil
		}
		if p.kind() == 200 || p.kind() == 1212 {
			item.Header = []Lexeme{p.current()}
			p.index++
			value, err := p.expression(12)
			if err != nil {
				return nil, err
			}
			item.Children = []*Node{value}
		}
		node.Children = append(node.Children, item)
		if p.kind() != 213 {
			break
		}
		p.index++
	}
	_, err := p.take(1230)
	return node, err
}

func (p *parser) forStatement() (*Node, error) {
	node := &Node{Form: "for", Token: p.current()}
	p.index++
	if _, err := p.take(101); err != nil {
		return nil, err
	}
	if p.kind() >= 1530 && p.kind() <= 1539 {
		initial, err := p.declaration()
		if err != nil {
			return nil, err
		}
		node.Children = append(node.Children, initial)
	} else {
		initial := &Node{Form: "empty", Token: p.current()}
		if p.kind() != 1230 {
			var err error
			initial, err = p.expression(0)
			if err != nil {
				return nil, err
			}
		}
		node.Children = append(node.Children, initial)
		if _, err := p.take(1230); err != nil {
			return nil, err
		}
	}
	for _, closing := range []uint16{1230, 980} {
		value := &Node{Form: "empty", Token: p.current()}
		if p.kind() != closing {
			var err error
			value, err = p.expression(0)
			if err != nil {
				return nil, err
			}
		}
		node.Children = append(node.Children, value)
		if _, err := p.take(closing); err != nil {
			return nil, err
		}
	}
	body, err := p.statement()
	if err != nil {
		return nil, err
	}
	node.Children = append(node.Children, body)
	return node, nil
}

func (p *parser) parenthesized() (*Node, error) {
	if _, err := p.take(101); err != nil {
		return nil, err
	}
	value, err := p.expression(0)
	if err != nil {
		return nil, err
	}
	_, err = p.take(980)
	return value, err
}

func (p *parser) expression(minimum int) (*Node, error) {
	p.depth++
	defer func() { p.depth-- }()
	if p.depth > 512 {
		return nil, locationError(p.current(), "表达式嵌套超过限制")
	}
	token := p.current()
	var left *Node
	switch p.kind() {
	case 2, 3, 4, 5, 1523:
		left = &Node{Form: "literal", Token: token}
		p.index++
	case 6:
		left = &Node{Form: "name", Token: token}
		p.index++
	case 101:
		var err error
		left, err = p.parenthesized()
		if err != nil {
			return nil, err
		}
	case 1100:
		body, err := p.block()
		if err != nil {
			return nil, err
		}
		left = &Node{Form: "closure", Token: token, Children: []*Node{body}}
	case 801, 802, 930, 1241, 302, 303, 990, 991, 1551, 1553:
		p.index++
		value, err := p.expression(90)
		if err != nil {
			return nil, err
		}
		left = &Node{Form: "unary", Token: token, Children: []*Node{value}}
	default:
		return nil, locationError(token, fmt.Sprintf("尚未恢复的表达式起始标记 kind=%d", p.kind()))
	}
	for {
		token = p.current()
		kind := p.kind()
		if (kind == 940 || kind == 950) && 100 >= minimum {
			p.index++
			member, err := p.take(6)
			if err != nil {
				return nil, err
			}
			left = &Node{Form: "member", Token: token, Children: []*Node{
				left, {Form: "name", Token: member},
			}}
			continue
		}
		if kind == 101 || kind == 102 {
			if 100 < minimum {
				break
			}
			p.index++
			form, closing := "call", uint16(980)
			if kind == 102 {
				form, closing = "index", 970
			}
			call := &Node{Form: form, Token: token, Children: []*Node{left}}
			for p.kind() != closing && p.kind() != 0 {
				value, err := p.expression(12)
				if err != nil {
					return nil, err
				}
				call.Children = append(call.Children, value)
				if p.kind() != 213 {
					break
				}
				p.index++
			}
			if _, err := p.take(closing); err != nil {
				return nil, err
			}
			left = call
			continue
		}
		if (kind == 302 || kind == 303) && 100 >= minimum {
			p.index++
			left = &Node{Form: "postfix", Token: token, Children: []*Node{left}}
			continue
		}
		precedence, rightAssociative := operatorPrecedence(kind)
		if precedence == 0 || precedence < minimum {
			break
		}
		p.index++
		if kind == 1210 {
			yes, err := p.expression(0)
			if err != nil {
				return nil, err
			}
			if _, err := p.take(1220); err != nil {
				return nil, err
			}
			no, err := p.expression(precedence)
			if err != nil {
				return nil, err
			}
			left = &Node{Form: "conditional", Token: token, Children: []*Node{left, yes, no}}
			continue
		}
		next := precedence + 1
		if rightAssociative {
			next = precedence
		}
		right, err := p.expression(next)
		if err != nil {
			return nil, err
		}
		left = &Node{Form: "binary", Token: token, Children: []*Node{left, right}}
	}
	return left, nil
}

func operatorPrecedence(kind uint16) (int, bool) {
	switch kind {
	case 200, 201, 202, 203, 204, 205, 1212:
		return 10, true
	case 213:
		return 11, false
	case 1210:
		return 12, true
	case 300:
		return 20, false
	case 301:
		return 30, false
	case 400:
		return 40, false
	case 401:
		return 41, false
	case 402:
		return 42, false
	case 500, 501:
		return 50, false
	case 600, 601, 602, 603:
		return 60, false
	case 700, 701:
		return 70, false
	case 801, 802:
		return 80, false
	case 850, 851, 852:
		return 85, false
	case 940, 950, 1241:
		return 95, false
	default:
		return 0, false
	}
}

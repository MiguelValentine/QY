package script

import (
	"bytes"
	"fmt"

	"QY/internal/fc0a"
)

// Value 保存脚本值；字符串保留原始字节，避免中文编码转换改变比较结果。
type Value struct {
	Kind     string
	Integer  int32
	Text     []byte
	Items    []Value
	Object   *Object
	Function *Function
	Date     Date
}

// Object 的成员键沿用 FC0A 名称哈希。
type Object struct {
	Members map[uint32]*Value
	// Owner 对应沿所属对象查找类定义的父链；原生 pid 也读写此链。
	Owner *Object
	// Children 保留所属链对应的子对象，供场景和事件调度使用。
	Children []*Object
	// ClassName 保存实例最终请求的类名。
	ClassName uint32
	// Classes 属于当前宿主对象；类声明保存定义，实例化时再处理类体。
	Classes map[uint32]*Class
	// ReadMember 和 WriteMember 处理宿主属性；handled=false 时才查找脚本成员。
	ReadMember  func(key uint32) (value Value, handled bool, err error)
	WriteMember func(key uint32, value Value) (handled bool, err error)
	// BindMember 处理脚本绑定成员；绑定必须由宿主对象显式确认。
	BindMember func(key uint32, binding Binding) (value Value, handled bool, err error)
	// CallMember 对应原生对象的调用分派；handled=false 才允许继续查找。
	CallMember func(key uint32, arguments []Value) (value Value, handled bool, err error)
}

// Class 保留类名、基类、初始化体及声明环境，供对象构造器使用。
type Class struct {
	Name  uint32
	Base  uint32
	Style bool
	Body  *Node
	scope *scope
}

// Function 保留声明和定义时的作用域，以便调用脚本函数及闭包。
type Function struct {
	Declaration *Node
	scope       *scope
	receiver    *Object
	previous    *Function
}

// ObjectFactory 构造具有实际宿主能力的内置对象；未登记的类型不能自动创建。
type ObjectFactory func(owner *Object) (*Object, error)

// HostFunction 是 Go 宿主接口；未登记的原生功能会返回错误。
type HostFunction func(arguments []Value) (Value, error)

type scope struct {
	values map[uint32]*Value
	parent *scope
}

func (s *scope) find(key uint32) (*Value, bool) {
	for current := s; current != nil; current = current.parent {
		if value, ok := current.values[key]; ok {
			return value, true
		}
	}
	return nil, false
}

// Runtime 执行已恢复的通用表达式与控制流，宿主功能必须显式登记。
type Runtime struct {
	globals        *scope
	hosts          map[uint32]HostFunction
	steps          uint64
	depth          int
	factories      map[uint32]ObjectFactory
	constructDepth int
	// Objects 持有已构造的对象，供后续事件与场景调度使用。
	Objects []*Object
	// CurrentObject 接收没有显式对象且未绑定脚本变量的调用。
	CurrentObject *Object
	// HandleDirective 在执行语句前按预处理顺序初始化宿主状态；未配置时拒绝指令。
	HandleDirective func(Directive) error
	// MaxSteps 限制单次执行的语句与表达式数量，防止错误脚本无限循环。
	MaxSteps uint64
}

func NewRuntime() *Runtime {
	return &Runtime{
		globals:   &scope{values: make(map[uint32]*Value)},
		hosts:     make(map[uint32]HostFunction),
		factories: make(map[uint32]ObjectFactory),
		MaxSteps:  1000000,
	}
}

// RegisterObjectFactory 登记内置类型；用户类在执行声明时登记到所属对象。
func (r *Runtime) RegisterObjectFactory(key uint32, factory ObjectFactory) {
	r.factories[key] = factory
}

func (r *Runtime) Register(key uint32, function HostFunction) {
	r.hosts[key] = function
}

func (r *Runtime) SetGlobal(key uint32, value Value) {
	r.globals.values[key] = &value
}

func (r *Runtime) Global(key uint32) (Value, bool) {
	value, ok := r.globals.find(key)
	if !ok {
		return Value{}, false
	}
	return *value, true
}

// Execute 遇到未恢复的语法或宿主行为立即停止，不把它作为成功执行。
func (r *Runtime) Execute(program *Program) error {
	if program == nil {
		return fmt.Errorf("script: 缺少程序")
	}
	r.steps = 0
	for _, directive := range program.Directives {
		if r.HandleDirective == nil {
			return fmt.Errorf("script: %s:0x%x: 宿主尚未处理指令 kind=%d", directive.Source, directive.Offset, directive.Kind)
		}
		if err := r.HandleDirective(directive); err != nil {
			return fmt.Errorf("script: %s:0x%x: %w", directive.Source, directive.Offset, err)
		}
	}
	for _, node := range program.Body {
		result, err := r.statement(node, r.globals)
		if err != nil {
			return err
		}
		if result.signal != "" {
			return locationError(node.Token, "控制流出现在函数或循环之外")
		}
	}
	return nil
}

type flow struct {
	signal string
	value  Value
}

func (r *Runtime) step(node *Node) error {
	r.steps++
	if r.MaxSteps == 0 || r.steps > r.MaxSteps {
		return locationError(node.Token, "执行步数超过限制")
	}
	return nil
}

func (r *Runtime) statement(node *Node, environment *scope) (flow, error) {
	if err := r.step(node); err != nil {
		return flow{}, err
	}
	if len(node.Modifiers) != 0 {
		return flow{}, locationError(node.Modifiers[0], "语句修饰符的运行语义尚未恢复")
	}
	switch node.Form {
	case "empty":
		return flow{}, nil
	case "block":
		for _, child := range node.Children {
			result, err := r.statement(child, environment)
			if err != nil || result.signal != "" {
				return result, err
			}
		}
		return flow{}, nil
	case "expression":
		if len(node.Children) == 1 && node.Children[0].Form == "binary" &&
			node.Children[0].Token.Kind == 1212 {
			return flow{}, r.executeBinding(node.Children[0], environment)
		}
		_, err := r.evaluate(node.Children[0], environment)
		return flow{}, err
	case "function":
		function := Value{Kind: "function", Function: &Function{Declaration: node, scope: environment, receiver: r.CurrentObject}}
		if previous := environment.values[node.Header[0].Value]; previous != nil && previous.Kind == "function" {
			function.Function.previous = previous.Function
		}
		environment.values[node.Header[0].Value] = &function
		return flow{}, nil
	case "object":
		if len(node.Header) != 1 || node.Header[0].Kind != 6 || len(node.Children) > 1 ||
			(len(node.Children) == 1 && node.Children[0].Form != "block") {
			return flow{}, locationError(node.Token, "对象头的附加参数尚未恢复")
		}
		object, err := r.construct(node.Header[0].Value, r.CurrentObject, node.Token)
		if err != nil {
			return flow{}, err
		}
		if len(node.Children) != 0 {
			err = r.initializeObject(object, node.Children[0], environment)
		}
		return flow{}, err
	case "class", "style":
		isStyle := node.Form == "style"
		validHeader := len(node.Header) == 1 && node.Header[0].Kind == 6
		if !isStyle {
			validHeader = len(node.Header) == 3 && node.Header[0].Kind == 6 &&
				node.Header[1].Kind == 1220 && node.Header[2].Kind == 6
		}
		if !validHeader ||
			len(node.Children) != 1 || node.Children[0].Form != "block" {
			return flow{}, locationError(node.Token, "类或样式定义头及初始化体无效")
		}
		if r.CurrentObject == nil {
			return flow{}, locationError(node.Token, "类登记缺少当前对象")
		}
		if r.CurrentObject.Classes == nil {
			r.CurrentObject.Classes = make(map[uint32]*Class)
		}
		name := node.Header[0].Value
		definition := &Class{
			Name: name, Style: isStyle,
			Body: node.Children[0], scope: environment,
		}
		if !isStyle {
			definition.Base = node.Header[2].Value
		}
		r.CurrentObject.Classes[name] = definition
		return flow{}, nil
	case "apply-style":
		return flow{}, r.applyStyle(node)
	case "declaration":
		for _, child := range node.Children {
			value := Value{Kind: "null"}
			switch node.Token.Kind {
			case 1530:
				value = integer(0)
			case 1531:
				value = Value{Kind: "string"}
			case 1533:
			case 1535:
				if len(child.Children) == 0 {
					return flow{}, locationError(child.Token, "未初始化日期的默认值尚未恢复")
				}
			default:
				return flow{}, locationError(node.Token, "变量类型的运行语义尚未恢复")
			}
			if len(child.Children) != 0 {
				if len(child.Header) != 0 && child.Header[0].Kind != 200 {
					return flow{}, locationError(child.Header[0], "引用赋值尚未恢复")
				}
				var err error
				value, err = r.evaluate(child.Children[0], environment)
				if err != nil {
					return flow{}, err
				}
				if node.Token.Kind == 1535 && value.Kind != "date" {
					return flow{}, locationError(child.Token, "日期声明的非日期转换尚未恢复")
				}
			}
			environment.values[child.Token.Value] = &value
		}
		return flow{}, nil
	case "return":
		result := flow{signal: "return", value: Value{Kind: "null"}}
		if len(node.Children) != 0 {
			var err error
			result.value, err = r.evaluate(node.Children[0], environment)
			return result, err
		}
		return result, nil
	case "break", "continue":
		return flow{signal: node.Form}, nil
	case "if":
		value, err := r.evaluate(node.Children[0], environment)
		if err != nil {
			return flow{}, err
		}
		if truth(value) {
			return r.statement(node.Children[1], environment)
		}
		if len(node.Children) == 3 {
			return r.statement(node.Children[2], environment)
		}
		return flow{}, nil
	case "switch":
		value, err := r.evaluate(node.Children[0], environment)
		if err != nil {
			return flow{}, err
		}
		body := node.Children[1]
		if body.Form != "block" {
			return flow{}, locationError(body.Token, "switch 需要块结构")
		}
		start, fallback := -1, -1
		for index, child := range body.Children {
			switch child.Form {
			case "case":
				candidate, err := r.evaluate(child.Children[0], environment)
				if err != nil {
					return flow{}, err
				}
				equal, err := binary(500, value, candidate)
				if err != nil {
					return flow{}, locationError(child.Token, err.Error())
				}
				if truth(equal) && start == -1 {
					start = index + 1
				}
			case "default":
				if fallback != -1 {
					return flow{}, locationError(child.Token, "switch 包含多个 default")
				}
				fallback = index + 1
			}
		}
		if start == -1 {
			start = fallback
		}
		if start == -1 {
			return flow{}, nil
		}
		for _, child := range body.Children[start:] {
			if child.Form == "case" || child.Form == "default" {
				continue
			}
			result, err := r.statement(child, environment)
			if result.signal == "break" {
				return flow{}, err
			}
			if err != nil || result.signal != "" {
				return result, err
			}
		}
		return flow{}, nil
	case "while", "for":
		condition, body := node.Children[0], node.Children[1]
		if node.Form == "for" {
			initial := node.Children[0]
			var err error
			if initial.Form == "declaration" {
				_, err = r.statement(initial, environment)
			} else if initial.Form != "empty" {
				_, err = r.evaluate(initial, environment)
			}
			if err != nil {
				return flow{}, err
			}
			condition, body = node.Children[1], node.Children[3]
		}
		for {
			if condition.Form != "empty" {
				value, err := r.evaluate(condition, environment)
				if err != nil || !truth(value) {
					return flow{}, err
				}
			}
			result, err := r.statement(body, environment)
			if err != nil || result.signal == "return" {
				return result, err
			}
			if result.signal == "break" {
				return flow{}, nil
			}
			if node.Form == "for" && node.Children[2].Form != "empty" {
				if _, err := r.evaluate(node.Children[2], environment); err != nil {
					return flow{}, err
				}
			}
		}
	default:
		return flow{}, locationError(node.Token, "尚未恢复的执行结构 "+node.Form)
	}
}

func integer(value int32) Value { return Value{Kind: "int", Integer: value} }

func truth(value Value) bool {
	switch value.Kind {
	case "int":
		return value.Integer != 0
	case "string":
		return len(value.Text) != 0
	case "object":
		return value.Object != nil
	case "function":
		return value.Function != nil
	}
	return false
}

type reference struct {
	read  func() (Value, error)
	write func(Value) error
}

func (r *Runtime) reference(node *Node, environment *scope) (reference, error) {
	return r.referenceWithImplicit(node, environment, false)
}

func (r *Runtime) referenceWithImplicit(node *Node, environment *scope, implicit bool) (reference, error) {
	switch node.Form {
	case "name":
		if value, ok := environment.find(node.Token.Value); ok {
			return reference{
				read: func() (Value, error) { return *value, nil },
				write: func(next Value) error {
					*value = next
					return nil
				},
			}, nil
		}
		if receiver := r.CurrentObject; receiver != nil {
			key := node.Token.Value
			if implicit {
				value := &Value{Kind: "int"}
				return reference{
					read: func() (Value, error) {
						if receiver.ReadMember != nil {
							if got, handled, err := receiver.ReadMember(key); err != nil {
								return Value{}, err
							} else if handled {
								return got, nil
							}
						}
						if member, ok := receiver.Members[key]; ok {
							return *member, nil
						}
						return *value, nil
					},
					write: func(next Value) error {
						if receiver.WriteMember != nil {
							if handled, err := receiver.WriteMember(key, next); err != nil {
								return err
							} else if handled {
								return nil
							}
						}
						receiver.Members[key] = value
						*value = next
						return nil
					},
				}, nil
			}
			return reference{
				read: func() (Value, error) {
					if receiver.ReadMember != nil {
						value, handled, err := receiver.ReadMember(key)
						if err != nil {
							return Value{}, fmt.Errorf("script: %s:%#x: %w", node.Token.Source, node.Token.Offset, err)
						}
						if handled {
							return value, nil
						}
					}
					return Value{}, locationError(node.Token, fmt.Sprintf("未定义名称 0x%08x", key))
				},
				write: func(next Value) error {
					if receiver.WriteMember != nil {
						handled, err := receiver.WriteMember(key, next)
						if err != nil {
							return fmt.Errorf("script: %s:%#x: %w", node.Token.Source, node.Token.Offset, err)
						}
						if handled {
							return nil
						}
					}
					return locationError(node.Token, fmt.Sprintf("未定义名称 0x%08x", key))
				},
			}, nil
		}
		return reference{}, locationError(node.Token, fmt.Sprintf("未定义名称 0x%08x", node.Token.Value))
	case "member":
		object, err := r.evaluate(node.Children[0], environment)
		if err != nil {
			return reference{}, err
		}
		if object.Kind != "object" || object.Object == nil {
			return reference{}, locationError(node.Token, "成员访问目标不是对象")
		}
		key := node.Children[1].Token.Value
		receiver := object.Object
		return reference{
			read: func() (Value, error) {
				if receiver.ReadMember != nil {
					value, handled, err := receiver.ReadMember(key)
					if err != nil {
						return Value{}, fmt.Errorf("script: %s:%#x: %w", node.Token.Source, node.Token.Offset, err)
					}
					if handled {
						return value, nil
					}
				}
				if value, ok := receiver.Members[key]; ok {
					return *value, nil
				}
				return Value{}, locationError(node.Token, fmt.Sprintf("未定义成员 0x%08x", key))
			},
			write: func(next Value) error {
				if receiver.WriteMember != nil {
					handled, err := receiver.WriteMember(key, next)
					if err != nil {
						return fmt.Errorf("script: %s:%#x: %w", node.Token.Source, node.Token.Offset, err)
					}
					if handled {
						return nil
					}
				}
				if value, ok := receiver.Members[key]; ok {
					*value = next
					return nil
				}
				return locationError(node.Token, fmt.Sprintf("未定义成员 0x%08x", key))
			},
		}, nil
	default:
		return reference{}, locationError(node.Token, "表达式不是可写变量")
	}
}

func (r *Runtime) evaluate(node *Node, environment *scope) (Value, error) {
	if err := r.step(node); err != nil {
		return Value{}, err
	}
	switch node.Form {
	case "literal":
		switch node.Token.Kind {
		case 2:
			return integer(int32(node.Token.Value)), nil
		case 3:
			return Value{Kind: "string", Text: bytes.Clone(node.Token.Text)}, nil
		case 1523:
			return Value{Kind: "null"}, nil
		}
	case "name", "member":
		target, err := r.reference(node, environment)
		if err != nil {
			return Value{}, err
		}
		return target.read()
	case "closure":
		return Value{Kind: "function", Function: &Function{Declaration: node, scope: environment, receiver: r.CurrentObject}}, nil
	case "call":
		return r.call(node, environment)
	case "conditional":
		condition, err := r.evaluate(node.Children[0], environment)
		if err != nil {
			return Value{}, err
		}
		branch := 2
		if truth(condition) {
			branch = 1
		}
		return r.evaluate(node.Children[branch], environment)
	case "unary", "postfix":
		if node.Token.Kind == 302 || node.Token.Kind == 303 {
			target, err := r.referenceWithImplicit(node.Children[0], environment, true)
			if err != nil {
				return Value{}, err
			}
			previous, err := target.read()
			if err != nil {
				return Value{}, err
			}
			if previous.Kind != "int" {
				return Value{}, locationError(node.Token, "自增或自减需要整数")
			}
			next := previous
			if node.Token.Kind == 302 {
				next.Integer++
			} else {
				next.Integer--
			}
			if err := target.write(next); err != nil {
				return Value{}, err
			}
			if node.Form == "postfix" {
				return previous, nil
			}
			return next, nil
		}
		if node.Token.Kind == 990 || node.Token.Kind == 991 {
			return r.evaluateNew(node, environment)
		}
		// 删除及其余对象运算需要单独恢复生命周期。
		if node.Token.Kind == 1551 || node.Token.Kind == 1553 {
			break
		}
		value, err := r.evaluate(node.Children[0], environment)
		if err != nil {
			return Value{}, err
		}
		if node.Token.Kind == 930 {
			if truth(value) {
				return integer(0), nil
			}
			return integer(1), nil
		}
		if value.Kind != "int" {
			return Value{}, locationError(node.Token, "一元运算需要整数")
		}
		switch node.Token.Kind {
		case 801:
			return value, nil
		case 802:
			return integer(-value.Integer), nil
		case 1241:
			return integer(^value.Integer), nil
		}
	case "binary":
		kind := node.Token.Kind
		if kind == 1212 {
			return Value{}, locationError(node.Token, "绑定赋值的表达式结果语义尚未恢复")
		}
		if kind == 200 || (kind >= 201 && kind <= 205) {
			target, err := r.referenceWithImplicit(node.Children[0], environment, true)
			if err != nil {
				return Value{}, err
			}
			value, err := r.evaluate(node.Children[1], environment)
			if err != nil {
				return Value{}, err
			}
			if kind != 200 {
				previous, err := target.read()
				if err != nil {
					return Value{}, err
				}
				operation := map[uint16]uint16{201: 801, 202: 802, 203: 851, 204: 852, 205: 850}[kind]
				value, err = binary(operation, previous, value)
				if err != nil {
					return Value{}, locationError(node.Token, err.Error())
				}
			}
			if err := target.write(value); err != nil {
				return Value{}, err
			}
			return value, nil
		}
		left, err := r.evaluate(node.Children[0], environment)
		if err != nil {
			return Value{}, err
		}
		if kind == 300 && truth(left) {
			return integer(1), nil
		}
		if kind == 301 && !truth(left) {
			return integer(0), nil
		}
		right, err := r.evaluate(node.Children[1], environment)
		if err != nil {
			return Value{}, err
		}
		if kind == 213 {
			items := []Value{left}
			if left.Kind == "tuple" {
				items = append([]Value(nil), left.Items...)
			}
			return Value{Kind: "tuple", Items: append(items, right)}, nil
		}
		value, err := binary(kind, left, right)
		if err != nil {
			return Value{}, fmt.Errorf("script: %s:0x%x: %w", node.Token.Source, node.Token.Offset, err)
		}
		return value, nil
	}
	return Value{}, locationError(node.Token, fmt.Sprintf("尚未恢复的表达式 %s kind=%d", node.Form, node.Token.Kind))
}

func (r *Runtime) call(node *Node, environment *scope) (Value, error) {
	target := node.Children[0]
	var host HostFunction
	var callable Value
	var receiver *Object
	var memberKey uint32
	// 脚本定义覆盖同名宿主函数；未知函数必须报告原哈希。
	if target.Form == "name" {
		if value, ok := environment.find(target.Token.Value); ok {
			callable = *value
		} else {
			receiver, memberKey = r.CurrentObject, target.Token.Value
			host = r.hosts[target.Token.Value]
			if host == nil && (receiver == nil || receiver.CallMember == nil) && memberKey != createObjKey && memberKey != callSubKey {
				return Value{}, locationError(target.Token, fmt.Sprintf("尚未实现的宿主调用 0x%08x", target.Token.Value))
			}
		}
	} else if target.Form == "member" {
		object, err := r.evaluate(target.Children[0], environment)
		if err != nil {
			return Value{}, err
		}
		if object.Kind != "object" || object.Object == nil {
			return Value{}, locationError(target.Token, "成员访问目标不是对象")
		}
		receiver, memberKey = object.Object, target.Children[1].Token.Value
		if value, ok := receiver.Members[memberKey]; ok {
			callable = *value
		} else if receiver.CallMember == nil && memberKey != createObjKey && memberKey != callSubKey {
			return Value{}, locationError(target.Token, fmt.Sprintf("未定义成员 0x%08x", memberKey))
		}
	} else {
		var err error
		callable, err = r.evaluate(target, environment)
		if err != nil {
			return Value{}, err
		}
	}
	var arguments []Value
	for _, argument := range node.Children[1:] {
		value, err := r.evaluate(argument, environment)
		if err != nil {
			return Value{}, err
		}
		arguments = append(arguments, value)
	}
	if receiver != nil && receiver.CallMember != nil {
		value, handled, err := receiver.CallMember(memberKey, arguments)
		if err != nil {
			return Value{}, fmt.Errorf("script: %s:0x%x: %w", target.Token.Source, target.Token.Offset, err)
		}
		if handled {
			return value, nil
		}
	}
	if memberKey == createObjKey {
		return r.createObject(receiver, arguments, target.Token)
	}
	if memberKey == callSubKey && callable.Kind == "" {
		return r.callSub(receiver, arguments, target.Token)
	}
	if host != nil {
		value, err := host(arguments)
		if err != nil {
			return Value{}, locationError(target.Token, err.Error())
		}
		return value, nil
	}
	if target.Form == "name" && callable.Kind == "" {
		return Value{}, locationError(target.Token, fmt.Sprintf("尚未实现的宿主调用 0x%08x", target.Token.Value))
	}
	if target.Form == "member" && callable.Kind == "" {
		return Value{}, locationError(target.Token, fmt.Sprintf("未定义成员 0x%08x", memberKey))
	}
	if callable.Kind != "function" || callable.Function == nil {
		return Value{}, locationError(target.Token, "调用目标不是函数")
	}
	return r.executeFunction(callable.Function, arguments, target.Token)
}

// DispatchEvent 执行对象成员中的脚本函数；未定义成员时不消费该事件。
func (r *Runtime) DispatchEvent(object *Object, key uint32, arguments []Value) (Value, bool, error) {
	r.steps = 0
	return r.dispatchEvent(object, key, arguments, Lexeme{
		Token: fc0a.Token{Value: key}, Source: "event",
	})
}

func (r *Runtime) dispatchEvent(object *Object, key uint32, arguments []Value, token Lexeme) (Value, bool, error) {
	if object == nil {
		return Value{}, false, nil
	}
	member, ok := object.Members[key]
	if !ok {
		return Value{}, false, nil
	}
	if member == nil || member.Kind != "function" || member.Function == nil {
		return Value{}, true, locationError(token, "事件成员不是函数")
	}
	function, err := eventFunction(member.Function, arguments)
	if err != nil {
		return Value{}, true, err
	}
	if function == nil {
		return Value{}, false, nil
	}
	value, err := r.executeFunction(function, arguments, token)
	return value, true, err
}

func (r *Runtime) executeFunction(function *Function, arguments []Value, token Lexeme) (Value, error) {
	if r.depth >= 128 {
		return Value{}, locationError(token, "函数调用深度超过限制")
	}
	r.depth++
	defer func() { r.depth-- }()
	previousReceiver := r.CurrentObject
	r.CurrentObject = function.receiver
	defer func() { r.CurrentObject = previousReceiver }()
	local := &scope{values: make(map[uint32]*Value), parent: function.scope}
	declaration := function.Declaration
	argumentIndex := 0
	for _, child := range declaration.Children {
		if child.Form != "parameter" {
			continue
		}
		if len(child.Header) != 1 {
			return Value{}, locationError(child.Token, "可变参数运行语义尚未恢复")
		}
		var value Value
		if argumentIndex < len(arguments) {
			value = arguments[argumentIndex]
			argumentIndex++
		} else if len(child.Children) != 0 {
			var err error
			value, err = r.evaluate(child.Children[0], local)
			if err != nil {
				return Value{}, err
			}
		} else {
			return Value{}, locationError(token, "函数缺少参数")
		}
		local.values[child.Header[0].Value] = &value
	}
	if argumentIndex != len(arguments) {
		return Value{}, locationError(token, "函数参数数量不匹配")
	}
	if len(declaration.Children) == 0 || declaration.Children[len(declaration.Children)-1].Form != "block" {
		return Value{}, locationError(token, "函数只有声明，没有函数体")
	}
	result, err := r.statement(declaration.Children[len(declaration.Children)-1], local)
	if err != nil {
		return Value{}, err
	}
	if result.signal == "break" || result.signal == "continue" {
		return Value{}, locationError(token, "函数外溢出循环控制")
	}
	if result.signal == "return" {
		return result.value, nil
	}
	return Value{Kind: "null"}, nil
}

func binary(kind uint16, left, right Value) (Value, error) {
	boolean := func(value bool) Value {
		if value {
			return integer(1)
		}
		return integer(0)
	}
	if kind == 300 {
		return boolean(truth(left) || truth(right)), nil
	}
	if kind == 301 {
		return boolean(truth(left) && truth(right)), nil
	}
	if left.Kind == "string" && right.Kind == "string" {
		if kind == 801 {
			text := append(bytes.Clone(left.Text), right.Text...)
			return Value{Kind: "string", Text: text}, nil
		}
		if kind == 500 {
			return boolean(bytes.Equal(left.Text, right.Text)), nil
		}
		if kind == 501 {
			return boolean(!bytes.Equal(left.Text, right.Text)), nil
		}
	}
	if left.Kind != "int" || right.Kind != "int" {
		// objsys:0x10015770 的 > 分支不把参数 tuple 转为数值或布尔值。
		if kind == 602 && left.Kind == "tuple" && right.Kind == "int" {
			return Value{}, &NativeError{Code: 8, Message: "> 不接受 tuple 与 int"}
		}
		return Value{}, fmt.Errorf("尚未恢复的运算类型 %s 与 %s", left.Kind, right.Kind)
	}
	a, b := left.Integer, right.Integer
	switch kind {
	case 801:
		return integer(a + b), nil
	case 802:
		return integer(a - b), nil
	case 851:
		return integer(a * b), nil
	case 850, 852:
		if b == 0 {
			return Value{}, fmt.Errorf("除数为零")
		}
		// Go 已为最小整数除以 -1 定义回绕结果。
		if kind == 852 {
			return integer(a / b), nil
		}
		return integer(a % b), nil
	case 400:
		return integer(a | b), nil
	case 401:
		return integer(a ^ b), nil
	case 402:
		return integer(a & b), nil
	case 700, 701:
		if b < 0 || b >= 32 {
			return Value{}, fmt.Errorf("移位位数超出已恢复范围")
		}
		if kind == 700 {
			return integer(a << uint32(b)), nil
		}
		return integer(a >> uint32(b)), nil
	case 500:
		return boolean(a == b), nil
	case 501:
		return boolean(a != b), nil
	case 600:
		return boolean(a >= b), nil
	case 601:
		return boolean(a <= b), nil
	case 602:
		return boolean(a > b), nil
	case 603:
		return boolean(a < b), nil
	}
	return Value{}, fmt.Errorf("尚未恢复的二元运算 kind=%d", kind)
}

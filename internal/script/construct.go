package script

import (
	"fmt"

	"QY/internal/symbol"
)

const createObjKey uint32 = 0x0e9c89f6

// evaluateNew 先在调用者环境求实参，再创建实例并调用带括号形式的同名方法。
func (r *Runtime) evaluateNew(node *Node, environment *scope) (Value, error) {
	target := node.Children[0]
	invoke := target.Form == "call"
	var argumentNodes []*Node
	if invoke {
		argumentNodes = target.Children[1:]
		target = target.Children[0]
	}
	if target.Form != "name" {
		return Value{}, locationError(node.Token, "动态类名的对象构造尚未恢复")
	}
	arguments := make([]Value, 0, len(argumentNodes))
	for _, argument := range argumentNodes {
		value, err := r.evaluate(argument, environment)
		if err != nil {
			return Value{}, err
		}
		arguments = append(arguments, value)
	}
	return r.createInstance(target.Token.Value, r.CurrentObject, arguments, invoke, node.Token)
}

// createObject 对应 CreateObj 回调；单字符串不调用同名方法，显式空值亦跳过。
func (r *Runtime) createObject(owner *Object, arguments []Value, token Lexeme) (Value, error) {
	if owner == nil {
		return Value{}, locationError(token, "CreateObj 需要所属对象")
	}
	if len(arguments) == 1 && arguments[0].Kind == "tuple" {
		arguments = arguments[0].Items
		if len(arguments) < 2 {
			return Value{}, locationError(token, "CreateObj 的参数组合至少需要两项")
		}
	}
	if len(arguments) == 0 || arguments[0].Kind != "string" {
		return Value{}, locationError(token, "CreateObj 需要字符串类名及可选构造参数")
	}
	invoke := len(arguments) > 1
	if len(arguments) == 2 && (arguments[1].Kind == "null" || arguments[1].Kind == "") {
		invoke = false
	}
	key := symbol.StringTableHash(string(arguments[0].Text))
	return r.createInstance(key, owner, arguments[1:], invoke, token)
}

// createInstance 共用工厂、类体、可选同名方法及创建事件的顺序。
func (r *Runtime) createInstance(key uint32, owner *Object, arguments []Value, invoke bool, token Lexeme) (Value, error) {
	object, err := r.construct(key, owner, token)
	if err != nil {
		return Value{}, err
	}
	if invoke {
		handled := false
		if object.CallMember != nil {
			_, handled, err = object.CallMember(key, arguments)
			if err != nil {
				return Value{}, fmt.Errorf("script: %s:0x%x: %w", token.Source, token.Offset, err)
			}
		}
		if !handled {
			if member := object.Members[key]; member != nil {
				if member.Kind != "function" || member.Function == nil {
					return Value{}, locationError(token, "同名构造成员不是函数")
				}
				if _, err := r.executeFunction(member.Function, arguments, token); err != nil {
					return Value{}, err
				}
			}
		}
	}
	// 原生创建事件不传实参，仅执行名称和空参数签名都匹配的声明。
	if _, _, err := r.dispatchEvent(object, 0x376d2b34, nil, token); err != nil {
		return Value{}, err
	}
	return Value{Kind: "object", Object: object}, nil
}

// construct 沿原生工厂、所属对象类表、基类和初始化体的顺序构造实例。
func (r *Runtime) construct(key uint32, owner *Object, token Lexeme) (*Object, error) {
	if r.constructDepth >= 128 {
		return nil, locationError(token, "类继承或对象构造深度超过限制")
	}
	r.constructDepth++
	defer func() { r.constructDepth-- }()
	var object *Object
	if factory := r.factories[key]; factory != nil {
		var err error
		object, err = factory(owner)
		if err != nil {
			return nil, fmt.Errorf("script: %s:0x%x: %w", token.Source, token.Offset, err)
		}
		if object == nil {
			return nil, locationError(token, "内置对象工厂返回空对象")
		}
		if err := object.Reparent(owner); err != nil {
			return nil, fmt.Errorf("script: %s:0x%x: %w", token.Source, token.Offset, err)
		}
		if object.Members == nil {
			object.Members = make(map[uint32]*Value)
		}
		r.Objects = append(r.Objects, object)
	} else {
		var definition *Class
		visited := make(map[*Object]bool)
		for current := owner; current != nil; current = current.Owner {
			if visited[current] {
				return nil, locationError(token, "所属对象链包含循环")
			}
			visited[current] = true
			if definition = current.Classes[key]; definition != nil {
				break
			}
		}
		if definition == nil {
			return nil, locationError(token, fmt.Sprintf("尚未实现或登记的对象类 0x%08x", key))
		}
		if definition.Style {
			return nil, locationError(token, "样式的对象构造语义尚未恢复")
		}
		var err error
		object, err = r.construct(definition.Base, owner, token)
		if err != nil {
			return nil, err
		}
		object.ClassName = key
		if err := r.initializeObject(object, definition.Body, definition.scope); err != nil {
			return nil, err
		}
	}
	object.ClassName = key
	return object, nil
}

func (r *Runtime) applyStyle(node *Node) error {
	if len(node.Header) != 1 || node.Header[0].Kind != 6 || r.CurrentObject == nil {
		return locationError(node.Token, "样式应用需要当前对象和样式名称")
	}
	if r.depth >= 128 {
		return locationError(node.Token, "样式或函数调用深度超过限制")
	}
	key := node.Header[0].Value
	visited := make(map[*Object]bool)
	for current := r.CurrentObject; current != nil; current = current.Owner {
		if visited[current] {
			return locationError(node.Token, "样式查找的所属对象链包含循环")
		}
		visited[current] = true
		if definition := current.Classes[key]; definition != nil {
			if !definition.Style {
				return locationError(node.Token, "将类作为样式应用的语义尚未恢复")
			}
			r.depth++
			defer func() { r.depth-- }()
			return r.initializeObject(r.CurrentObject, definition.Body, definition.scope)
		}
	}
	return locationError(node.Token, fmt.Sprintf("未登记样式 0x%08x", key))
}

func (r *Runtime) initializeObject(object *Object, body *Node, parent *scope) error {
	previous := r.CurrentObject
	r.CurrentObject = object
	defer func() { r.CurrentObject = previous }()
	environment := &scope{values: object.Members, parent: parent}
	result, err := r.statement(body, environment)
	if err != nil {
		return err
	}
	if result.signal != "" {
		return locationError(body.Token, "对象初始化体包含外溢控制流")
	}
	return nil
}

package script

import (
	"fmt"
)

// Binding 保存绑定调用的名称与已求值实参，Clear 表示原生操作码5的空绑定。
type Binding struct {
	Name uint32
	// Instance 对应 ~ 后的静态名称哈希或整数；省略时为零。
	Instance  uint32
	Arguments []Value
	Clear     bool
}

func (r *Runtime) executeBinding(node *Node, environment *scope) error {
	left := node.Children[0]
	var instance uint32
	if left.Form == "binary" && left.Token.Kind == 1241 && len(left.Children) == 2 {
		name := left.Children[1]
		if name.Form != "name" && !(name.Form == "literal" && name.Token.Kind == 2) {
			return locationError(name.Token, "命名绑定需要静态名称或整数字面值")
		}
		instance = name.Token.Value
		left = left.Children[0]
	}
	var receiver *Object
	var key uint32
	switch left.Form {
	case "name":
		key = left.Token.Value
		if _, exists := environment.find(key); exists {
			return locationError(left.Token, "绑定赋值左侧不能是词法变量")
		}
		receiver = r.CurrentObject
		if receiver == nil {
			return locationError(left.Token, "绑定赋值没有当前宿主对象")
		}
	case "member":
		object, err := r.evaluate(left.Children[0], environment)
		if err != nil {
			return err
		}
		if object.Kind != "object" || object.Object == nil {
			return locationError(left.Token, "绑定赋值目标不是对象")
		}
		receiver = object.Object
		key = left.Children[1].Token.Value
	default:
		return locationError(left.Token, "绑定赋值左侧只支持名称或对象成员")
	}

	right := node.Children[1]
	clear := right.Form == "literal" && right.Token.Kind == 1523
	if !clear && (right.Form != "call" || len(right.Children) == 0 || right.Children[0].Form != "name") {
		return locationError(right.Token, "绑定赋值右侧只支持名称调用或 null")
	}
	if receiver.BindMember == nil {
		return locationError(left.Token, fmt.Sprintf("宿主对象未实现绑定成员 0x%08x", key))
	}
	binding := Binding{Clear: clear, Instance: instance}
	if !clear {
		binding.Name = right.Children[0].Token.Value
		binding.Arguments = make([]Value, 0, len(right.Children)-1)
		for _, argument := range right.Children[1:] {
			value, err := r.evaluate(argument, environment)
			if err != nil {
				return err
			}
			binding.Arguments = append(binding.Arguments, value)
		}
	}
	_, handled, err := receiver.BindMember(key, binding)
	if err != nil {
		return fmt.Errorf("script: %s:%#x: %w", left.Token.Source, left.Token.Offset, err)
	}
	if !handled {
		return locationError(left.Token, fmt.Sprintf("宿主对象未处理绑定成员 0x%08x", key))
	}
	return nil
}

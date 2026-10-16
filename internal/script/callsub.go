package script

import (
	"fmt"

	"QY/internal/symbol"
)

const callSubKey uint32 = 0xb350cfe1

// callSub 按直属子对象的属性值筛选并派发事件；目前只恢复整数筛选。
func (r *Runtime) callSub(receiver *Object, arguments []Value, token Lexeme) (Value, error) {
	if receiver == nil {
		return Value{}, locationError(token, "CallSub 缺少所属对象")
	}
	if len(arguments) < 3 || arguments[0].Kind != "string" || arguments[2].Kind != "string" {
		return Value{}, locationError(token, "CallSub 需要属性名、比较值和事件名")
	}
	if arguments[1].Kind != "int" {
		return Value{}, locationError(token, "CallSub 的非整数筛选尚未恢复")
	}
	if len(arguments) != 3 {
		return Value{}, locationError(token, "CallSub 的附加事件参数尚未恢复")
	}
	property := symbol.StringTableHash(string(cString(arguments[0].Text)))
	event := symbol.StringTableHash(string(cString(arguments[2].Text)))
	count := int32(0)
	for _, child := range append([]*Object(nil), receiver.Children...) {
		if child == nil {
			continue
		}
		var value Value
		var handled bool
		if child.ReadMember != nil {
			var err error
			value, handled, err = child.ReadMember(property)
			if err != nil {
				return Value{}, locationError(token, err.Error())
			}
		}
		if !handled {
			if member := child.Members[property]; member != nil {
				value, handled = *member, true
			}
		}
		if !handled || value.Kind != "int" || value.Integer != arguments[1].Integer {
			continue
		}
		_, consumed, err := r.dispatchEvent(child, event, nil, token)
		if err != nil {
			return Value{}, err
		}
		if !consumed && child.CallMember != nil {
			_, consumed, err = child.CallMember(event, nil)
			if err != nil {
				return Value{}, locationError(token, fmt.Sprintf("CallSub 事件失败：%v", err))
			}
		}
		if consumed {
			count++
		}
	}
	return Value{Kind: "int", Integer: count}, nil
}

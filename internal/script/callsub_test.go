package script

import (
	"errors"
	"strings"
	"testing"

	"QY/internal/symbol"
)

const (
	callSubPropertyName = "m_nMid"
	callSubEventName    = "OnPlayMid"
)

func callSubArgs(property string, comparison int32, event string) []Value {
	return []Value{
		{Kind: "string", Text: []byte(property)},
		integer(comparison),
		{Kind: "string", Text: []byte(event)},
	}
}

func callSubToken() Lexeme {
	return runtimeToken(6, 0, "CallSub")
}

func runCallSub(t *testing.T, runtime *Runtime, receiver *Object, arguments []Value) (Value, error) {
	t.Helper()
	return runtime.callSub(receiver, arguments, callSubToken())
}

func TestCallSubVisitsOnlyDirectChildren(t *testing.T) {
	runtime := NewRuntime()
	eventKey := symbol.StringTableHash(callSubEventName)
	grandchild := &Object{Members: map[uint32]*Value{
		symbol.StringTableHash(callSubPropertyName): ptrValue(integer(1)),
	}, CallMember: func(uint32, []Value) (Value, bool, error) {
		t.Fatal("CallSub 不应递归访问孙对象")
		return Value{}, false, nil
	}}
	direct := &Object{Children: []*Object{grandchild}}
	root := &Object{Children: []*Object{direct}}
	direct.Members = map[uint32]*Value{
		symbol.StringTableHash(callSubPropertyName): ptrValue(integer(1)),
	}
	dispatched := 0
	direct.CallMember = func(key uint32, args []Value) (Value, bool, error) {
		dispatched++
		if key != eventKey || len(args) != 0 {
			t.Fatalf("事件参数错误：key=%#x args=%+v", key, args)
		}
		return Value{}, true, nil
	}

	result, err := runCallSub(t, runtime, root, callSubArgs(callSubPropertyName, 1, callSubEventName))
	if err != nil || result.Kind != "int" || result.Integer != 1 || dispatched != 1 {
		t.Fatalf("直属筛选结果=%+v dispatched=%d err=%v", result, dispatched, err)
	}
}

func TestCallSubPropertyGetterTakesPrecedence(t *testing.T) {
	runtime := NewRuntime()
	propertyKey := symbol.StringTableHash(callSubPropertyName)
	eventCalls := 0
	child := &Object{
		Members: map[uint32]*Value{propertyKey: ptrValue(integer(1))},
		ReadMember: func(key uint32) (Value, bool, error) {
			if key != propertyKey {
				t.Fatalf("getter 收到错误的成员键：%#x", key)
			}
			return integer(2), true, nil
		},
		CallMember: func(uint32, []Value) (Value, bool, error) {
			eventCalls++
			return Value{}, true, nil
		},
	}
	result, err := runCallSub(t, runtime, &Object{Children: []*Object{child}},
		callSubArgs(callSubPropertyName, 1, callSubEventName))
	if err != nil || result.Integer != 0 || eventCalls != 0 {
		t.Fatalf("getter 未优先于 Members：result=%+v events=%d err=%v", result, eventCalls, err)
	}
}

func TestCallSubMissingAndWrongTypePropertiesDoNotMatch(t *testing.T) {
	runtime := NewRuntime()
	eventCalls := 0
	childWithWrongType := &Object{Members: map[uint32]*Value{
		symbol.StringTableHash(callSubPropertyName): {Kind: "string", Text: []byte("1")},
	}, CallMember: func(uint32, []Value) (Value, bool, error) {
		eventCalls++
		return Value{}, true, nil
	}}
	childWithoutProperty := &Object{CallMember: childWithWrongType.CallMember}
	result, err := runCallSub(t, runtime, &Object{Children: []*Object{
		childWithWrongType, childWithoutProperty,
	}}, callSubArgs(callSubPropertyName, 1, callSubEventName))
	if err != nil || result.Kind != "int" || result.Integer != 0 || eventCalls != 0 {
		t.Fatalf("缺失或类型不符属性意外命中：result=%+v events=%d err=%v", result, eventCalls, err)
	}
}

func TestCallSubCountsOnlyConsumedEvents(t *testing.T) {
	runtime := NewRuntime()
	propertyKey := symbol.StringTableHash(callSubPropertyName)
	eventKey := symbol.StringTableHash(callSubEventName)
	newChild := func() *Object {
		return &Object{Members: map[uint32]*Value{propertyKey: ptrValue(integer(1))}}
	}
	scriptEvent := newChild()
	parsedEventObject(t, runtime, scriptEvent, &scope{values: make(map[uint32]*Value)},
		runtimeToken(1530, 0, "int"), runtimeToken(6, eventKey, callSubEventName),
		runtimeToken(101, 0, "("), runtimeToken(980, 0, ")"),
		runtimeToken(1100, 0, "{"),
		runtimeToken(1514, 0, "return"), runtimeToken(2, 1, "1"),
		runtimeToken(1230, 0, ";"), runtimeToken(1101, 0, "}"),
	)

	fallbackNotHandled := newChild()
	fallbackNotHandledCalls := 0
	fallbackNotHandled.CallMember = func(key uint32, args []Value) (Value, bool, error) {
		fallbackNotHandledCalls++
		if key != eventKey || len(args) != 0 {
			t.Fatalf("fallback 收到错误事件：key=%#x args=%+v", key, args)
		}
		return Value{}, false, nil
	}
	fallbackHandled := newChild()
	fallbackHandledCalls := 0
	fallbackHandled.CallMember = func(key uint32, args []Value) (Value, bool, error) {
		fallbackHandledCalls++
		return integer(99), key == eventKey && len(args) == 0, nil
	}
	noHandler := newChild()

	result, err := runCallSub(t, runtime, &Object{Children: []*Object{
		scriptEvent, fallbackNotHandled, noHandler, fallbackHandled,
	}}, callSubArgs(callSubPropertyName, 1, callSubEventName))
	if err != nil || result.Kind != "int" || result.Integer != 2 ||
		fallbackNotHandledCalls != 1 || fallbackHandledCalls != 1 {
		t.Fatalf("只应累计成功处理的事件：result=%+v fallback=%d/%d err=%v",
			result, fallbackNotHandledCalls, fallbackHandledCalls, err)
	}
}

func TestCallSubPropagatesEventErrors(t *testing.T) {
	runtime := NewRuntime()
	propertyKey := symbol.StringTableHash(callSubPropertyName)
	eventKey := symbol.StringTableHash(callSubEventName)
	scriptEvent := &Object{Members: map[uint32]*Value{
		propertyKey: ptrValue(integer(1)),
	}}
	parsedEventObject(t, runtime, scriptEvent, &scope{values: make(map[uint32]*Value)},
		runtimeToken(1530, 0, "int"), runtimeToken(6, eventKey, callSubEventName),
		runtimeToken(101, 0, "("), runtimeToken(980, 0, ")"),
		runtimeToken(1100, 0, "{"),
		runtimeToken(1514, 0, "return"), runtimeToken(2, 1, "1"),
		runtimeToken(852, 0, "/"), runtimeToken(2, 0, "0"),
		runtimeToken(1230, 0, ";"), runtimeToken(1101, 0, "}"),
	)
	err := func() error {
		_, err := runCallSub(t, runtime, &Object{Children: []*Object{scriptEvent}},
			callSubArgs(callSubPropertyName, 1, callSubEventName))
		return err
	}()
	if err == nil || !strings.Contains(err.Error(), "除数为零") {
		t.Fatalf("脚本事件错误未传播：%v", err)
	}

	hostFailure := errors.New("宿主事件失败")
	hostEvent := &Object{
		Members: map[uint32]*Value{propertyKey: ptrValue(integer(1))},
		CallMember: func(uint32, []Value) (Value, bool, error) {
			return Value{}, false, hostFailure
		},
	}
	_, err = runCallSub(t, runtime, &Object{Children: []*Object{hostEvent}},
		callSubArgs(callSubPropertyName, 1, callSubEventName))
	if err == nil || !strings.Contains(err.Error(), hostFailure.Error()) ||
		!strings.Contains(err.Error(), "runtime_test.cod:0x0") {
		t.Fatalf("宿主事件错误未包含 cause/source：%v", err)
	}
}

func TestCallSubNamesUseCStringHashing(t *testing.T) {
	runtime := NewRuntime()
	propertyKey := symbol.StringTableHash(callSubPropertyName)
	eventKey := symbol.StringTableHash(callSubEventName)
	gotProperty, gotEvent := uint32(0), uint32(0)
	child := &Object{
		ReadMember: func(key uint32) (Value, bool, error) {
			gotProperty = key
			return integer(1), true, nil
		},
		CallMember: func(key uint32, _ []Value) (Value, bool, error) {
			gotEvent = key
			return Value{}, true, nil
		},
	}
	result, err := runCallSub(t, runtime, &Object{Children: []*Object{child}},
		callSubArgs(callSubPropertyName+"\x00ignored", 1, callSubEventName+"\x00ignored"))
	if err != nil || result.Integer != 1 || gotProperty != propertyKey || gotEvent != eventKey {
		t.Fatalf("NUL 后缀影响了名称哈希：result=%+v property=%#x event=%#x err=%v",
			result, gotProperty, gotEvent, err)
	}
}

func TestCallSubRejectsMissingReceiverAndInvalidArguments(t *testing.T) {
	valid := callSubArgs(callSubPropertyName, 1, callSubEventName)
	if _, err := runCallSub(t, NewRuntime(), nil, valid); err == nil ||
		!strings.Contains(err.Error(), "缺少所属对象") {
		t.Fatalf("nil receiver 未被拒绝：%v", err)
	}

	tests := []struct {
		name string
		args []Value
	}{
		{name: "参数不足", args: valid[:2]},
		{name: "属性名非字符串", args: []Value{integer(1), valid[1], valid[2]}},
		{name: "比较值非整数", args: []Value{valid[0], {Kind: "string", Text: []byte("1")}, valid[2]}},
		{name: "事件名非字符串", args: []Value{valid[0], valid[1], integer(2)}},
		{name: "附加参数尚未恢复", args: append(append([]Value(nil), valid...), integer(3))},
	}
	for _, test := range tests {
		t.Run(test.name, func(t *testing.T) {
			if _, err := runCallSub(t, NewRuntime(), &Object{}, test.args); err == nil {
				t.Fatalf("无效实参未报错：%+v", test.args)
			}
		})
	}
}

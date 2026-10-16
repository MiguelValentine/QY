package script

import (
	"errors"
	"strings"
	"testing"
)

const signatureEventKey = 0x376d2b34

func eventFunctionTokens(key uint32, parameterKinds []uint16, hook uint32) []Lexeme {
	tokens := []Lexeme{
		runtimeToken(1530, 0, "int"),
		runtimeToken(6, key, "OnCreate"),
		runtimeToken(101, 0, "("),
	}
	for index, kind := range parameterKinds {
		if index != 0 {
			tokens = append(tokens, runtimeToken(213, 0, ","))
		}
		tokens = append(tokens,
			runtimeToken(kind, 0, "parameter_type"),
			runtimeToken(6, uint32(0x7b000000+index), "parameter"),
		)
	}
	tokens = append(tokens,
		runtimeToken(980, 0, ")"),
		runtimeToken(1100, 0, "{"),
		runtimeToken(6, hook, "event_hook"),
		runtimeToken(101, 0, "("),
	)
	for index := range parameterKinds {
		if index != 0 {
			tokens = append(tokens, runtimeToken(213, 0, ","))
		}
		tokens = append(tokens, runtimeToken(6, uint32(0x7b000000+index), "parameter"))
	}
	tokens = append(tokens,
		runtimeToken(980, 0, ")"),
		runtimeToken(1230, 0, ";"),
		runtimeToken(1101, 0, "}"),
	)
	return tokens
}

func TestDispatchEventSelectsOverloadsAndRetainsEarlierSignature(t *testing.T) {
	const (
		zeroHook = 0x7b000010
		twoHook  = 0x7b000011
	)
	runtime := NewRuntime()
	object := &Object{Members: make(map[uint32]*Value)}
	var calls []string
	runtime.Register(zeroHook, func([]Value) (Value, error) {
		calls = append(calls, "zero")
		return Value{}, nil
	})
	runtime.Register(twoHook, func(arguments []Value) (Value, error) {
		if len(arguments) != 2 || arguments[0].Kind != "int" || arguments[1].Kind != "string" {
			t.Fatalf("二参重载实参=%+v", arguments)
		}
		calls = append(calls, "two")
		return Value{}, nil
	})
	tokens := append(
		eventFunctionTokens(signatureEventKey, nil, zeroHook),
		eventFunctionTokens(signatureEventKey, []uint16{1530, 1531}, twoHook)...,
	)
	parsedEventObject(t, runtime, object, &scope{values: make(map[uint32]*Value)}, tokens...)

	if _, handled, err := runtime.DispatchEvent(object, signatureEventKey, nil); err != nil || !handled {
		t.Fatalf("零参事件结果 handled=%t err=%v", handled, err)
	}
	if _, handled, err := runtime.DispatchEvent(object, signatureEventKey, []Value{
		integer(7), {Kind: "string", Text: []byte("ok")},
	}); err != nil || !handled {
		t.Fatalf("二参事件结果 handled=%t err=%v", handled, err)
	}
	if len(calls) != 2 || calls[0] != "zero" || calls[1] != "two" {
		t.Fatalf("实际重载调用=%v，期望 [zero two]", calls)
	}
}

func TestDispatchEventTypeMismatchIsUnhandled(t *testing.T) {
	const hook = 0x7b000020
	runtime := NewRuntime()
	object := &Object{Members: make(map[uint32]*Value)}
	calls := 0
	runtime.Register(hook, func([]Value) (Value, error) {
		calls++
		return Value{}, nil
	})
	parsedEventObject(t, runtime, object, &scope{values: make(map[uint32]*Value)},
		eventFunctionTokens(signatureEventKey, []uint16{1530, 1531}, hook)...,
	)

	_, handled, err := runtime.DispatchEvent(object, signatureEventKey, []Value{
		integer(1), integer(2),
	})
	if err != nil || handled || calls != 0 {
		t.Fatalf("类型不匹配事件 handled=%t calls=%d err=%v，期望未处理", handled, calls, err)
	}
}

func TestDispatchEventCountMismatchDoesNotRunBody(t *testing.T) {
	const hook = 0x7b000030
	runtime := NewRuntime()
	object := &Object{Members: make(map[uint32]*Value)}
	calls := 0
	runtime.Register(hook, func([]Value) (Value, error) {
		calls++
		return Value{}, nil
	})
	parsedEventObject(t, runtime, object, &scope{values: make(map[uint32]*Value)},
		eventFunctionTokens(signatureEventKey, []uint16{1530, 1530}, hook)...,
	)

	_, handled, err := runtime.DispatchEvent(object, signatureEventKey, []Value{integer(1)})
	if err != nil || handled || calls != 0 {
		t.Fatalf("数量不匹配事件 handled=%t calls=%d err=%v，期望未处理", handled, calls, err)
	}
}

func TestDispatchEventPropagatesMatchedBodyError(t *testing.T) {
	const hook = 0x7b000040
	runtime := NewRuntime()
	object := &Object{Members: make(map[uint32]*Value)}
	sentinel := errors.New("事件宿主失败")
	runtime.Register(hook, func([]Value) (Value, error) {
		return Value{}, sentinel
	})
	parsedEventObject(t, runtime, object, &scope{values: make(map[uint32]*Value)},
		eventFunctionTokens(signatureEventKey, nil, hook)...,
	)

	_, handled, err := runtime.DispatchEvent(object, signatureEventKey, nil)
	if !handled || err == nil || !strings.Contains(err.Error(), sentinel.Error()) {
		t.Fatalf("匹配事件错误未传播：handled=%t err=%v", handled, err)
	}
}

func TestNewDoesNotInvokeTwoArgumentOnCreateWithoutArguments(t *testing.T) {
	const (
		baseClass = 0x7b000050
		userClass = 0x7b000051
		hook      = 0x7b000052
	)
	runtime := NewRuntime()
	owner := &Object{}
	runtime.CurrentObject = owner
	runtime.RegisterObjectFactory(baseClass, func(*Object) (*Object, error) {
		return &Object{Members: make(map[uint32]*Value)}, nil
	})
	calls := 0
	runtime.Register(hook, func([]Value) (Value, error) {
		calls++
		return Value{}, nil
	})
	onCreate := &Node{
		Form:   "function",
		Token:  runtimeToken(1530, 0, "int"),
		Header: []Lexeme{runtimeToken(6, signatureEventKey, "OnCreate")},
		Children: []*Node{
			{Form: "parameter", Token: runtimeToken(1530, 0, "int"), Header: []Lexeme{runtimeToken(6, 0x7b000053, "first")}},
			{Form: "parameter", Token: runtimeToken(1530, 0, "int"), Header: []Lexeme{runtimeToken(6, 0x7b000054, "second")}},
			constructBlock(constructCallStatement(hook)),
		},
	}
	executeClassDefinitions(t, runtime, owner, classDefinition(userClass, baseClass, constructBlock(onCreate)))

	program, err := Parse(&Preprocessed{Tokens: []Lexeme{
		runtimeToken(990, 0, "new"),
		runtimeToken(6, userClass, "User"),
		runtimeToken(101, 0, "("),
		runtimeToken(980, 0, ")"),
		runtimeToken(1230, 0, ";"),
	}})
	if err != nil {
		t.Fatal(err)
	}
	if err := runtime.Execute(program); err != nil {
		t.Fatalf("无匹配的自动 OnCreate 应被跳过：%v", err)
	}
	if calls != 0 {
		t.Fatalf("零实参自动事件误运行二参函数 %d 次", calls)
	}
}

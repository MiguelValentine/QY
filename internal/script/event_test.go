package script

import (
	"strings"
	"testing"
)

func parsedEventObject(t *testing.T, runtime *Runtime, object *Object, parent *scope, tokens ...Lexeme) {
	t.Helper()
	program, err := Parse(&Preprocessed{Tokens: tokens})
	if err != nil {
		t.Fatal(err)
	}
	body := &Node{
		Form:     "block",
		Token:    runtimeToken(1100, 0, "{"),
		Children: program.Body,
	}
	if err := runtime.initializeObject(object, body, parent); err != nil {
		t.Fatal(err)
	}
}

func TestDispatchEventRunsParsedObjectFunctionWithReceiverAndClosure(t *testing.T) {
	const (
		eventKey    = 1001
		deltaKey    = 1002
		countKey    = 1003
		capturedKey = 1004
	)
	runtime := NewRuntime()
	object := &Object{Members: map[uint32]*Value{
		countKey: ptrValue(integer(1)),
	}}
	parent := &scope{values: map[uint32]*Value{
		capturedKey: ptrValue(integer(10)),
	}}
	parsedEventObject(t, runtime, object, parent,
		runtimeToken(1530, 0, "int"), runtimeToken(6, eventKey, "on_change"),
		runtimeToken(101, 0, "("), runtimeToken(1530, 0, "int"),
		runtimeToken(6, deltaKey, "delta"), runtimeToken(980, 0, ")"),
		runtimeToken(1100, 0, "{"),
		runtimeToken(6, countKey, "count"), runtimeToken(201, 0, "+="),
		runtimeToken(6, deltaKey, "delta"), runtimeToken(1230, 0, ";"),
		runtimeToken(6, capturedKey, "captured"), runtimeToken(201, 0, "+="),
		runtimeToken(6, deltaKey, "delta"), runtimeToken(1230, 0, ";"),
		runtimeToken(1514, 0, "return"), runtimeToken(6, countKey, "count"),
		runtimeToken(1230, 0, ";"), runtimeToken(1101, 0, "}"),
	)

	previous := &Object{}
	runtime.CurrentObject = previous
	runtime.steps = 999
	result, handled, err := runtime.DispatchEvent(object, eventKey, []Value{integer(4)})
	if err != nil || !handled {
		t.Fatalf("事件结果=(%+v,%t)，错误=%v", result, handled, err)
	}
	if result.Kind != "int" || result.Integer != 5 {
		t.Fatalf("事件返回值=%+v，期望 5", result)
	}
	if object.Members[countKey].Integer != 5 || parent.values[capturedKey].Integer != 14 {
		t.Fatalf("事件未修改实例/闭包状态：count=%+v captured=%+v", object.Members[countKey], parent.values[capturedKey])
	}
	if runtime.CurrentObject != previous || runtime.depth != 0 || runtime.steps == 0 || runtime.steps >= 999 {
		t.Fatalf("事件执行状态未恢复或重置：receiver=%p depth=%d steps=%d", runtime.CurrentObject, runtime.depth, runtime.steps)
	}
}

func TestDispatchEventMissingMemberIsUnhandled(t *testing.T) {
	runtime := NewRuntime()
	runtime.steps = 42
	value, handled, err := runtime.DispatchEvent(&Object{Members: make(map[uint32]*Value)}, 77, nil)
	if err != nil || handled || value.Kind != "" || runtime.steps != 0 {
		t.Fatalf("缺失事件结果=(%+v,%t)，错误=%v，steps=%d", value, handled, err, runtime.steps)
	}
}

func TestDispatchEventErrorRestoresExecutionState(t *testing.T) {
	const eventKey = 2001
	runtime := NewRuntime()
	object := &Object{Members: make(map[uint32]*Value)}
	parsedEventObject(t, runtime, object, &scope{values: make(map[uint32]*Value)},
		runtimeToken(1530, 0, "int"), runtimeToken(6, eventKey, "broken"),
		runtimeToken(101, 0, "("), runtimeToken(980, 0, ")"),
		runtimeToken(1100, 0, "{"),
		runtimeToken(1514, 0, "return"), runtimeToken(2, 1, "1"),
		runtimeToken(852, 0, "/"), runtimeToken(2, 0, "0"),
		runtimeToken(1230, 0, ";"), runtimeToken(1101, 0, "}"),
	)

	previous := &Object{}
	runtime.CurrentObject = previous
	value, handled, err := runtime.DispatchEvent(object, eventKey, nil)
	if !handled || err == nil || !strings.Contains(err.Error(), "除数为零") || value.Kind != "" {
		t.Fatalf("异常事件结果=(%+v,%t)，错误=%v", value, handled, err)
	}
	if runtime.CurrentObject != previous || runtime.depth != 0 {
		t.Fatalf("事件异常后状态未恢复：receiver=%p depth=%d", runtime.CurrentObject, runtime.depth)
	}
}

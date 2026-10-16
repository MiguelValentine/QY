package script

import (
	"errors"
	"strings"
	"testing"

	"QY/internal/symbol"
)

const (
	createObjHash       = 0x0e9c89f6
	createObjEventHash  = 0x376d2b34
	createObjCtorHook   = 0x7a010001
	createObjEventHook  = 0x7a010002
	createObjMarkerSlot = 0x7a010003
)

func createObjClassDefinition(classKey, baseKey uint32, parameters ...uint32) *Node {
	constructor := &Node{
		Form:   "function",
		Header: []Lexeme{runtimeToken(6, classKey, "TestClass")},
	}
	for _, key := range parameters {
		constructor.Children = append(constructor.Children, &Node{
			Form:   "parameter",
			Header: []Lexeme{runtimeToken(6, key, "argument")},
		})
	}
	callChildren := []*Node{{Form: "name", Token: runtimeToken(6, createObjCtorHook, "constructor_hook")}}
	for _, key := range parameters {
		callChildren = append(callChildren, &Node{Form: "name", Token: runtimeToken(6, key, "argument")})
	}
	constructor.Children = append(constructor.Children, constructBlock(&Node{
		Form: "expression",
		Children: []*Node{{
			Form:     "call",
			Children: callChildren,
		}},
	}))
	onCreate := &Node{
		Form:   "function",
		Header: []Lexeme{runtimeToken(6, createObjEventHash, "OnCreate")},
		Children: []*Node{
			constructBlock(constructCallStatement(createObjEventHook)),
		},
	}
	return classDefinition(classKey, baseKey, constructBlock(constructor, onCreate))
}

func parseCreateObjAssignment(t *testing.T, receiver uint32, arguments ...[]Lexeme) *Program {
	t.Helper()
	tokens := []Lexeme{runtimeToken(6, 0x7a010004, "result"), runtimeToken(200, 0, "=")}
	if receiver != 0 {
		tokens = append(tokens, runtimeToken(6, receiver, "target"), runtimeToken(940, 0, "."))
	}
	tokens = append(tokens, runtimeToken(6, createObjHash, "CreateObj"), runtimeToken(101, 0, "("))
	for index, argument := range arguments {
		if index > 0 {
			tokens = append(tokens, runtimeToken(213, 0, ","))
		}
		tokens = append(tokens, argument...)
	}
	tokens = append(tokens, runtimeToken(980, 0, ")"), runtimeToken(1230, 0, ";"))
	program, err := Parse(&Preprocessed{Tokens: tokens})
	if err != nil {
		t.Fatal(err)
	}
	return program
}

func createObjString(name string) []Lexeme {
	return []Lexeme{runtimeToken(3, 0, name)}
}

func createObjInteger(value int32) []Lexeme {
	return []Lexeme{runtimeToken(2, uint32(value), "integer")}
}

func TestCreateObjUsesExplicitReceiverAndForwardsArgumentsThenOnCreate(t *testing.T) {
	const (
		classBase   = 0x7a010010
		otherBase   = 0x7a010011
		firstParam  = 0x7a010012
		secondParam = 0x7a010013
		targetKey   = 0x7a010014
	)
	classKey := symbol.StringTableHash("TestClass")
	runtime := NewRuntime()
	owner := &Object{}
	explicitReceiver := &Object{}
	decoyCurrent := &Object{}
	var order []string
	var instances []*Object
	registerBase := func(key uint32, marker int32) {
		runtime.RegisterObjectFactory(key, func(*Object) (*Object, error) {
			instance := &Object{Members: map[uint32]*Value{
				createObjMarkerSlot: ptrValue(integer(marker)),
			}}
			instances = append(instances, instance)
			return instance, nil
		})
	}
	registerBase(classBase, 41)
	registerBase(otherBase, 99)
	runtime.Register(createObjCtorHook, func(arguments []Value) (Value, error) {
		if runtime.CurrentObject == nil || runtime.CurrentObject.ClassName != classKey {
			t.Fatalf("构造方法 receiver 错误：%p", runtime.CurrentObject)
		}
		if len(arguments) != 2 || arguments[0].Integer != 7 || arguments[1].Integer != 8 {
			t.Fatalf("构造方法参数错误：%+v", arguments)
		}
		order = append(order, "constructor")
		return integer(12345), nil
	})
	runtime.Register(createObjEventHook, func(arguments []Value) (Value, error) {
		if len(arguments) != 0 {
			t.Fatalf("OnCreate 不应收到脚本实参：%+v", arguments)
		}
		order = append(order, "OnCreate")
		return Value{}, nil
	})
	executeClassDefinitions(t, runtime, owner, createObjClassDefinition(classKey, classBase, firstParam, secondParam))
	executeClassDefinitions(t, runtime, explicitReceiver, createObjClassDefinition(classKey, otherBase, firstParam, secondParam))
	runtime.SetGlobal(targetKey, Value{Kind: "object", Object: explicitReceiver})
	runtime.CurrentObject = decoyCurrent
	runtime.SetGlobal(0x7a010004, Value{Kind: "null"})

	program := parseCreateObjAssignment(t, targetKey,
		createObjString("TestClass"), createObjInteger(7), createObjInteger(8))
	if err := runtime.Execute(program); err != nil {
		t.Fatal(err)
	}
	result, ok := runtime.Global(0x7a010004)
	if !ok || result.Kind != "object" || result.Object == nil {
		t.Fatalf("CreateObj 结果不是对象：%+v", result)
	}
	if result.Object.Owner != explicitReceiver || result.Object.ClassName != classKey {
		t.Fatalf("显式 receiver 未作为 Owner 和类表来源：owner=%p class=%x", result.Object.Owner, result.Object.ClassName)
	}
	if marker := result.Object.Members[createObjMarkerSlot]; marker == nil || marker.Integer != 99 {
		t.Fatalf("未使用显式 receiver 的类定义：%+v", result.Object.Members)
	}
	if got, want := strings.Join(order, ","), "constructor,OnCreate"; got != want {
		t.Fatalf("构造/事件顺序=%s，期望 %s", got, want)
	}
	if runtime.CurrentObject != decoyCurrent {
		t.Fatal("CreateObj 执行后没有恢复调用者 CurrentObject")
	}
}

func TestCreateObjTupleArgumentsAndNullConstructor(t *testing.T) {
	const (
		baseKey     = 0x7a010020
		firstParam  = 0x7a010021
		secondParam = 0x7a010022
		targetKey   = 0x7a010023
		resultKey   = 0x7a010004
	)
	classKey := symbol.StringTableHash("TestClass")
	runtime := NewRuntime()
	owner := &Object{}
	var received []Value
	calls := 0
	events := 0
	runtime.RegisterObjectFactory(baseKey, func(*Object) (*Object, error) {
		return &Object{Members: make(map[uint32]*Value)}, nil
	})
	runtime.Register(createObjCtorHook, func(arguments []Value) (Value, error) {
		calls++
		received = append([]Value(nil), arguments...)
		return integer(100), nil
	})
	runtime.Register(createObjEventHook, func([]Value) (Value, error) {
		events++
		return Value{}, nil
	})
	executeClassDefinitions(t, runtime, owner, createObjClassDefinition(classKey, baseKey, firstParam, secondParam))
	runtime.SetGlobal(targetKey, Value{Kind: "object", Object: owner})
	runtime.SetGlobal(resultKey, Value{Kind: "null"})
	runtime.CurrentObject = owner

	t.Run("单参数tuple展开", func(t *testing.T) {
		program := parseCreateObjAssignment(t, 0,
			[]Lexeme{
				runtimeToken(101, 0, "("),
				runtimeToken(3, 0, "TestClass"),
				runtimeToken(213, 0, ","),
				runtimeToken(2, 31, "31"),
				runtimeToken(213, 0, ","),
				runtimeToken(2, 32, "32"),
				runtimeToken(980, 0, ")"),
			})
		if err := runtime.Execute(program); err != nil {
			t.Fatal(err)
		}
		if calls != 1 || len(received) != 2 || received[0].Integer != 31 || received[1].Integer != 32 {
			t.Fatalf("tuple 参数没有展开到构造方法：calls=%d arguments=%+v", calls, received)
		}
		if events != 1 {
			t.Fatalf("OnCreate 调用次数=%d，期望1", events)
		}
	})
	t.Run("单字符串跳过同名构造", func(t *testing.T) {
		beforeCalls, beforeEvents := calls, events
		if err := runtime.Execute(parseCreateObjAssignment(t, 0, createObjString("TestClass"))); err != nil {
			t.Fatal(err)
		}
		if calls != beforeCalls || events != beforeEvents+1 {
			t.Fatalf("单字符串应跳过构造并触发 OnCreate：构造=%d 事件=%d", calls-beforeCalls, events-beforeEvents)
		}
	})

	t.Run("嵌套tuple保留单项", func(t *testing.T) {
		received = nil
		program := parseCreateObjAssignment(t, 0,
			createObjString("TestClass"),
			[]Lexeme{
				runtimeToken(101, 0, "("),
				runtimeToken(2, 41, "41"),
				runtimeToken(213, 0, ","),
				runtimeToken(2, 42, "42"),
				runtimeToken(980, 0, ")"),
			})
		err := runtime.Execute(program)
		if err == nil || (!strings.Contains(err.Error(), "参数数量不匹配") &&
			!strings.Contains(err.Error(), "函数缺少参数")) {
			t.Fatalf("嵌套 tuple 应作为一个实参传入：%v", err)
		}
		if len(received) != 0 {
			t.Fatal("参数数量校验失败后不应执行构造方法")
		}
	})

	t.Run("null不调用构造但触发事件", func(t *testing.T) {
		beforeCalls, beforeEvents := calls, events
		program := parseCreateObjAssignment(t, 0, createObjString("TestClass"), []Lexeme{runtimeToken(1523, 0, "null")})
		if err := runtime.Execute(program); err != nil {
			t.Fatal(err)
		}
		if calls != beforeCalls || events != beforeEvents+1 {
			t.Fatalf("null 实参构造/事件次数=%d/%d，期望=%d/%d", calls, events, beforeCalls, beforeEvents+1)
		}
	})
}

func TestCreateObjRejectsInvalidClassBeforeFactoryAndRecoversAfterError(t *testing.T) {
	const (
		baseKey   = 0x7a010030
		targetKey = 0x7a010031
		resultKey = 0x7a010004
		paramKey  = 0x7a010032
	)
	classKey := symbol.StringTableHash("TestClass")
	runtime := NewRuntime()
	owner := &Object{}
	factoryCalls := 0
	runtime.RegisterObjectFactory(baseKey, func(*Object) (*Object, error) {
		factoryCalls++
		return &Object{Members: make(map[uint32]*Value)}, nil
	})
	runtime.Register(createObjEventHook, func([]Value) (Value, error) { return Value{}, nil })
	executeClassDefinitions(t, runtime, owner, createObjClassDefinition(classKey, baseKey, paramKey))
	runtime.SetGlobal(targetKey, Value{Kind: "object", Object: owner})
	runtime.SetGlobal(resultKey, Value{Kind: "null"})
	runtime.CurrentObject = owner

	invalid := parseCreateObjAssignment(t, 0, createObjInteger(9))
	if err := runtime.Execute(invalid); err == nil {
		t.Fatal("非字符串类名应失败")
	}
	if factoryCalls != 0 {
		t.Fatalf("非法类名产生工厂副作用：%d", factoryCalls)
	}
	singleItemTuple := Value{
		Kind: "tuple",
		Items: []Value{{
			Kind: "string",
			Text: []byte("TestClass"),
		}},
	}
	if _, err := runtime.createObject(owner, []Value{singleItemTuple}, runtimeToken(6, createObjHash, "CreateObj")); err == nil {
		t.Fatal("CreateObj 单项 tuple 应按原生规则拒绝")
	}
	if factoryCalls != 0 {
		t.Fatalf("被拒绝的单项 tuple 产生工厂副作用：%d", factoryCalls)
	}

	sentinel := errors.New("构造回调失败")
	fail := true
	runtime.Register(createObjCtorHook, func([]Value) (Value, error) {
		if fail {
			return Value{}, sentinel
		}
		return Value{}, nil
	})
	valid := parseCreateObjAssignment(t, targetKey, createObjString("TestClass"), createObjInteger(5))
	err := runtime.Execute(valid)
	if err == nil || !strings.Contains(err.Error(), sentinel.Error()) {
		t.Fatalf("构造回调错误未传播：%v", err)
	}
	if runtime.CurrentObject != owner || runtime.depth != 0 || runtime.constructDepth != 0 {
		t.Fatal("构造失败后运行时状态未恢复")
	}
	fail = false
	if err := runtime.Execute(valid); err != nil {
		t.Fatalf("错误解除后无法继续执行：%v", err)
	}
}

func TestCreateObjCallMemberPrecedenceAndScriptShadowing(t *testing.T) {
	const (
		baseKey   = 0x7a010040
		targetKey = 0x7a010041
		resultKey = 0x7a010004
	)
	classKey := symbol.StringTableHash("TestClass")
	runtime := NewRuntime()
	owner := &Object{}
	factoryCalls := 0
	runtime.RegisterObjectFactory(baseKey, func(*Object) (*Object, error) {
		factoryCalls++
		return &Object{Members: make(map[uint32]*Value)}, nil
	})
	runtime.Register(createObjEventHook, func([]Value) (Value, error) { return Value{}, nil })
	executeClassDefinitions(t, runtime, owner, createObjClassDefinition(classKey, baseKey))
	runtime.SetGlobal(targetKey, Value{Kind: "object", Object: owner})
	runtime.SetGlobal(resultKey, Value{Kind: "null"})
	runtime.CurrentObject = owner
	program := parseCreateObjAssignment(t, targetKey, createObjString("TestClass"))

	memberCalls := 0
	owner.CallMember = func(key uint32, arguments []Value) (Value, bool, error) {
		if key != createObjHash {
			return Value{}, false, nil
		}
		memberCalls++
		if len(arguments) != 1 {
			t.Fatalf("CallMember 参数错误：%+v", arguments)
		}
		return integer(71), true, nil
	}
	if err := runtime.Execute(program); err != nil {
		t.Fatal(err)
	}
	result, _ := runtime.Global(resultKey)
	if memberCalls != 1 || factoryCalls != 0 || result.Kind != "int" || result.Integer != 71 {
		t.Fatalf("CallMember 优先级错误：calls=%d factories=%d result=%+v", memberCalls, factoryCalls, result)
	}

	owner.CallMember = func(key uint32, _ []Value) (Value, bool, error) {
		if key == createObjHash {
			memberCalls++
		}
		return Value{}, false, nil
	}
	if err := runtime.Execute(program); err != nil {
		t.Fatal(err)
	}
	if factoryCalls != 1 {
		t.Fatalf("CallMember 未处理时没有回退 CreateObj：factory calls=%d", factoryCalls)
	}

	scriptCalls := 0
	declaration := &Node{
		Form:   "function",
		Header: []Lexeme{runtimeToken(6, createObjHash, "CreateObj")},
		Children: []*Node{
			{Form: "parameter", Header: []Lexeme{runtimeToken(6, 0x7a010042, "className")}},
			constructBlock(&Node{Form: "return", Children: []*Node{
				{Form: "literal", Token: runtimeToken(2, 88, "88")},
			}}),
		},
	}
	if err := runtime.Execute(&Program{Body: []*Node{declaration}}); err != nil {
		t.Fatal(err)
	}
	runtime.Register(createObjHash, func([]Value) (Value, error) {
		scriptCalls++
		return integer(0), nil
	})
	if err := runtime.Execute(parseCreateObjAssignment(t, 0, createObjString("TestClass"))); err != nil {
		t.Fatal(err)
	}
	result, _ = runtime.Global(resultKey)
	if factoryCalls != 1 || scriptCalls != 0 || result.Kind != "int" || result.Integer != 88 {
		t.Fatalf("局部同名脚本函数没有遮蔽 builtin：factory=%d host=%d result=%+v", factoryCalls, scriptCalls, result)
	}
}

package script

import (
	"errors"
	"strings"
	"testing"
)

func constructBlock(children ...*Node) *Node {
	return &Node{Form: "block", Children: children}
}

func constructCallStatement(key uint32) *Node {
	return &Node{
		Form: "expression",
		Children: []*Node{{
			Form: "call",
			Children: []*Node{{
				Form:  "name",
				Token: runtimeToken(6, key, "construct_callback"),
			}},
		}},
	}
}

func executeClassDefinitions(t *testing.T, runtime *Runtime, owner *Object, definitions ...*Node) {
	t.Helper()
	previous := runtime.CurrentObject
	runtime.CurrentObject = owner
	err := runtime.Execute(&Program{Body: definitions})
	runtime.CurrentObject = previous
	if err != nil {
		t.Fatal(err)
	}
}

func TestConstructRunsFactoryThenBaseAndDerivedInitializers(t *testing.T) {
	const (
		builtinClass = 100
		baseClass    = 101
		derivedClass = 102
		baseHook     = 201
		derivedHook  = 202
	)
	runtime := NewRuntime()
	owner := &Object{}
	var instance *Object
	var order []string
	runtime.RegisterObjectFactory(builtinClass, func(gotOwner *Object) (*Object, error) {
		order = append(order, "factory")
		if gotOwner != owner {
			t.Fatalf("工厂 owner = %p，期望 %p", gotOwner, owner)
		}
		instance = &Object{Members: make(map[uint32]*Value)}
		return instance, nil
	})
	runtime.Register(baseHook, func([]Value) (Value, error) {
		if runtime.CurrentObject != instance {
			t.Fatal("基类初始化期间 CurrentObject 不是构造实例")
		}
		order = append(order, "base")
		return Value{}, nil
	})
	runtime.Register(derivedHook, func([]Value) (Value, error) {
		if runtime.CurrentObject != instance {
			t.Fatal("派生类初始化期间 CurrentObject 不是构造实例")
		}
		order = append(order, "derived")
		return Value{}, nil
	})
	executeClassDefinitions(t, runtime, owner,
		classDefinition(baseClass, builtinClass, constructBlock(constructCallStatement(baseHook))),
		classDefinition(derivedClass, baseClass, constructBlock(constructCallStatement(derivedHook))),
	)

	previous := &Object{}
	runtime.CurrentObject = previous
	object, err := runtime.construct(derivedClass, owner, runtimeToken(990, derivedClass, "new"))
	if err != nil {
		t.Fatal(err)
	}
	if object != instance || object.Owner != owner || object.ClassName != derivedClass {
		t.Fatalf("构造对象状态错误：object=%p owner=%p class=%d", object, object.Owner, object.ClassName)
	}
	if strings.Join(order, ",") != "factory,base,derived" {
		t.Fatalf("构造顺序 = %v，期望 factory,base,derived", order)
	}
	if len(runtime.Objects) != 1 || runtime.Objects[0] != instance {
		t.Fatalf("宿主对象登记错误：%v", runtime.Objects)
	}
	if runtime.CurrentObject != previous {
		t.Fatal("类初始化后没有恢复 CurrentObject")
	}
}

func TestConstructFindsNearestSameNameClassAlongOwnerChain(t *testing.T) {
	const (
		classKey    = 301
		rootBase    = 302
		childBase   = 303
		rootMarker  = 401
		childMarker = 402
	)
	runtime := NewRuntime()
	for key, marker := range map[uint32]int32{rootBase: rootMarker, childBase: childMarker} {
		marker := marker
		runtime.RegisterObjectFactory(key, func(owner *Object) (*Object, error) {
			return &Object{Members: map[uint32]*Value{900: ptrValue(integer(marker))}}, nil
		})
	}

	root := &Object{}
	child := &Object{Owner: root}
	leaf := &Object{Owner: child}
	fallbackLeaf := &Object{Owner: root}
	executeClassDefinitions(t, runtime, root, classDefinition(classKey, rootBase, constructBlock()))
	executeClassDefinitions(t, runtime, child, classDefinition(classKey, childBase, constructBlock()))

	for _, test := range []struct {
		name  string
		owner *Object
		want  int32
	}{
		{name: "最近宿主遮蔽同名类", owner: leaf, want: childMarker},
		{name: "沿Owner回退到祖先类", owner: fallbackLeaf, want: rootMarker},
	} {
		t.Run(test.name, func(t *testing.T) {
			object, err := runtime.construct(classKey, test.owner, runtimeToken(990, classKey, "new"))
			if err != nil {
				t.Fatal(err)
			}
			if object.Owner != test.owner || object.Members[900] == nil || object.Members[900].Integer != test.want {
				t.Fatalf("类定义查找结果错误：owner=%p members=%v", object.Owner, object.Members)
			}
		})
	}
}

func ptrValue(value Value) *Value {
	return &value
}

func TestConstructedInstancesHaveIsolatedMembers(t *testing.T) {
	const (
		builtinClass = 501
		userClass    = 502
		memberKey    = 503
	)
	runtime := NewRuntime()
	owner := &Object{}
	runtime.RegisterObjectFactory(builtinClass, func(*Object) (*Object, error) {
		return &Object{}, nil
	})
	executeClassDefinitions(t, runtime, owner, classDefinition(userClass, builtinClass, constructBlock()))

	first, err := runtime.construct(userClass, owner, runtimeToken(990, userClass, "new"))
	if err != nil {
		t.Fatal(err)
	}
	second, err := runtime.construct(userClass, owner, runtimeToken(990, userClass, "new"))
	if err != nil {
		t.Fatal(err)
	}
	if first == second || first.Members == nil || second.Members == nil {
		t.Fatal("不同实例没有获得独立的成员表")
	}
	first.Members[memberKey] = ptrValue(integer(7))
	if second.Members[memberKey] != nil {
		t.Fatal("一个实例的成员写入泄漏到另一个实例")
	}
}

func TestScriptMethodReceiverAndCurrentObjectRestoreAfterError(t *testing.T) {
	const (
		builtinClass = 601
		userClass    = 602
		objectName   = 603
		methodKey    = 604
		failureKey   = 605
	)
	runtime := NewRuntime()
	owner := &Object{}
	var instance *Object
	sentinel := errors.New("方法中的宿主错误")
	runtime.RegisterObjectFactory(builtinClass, func(*Object) (*Object, error) {
		instance = &Object{Members: make(map[uint32]*Value)}
		return instance, nil
	})
	runtime.Register(failureKey, func([]Value) (Value, error) {
		if runtime.CurrentObject != instance {
			t.Fatal("脚本方法没有以所属实例作为 receiver")
		}
		return Value{}, sentinel
	})
	method := &Node{
		Form:   "function",
		Header: []Lexeme{runtimeToken(6, methodKey, "method")},
		Children: []*Node{
			constructBlock(constructCallStatement(failureKey)),
		},
	}
	executeClassDefinitions(t, runtime, owner, classDefinition(userClass, builtinClass, constructBlock(method)))
	constructed, err := runtime.construct(userClass, owner, runtimeToken(990, userClass, "new"))
	if err != nil {
		t.Fatal(err)
	}
	if got := constructed.Members[methodKey]; got == nil || got.Function == nil || got.Function.receiver != constructed {
		t.Fatal("脚本方法未绑定到构造实例")
	}

	previous := &Object{}
	runtime.CurrentObject = previous
	runtime.SetGlobal(objectName, Value{Kind: "object", Object: constructed})
	program, err := Parse(&Preprocessed{Tokens: []Lexeme{
		runtimeToken(6, objectName, "object"),
		runtimeToken(940, 0, "."),
		runtimeToken(6, methodKey, "method"),
		runtimeToken(101, 0, "("),
		runtimeToken(980, 0, ")"),
		runtimeToken(1230, 0, ";"),
	}})
	if err != nil {
		t.Fatal(err)
	}
	err = runtime.Execute(program)
	if err == nil || !strings.Contains(err.Error(), sentinel.Error()) {
		t.Fatalf("预期方法宿主错误，得到 %v", err)
	}
	if runtime.CurrentObject != previous {
		t.Fatal("脚本方法报错后没有恢复 CurrentObject")
	}
}

func TestConstructReportsMissingAndFailedFactories(t *testing.T) {
	const (
		missingClass = 701
		nilClass     = 702
		errorClass   = 703
	)
	runtime := NewRuntime()
	owner := &Object{}
	token := runtimeToken(990, missingClass, "new")
	if _, err := runtime.construct(missingClass, owner, token); err == nil || !strings.Contains(err.Error(), "尚未实现或登记") {
		t.Fatalf("缺失工厂未返回错误：%v", err)
	}
	runtime.RegisterObjectFactory(nilClass, func(*Object) (*Object, error) { return nil, nil })
	if _, err := runtime.construct(nilClass, owner, runtimeToken(990, nilClass, "new")); err == nil || !strings.Contains(err.Error(), "返回空对象") {
		t.Fatalf("空对象工厂未返回错误：%v", err)
	}

	sentinel := errors.New("工厂失败")
	runtime.RegisterObjectFactory(errorClass, func(*Object) (*Object, error) { return nil, sentinel })
	if _, err := runtime.construct(errorClass, owner, runtimeToken(990, errorClass, "new")); !errors.Is(err, sentinel) {
		t.Fatalf("工厂错误链没有保留：%v", err)
	}
	if runtime.CurrentObject != nil || len(runtime.Objects) != 0 || runtime.constructDepth != 0 {
		t.Fatal("失败构造留下了当前对象、登记对象或深度状态")
	}
}

func TestConstructRejectsInheritanceCycleAndRestoresDepth(t *testing.T) {
	const (
		classA = 801
		classB = 802
	)
	runtime := NewRuntime()
	owner := &Object{}
	executeClassDefinitions(t, runtime, owner,
		classDefinition(classA, classB, constructBlock()),
		classDefinition(classB, classA, constructBlock()),
	)

	previous := &Object{}
	runtime.CurrentObject = previous
	_, err := runtime.construct(classA, owner, runtimeToken(990, classA, "new"))
	if err == nil || !strings.Contains(err.Error(), "深度超过限制") {
		t.Fatalf("继承环未被限制：%v", err)
	}
	if runtime.constructDepth != 0 || runtime.CurrentObject != previous || len(runtime.Objects) != 0 {
		t.Fatal("继承环失败后构造状态未恢复")
	}
}

func TestParsedNewCallEvaluatesArgumentsBeforeInitializationAndReturnsInstance(t *testing.T) {
	const (
		baseClass      = 901
		userClass      = 902
		firstParamKey  = 904
		secondParamKey = 911
		resultKey      = 905
		firstArgKey    = 906
		secondArgKey   = 907
		initHookKey    = 908
		ctorHookKey    = 909
		createEventKey = 0x376d2b34
		createHookKey  = 910
	)
	runtime := NewRuntime()
	owner := &Object{}
	var order []string
	var instance *Object
	runtime.RegisterObjectFactory(baseClass, func(gotOwner *Object) (*Object, error) {
		if gotOwner != owner {
			t.Fatalf("工厂 owner = %p，期望 %p", gotOwner, owner)
		}
		order = append(order, "factory")
		instance = &Object{Members: make(map[uint32]*Value)}
		return instance, nil
	})
	runtime.Register(firstArgKey, func([]Value) (Value, error) {
		order = append(order, "arg1")
		return integer(17), nil
	})
	runtime.Register(secondArgKey, func([]Value) (Value, error) {
		order = append(order, "arg2")
		return integer(23), nil
	})
	runtime.Register(initHookKey, func([]Value) (Value, error) {
		order = append(order, "initialize")
		return Value{}, nil
	})
	runtime.Register(ctorHookKey, func(arguments []Value) (Value, error) {
		if runtime.CurrentObject != instance {
			t.Fatalf("构造方法 receiver = %p，期望 %p", runtime.CurrentObject, instance)
		}
		if len(arguments) != 2 || arguments[0].Kind != "int" || arguments[0].Integer != 17 ||
			arguments[1].Kind != "int" || arguments[1].Integer != 23 {
			t.Fatalf("构造方法实参 = %+v，期望 [17 23]", arguments)
		}
		order = append(order, "constructor")
		return Value{}, nil
	})
	runtime.Register(createHookKey, func(arguments []Value) (Value, error) {
		if runtime.CurrentObject != instance {
			t.Fatalf("OnCreate receiver = %p，期望 %p", runtime.CurrentObject, instance)
		}
		if len(arguments) != 0 {
			t.Fatalf("OnCreate 收到意外实参：%+v", arguments)
		}
		order = append(order, "OnCreate")
		return Value{}, nil
	})
	constructor := &Node{
		Form:   "function",
		Header: []Lexeme{runtimeToken(6, userClass, "User")},
		Children: []*Node{
			{Form: "parameter", Header: []Lexeme{runtimeToken(6, firstParamKey, "firstValue")}},
			{Form: "parameter", Header: []Lexeme{runtimeToken(6, secondParamKey, "secondValue")}},
			constructBlock(
				&Node{Form: "expression", Children: []*Node{{
					Form: "call",
					Children: []*Node{
						{Form: "name", Token: runtimeToken(6, ctorHookKey, "constructor_hook")},
						{Form: "name", Token: runtimeToken(6, firstParamKey, "firstValue")},
						{Form: "name", Token: runtimeToken(6, secondParamKey, "secondValue")},
					},
				}}},
				&Node{Form: "return", Children: []*Node{{Form: "literal", Token: runtimeToken(2, 99, "99")}}},
			),
		},
	}
	onCreate := &Node{
		Form:   "function",
		Header: []Lexeme{runtimeToken(6, createEventKey, "OnCreate")},
		Children: []*Node{
			constructBlock(constructCallStatement(createHookKey)),
		},
	}
	executeClassDefinitions(t, runtime, owner, classDefinition(userClass, baseClass, constructBlock(
		constructCallStatement(initHookKey),
		constructor,
		onCreate,
	)))
	runtime.SetGlobal(resultKey, Value{Kind: "null"})

	program, err := Parse(&Preprocessed{Tokens: []Lexeme{
		runtimeToken(6, resultKey, "result"), runtimeToken(200, 0, "="),
		runtimeToken(990, 0, "new"), runtimeToken(6, userClass, "User"),
		runtimeToken(101, 0, "("),
		runtimeToken(6, firstArgKey, "first"), runtimeToken(101, 0, "("), runtimeToken(980, 0, ")"),
		runtimeToken(213, 0, ","),
		runtimeToken(6, secondArgKey, "second"), runtimeToken(101, 0, "("), runtimeToken(980, 0, ")"),
		runtimeToken(980, 0, ")"), runtimeToken(1230, 0, ";"),
	}})
	if err != nil {
		t.Fatal(err)
	}
	runtime.CurrentObject = owner
	if err := runtime.Execute(program); err != nil {
		t.Fatal(err)
	}
	wantOrder := "arg1,arg2,factory,initialize,constructor,OnCreate"
	if got := strings.Join(order, ","); got != wantOrder {
		t.Fatalf("构造顺序 = %s，期望 %s", got, wantOrder)
	}
	result, ok := runtime.Global(resultKey)
	if !ok || result.Kind != "object" || result.Object != instance {
		t.Fatalf("带括号 new 的结果 = %+v，期望构造实例 %p", result, instance)
	}
	firstInstance := instance
	if runtime.CurrentObject != owner {
		t.Fatal("构造方法返回后没有恢复调用者 CurrentObject")
	}

	order = nil
	bareNew, err := Parse(&Preprocessed{Tokens: []Lexeme{
		runtimeToken(6, resultKey, "result"), runtimeToken(200, 0, "="),
		runtimeToken(990, 0, "new"), runtimeToken(6, userClass, "User"),
		runtimeToken(1230, 0, ";"),
	}})
	if err != nil {
		t.Fatal(err)
	}
	if err := runtime.Execute(bareNew); err != nil {
		t.Fatal(err)
	}
	if got, want := strings.Join(order, ","), "factory,initialize,OnCreate"; got != want {
		t.Fatalf("裸 new 不应调用同名构造方法：顺序=%s，期望 %s", got, want)
	}
	result, ok = runtime.Global(resultKey)
	if !ok || result.Kind != "object" || result.Object == firstInstance {
		t.Fatalf("裸 new 结果没有返回新实例：%+v", result)
	}
}

func TestParsedNewCallPropagatesConstructorErrorAndRecovers(t *testing.T) {
	const (
		baseClass = 921
		userClass = 922
		hookKey   = 924
	)
	runtime := NewRuntime()
	owner := &Object{}
	fail := true
	var instance *Object
	sentinel := errors.New("构造宿主失败")
	runtime.RegisterObjectFactory(baseClass, func(*Object) (*Object, error) {
		instance = &Object{Members: make(map[uint32]*Value)}
		return instance, nil
	})
	runtime.Register(hookKey, func([]Value) (Value, error) {
		if runtime.CurrentObject != instance {
			t.Fatalf("构造方法 receiver = %p，期望 %p", runtime.CurrentObject, instance)
		}
		if fail {
			return Value{}, sentinel
		}
		return Value{}, nil
	})
	constructor := &Node{
		Form:   "function",
		Header: []Lexeme{runtimeToken(6, userClass, "User")},
		Children: []*Node{
			constructBlock(constructCallStatement(hookKey)),
		},
	}
	executeClassDefinitions(t, runtime, owner, classDefinition(userClass, baseClass, constructBlock(constructor)))
	program, err := Parse(&Preprocessed{Tokens: []Lexeme{
		runtimeToken(990, 0, "new"), runtimeToken(6, userClass, "User"),
		runtimeToken(101, 0, "("), runtimeToken(980, 0, ")"),
		runtimeToken(1230, 0, ";"),
	}})
	if err != nil {
		t.Fatal(err)
	}
	runtime.CurrentObject = owner
	err = runtime.Execute(program)
	if err == nil || !strings.Contains(err.Error(), sentinel.Error()) {
		t.Fatalf("构造宿主错误未向上传播：%v", err)
	}
	if runtime.CurrentObject != owner || runtime.depth != 0 || runtime.constructDepth != 0 {
		t.Fatal("构造方法失败后没有恢复运行时上下文")
	}

	fail = false
	if err := runtime.Execute(program); err != nil {
		t.Fatalf("清除宿主错误后无法继续执行：%v", err)
	}
	if runtime.CurrentObject != owner || runtime.depth != 0 || runtime.constructDepth != 0 {
		t.Fatal("构造成功后运行时上下文未恢复")
	}
}

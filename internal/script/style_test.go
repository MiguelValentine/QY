package script

import (
	"strings"
	"testing"

	"QY/internal/fc0a"
)

func styleDefinition(name uint32, body *Node) *Node {
	return &Node{
		Form:   "style",
		Token:  Lexeme{Token: fc0a.Token{Kind: 1521}},
		Header: []Lexeme{{Token: fc0a.Token{Kind: 6, Value: name}}},
		Children: []*Node{
			body,
		},
	}
}

func applyStyle(name uint32) *Node {
	return &Node{
		Form:   "apply-style",
		Token:  Lexeme{Token: fc0a.Token{Kind: 1521}},
		Header: []Lexeme{{Token: fc0a.Token{Kind: 6, Value: name}}},
	}
}

func styleCall(key uint32) *Node {
	return &Node{
		Form: "expression",
		Children: []*Node{{
			Form: "call",
			Children: []*Node{{
				Form:  "name",
				Token: runtimeToken(6, key, "style_callback"),
			}},
		}},
	}
}

func executeStyleDefinition(t *testing.T, runtime *Runtime, owner *Object, definitions ...*Node) {
	t.Helper()
	previous := runtime.CurrentObject
	runtime.CurrentObject = owner
	err := runtime.Execute(&Program{Body: definitions})
	runtime.CurrentObject = previous
	if err != nil {
		t.Fatal(err)
	}
}

func TestStyleDeclarationStoresDefinitionWithoutRunningBody(t *testing.T) {
	const (
		styleKey = 701
		hostKey  = 702
	)
	runtime := NewRuntime()
	owner := &Object{}
	calls := 0
	runtime.Register(hostKey, func([]Value) (Value, error) {
		calls++
		return Value{}, nil
	})
	body := constructBlock(styleCall(hostKey))
	executeStyleDefinition(t, runtime, owner, styleDefinition(styleKey, body))

	definition := owner.Classes[styleKey]
	if definition == nil || !definition.Style || definition.Name != styleKey ||
		definition.Body != body || definition.scope != runtime.globals {
		t.Fatalf("样式定义未完整保存：%+v", definition)
	}
	if calls != 0 {
		t.Fatalf("登记样式时执行了定义体，调用次数=%d", calls)
	}
}

func TestApplyStyleUsesCurrentObjectAndFindsParentDefinition(t *testing.T) {
	const (
		styleKey = 711
		hostKey  = 712
	)
	runtime := NewRuntime()
	root := &Object{}
	child := &Object{Owner: root}
	current := &Object{Owner: child}
	var receivers []*Object
	runtime.Register(hostKey, func([]Value) (Value, error) {
		receivers = append(receivers, runtime.CurrentObject)
		return Value{}, nil
	})
	executeStyleDefinition(t, runtime, root,
		styleDefinition(styleKey, constructBlock(styleCall(hostKey))),
	)

	runtime.CurrentObject = current
	if err := runtime.Execute(&Program{Body: []*Node{applyStyle(styleKey)}}); err != nil {
		t.Fatal(err)
	}
	if len(receivers) != 1 || receivers[0] != current {
		t.Fatalf("父级样式未作用于当前对象：receivers=%v current=%p", receivers, current)
	}
	if runtime.CurrentObject != current {
		t.Fatal("样式执行后没有恢复 CurrentObject")
	}
}

func TestApplyStyleCapturesCurrentObjectAsFunctionReceiver(t *testing.T) {
	const (
		styleKey    = 721
		functionKey = 722
	)
	runtime := NewRuntime()
	owner := &Object{}
	current := &Object{Owner: owner, Members: make(map[uint32]*Value)}
	function := &Node{
		Form:  "function",
		Token: runtimeToken(1530, 0, "int"),
		Header: []Lexeme{
			runtimeToken(6, functionKey, "style_method"),
			runtimeToken(101, 0, "("),
			runtimeToken(980, 0, ")"),
		},
		Children: []*Node{constructBlock()},
	}
	executeStyleDefinition(t, runtime, owner,
		styleDefinition(styleKey, constructBlock(function)),
	)

	runtime.CurrentObject = current
	if err := runtime.Execute(&Program{Body: []*Node{applyStyle(styleKey)}}); err != nil {
		t.Fatal(err)
	}
	member := current.Members[functionKey]
	if member == nil || member.Function == nil || member.Function.receiver != current {
		t.Fatalf("样式声明的闭包没有捕获当前实例：%+v", member)
	}
}

func TestStyleReplacementAndInvalidLookupFailures(t *testing.T) {
	const (
		styleKey = 731
		hostKey  = 732
	)
	runtime := NewRuntime()
	owner := &Object{}
	calls := []int{}
	for marker := 1; marker <= 2; marker++ {
		marker := marker
		runtime.Register(hostKey+uint32(marker), func([]Value) (Value, error) {
			calls = append(calls, marker)
			return Value{}, nil
		})
		executeStyleDefinition(t, runtime, owner,
			styleDefinition(styleKey, constructBlock(styleCall(hostKey+uint32(marker)))),
		)
	}
	runtime.CurrentObject = owner
	if err := runtime.Execute(&Program{Body: []*Node{applyStyle(styleKey)}}); err != nil {
		t.Fatal(err)
	}
	if len(calls) != 1 || calls[0] != 2 {
		t.Fatalf("同名样式没有使用最新定义：calls=%v", calls)
	}

	if err := runtime.Execute(&Program{Body: []*Node{applyStyle(styleKey + 1)}}); err == nil ||
		!strings.Contains(err.Error(), "未登记样式") {
		t.Fatalf("未登记样式未返回明确错误：%v", err)
	}
	owner.Classes[styleKey+2] = &Class{Name: styleKey + 2}
	if err := runtime.Execute(&Program{Body: []*Node{applyStyle(styleKey + 2)}}); err == nil ||
		!strings.Contains(err.Error(), "将类作为样式") {
		t.Fatalf("普通类被错误当作样式应用：%v", err)
	}
}

func TestApplyStyleRejectsOwnerCyclesAndRecursiveDepth(t *testing.T) {
	const (
		styleKey = 741
	)
	runtime := NewRuntime()
	owner := &Object{}
	executeStyleDefinition(t, runtime, owner,
		styleDefinition(styleKey, constructBlock(applyStyle(styleKey))),
	)

	runtime.CurrentObject = owner
	if err := runtime.Execute(&Program{Body: []*Node{applyStyle(styleKey)}}); err == nil ||
		!strings.Contains(err.Error(), "深度超过限制") {
		t.Fatalf("递归样式没有触发深度限制：%v", err)
	}

	cycleA := &Object{}
	cycleB := &Object{Owner: cycleA}
	cycleA.Owner = cycleB
	runtime.CurrentObject = cycleA
	if err := runtime.Execute(&Program{Body: []*Node{applyStyle(styleKey + 1)}}); err == nil ||
		!strings.Contains(err.Error(), "所属对象链包含循环") {
		t.Fatalf("循环 Owner 链未被拒绝：%v", err)
	}
}

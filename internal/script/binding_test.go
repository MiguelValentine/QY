package script

import (
	"errors"
	"strings"
	"testing"
)

const (
	bindingObjectKey = 1101
	bindingMemberKey = 1102
	bindingNameKey   = 1103
	bindingArgKey    = 1104
	bindingHostKey   = 1105
)

func bindingProgram(t *testing.T, member bool) *Program {
	t.Helper()
	tokens := []Lexeme{}
	if member {
		tokens = append(tokens,
			runtimeToken(6, bindingObjectKey, "object"),
			runtimeToken(940, 0, "."),
			runtimeToken(6, bindingMemberKey, "slot"))
	} else {
		tokens = append(tokens, runtimeToken(6, bindingMemberKey, "slot"))
	}
	tokens = append(tokens,
		runtimeToken(1212, 0, ":="),
		runtimeToken(6, bindingNameKey, "bind"),
		runtimeToken(101, 0, "("),
		runtimeToken(6, bindingArgKey, "argument"),
		runtimeToken(980, 0, ")"),
		runtimeToken(1230, 0, ";"))
	program, err := Parse(&Preprocessed{Tokens: tokens})
	if err != nil {
		t.Fatal(err)
	}
	return program
}

func TestBindingDispatchDoesNotReadLeftOrCallFunction(t *testing.T) {
	for _, member := range []bool{false, true} {
		t.Run(map[bool]string{false: "当前对象", true: "成员对象"}[member], func(t *testing.T) {
			runtime := NewRuntime()
			reads, calls, bindings := 0, 0, 0
			object := &Object{
				ReadMember: func(uint32) (Value, bool, error) {
					reads++
					return Value{}, true, nil
				},
				BindMember: func(key uint32, binding Binding) (Value, bool, error) {
					bindings++
					if key != bindingMemberKey || binding.Name != bindingNameKey ||
						len(binding.Arguments) != 1 || binding.Arguments[0].Integer != 17 {
						t.Fatalf("绑定内容错误：key=%d binding=%+v", key, binding)
					}
					return integer(29), true, nil
				},
			}
			if member {
				runtime.SetGlobal(bindingObjectKey, Value{Kind: "object", Object: object})
			} else {
				runtime.CurrentObject = object
			}
			runtime.SetGlobal(bindingArgKey, integer(17))
			runtime.Register(bindingNameKey, func([]Value) (Value, error) {
				calls++
				return integer(99), nil
			})
			if err := runtime.Execute(bindingProgram(t, member)); err != nil {
				t.Fatal(err)
			}
			if reads != 0 || calls != 0 || bindings != 1 {
				t.Fatalf("读取/普通调用/绑定次数=%d/%d/%d，期望 0/0/1", reads, calls, bindings)
			}
		})
	}
}

func TestBindingMemberReceiverIsEvaluatedOnce(t *testing.T) {
	runtime := NewRuntime()
	receiverCalls, bindings := 0, 0
	object := &Object{BindMember: func(key uint32, binding Binding) (Value, bool, error) {
		bindings++
		if key != bindingMemberKey || binding.Name != bindingNameKey {
			t.Fatalf("绑定目标错误：%d %+v", key, binding)
		}
		return integer(4), true, nil
	}}
	runtime.Register(bindingHostKey, func([]Value) (Value, error) {
		receiverCalls++
		return Value{Kind: "object", Object: object}, nil
	})
	tokens := []Lexeme{
		runtimeToken(6, bindingHostKey, "receiver"),
		runtimeToken(101, 0, "("), runtimeToken(980, 0, ")"),
		runtimeToken(940, 0, "."), runtimeToken(6, bindingMemberKey, "slot"),
		runtimeToken(1212, 0, ":="), runtimeToken(6, bindingNameKey, "bind"),
		runtimeToken(101, 0, "("), runtimeToken(980, 0, ")"),
		runtimeToken(1230, 0, ";"),
	}
	program, err := Parse(&Preprocessed{Tokens: tokens})
	if err != nil {
		t.Fatal(err)
	}
	if err := runtime.Execute(program); err != nil {
		t.Fatal(err)
	}
	if receiverCalls != 1 || bindings != 1 {
		t.Fatalf("接收者求值/绑定次数=%d/%d，期望 1/1", receiverCalls, bindings)
	}
}

func TestNullBindingDispatchesExplicitClear(t *testing.T) {
	for _, member := range []bool{false, true} {
		program := bindingProgram(t, member)
		binary := program.Body[0].Children[0]
		binary.Children[1] = &Node{Form: "literal", Token: runtimeToken(1523, 1, "null")}
		calls := 0
		object := &Object{BindMember: func(key uint32, binding Binding) (Value, bool, error) {
			calls++
			if key != bindingMemberKey || !binding.Clear || binding.Name != 0 || len(binding.Arguments) != 0 {
				t.Fatalf("空绑定分派错误：key=%d binding=%+v", key, binding)
			}
			return Value{Kind: "null"}, true, nil
		}, WriteMember: func(uint32, Value) (bool, error) {
			t.Fatal("空绑定不能执行普通赋值")
			return false, nil
		}}
		runtime := NewRuntime()
		if member {
			runtime.SetGlobal(bindingObjectKey, Value{Kind: "object", Object: object})
		} else {
			runtime.CurrentObject = object
		}
		if err := runtime.Execute(program); err != nil {
			t.Fatal(err)
		}
		if calls != 1 {
			t.Fatalf("空绑定调用次数=%d，期望1", calls)
		}
	}
}

func TestBindingRejectsUnsupportedAndUnhandledTargets(t *testing.T) {
	tests := []struct {
		name   string
		tokens []Lexeme
	}{
		{
			name: "右侧不是名称调用",
			tokens: []Lexeme{
				runtimeToken(6, bindingMemberKey, "slot"), runtimeToken(1212, 0, ":="),
				runtimeToken(2, 1, "1"), runtimeToken(1230, 0, ";"),
			},
		},
	}
	for _, test := range tests {
		t.Run(test.name, func(t *testing.T) {
			program, err := Parse(&Preprocessed{Tokens: test.tokens})
			if err != nil {
				t.Fatal(err)
			}
			runtime := NewRuntime()
			runtime.CurrentObject = &Object{WriteMember: func(uint32, Value) (bool, error) {
				t.Fatal("绑定失败时不得退回普通赋值")
				return false, nil
			}}
			if err := runtime.Execute(program); err == nil {
				t.Fatal("不支持的绑定目标应报错")
			}
		})
	}

	program := bindingProgram(t, false)
	for _, bindMember := range []func(uint32, Binding) (Value, bool, error){
		nil,
		func(uint32, Binding) (Value, bool, error) { return Value{}, false, nil },
	} {
		runtime := NewRuntime()
		runtime.SetGlobal(bindingArgKey, integer(17))
		writes := 0
		callbacks := 0
		object := &Object{WriteMember: func(uint32, Value) (bool, error) {
			writes++
			return true, nil
		}}
		if bindMember != nil {
			object.BindMember = func(key uint32, binding Binding) (Value, bool, error) {
				callbacks++
				return bindMember(key, binding)
			}
		}
		runtime.CurrentObject = object
		err := runtime.Execute(program)
		if err == nil || writes != 0 {
			t.Fatalf("未处理绑定没有失败或执行了普通赋值：writes=%d err=%v", writes, err)
		}
		if bindMember == nil {
			if callbacks != 0 || !strings.Contains(err.Error(), "未实现绑定成员") {
				t.Fatalf("缺失处理器路径错误：callbacks=%d err=%v", callbacks, err)
			}
		} else if callbacks != 1 || !strings.Contains(err.Error(), "未处理绑定成员") {
			t.Fatalf("handled=false 未到达回调或错误不符：callbacks=%d err=%v", callbacks, err)
		}
	}
}

func TestBindingRejectsLexicalLeftAndPreservesHostError(t *testing.T) {
	lexical := bindingProgram(t, false)
	runtime := NewRuntime()
	runtime.SetGlobal(bindingMemberKey, integer(8))
	runtime.CurrentObject = &Object{BindMember: func(uint32, Binding) (Value, bool, error) {
		t.Fatal("词法变量不应被当作宿主绑定目标")
		return Value{}, false, nil
	}}
	if err := runtime.Execute(lexical); err == nil || !strings.Contains(err.Error(), "词法变量") {
		t.Fatalf("词法左值应被拒绝：%v", err)
	}

	sentinel := errors.New("绑定处理失败")
	program := bindingProgram(t, false)
	runtime = NewRuntime()
	runtime.SetGlobal(bindingArgKey, integer(17))
	runtime.CurrentObject = &Object{BindMember: func(uint32, Binding) (Value, bool, error) {
		return Value{}, false, sentinel
	}}
	err := runtime.Execute(program)
	if !errors.Is(err, sentinel) || !strings.Contains(err.Error(), "runtime_test.cod:0x0") {
		t.Fatalf("未保留宿主错误 cause/source：%v", err)
	}
}

func TestBindingRejectsNestedExpressionResult(t *testing.T) {
	tokens := []Lexeme{
		runtimeToken(2, 1, "1"),
		runtimeToken(801, 0, "+"),
		runtimeToken(101, 0, "("),
		runtimeToken(6, bindingMemberKey, "slot"),
		runtimeToken(1212, 0, ":="),
		runtimeToken(6, bindingNameKey, "bind"),
		runtimeToken(101, 0, "("),
		runtimeToken(980, 0, ")"),
		runtimeToken(980, 0, ")"),
		runtimeToken(1230, 0, ";"),
	}
	program, err := Parse(&Preprocessed{Tokens: tokens})
	if err != nil {
		t.Fatal(err)
	}
	bindings := 0
	runtime := NewRuntime()
	runtime.CurrentObject = &Object{BindMember: func(uint32, Binding) (Value, bool, error) {
		bindings++
		return integer(99), true, nil
	}}
	err = runtime.Execute(program)
	if err == nil || !strings.Contains(err.Error(), "绑定赋值的表达式结果语义尚未恢复") {
		t.Fatalf("嵌套绑定应返回明确语义错误：%v", err)
	}
	if bindings != 0 {
		t.Fatalf("嵌套绑定错误地调用了宿主处理器 %d 次", bindings)
	}
}

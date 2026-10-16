package script

import (
	"strings"
	"testing"
)

const (
	namedBindingMember = uint32(0x11b4b1fa)
	namedBindingName   = uint32(0x23a3d969)
	namedBindingCall   = uint32(0xf77272f2)
)

func namedBindingProgram(instance Lexeme, clear bool) (*Program, error) {
	tokens := []Lexeme{
		runtimeToken(6, namedBindingMember, "ctrl"),
		runtimeToken(1241, 0, "~"),
		instance,
		runtimeToken(1212, 0, ":="),
	}
	if clear {
		tokens = append(tokens, runtimeToken(1523, 1, "null"))
	} else {
		tokens = append(tokens,
			runtimeToken(6, namedBindingCall, "OnPlayMid"),
			runtimeToken(101, 0, "("),
			runtimeToken(980, 0, ")"),
		)
	}
	tokens = append(tokens, runtimeToken(1230, 0, ";"))
	return Parse(&Preprocessed{Tokens: tokens})
}

func TestNamedBindingPassesStaticNameHashWithoutResolvingIt(t *testing.T) {
	program, err := namedBindingProgram(runtimeToken(6, namedBindingName, "instanceName"), false)
	if err != nil {
		t.Fatal(err)
	}
	runtime := NewRuntime()
	runtime.SetGlobal(namedBindingName, integer(77))
	var got Binding
	runtime.CurrentObject = &Object{BindMember: func(key uint32, binding Binding) (Value, bool, error) {
		if key != namedBindingMember {
			t.Fatalf("绑定成员哈希=%#x，期望 %#x", key, namedBindingMember)
		}
		got = binding
		return Value{Kind: "null"}, true, nil
	}}
	if err := runtime.Execute(program); err != nil {
		t.Fatal(err)
	}
	if got.Instance != namedBindingName || got.Instance == 77 ||
		got.Name != namedBindingCall || got.Clear {
		t.Fatalf("命名绑定没有保留静态哈希：%+v", got)
	}
}

func TestNamedBindingPassesIntegerInstanceAndClearRetainsIt(t *testing.T) {
	for _, clear := range []bool{false, true} {
		name := "调用"
		if clear {
			name = "清除"
		}
		t.Run(name, func(t *testing.T) {
			program, err := namedBindingProgram(runtimeToken(2, 17, "17"), clear)
			if err != nil {
				t.Fatal(err)
			}
			var got Binding
			runtime := NewRuntime()
			runtime.CurrentObject = &Object{BindMember: func(_ uint32, binding Binding) (Value, bool, error) {
				got = binding
				return Value{Kind: "null"}, true, nil
			}}
			if err := runtime.Execute(program); err != nil {
				t.Fatal(err)
			}
			if got.Instance != 17 || got.Clear != clear {
				t.Fatalf("实例/清除标志错误：%+v", got)
			}
			if clear {
				if got.Name != 0 || len(got.Arguments) != 0 {
					t.Fatalf("清除绑定残留调用信息：%+v", got)
				}
			} else if got.Name != namedBindingCall {
				t.Fatalf("绑定调用名称错误：%+v", got)
			}
		})
	}
}

func TestNamedBindingRejectsNonStaticInstanceForms(t *testing.T) {
	program, err := namedBindingProgram(runtimeToken(3, 17, `"17"`), false)
	if err != nil {
		t.Fatal(err)
	}
	runtime := NewRuntime()
	calls := 0
	runtime.CurrentObject = &Object{BindMember: func(uint32, Binding) (Value, bool, error) {
		calls++
		return Value{Kind: "null"}, true, nil
	}}
	err = runtime.Execute(program)
	if err == nil || !strings.Contains(err.Error(), "命名绑定需要静态名称或整数字面值") {
		t.Fatalf("不支持的实例形式未报错：%v", err)
	}
	if calls != 0 {
		t.Fatalf("实例形式校验失败后仍调用宿主：%d", calls)
	}
}

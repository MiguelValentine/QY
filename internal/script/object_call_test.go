package script

import (
	"errors"
	"strings"
	"testing"
)

func callProgram(t *testing.T, member bool) *Program {
	t.Helper()
	tokens := []Lexeme{}
	if member {
		tokens = append(tokens, runtimeToken(6, 80, "object"), runtimeToken(940, 0, "."))
	}
	tokens = append(tokens,
		runtimeToken(6, 90, "method"), runtimeToken(101, 0, "("),
		runtimeToken(2, 7, "7"), runtimeToken(980, 0, ")"), runtimeToken(1230, 0, ";"))
	program, err := Parse(&Preprocessed{Tokens: tokens})
	if err != nil {
		t.Fatal(err)
	}
	return program
}

func TestObjectCallDispatchAndGlobalFallback(t *testing.T) {
	for _, member := range []bool{false, true} {
		t.Run(map[bool]string{false: "隐式对象", true: "显式对象"}[member], func(t *testing.T) {
			program := callProgram(t, member)
			runtime := NewRuntime()
			calls, globals := 0, 0
			handled := true
			sentinel := errors.New("对象调用失败")
			var failure error
			object := &Object{CallMember: func(key uint32, args []Value) (Value, bool, error) {
				calls++
				if key != 90 || len(args) != 1 || args[0].Integer != 7 {
					t.Fatalf("分派键或实参错误：%d %+v", key, args)
				}
				return integer(12), handled, failure
			}}
			runtime.CurrentObject = object
			runtime.SetGlobal(80, Value{Kind: "object", Object: object})
			runtime.Register(90, func([]Value) (Value, error) {
				globals++
				return integer(99), nil
			})
			if err := runtime.Execute(program); err != nil || calls != 1 || globals != 0 {
				t.Fatalf("对象调用未先处理：calls=%d globals=%d err=%v", calls, globals, err)
			}
			failure = sentinel
			if err := runtime.Execute(program); !errors.Is(err, sentinel) || !strings.Contains(err.Error(), "runtime_test.cod:") || globals != 0 {
				t.Fatalf("对象错误没有保留位置与错误链：%v", err)
			}
			failure, handled = nil, false
			err := runtime.Execute(program)
			if member {
				if err == nil || !strings.Contains(err.Error(), "未定义成员") || globals != 0 {
					t.Fatalf("显式对象泄漏到全局函数：%d %v", globals, err)
				}
			} else if err != nil || globals != 1 {
				t.Fatalf("隐式对象未处理时没有回退：%d %v", globals, err)
			}
		})
	}
}

func TestBoundNonFunctionDoesNotFallThroughToCurrentObject(t *testing.T) {
	runtime := NewRuntime()
	runtime.SetGlobal(90, integer(1))
	runtime.CurrentObject = &Object{CallMember: func(uint32, []Value) (Value, bool, error) {
		t.Fatal("已绑定变量不应进入隐式对象分派")
		return Value{}, false, nil
	}}
	if err := runtime.Execute(callProgram(t, false)); err == nil || !strings.Contains(err.Error(), "调用目标不是函数") {
		t.Fatalf("非函数变量未拒绝：%v", err)
	}
}

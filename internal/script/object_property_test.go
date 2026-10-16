package script

import (
	"errors"
	"strings"
	"testing"
)

const (
	propertyObjectKey = 901
	propertyMemberKey = 902
)

func propertyProgram(t *testing.T, tokens ...Lexeme) *Program {
	t.Helper()
	program, err := Parse(&Preprocessed{Tokens: tokens})
	if err != nil {
		t.Fatal(err)
	}
	return program
}

func propertyTokens() []Lexeme {
	return []Lexeme{
		runtimeToken(6, propertyObjectKey, "obj"),
		runtimeToken(940, 0, "."),
		runtimeToken(6, propertyMemberKey, "value"),
	}
}

func TestObjectSetterOnlySimpleAssignmentDoesNotRead(t *testing.T) {
	tokens := append(propertyTokens(),
		runtimeToken(200, 0, "="), runtimeToken(2, 7, "7"),
		runtimeToken(1230, 0, ";"))
	program := propertyProgram(t, tokens...)
	runtime := NewRuntime()
	reads, writes := 0, 0
	runtime.SetGlobal(propertyObjectKey, Value{
		Kind: "object",
		Object: &Object{
			ReadMember: func(uint32) (Value, bool, error) {
				reads++
				return Value{}, true, nil
			},
			WriteMember: func(key uint32, value Value) (bool, error) {
				writes++
				return key == propertyMemberKey && value.Integer == 7, nil
			},
		},
	})
	if err := runtime.Execute(program); err != nil {
		t.Fatal(err)
	}
	if reads != 0 || writes != 1 {
		t.Fatalf("纯赋值读写次数为 %d/%d，期望 0/1", reads, writes)
	}
}

func TestObjectCompoundAssignmentAndIncrementReadAndWriteOnce(t *testing.T) {
	tokens := []Lexeme{}
	tokens = append(tokens, propertyTokens()...)
	tokens = append(tokens,
		runtimeToken(201, 0, "+="), runtimeToken(2, 2, "2"),
		runtimeToken(1230, 0, ";"))
	tokens = append(tokens, runtimeToken(302, 0, "++"))
	tokens = append(tokens, propertyTokens()...)
	tokens = append(tokens, runtimeToken(1230, 0, ";"))
	tokens = append(tokens, propertyTokens()...)
	tokens = append(tokens, runtimeToken(302, 0, "++"), runtimeToken(1230, 0, ";"))
	program := propertyProgram(t, tokens...)
	runtime := NewRuntime()
	reads, writes := 0, 0
	current := int32(10)
	runtime.SetGlobal(propertyObjectKey, Value{
		Kind: "object",
		Object: &Object{
			ReadMember: func(key uint32) (Value, bool, error) {
				reads++
				return integer(current), key == propertyMemberKey, nil
			},
			WriteMember: func(key uint32, value Value) (bool, error) {
				writes++
				if key != propertyMemberKey {
					return false, nil
				}
				current = value.Integer
				return true, nil
			},
		},
	})
	if err := runtime.Execute(program); err != nil {
		t.Fatal(err)
	}
	if reads != 3 || writes != 3 || current != 14 {
		t.Fatalf("读写次数=%d/%d，最终值=%d，期望 3/3/14", reads, writes, current)
	}
}

func TestObjectPropertyErrorsKeepCauseAndSource(t *testing.T) {
	sentinel := errors.New("宿主属性读取失败")
	tokens := append(propertyTokens(), runtimeToken(1230, 0, ";"))
	runtime := NewRuntime()
	runtime.SetGlobal(propertyObjectKey, Value{
		Kind: "object",
		Object: &Object{
			ReadMember: func(uint32) (Value, bool, error) {
				return Value{}, false, sentinel
			},
		},
	})
	err := runtime.Execute(propertyProgram(t, tokens...))
	if !errors.Is(err, sentinel) || !strings.Contains(err.Error(), "runtime_test.cod:0x0") {
		t.Fatalf("属性读取错误未保留 cause/source：%v", err)
	}

	writeFailure := errors.New("宿主属性写入失败")
	assignment := append(propertyTokens(),
		runtimeToken(200, 0, "="), runtimeToken(2, 1, "1"),
		runtimeToken(1230, 0, ";"))
	runtime = NewRuntime()
	runtime.SetGlobal(propertyObjectKey, Value{
		Kind: "object",
		Object: &Object{
			WriteMember: func(uint32, Value) (bool, error) {
				return false, writeFailure
			},
		},
	})
	err = runtime.Execute(propertyProgram(t, assignment...))
	if !errors.Is(err, writeFailure) || !strings.Contains(err.Error(), "runtime_test.cod:0x0") {
		t.Fatalf("属性写入错误未保留 cause/source：%v", err)
	}
}

func TestObjectUnknownPropertyIsNotCreated(t *testing.T) {
	tokens := append(propertyTokens(),
		runtimeToken(200, 0, "="), runtimeToken(2, 1, "1"),
		runtimeToken(1230, 0, ";"))
	runtime := NewRuntime()
	object := &Object{Members: make(map[uint32]*Value)}
	runtime.SetGlobal(propertyObjectKey, Value{Kind: "object", Object: object})
	err := runtime.Execute(propertyProgram(t, tokens...))
	if err == nil || !strings.Contains(err.Error(), "未定义成员") {
		t.Fatalf("未知属性赋值应失败，错误=%v", err)
	}
	if _, exists := object.Members[propertyMemberKey]; exists {
		t.Fatal("未知属性赋值自动创建了脚本成员")
	}
}

func TestCurrentObjectBarePropertyReadWriteAndReadOnly(t *testing.T) {
	const barePropertyKey = 903
	readTokens := []Lexeme{
		runtimeToken(6, barePropertyKey, "host_value"),
		runtimeToken(1230, 0, ";"),
	}
	writeTokens := []Lexeme{
		runtimeToken(6, barePropertyKey, "host_value"),
		runtimeToken(200, 0, "="),
		runtimeToken(2, 12, "12"),
		runtimeToken(1230, 0, ";"),
	}
	runtime := NewRuntime()
	reads, writes := 0, 0
	current := int32(5)
	runtime.CurrentObject = &Object{
		ReadMember: func(key uint32) (Value, bool, error) {
			reads++
			return integer(current), key == barePropertyKey, nil
		},
		WriteMember: func(key uint32, value Value) (bool, error) {
			writes++
			if key != barePropertyKey {
				return false, nil
			}
			current = value.Integer
			return true, nil
		},
	}
	if err := runtime.Execute(propertyProgram(t, readTokens...)); err != nil {
		t.Fatal(err)
	}
	if err := runtime.Execute(propertyProgram(t, writeTokens...)); err != nil {
		t.Fatal(err)
	}
	if reads != 1 || writes != 1 || current != 12 {
		t.Fatalf("裸属性读写次数=%d/%d，最终值=%d，期望 1/1/12", reads, writes, current)
	}

	readOnly := errors.New("宿主属性只读")
	runtime.CurrentObject = &Object{
		ReadMember: func(key uint32) (Value, bool, error) {
			return integer(1), key == barePropertyKey, nil
		},
		WriteMember: func(key uint32, _ Value) (bool, error) {
			if key == barePropertyKey {
				return false, readOnly
			}
			return false, nil
		},
	}
	err := runtime.Execute(propertyProgram(t, writeTokens...))
	if !errors.Is(err, readOnly) || !strings.Contains(err.Error(), "runtime_test.cod:0x0") {
		t.Fatalf("只读裸属性未拒绝写入或丢失错误上下文：%v", err)
	}
}

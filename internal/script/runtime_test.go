package script

import (
	"errors"
	"strings"
	"testing"
)

func TestRuntimeInitializesDirectivesInOrderBeforeStatements(t *testing.T) {
	program := &Program{
		Directives: []Directive{
			{Kind: 1650, Source: "root.cod", Offset: 10},
			{Kind: 1620, Source: "child.cod", Offset: 20},
		},
		Body: []*Node{{Form: "empty"}},
	}
	runtime := NewRuntime()
	if err := runtime.Execute(program); err == nil || !strings.Contains(err.Error(), "root.cod:0xa") {
		t.Fatalf("缺少宿主时未拒绝指令：%v", err)
	}
	sentinel := errors.New("宿主初始化失败")
	calls := 0
	runtime.HandleDirective = func(directive Directive) error {
		calls++
		if calls == 1 && directive.Source == "root.cod" {
			return nil
		}
		return sentinel
	}
	err := runtime.Execute(program)
	if !errors.Is(err, sentinel) || !strings.Contains(err.Error(), "child.cod:0x14") ||
		calls != 2 || runtime.steps != 0 {
		t.Fatalf("指令错误、顺序或初始化边界不正确：calls=%d steps=%d err=%v", calls, runtime.steps, err)
	}
}

func runtimeToken(kind uint16, value uint32, text string) Lexeme {
	return testLexeme(kind, value, "runtime_test.cod", text)
}

func executeTokens(t *testing.T, tokens ...Lexeme) (*Runtime, error) {
	t.Helper()
	program, err := Parse(&Preprocessed{Tokens: tokens})
	if err != nil {
		return nil, err
	}
	runtime := NewRuntime()
	return runtime, runtime.Execute(program)
}

func TestRuntimeFunctionScopeReturnAndDefaultArgument(t *testing.T) {
	tokens := []Lexeme{
		runtimeToken(1530, 0, "int"), runtimeToken(6, 1, "sum"),
		runtimeToken(101, 0, "("), runtimeToken(1530, 0, "int"),
		runtimeToken(6, 2, "x"), runtimeToken(200, 0, "="),
		runtimeToken(2, 2, "2"), runtimeToken(980, 0, ")"),
		runtimeToken(1100, 0, "{"),
		runtimeToken(1530, 0, "int"), runtimeToken(6, 3, "local"),
		runtimeToken(200, 0, "="), runtimeToken(6, 2, "x"),
		runtimeToken(801, 0, "+"), runtimeToken(2, 5, "5"),
		runtimeToken(1230, 0, ";"),
		runtimeToken(1514, 0, "return"), runtimeToken(6, 3, "local"),
		runtimeToken(1230, 0, ";"), runtimeToken(1101, 0, "}"),
		runtimeToken(1530, 0, "int"), runtimeToken(6, 4, "with_arg"),
		runtimeToken(200, 0, "="), runtimeToken(6, 1, "sum"),
		runtimeToken(101, 0, "("), runtimeToken(2, 7, "7"),
		runtimeToken(980, 0, ")"), runtimeToken(1230, 0, ";"),
		runtimeToken(1530, 0, "int"), runtimeToken(6, 5, "with_default"),
		runtimeToken(200, 0, "="), runtimeToken(6, 1, "sum"),
		runtimeToken(101, 0, "("), runtimeToken(980, 0, ")"),
		runtimeToken(1230, 0, ";"),
	}
	runtime, err := executeTokens(t, tokens...)
	if err != nil {
		t.Fatal(err)
	}
	for key, want := range map[uint32]int32{4: 12, 5: 7} {
		value, ok := runtime.Global(key)
		if !ok || value.Kind != "int" || value.Integer != want {
			t.Errorf("全局变量 %#x=(%+v,%t)，期望整数 %d", key, value, ok, want)
		}
	}
	if _, ok := runtime.Global(3); ok {
		t.Fatal("函数局部变量泄漏到了全局作用域")
	}
}

func TestRuntimeForContinueAndBreak(t *testing.T) {
	tokens := []Lexeme{
		runtimeToken(1530, 0, "int"), runtimeToken(6, 1, "sum"),
		runtimeToken(200, 0, "="), runtimeToken(2, 0, "0"),
		runtimeToken(1230, 0, ";"),
		runtimeToken(1502, 0, "for"), runtimeToken(101, 0, "("),
		runtimeToken(1530, 0, "int"), runtimeToken(6, 2, "i"),
		runtimeToken(200, 0, "="), runtimeToken(2, 0, "0"),
		runtimeToken(1230, 0, ";"),
		runtimeToken(6, 2, "i"), runtimeToken(603, 0, "<"),
		runtimeToken(2, 10, "10"), runtimeToken(1230, 0, ";"),
		runtimeToken(6, 2, "i"), runtimeToken(302, 0, "++"),
		runtimeToken(980, 0, ")"), runtimeToken(1100, 0, "{"),
		runtimeToken(1500, 0, "if"), runtimeToken(101, 0, "("),
		runtimeToken(6, 2, "i"), runtimeToken(500, 0, "=="),
		runtimeToken(2, 2, "2"), runtimeToken(980, 0, ")"),
		runtimeToken(1503, 0, "continue"), runtimeToken(1230, 0, ";"),
		runtimeToken(1500, 0, "if"), runtimeToken(101, 0, "("),
		runtimeToken(6, 2, "i"), runtimeToken(500, 0, "=="),
		runtimeToken(2, 5, "5"), runtimeToken(980, 0, ")"),
		runtimeToken(1512, 0, "break"), runtimeToken(1230, 0, ";"),
		runtimeToken(6, 1, "sum"), runtimeToken(201, 0, "+="),
		runtimeToken(6, 2, "i"), runtimeToken(1230, 0, ";"),
		runtimeToken(1101, 0, "}"),
	}
	runtime, err := executeTokens(t, tokens...)
	if err != nil {
		t.Fatal(err)
	}
	value, ok := runtime.Global(1)
	if !ok || value.Integer != 8 {
		t.Fatalf("循环累计值=(%+v,%t)，期望 8", value, ok)
	}
}

func TestRuntimeHostArgumentsAndShortCircuit(t *testing.T) {
	const hostKey = 90
	tokens := []Lexeme{
		runtimeToken(6, hostKey, "host"),
		runtimeToken(101, 0, "("), runtimeToken(2, 7, "7"),
		runtimeToken(213, 0, ","), runtimeToken(2, 8, "8"),
		runtimeToken(980, 0, ")"), runtimeToken(1230, 0, ";"),
		runtimeToken(2, 0, "0"), runtimeToken(301, 0, "&&"),
		runtimeToken(6, hostKey, "host"), runtimeToken(101, 0, "("),
		runtimeToken(2, 1, "1"), runtimeToken(980, 0, ")"),
		runtimeToken(1230, 0, ";"),
		runtimeToken(2, 1, "1"), runtimeToken(300, 0, "||"),
		runtimeToken(2, 1, "1"), runtimeToken(852, 0, "/"),
		runtimeToken(2, 0, "0"), runtimeToken(1230, 0, ";"),
	}
	program, err := Parse(&Preprocessed{Tokens: tokens})
	if err != nil {
		t.Fatal(err)
	}
	runtime := NewRuntime()
	calls := 0
	runtime.Register(hostKey, func(arguments []Value) (Value, error) {
		calls++
		if len(arguments) == 1 {
			return integer(99), nil
		}
		if len(arguments) != 2 || arguments[0].Integer != 7 || arguments[1].Integer != 8 {
			t.Fatalf("宿主实参错误：%+v", arguments)
		}
		return integer(15), nil
	})
	if err := runtime.Execute(program); err != nil {
		t.Fatal(err)
	}
	if calls != 1 {
		t.Fatalf("短路表达式调用了宿主函数，调用次数=%d", calls)
	}
}

func TestRuntimeStepAndRecursionLimits(t *testing.T) {
	t.Run("步数限制", func(t *testing.T) {
		program, err := Parse(&Preprocessed{Tokens: []Lexeme{
			runtimeToken(1502, 0, "for"), runtimeToken(101, 0, "("),
			runtimeToken(1230, 0, ";"), runtimeToken(1230, 0, ";"),
			runtimeToken(980, 0, ")"), runtimeToken(1100, 0, "{"),
			runtimeToken(1101, 0, "}"),
		}})
		if err != nil {
			t.Fatal(err)
		}
		runtime := NewRuntime()
		runtime.MaxSteps = 12
		err = runtime.Execute(program)
		if err == nil || !strings.Contains(err.Error(), "执行步数超过限制") {
			t.Fatalf("无限循环应触发步数限制，错误=%v", err)
		}
	})

	t.Run("递归深度限制", func(t *testing.T) {
		tokens := []Lexeme{
			runtimeToken(1530, 0, "int"), runtimeToken(6, 1, "recurse"),
			runtimeToken(101, 0, "("), runtimeToken(1530, 0, "int"),
			runtimeToken(6, 2, "n"), runtimeToken(980, 0, ")"),
			runtimeToken(1100, 0, "{"),
			runtimeToken(1500, 0, "if"), runtimeToken(101, 0, "("),
			runtimeToken(6, 2, "n"), runtimeToken(602, 0, ">"),
			runtimeToken(2, 0, "0"), runtimeToken(980, 0, ")"),
			runtimeToken(1514, 0, "return"), runtimeToken(6, 1, "recurse"),
			runtimeToken(101, 0, "("), runtimeToken(6, 2, "n"),
			runtimeToken(802, 0, "-"), runtimeToken(2, 1, "1"),
			runtimeToken(980, 0, ")"), runtimeToken(1230, 0, ";"),
			runtimeToken(1514, 0, "return"), runtimeToken(2, 0, "0"),
			runtimeToken(1230, 0, ";"), runtimeToken(1101, 0, "}"),
			runtimeToken(6, 1, "recurse"), runtimeToken(101, 0, "("),
			runtimeToken(2, 200, "200"), runtimeToken(980, 0, ")"),
			runtimeToken(1230, 0, ";"),
		}
		_, err := executeTokens(t, tokens...)
		if err == nil || !strings.Contains(err.Error(), "函数调用深度超过限制") {
			t.Fatalf("递归应触发调用深度限制，错误=%v", err)
		}
	})
}

func TestRuntimePreservesRawStringBytes(t *testing.T) {
	valueToken := runtimeToken(3, 1, "")
	valueToken.Text = []byte{0x41, 0xff, 0x00, 0xe4, 0xb8, 0xad}
	program, err := Parse(&Preprocessed{Tokens: []Lexeme{
		runtimeToken(1531, 0, "string"), runtimeToken(6, 2, "text"),
		runtimeToken(200, 0, "="), valueToken, runtimeToken(1230, 0, ";"),
	}})
	if err != nil {
		t.Fatal(err)
	}
	runtime := NewRuntime()
	if err := runtime.Execute(program); err != nil {
		t.Fatal(err)
	}
	value, ok := runtime.Global(2)
	want := []byte{0x41, 0xff, 0x00, 0xe4, 0xb8, 0xad}
	if !ok || value.Kind != "string" || string(value.Text) != string(want) {
		t.Fatalf("字符串字节被改变：(%+v,%t)，期望 %v", value, ok, want)
	}
	valueToken.Text[0] = 0x42
	if string(value.Text) != string(want) {
		t.Fatal("运行时字符串与输入 token 共享可变字节")
	}
}

func TestRuntimeUnrestoredOperationsReturnErrors(t *testing.T) {
	tests := []struct {
		name  string
		token []Lexeme
		want  string
	}{
		{
			name: "对象构造",
			token: []Lexeme{
				runtimeToken(990, 0, "new"), runtimeToken(6, 1, "Thing"),
				runtimeToken(1230, 0, ";"),
			},
			want: "尚未实现或登记的对象类",
		},
		{
			name: "未登记宿主函数",
			token: []Lexeme{
				runtimeToken(6, 77, "unknown"), runtimeToken(101, 0, "("),
				runtimeToken(980, 0, ")"), runtimeToken(1230, 0, ";"),
			},
			want: "尚未实现的宿主调用",
		},
	}
	for _, test := range tests {
		t.Run(test.name, func(t *testing.T) {
			_, err := executeTokens(t, test.token...)
			if err == nil || !strings.Contains(err.Error(), test.want) {
				t.Fatalf("未恢复行为应明确报错，错误=%v，期望包含 %q", err, test.want)
			}
		})
	}
}

func TestRuntimeSwitchFallthroughBreakAndDefault(t *testing.T) {
	for input, want := range map[uint32]int32{1: 30, 2: 20, 3: 40} {
		tokens := []Lexeme{
			runtimeToken(1530, 0, ""), runtimeToken(6, 1, ""),
			runtimeToken(1230, 0, ""),
			runtimeToken(1510, 0, ""), runtimeToken(101, 0, ""),
			runtimeToken(2, input, ""), runtimeToken(980, 0, ""),
			runtimeToken(1100, 0, ""),
			runtimeToken(1511, 0, ""), runtimeToken(2, 1, ""), runtimeToken(1220, 0, ""),
			runtimeToken(6, 1, ""), runtimeToken(201, 0, ""), runtimeToken(2, 10, ""), runtimeToken(1230, 0, ""),
			runtimeToken(1511, 0, ""), runtimeToken(2, 2, ""), runtimeToken(1220, 0, ""),
			runtimeToken(6, 1, ""), runtimeToken(201, 0, ""), runtimeToken(2, 20, ""), runtimeToken(1230, 0, ""),
			runtimeToken(1512, 0, ""), runtimeToken(1230, 0, ""),
			runtimeToken(1513, 0, ""), runtimeToken(1220, 0, ""),
			runtimeToken(6, 1, ""), runtimeToken(200, 0, ""), runtimeToken(2, 40, ""), runtimeToken(1230, 0, ""),
			runtimeToken(1101, 0, ""),
		}
		runtime, err := executeTokens(t, tokens...)
		if err != nil {
			t.Fatal(err)
		}
		value, ok := runtime.Global(1)
		if !ok || value.Integer != want {
			t.Fatalf("switch(%d) 得到 %+v，期望 %d", input, value, want)
		}
	}
}

func TestRuntimeNativeArithmeticTokenNumbers(t *testing.T) {
	for _, test := range []struct {
		kind uint16
		want int32
	}{
		{850, 2},
		{851, 51},
		{852, 5},
	} {
		runtime, err := executeTokens(t,
			runtimeToken(1530, 0, ""), runtimeToken(6, 1, ""),
			runtimeToken(200, 0, ""), runtimeToken(2, 17, ""),
			runtimeToken(test.kind, 0, ""), runtimeToken(2, 3, ""),
			runtimeToken(1230, 0, ""),
		)
		if err != nil {
			t.Fatal(err)
		}
		value, _ := runtime.Global(1)
		if value.Integer != test.want {
			t.Errorf("原生运算符 kind=%d 结果=%d，期望 %d", test.kind, value.Integer, test.want)
		}
	}
	for _, test := range []struct {
		kind uint16
		want int32
	}{
		{203, 51},
		{204, 5},
		{205, 2},
	} {
		runtime, err := executeTokens(t,
			runtimeToken(1530, 0, ""), runtimeToken(6, 1, ""),
			runtimeToken(200, 0, ""), runtimeToken(2, 17, ""), runtimeToken(1230, 0, ""),
			runtimeToken(6, 1, ""), runtimeToken(test.kind, 0, ""),
			runtimeToken(2, 3, ""), runtimeToken(1230, 0, ""),
		)
		if err != nil {
			t.Fatal(err)
		}
		value, _ := runtime.Global(1)
		if value.Integer != test.want {
			t.Errorf("原生复合运算符 kind=%d 结果=%d，期望 %d", test.kind, value.Integer, test.want)
		}
	}
}

func TestRuntimeClosureReadsCapturedScope(t *testing.T) {
	program, err := Parse(&Preprocessed{Tokens: []Lexeme{
		runtimeToken(6, 1, ""), runtimeToken(200, 0, ""), runtimeToken(1100, 0, ""),
		runtimeToken(1514, 0, ""), runtimeToken(6, 2, ""), runtimeToken(801, 0, ""),
		runtimeToken(2, 1, ""), runtimeToken(1230, 0, ""), runtimeToken(1101, 0, ""),
		runtimeToken(1230, 0, ""),
		runtimeToken(6, 2, ""), runtimeToken(200, 0, ""), runtimeToken(2, 8, ""), runtimeToken(1230, 0, ""),
		runtimeToken(6, 3, ""), runtimeToken(200, 0, ""), runtimeToken(6, 1, ""),
		runtimeToken(101, 0, ""), runtimeToken(980, 0, ""), runtimeToken(1230, 0, ""),
	}})
	if err != nil {
		t.Fatal(err)
	}
	runtime := NewRuntime()
	for _, key := range []uint32{1, 2, 3} {
		runtime.SetGlobal(key, integer(0))
	}
	if err := runtime.Execute(program); err != nil {
		t.Fatal(err)
	}
	value, _ := runtime.Global(3)
	if value.Integer != 9 {
		t.Fatalf("闭包没有读取定义作用域中的更新值：%+v", value)
	}
}

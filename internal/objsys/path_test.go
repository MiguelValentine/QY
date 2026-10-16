package objsys

import (
	"testing"

	"QY/internal/fc0a"
	"QY/internal/script"
	"QY/internal/symbol"
)

func bindPathForTest(t *testing.T, wnd *Wnd, selector uint32, args ...script.Value) *PathController {
	t.Helper()
	_, handled, err := wnd.Object.BindMember(pathBindingKey, script.Binding{
		Name:      selector,
		Arguments: args,
	})
	if err != nil || !handled {
		t.Fatalf("绑定 path 失败：handled=%t，错误=%v", handled, err)
	}
	if wnd.Path == nil {
		t.Fatal("path 控制器未安装")
	}
	return wnd.Path
}

func TestPathSelectorsApplyDifferentOffsets(t *testing.T) {
	wnd := NewWnd(nil)
	first := bindPathForTest(t, wnd, pathSelectorOffset,
		script.Value{Kind: "int", Integer: 5},
		script.Value{Kind: "int", Integer: -7},
		script.Value{Kind: "int", Integer: 3},
	)
	if wnd.X != 5 || wnd.Y != -7 || first.targetX != -5 || first.targetY != 7 {
		t.Fatalf("偏移 selector 状态：位置=(%d,%d)，目标=(%d,%d)",
			wnd.X, wnd.Y, first.targetX, first.targetY)
	}
	for i := 0; i < 8 && !first.finished; i++ {
		if err := first.update(nil); err != nil {
			t.Fatal(err)
		}
	}
	if wnd.X != 0 || wnd.Y != 0 {
		t.Fatalf("偏移 selector 完成后位置=(%d,%d)，期望回到原位置", wnd.X, wnd.Y)
	}

	wnd = NewWnd(nil)
	second := bindPathForTest(t, wnd, pathSelectorTarget,
		script.Value{Kind: "int", Integer: 5},
		script.Value{Kind: "int", Integer: -7},
		script.Value{Kind: "int", Integer: 3},
	)
	if wnd.X != 0 || wnd.Y != 0 || second.targetX != 5 || second.targetY != -7 {
		t.Fatalf("目标 selector 状态：位置=(%d,%d)，目标=(%d,%d)",
			wnd.X, wnd.Y, second.targetX, second.targetY)
	}
	for i := 0; i < 8 && !second.finished; i++ {
		if err := second.update(nil); err != nil {
			t.Fatal(err)
		}
	}
	if wnd.X != 5 || wnd.Y != -7 {
		t.Fatalf("目标 selector 完成后位置=(%d,%d)，期望 (5,-7)", wnd.X, wnd.Y)
	}
}

func TestPathStepIntegerInterpolationAndNormalization(t *testing.T) {
	tests := []struct {
		name              string
		current, target   int32
		divisor, expected int32
	}{
		{name: "有符号除法向零截断后强制前进", current: 10, target: 0, divisor: 3, expected: 6},
		{name: "反向推进", current: 0, target: 10, divisor: 3, expected: 4},
		{name: "除数不大于一时直达", current: 10, target: 4, divisor: 1, expected: 4},
	}
	for _, test := range tests {
		t.Run(test.name, func(t *testing.T) {
			if got := pathStep(test.current, test.target, test.divisor); got != test.expected {
				t.Fatalf("pathStep(%d,%d,%d)=%d，期望 %d",
					test.current, test.target, test.divisor, got, test.expected)
			}
		})
	}
	defaultDivisor := bindPathForTest(t, NewWnd(nil), pathSelectorTarget,
		script.Value{Kind: "int", Integer: 9},
		script.Value{Kind: "int", Integer: 0},
	)
	if defaultDivisor.divisor != 5 {
		t.Fatalf("省略除数后为 %d，期望默认 5", defaultDivisor.divisor)
	}
	for _, divisor := range []int32{-4, 0} {
		wnd := NewWnd(nil)
		controller := bindPathForTest(t, wnd, pathSelectorTarget,
			script.Value{Kind: "int", Integer: 9},
			script.Value{Kind: "int", Integer: 0},
			script.Value{Kind: "int", Integer: divisor},
		)
		if controller.divisor != 3 {
			t.Fatalf("除数 %d 归一化为 %d，期望 3", divisor, controller.divisor)
		}
	}
}

func TestPathCompletionDispatchesEventOnce(t *testing.T) {
	wnd := NewWnd(nil)
	runtime := script.NewRuntime()
	eventName := "PathFinished"
	eventKey := symbol.StringTableHash(eventName)
	token := func(kind uint16, value uint32, text string) script.Lexeme {
		return script.Lexeme{Token: fc0a.Token{Kind: kind, Value: value}, Text: []byte(text), Source: "path_test"}
	}
	program, err := script.Parse(&script.Preprocessed{Tokens: []script.Lexeme{
		token(1530, 0, "int"), token(6, eventKey, eventName),
		token(101, 0, "("), token(980, 0, ")"), token(1100, 0, "{"),
		token(6, 0x399aa54d, "alpha"), token(200, 0, "="),
		token(2, 17, "17"), token(1230, 0, ";"), token(1101, 0, "}"),
	}})
	if err != nil {
		t.Fatal(err)
	}
	runtime.CurrentObject = wnd.Object
	if err := runtime.Execute(program); err != nil {
		t.Fatal(err)
	}
	event, exists := runtime.Global(eventKey)
	if !exists {
		t.Fatal("解析后的完成事件没有登记")
	}
	wnd.Object.Members[eventKey] = &event

	controller := bindPathForTest(t, wnd, pathSelectorTarget,
		script.Value{Kind: "int", Integer: 3},
		script.Value{Kind: "int", Integer: -3},
		script.Value{Kind: "int", Integer: 1},
		script.Value{Kind: "string", Text: []byte(eventName)},
	)
	for i := 0; i < 4 && !controller.finished; i++ {
		if err := controller.update(runtime); err != nil {
			t.Fatal(err)
		}
	}
	if !controller.finished || wnd.X != 3 || wnd.Y != -3 || wnd.Alpha != 17 {
		t.Fatalf("路径未完成：finished=%t 位置=(%d,%d) alpha=%d",
			controller.finished, wnd.X, wnd.Y, wnd.Alpha)
	}
	wnd.Alpha = 0
	if err := controller.update(runtime); err != nil {
		t.Fatal(err)
	}
	if wnd.Alpha != 0 {
		t.Fatal("完成事件被重复派发")
	}
}

func TestPathClearAndReplacementFinishPrevious(t *testing.T) {
	wnd := NewWnd(nil)
	first := bindPathForTest(t, wnd, pathSelectorTarget,
		script.Value{Kind: "int", Integer: 20},
		script.Value{Kind: "int", Integer: 0},
		script.Value{Kind: "int", Integer: 3},
	)
	second := bindPathForTest(t, wnd, pathSelectorTarget,
		script.Value{Kind: "int", Integer: 4},
		script.Value{Kind: "int", Integer: 0},
		script.Value{Kind: "int", Integer: 3},
	)
	if !first.finished || second != wnd.Path {
		t.Fatal("新 path 绑定未结束旧控制器")
	}
	_, handled, err := wnd.Object.BindMember(pathBindingKey, script.Binding{Clear: true})
	if err != nil || !handled || !second.finished || wnd.Path != second {
		t.Fatalf("清除 path 失败：handled=%t finished=%t err=%v", handled, second.finished, err)
	}
}

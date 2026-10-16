package objsys

import (
	"testing"

	"QY/internal/fc0a"
	"QY/internal/script"
	"QY/internal/symbol"
)

func TestControllerCompletionDispatchesParsedScriptOnce(t *testing.T) {
	desktop := &Desktop{}
	wnd := NewWnd(desktop)
	runtime := script.NewRuntime()
	runtime.CurrentObject = wnd.Object
	const eventKey = 1234
	const property = uint32(0xb1daeb5b)
	token := func(kind uint16, value uint32) script.Lexeme {
		return script.Lexeme{Token: fc0a.Token{Kind: kind, Value: value}, Source: "controller_test"}
	}
	program, err := script.Parse(&script.Preprocessed{Tokens: []script.Lexeme{
		token(1530, 0), token(6, eventKey), token(101, 0), token(980, 0),
		token(1100, 0), token(6, property), token(200, 0),
		token(2, 77), token(1230, 0), token(1101, 0),
	}})
	if err != nil {
		t.Fatal(err)
	}
	if err := runtime.Execute(program); err != nil {
		t.Fatal(err)
	}
	event, exists := runtime.Global(eventKey)
	if !exists {
		t.Fatal("解析后的事件没有登记")
	}
	wnd.Object.Members[eventKey] = &event
	args := controllerArguments(0, 2, 1, 1, 1)
	args[0].Text = []byte("alpha")
	// 使用字符串表的真实事件键，避免依赖测试辅助名称的哈希。
	name := "OnFinished"
	key := symbol.StringTableHash(name)
	wnd.Object.Members[key] = &event
	args = append(args, script.Value{Kind: "string", Text: []byte(name)})
	if _, _, err := wnd.Object.BindMember(0x11b4b1fa, script.Binding{Name: 0xb3ef61e9, Arguments: args}); err != nil {
		t.Fatal(err)
	}
	desktop.Windows = append(desktop.Windows, wnd)
	for _, now := range []uint32{1, 2} {
		if err := desktop.Update(now, runtime); err != nil {
			t.Fatal(err)
		}
		if wnd.X != 0 {
			t.Fatal("尚未越过边界就触发了完成事件")
		}
	}
	if err := desktop.Update(3, runtime); err != nil {
		t.Fatal(err)
	}
	if wnd.X != 77 || wnd.Alpha != 2 || len(desktop.Controllers) != 0 {
		t.Fatalf("完成事件没有更新实际窗口：x=%d alpha=%d controllers=%d", wnd.X, wnd.Alpha, len(desktop.Controllers))
	}
	wnd.X = 9
	if err := desktop.Update(4, runtime); err != nil || wnd.X != 9 {
		t.Fatalf("完成事件被重复派发：x=%d err=%v", wnd.X, err)
	}
}

func controllerArguments(start, end, step, interval, remaining int32) []script.Value {
	return []script.Value{
		{Kind: "string", Text: []byte("controller_test_property")},
		{Kind: "int", Integer: start},
		{Kind: "int", Integer: end},
		{Kind: "int", Integer: step},
		{Kind: "int", Integer: interval},
		{Kind: "int", Integer: remaining},
	}
}

func bindController(t *testing.T, desktop *Desktop, args []script.Value) *Wnd {
	t.Helper()
	wnd := NewWnd(desktop)
	current := int32(-1)
	property := symbol.StringTableHash(string(args[0].Text))
	wnd.Object.WriteMember = func(key uint32, value script.Value) (bool, error) {
		if key != property {
			return false, nil
		}
		if value.Kind != "int" {
			t.Fatalf("控制器写入了非整数属性：%+v", value)
		}
		current = value.Integer
		return true, nil
	}
	wnd.Object.ReadMember = func(key uint32) (script.Value, bool, error) {
		return script.Value{Kind: "int", Integer: current}, key == property, nil
	}
	_, handled, err := wnd.Object.BindMember(0x11b4b1fa, script.Binding{
		Name:      0xb3ef61e9,
		Arguments: args,
	})
	if err != nil || !handled {
		t.Fatalf("绑定 ctrl:loop 失败：handled=%t，错误=%v", handled, err)
	}
	return wnd
}

func controllerX(t *testing.T, wnd *Wnd) int32 {
	t.Helper()
	value, handled, err := wnd.Object.ReadMember(symbol.StringTableHash("controller_test_property"))
	if err != nil || !handled || value.Kind != "int" {
		t.Fatalf("读取窗口 x 失败：value=%+v，handled=%t，错误=%v", value, handled, err)
	}
	return value.Integer
}

func TestControllerInitialValueAndDeadline(t *testing.T) {
	desktop := &Desktop{}
	wnd := bindController(t, desktop, controllerArguments(2, 8, 3, 10, 1))
	if got := controllerX(t, wnd); got != 2 {
		t.Fatalf("初值=%d，期望 2", got)
	}
	if got := len(desktop.Controllers); got != 1 {
		t.Fatalf("活跃控制器数=%d，期望 1", got)
	}

	if err := desktop.Update(9, nil); err != nil {
		t.Fatal(err)
	}
	if got := controllerX(t, wnd); got != 2 {
		t.Fatalf("截止时间前的值=%d，期望 2", got)
	}
	if err := desktop.Update(10, nil); err != nil {
		t.Fatal(err)
	}
	if got := controllerX(t, wnd); got != 5 {
		t.Fatalf("首次推进值=%d，期望 5", got)
	}

	if err := desktop.Update(100, nil); err != nil {
		t.Fatal(err)
	}
	if got := controllerX(t, wnd); got != 8 {
		t.Fatalf("单次更新跨过多个截止点后值=%d，期望只推进一步到 8", got)
	}
	if len(desktop.Controllers) != 1 {
		t.Fatal("精确抵达端点不应算作越界")
	}
	if err := desktop.Update(110, nil); err != nil {
		t.Fatal(err)
	}
	if got := len(desktop.Controllers); got != 0 {
		t.Fatalf("控制器到达终点后仍活跃：%d", got)
	}
}

func TestControllerEndpointCrossingAndDescending(t *testing.T) {
	t.Run("升序越界后反向并按端点计数", func(t *testing.T) {
		desktop := &Desktop{}
		wnd := bindController(t, desktop, controllerArguments(0, 3, 2, 1, 2))
		for tick, expected := range []int32{2, 3, 1, 0} {
			if err := desktop.Update(uint32(tick+1), nil); err != nil {
				t.Fatal(err)
			}
			if got := controllerX(t, wnd); got != expected {
				t.Fatalf("第 %d 次推进值=%d，期望 %d", tick+1, got, expected)
			}
		}
		if len(desktop.Controllers) != 0 {
			t.Fatalf("完成两个端点后仍有 %d 个控制器", len(desktop.Controllers))
		}
	})

	t.Run("降序和负步长", func(t *testing.T) {
		desktop := &Desktop{}
		wnd := bindController(t, desktop, controllerArguments(8, 2, -3, 1, 1))
		for tick, expected := range []int32{5, 2, 2} {
			if err := desktop.Update(uint32(tick+1), nil); err != nil {
				t.Fatal(err)
			}
			if got := controllerX(t, wnd); got != expected {
				t.Fatalf("第 %d 次推进值=%d，期望 %d", tick+1, got, expected)
			}
		}
		if len(desktop.Controllers) != 0 {
			t.Fatalf("控制器到达降序终点后仍活跃")
		}
	})
}

func TestControllerZeroStepAndZeroIntervalNormalize(t *testing.T) {
	desktop := &Desktop{}
	wnd := bindController(t, desktop, controllerArguments(0, 4, 0, 0, 1))
	if err := desktop.Update(1, nil); err != nil {
		t.Fatal(err)
	}
	if got := controllerX(t, wnd); got != 1 {
		t.Fatalf("零步长与零间隔归一化后的首次推进值=%d，期望 1", got)
	}
}

func TestControllerZeroRemainingDoesNotSubmit(t *testing.T) {
	desktop := &Desktop{}
	wnd := NewWnd(desktop)
	property := symbol.StringTableHash("controller_test_property")
	current := int32(17)
	wnd.Object.WriteMember = func(key uint32, value script.Value) (bool, error) {
		if key != property {
			return false, nil
		}
		current = value.Integer
		return true, nil
	}
	wnd.Object.ReadMember = func(key uint32) (script.Value, bool, error) {
		return script.Value{Kind: "int", Integer: current}, key == property, nil
	}
	_, handled, err := wnd.Object.BindMember(0x11b4b1fa, script.Binding{
		Name:      0xb3ef61e9,
		Arguments: controllerArguments(2, 8, 1, 1, 0),
	})
	if err != nil || !handled {
		t.Fatalf("绑定零剩余次数控制器失败：handled=%t，错误=%v", handled, err)
	}
	if got := controllerX(t, wnd); got != 17 {
		t.Fatalf("零剩余次数不应提交初值，实际值=%d", got)
	}
	if err := desktop.Update(1, nil); err != nil {
		t.Fatal(err)
	}
	if len(desktop.Controllers) != 0 {
		t.Fatalf("零剩余次数控制器更新后仍活跃")
	}
}

func TestControllerClearAndReplacementFinishPrevious(t *testing.T) {
	desktop := &Desktop{}
	wnd := bindController(t, desktop, controllerArguments(0, 10, 1, 1, -1))
	first := wnd.Controller

	_, handled, err := wnd.Object.BindMember(0x11b4b1fa, script.Binding{Clear: true})
	if err != nil || !handled {
		t.Fatalf("清除控制器失败：handled=%t，错误=%v", handled, err)
	}
	if !first.finished {
		t.Fatal("清除绑定未结束旧控制器")
	}

	wnd = bindController(t, desktop, controllerArguments(1, 10, 1, 1, -1))
	second := wnd.Controller
	_, handled, err = wnd.Object.BindMember(0x11b4b1fa, script.Binding{
		Name:      0xb3ef61e9,
		Arguments: controllerArguments(3, 10, 1, 1, -1),
	})
	if err != nil || !handled {
		t.Fatalf("替换控制器失败：handled=%t，错误=%v", handled, err)
	}
	if !second.finished {
		t.Fatal("新绑定未结束被替换的控制器")
	}
	if got := controllerX(t, wnd); got != 3 {
		t.Fatalf("替换绑定的初值=%d，期望 3", got)
	}
}

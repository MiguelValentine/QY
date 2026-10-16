package objsys

import (
	"testing"

	"QY/internal/fc0a"
	"QY/internal/script"
	"QY/internal/symbol"
)

func timerEventRuntime(t *testing.T, wnd *Wnd) (*script.Runtime, *int) {
	t.Helper()
	const (
		eventName = "OnTimer"
		hostName  = uint32(0xabcddcba)
	)
	calls := 0
	runtime := script.NewRuntime()
	runtime.Register(hostName, func([]script.Value) (script.Value, error) {
		calls++
		return script.Value{Kind: "null"}, nil
	})
	runtime.CurrentObject = wnd.Object
	token := func(kind uint16, value uint32) script.Lexeme {
		return script.Lexeme{Token: fc0a.Token{Kind: kind, Value: value}, Source: "controller_timer_test"}
	}
	program, err := script.Parse(&script.Preprocessed{Tokens: []script.Lexeme{
		token(1530, 0), token(6, symbol.StringTableHash(eventName)), token(101, 0),
		token(980, 0), token(1100, 0),
		token(6, hostName), token(101, 0), token(980, 0), token(1230, 0),
		token(1101, 0),
	}})
	if err != nil {
		t.Fatal(err)
	}
	if err := runtime.Execute(program); err != nil {
		t.Fatal(err)
	}
	eventKey := symbol.StringTableHash(eventName)
	event, ok := runtime.Global(eventKey)
	if !ok {
		t.Fatal("解析后的定时事件没有登记")
	}
	wnd.Object.Members[eventKey] = &event
	return runtime, &calls
}

func bindTimerController(t *testing.T, wnd *Wnd, desktop *Desktop, event string, count, delay, interval int32) *Controller {
	t.Helper()
	_, handled, err := wnd.Object.BindMember(0x11b4b1fa, script.Binding{
		Name: 0xf77272f2,
		Arguments: []script.Value{
			{Kind: "string", Text: []byte(event)},
			{Kind: "int", Integer: count},
			{Kind: "int", Integer: delay},
			{Kind: "int", Integer: interval},
		},
	})
	if err != nil || !handled {
		t.Fatalf("绑定定时控制器失败：handled=%t，错误=%v", handled, err)
	}
	if wnd.Controller == nil || !wnd.Controller.timer {
		t.Fatal("定时绑定没有登记 timer controller")
	}
	return wnd.Controller
}

func TestTimerControllerDeadlineClampAndSingleDispatch(t *testing.T) {
	desktop := &Desktop{clock: 20}
	wnd := NewWnd(desktop)
	runtime, calls := timerEventRuntime(t, wnd)
	controller := bindTimerController(t, wnd, desktop, "OnTimer", 2, 5, 0)
	if controller.deadline != 25 || controller.interval != 1 {
		t.Fatalf("绑定后的 deadline=%d interval=%d，期望 25 和 1", controller.deadline, controller.interval)
	}

	if err := desktop.Update(24, runtime); err != nil {
		t.Fatal(err)
	}
	if *calls != 0 {
		t.Fatalf("截止时间前派发了 %d 次", *calls)
	}
	if err := desktop.Update(25, runtime); err != nil {
		t.Fatal(err)
	}
	if *calls != 1 || controller.remaining != 1 || controller.finished || controller.deadline != 26 {
		t.Fatalf("首次派发后 calls=%d remaining=%d finished=%t deadline=%d", *calls, controller.remaining, controller.finished, controller.deadline)
	}

	if err := desktop.Update(100, runtime); err != nil {
		t.Fatal(err)
	}
	if *calls != 2 || controller.remaining != 0 || !controller.finished {
		t.Fatalf("跨过多个截止点的单次更新后 calls=%d remaining=%d finished=%t", *calls, controller.remaining, controller.finished)
	}
	if err := desktop.Update(101, runtime); err != nil {
		t.Fatal(err)
	}
	if *calls != 2 {
		t.Fatalf("控制器完成后重复派发：calls=%d", *calls)
	}
}

func TestTimerControllerZeroAndNegativeCounts(t *testing.T) {
	t.Run("零次数直接完成", func(t *testing.T) {
		desktop := &Desktop{clock: 7}
		wnd := NewWnd(desktop)
		runtime, calls := timerEventRuntime(t, wnd)
		controller := bindTimerController(t, wnd, desktop, "OnTimer", 0, 0, 4)
		if !controller.finished || controller.deadline != 7 {
			t.Fatalf("零次数控制器状态 finished=%t deadline=%d", controller.finished, controller.deadline)
		}
		if err := desktop.Update(100, runtime); err != nil {
			t.Fatal(err)
		}
		if *calls != 0 || len(desktop.Controllers) != 0 {
			t.Fatalf("零次数控制器产生派发或未清理：calls=%d controllers=%d", *calls, len(desktop.Controllers))
		}
	})

	t.Run("负次数持续计数", func(t *testing.T) {
		desktop := &Desktop{}
		wnd := NewWnd(desktop)
		runtime, calls := timerEventRuntime(t, wnd)
		controller := bindTimerController(t, wnd, desktop, "OnTimer", -1, 0, 2)
		if err := desktop.Update(2, runtime); err != nil {
			t.Fatal(err)
		}
		if *calls != 1 || controller.remaining != -2 || controller.finished {
			t.Fatalf("负次数更新后 calls=%d remaining=%d finished=%t", *calls, controller.remaining, controller.finished)
		}
	})
}

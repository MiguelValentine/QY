package objsys

import (
	"testing"

	"QY/internal/script"
)

func bindNamedTimerController(t *testing.T, wnd *Wnd, desktop *Desktop, instance uint32) *Controller {
	t.Helper()
	_, handled, err := wnd.Object.BindMember(0x11b4b1fa, script.Binding{
		Instance: instance,
		Name:     0xf77272f2,
		Arguments: []script.Value{
			{Kind: "string", Text: []byte("OnTimer")},
			{Kind: "int", Integer: 3},
			{Kind: "int", Integer: 100},
			{Kind: "int", Integer: 25},
		},
	})
	if err != nil || !handled {
		t.Fatalf("命名定时器绑定失败：instance=%d handled=%t err=%v", instance, handled, err)
	}
	controller := wnd.controllerInstance(instance)
	if controller == nil || !controller.timer {
		t.Fatalf("实例 %d 没有对应定时器", instance)
	}
	return controller
}

func TestDefaultLoopAndMultipleNamedTimersCoexist(t *testing.T) {
	desktop := &Desktop{clock: 10}
	wnd := NewWnd(desktop)
	_, handled, err := wnd.Object.BindMember(0x11b4b1fa, script.Binding{
		Name: 0xb3ef61e9,
		Arguments: []script.Value{
			{Kind: "string", Text: []byte("alpha")},
			{Kind: "int", Integer: 0},
			{Kind: "int", Integer: 4},
			{Kind: "int", Integer: 1},
			{Kind: "int", Integer: 20},
			{Kind: "int", Integer: -1},
		},
	})
	if err != nil || !handled {
		t.Fatalf("默认 loop 绑定失败：handled=%t err=%v", handled, err)
	}
	defaultController := wnd.Controller
	first := bindNamedTimerController(t, wnd, desktop, 0x23a3d969)
	second := bindNamedTimerController(t, wnd, desktop, 42)

	if defaultController == nil || defaultController.timer ||
		first == second || first == defaultController || second == defaultController ||
		first.finished || second.finished || defaultController.finished {
		t.Fatalf("默认和命名控制器未独立保留：default=%+v first=%+v second=%+v",
			defaultController, first, second)
	}
	if len(desktop.Controllers) != 3 ||
		wnd.controllerInstance(0x23a3d969) != first ||
		wnd.controllerInstance(42) != second {
		t.Fatalf("控制器登记错误：desktop=%d named=%v", len(desktop.Controllers), wnd.namedControllers)
	}
}

func TestNamedTimerReplacementAndClearOnlyAffectMatchingInstance(t *testing.T) {
	desktop := &Desktop{clock: 10}
	wnd := NewWnd(desktop)
	defaultController := bindTimerController(t, wnd, desktop, "OnTimer", 3, 100, 25)
	first := bindNamedTimerController(t, wnd, desktop, 101)
	second := bindNamedTimerController(t, wnd, desktop, 202)

	replacement := bindNamedTimerController(t, wnd, desktop, 101)
	if !first.finished || replacement == first || replacement.finished ||
		second.finished || defaultController.finished {
		t.Fatalf("覆盖实例 101 影响范围错误：old=%t replacement=%t second=%t default=%t",
			first.finished, replacement.finished, second.finished, defaultController.finished)
	}

	_, handled, err := wnd.Object.BindMember(0x11b4b1fa, script.Binding{
		Instance: 101, Clear: true,
	})
	if err != nil || !handled {
		t.Fatalf("清除命名实例失败：handled=%t err=%v", handled, err)
	}
	if !replacement.finished || second.finished || defaultController.finished {
		t.Fatalf("清除实例 101 影响范围错误：replacement=%t second=%t default=%t",
			replacement.finished, second.finished, defaultController.finished)
	}
	if wnd.controllerInstance(202) != second || wnd.Controller != defaultController {
		t.Fatal("清除命名实例改动了其它实例的映射")
	}
}

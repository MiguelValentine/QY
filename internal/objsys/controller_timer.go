package objsys

import (
	"fmt"

	"QY/internal/script"
	"QY/internal/symbol"
)

// bindTimer 对应 ctrl mode3，延迟后按间隔派发有限次或负计数事件。
func (w *Wnd) bindTimer(desktop *Desktop, binding script.Binding) (script.Value, bool, error) {
	if desktop == nil {
		return script.Value{}, true, fmt.Errorf("定时控制器缺少桌面计时宿主")
	}
	args := binding.Arguments
	if len(args) < 2 || len(args) > 4 || args[0].Kind != "string" {
		return script.Value{}, true, fmt.Errorf("定时控制器需要事件名、次数及可选延迟和间隔")
	}
	values := []int32{0, 0, 1}
	for i := 1; i < len(args); i++ {
		if args[i].Kind != "int" {
			return script.Value{}, true, fmt.Errorf("定时控制器第%d个参数需要整数", i+1)
		}
		values[i-1] = args[i].Integer
	}
	if values[2] < 1 {
		values[2] = 1
	}
	controller := &Controller{
		owner: w.Object, timer: true,
		event:     symbol.StringTableHash(string(nulBytes(args[0].Text))),
		remaining: values[0], finished: values[0] == 0,
		deadline: desktop.clock + uint32(values[1]), interval: uint32(values[2]),
	}
	w.replaceController(binding.Instance, controller)
	desktop.Controllers = append(desktop.Controllers, controller)
	return script.Value{Kind: "null"}, true, nil
}

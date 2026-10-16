package objsys

import (
	"fmt"

	"QY/internal/script"
	"QY/internal/symbol"
)

const (
	pathSelectorOffset = uint32(0x69a34356)
	pathSelectorTarget = uint32(0xf6f99e51)
	pathBindingKey     = uint32(0x403e4ac8)
)

// PathController 保存原生 path mode 1 的目标位置和逐帧插值状态。
type PathController struct {
	owner    *Wnd
	currentX int32
	currentY int32
	targetX  int32
	targetY  int32
	divisor  int32
	event    uint32
	finished bool
}

func (w *Wnd) bindPath(binding script.Binding) (script.Value, bool, error) {
	if binding.Clear {
		if binding.Name != 0 || len(binding.Arguments) != 0 {
			return script.Value{}, true, fmt.Errorf("空 path 绑定不能包含参数")
		}
		if w.Path != nil {
			w.Path.finished = true
		}
		return script.Value{Kind: "null"}, true, nil
	}

	if binding.Name != pathSelectorOffset && binding.Name != pathSelectorTarget {
		return script.Value{}, true, fmt.Errorf("path 尚未恢复操作 0x%08x", binding.Name)
	}
	args := binding.Arguments
	if len(args) < 2 || len(args) > 4 {
		return script.Value{}, true, fmt.Errorf("path mode 1 需要两个整数、可选除数和完成事件")
	}
	for i := 0; i < 2; i++ {
		if args[i].Kind != "int" {
			return script.Value{}, true, fmt.Errorf("path mode 1 第%d个参数需要整数", i+1)
		}
	}
	divisor := int32(5)
	if len(args) >= 3 {
		if args[2].Kind != "int" {
			return script.Value{}, true, fmt.Errorf("path mode 1 第三个参数需要整数除数")
		}
		divisor = args[2].Integer
	}
	if len(args) == 4 && args[3].Kind != "string" {
		return script.Value{}, true, fmt.Errorf("path 完成事件需要字符串")
	}

	x, y := args[0].Integer, args[1].Integer
	if binding.Name == pathSelectorOffset {
		w.X += x
		w.Y += y
		w.Dirty = true
		x, y = -x, -y
	}
	if divisor < 1 {
		divisor = 3
	}
	controller := &PathController{
		owner:   w,
		targetX: x,
		targetY: y,
		divisor: divisor,
	}
	if len(args) == 4 {
		controller.event = symbol.StringTableHash(string(nulBytes(args[3].Text)))
	}
	if w.Path != nil {
		w.Path.finished = true
	}
	w.Path = controller
	return script.Value{Kind: "null"}, true, nil
}

func (p *PathController) update(runtime *script.Runtime) error {
	if p == nil || p.finished {
		return nil
	}
	w := p.owner
	oldX, oldY := p.currentX, p.currentY
	p.currentX = pathStep(p.currentX, p.targetX, p.divisor)
	p.currentY = pathStep(p.currentY, p.targetY, p.divisor)
	w.X += p.currentX - oldX
	w.Y += p.currentY - oldY
	if p.currentX != oldX || p.currentY != oldY {
		w.Dirty = true
	}
	if p.currentX != p.targetX || p.currentY != p.targetY {
		return nil
	}

	p.finished = true
	if p.event == 0 {
		return nil
	}
	if runtime == nil {
		return fmt.Errorf("path 完成事件缺少脚本运行时")
	}
	_, _, err := runtime.DispatchEvent(w.Object, p.event, nil)
	return err
}

func pathStep(current, target, divisor int32) int32 {
	if divisor <= 1 {
		return target
	}
	if current == target {
		return current
	}
	step := (target - current) / divisor
	if target > current {
		step++
	} else {
		step--
	}
	return current + step
}

package objsys

import (
	"fmt"

	"QY/internal/script"
)

const autoposMemberHash uint32 = 0xdddd0b92
const autoposVerticalSelector uint32 = 0x049c5ec3

// AutoPosition 保存原生 autopos mode3 的纵向排列参数与刷新时钟。
type AutoPosition struct {
	owner       *Wnd
	x, y, gap   int32
	resize      bool
	deadline    uint32
	children    []*script.Object
	initialized bool
	finished    bool
}

func (w *Wnd) bindAutoPosition(desktop *Desktop, binding script.Binding) (script.Value, bool, error) {
	if binding.Clear {
		if binding.Name != 0 || len(binding.Arguments) != 0 {
			return script.Value{}, true, fmt.Errorf("空 autopos 绑定不能包含参数")
		}
		if w.AutoPosition != nil {
			w.AutoPosition.finished = true
		}
		return script.Value{Kind: "null"}, true, nil
	}
	if binding.Name != autoposVerticalSelector {
		return script.Value{}, true, fmt.Errorf("autopos 尚未恢复操作 0x%08x", binding.Name)
	}
	if desktop == nil {
		return script.Value{}, true, fmt.Errorf("autopos 缺少桌面宿主")
	}
	args := binding.Arguments
	if len(args) < 2 || len(args) > 5 {
		return script.Value{}, true, fmt.Errorf("autopos 纵向排列需要两个坐标和可选间距、自动尺寸及子对象限制")
	}
	values := []int32{0, 0, 5, 0, 0}
	for i, arg := range args {
		if arg.Kind != "int" {
			return script.Value{}, true, fmt.Errorf("autopos 第%d个参数需要整数", i+1)
		}
		values[i] = arg.Integer
	}
	if values[4] > 1 {
		return script.Value{}, true, fmt.Errorf("autopos 删除超出限制的子对象行为尚未恢复")
	}
	position := &AutoPosition{owner: w, x: values[0], y: values[1], gap: values[2], resize: values[3] != 0}
	if err := position.update(desktop, desktop.clock); err != nil {
		return script.Value{}, true, err
	}
	if w.AutoPosition != nil {
		w.AutoPosition.finished = true
	}
	w.AutoPosition = position
	return script.Value{Kind: "null"}, true, nil
}

func (a *AutoPosition) update(desktop *Desktop, now uint32) error {
	if a == nil || a.finished {
		return nil
	}
	children := a.owner.Object.Children
	changed := len(a.children) != len(children)
	if !changed {
		for i, child := range children {
			if child != a.children[i] {
				changed = true
				break
			}
		}
	}
	if a.initialized && !changed && now < a.deadline {
		return nil
	}
	windows := make(map[*script.Object]*Wnd, len(desktop.Windows))
	offsets := make(map[*script.Object][2]int32, len(desktop.Images))
	for _, wnd := range desktop.Windows {
		windows[wnd.Object] = wnd
	}
	for _, img := range desktop.Images {
		offsets[img.Object] = [2]int32{img.FrameOffsetX, img.FrameOffsetY}
	}
	y := a.y
	var right, bottom int32
	for _, child := range children {
		wnd := windows[child]
		if wnd == nil {
			return fmt.Errorf("autopos 子对象没有已恢复的窗口几何")
		}
		if !wnd.Visible {
			continue
		}
		offset := offsets[child]
		x, nextY := a.x-offset[0], y-offset[1]
		if wnd.X != x || wnd.Y != nextY {
			wnd.X, wnd.Y, wnd.Dirty = x, nextY, true
		}
		y += wnd.Height + a.gap
		if edge := wnd.X + offset[0] + wnd.Width; edge > right {
			right = edge
		}
		if edge := wnd.Y + offset[1] + wnd.Height; edge > bottom {
			bottom = edge
		}
	}
	if a.resize {
		width, height := right+a.x, bottom+a.y
		if a.owner.Width != width || a.owner.Height != height {
			a.owner.Width, a.owner.Height, a.owner.Dirty = width, height, true
		}
	}
	a.children = append(a.children[:0], children...)
	a.deadline, a.initialized = now+50, true
	return nil
}

package objsys

import (
	"fmt"

	"QY/internal/script"
	"QY/internal/symbol"
)

// Controller 保存原生 ctrl:loop 的往返状态和毫秒截止时间。
type Controller struct {
	owner                     *script.Object
	property, event           uint32
	minimum, maximum, current int32
	step, remaining           int32
	interval                  uint32
	deadline                  uint32
	increasing, finished      bool
	timer                     bool
}

func (w *Wnd) bindController(desktop *Desktop, binding script.Binding) (script.Value, bool, error) {
	if binding.Clear {
		if binding.Name != 0 || len(binding.Arguments) != 0 {
			return script.Value{}, true, fmt.Errorf("空 ctrl 绑定不能包含参数")
		}
		if controller := w.controllerInstance(binding.Instance); controller != nil {
			controller.finished = true
		}
		return script.Value{Kind: "null"}, true, nil
	}
	if binding.Name == 0xf77272f2 {
		return w.bindTimer(desktop, binding)
	}
	if binding.Name != 0xb3ef61e9 {
		return script.Value{}, true, fmt.Errorf("ctrl 尚未恢复操作 0x%08x", binding.Name)
	}
	if desktop == nil {
		return script.Value{}, true, fmt.Errorf("ctrl 缺少桌面计时宿主")
	}
	args := binding.Arguments
	if len(args) < 3 || len(args) > 7 || args[0].Kind != "string" {
		return script.Value{}, true, fmt.Errorf("ctrl loop 需要属性名、起值、终值及可选控制参数")
	}
	values := []int32{0, 0, 1, 0, -1}
	for index := 1; index < len(args) && index < 6; index++ {
		if args[index].Kind != "int" {
			return script.Value{}, true, fmt.Errorf("ctrl loop 第%d个参数需要整数", index+1)
		}
		values[index-1] = args[index].Integer
	}
	controller := &Controller{
		owner: w.Object, property: symbol.StringTableHash(string(nulBytes(args[0].Text))),
		minimum: values[0], maximum: values[1], current: values[0],
		step: values[2], remaining: values[4], increasing: values[0] <= values[1],
	}
	if len(args) == 7 {
		if args[6].Kind != "string" {
			return script.Value{}, true, fmt.Errorf("ctrl loop 完成事件需要字符串")
		}
		controller.event = symbol.StringTableHash(string(nulBytes(args[6].Text)))
	}
	if values[3] < 1 {
		values[3] = 1
	}
	controller.interval = uint32(values[3])
	controller.deadline = desktop.clock + controller.interval
	if controller.minimum > controller.maximum {
		controller.minimum, controller.maximum = controller.maximum, controller.minimum
	}
	if controller.step < 0 {
		controller.step = -controller.step
	}
	if controller.step == 0 {
		controller.step = 1
	}
	if controller.remaining == 0 {
		controller.finished = true
	} else if err := controller.submit(controller.current); err != nil {
		return script.Value{}, true, err
	}
	w.replaceController(binding.Instance, controller)
	desktop.Controllers = append(desktop.Controllers, controller)
	return script.Value{Kind: "null"}, true, nil
}

func (w *Wnd) controllerInstance(instance uint32) *Controller {
	if instance == 0 {
		return w.Controller
	}
	return w.namedControllers[instance]
}

func (w *Wnd) replaceController(instance uint32, controller *Controller) {
	if previous := w.controllerInstance(instance); previous != nil {
		previous.finished = true
	}
	if instance == 0 {
		w.Controller = controller
		return
	}
	if w.namedControllers == nil {
		w.namedControllers = make(map[uint32]*Controller)
	}
	w.namedControllers[instance] = controller
}

func (c *Controller) submit(value int32) error {
	if c.owner.WriteMember == nil {
		return fmt.Errorf("ctrl 所属对象没有属性写入器")
	}
	handled, err := c.owner.WriteMember(c.property, script.Value{Kind: "int", Integer: value})
	if err != nil {
		return err
	}
	if !handled {
		return fmt.Errorf("ctrl 所属对象未处理属性 0x%08x", c.property)
	}
	return nil
}

func (c *Controller) update(now uint32, runtime *script.Runtime) error {
	if c.finished || now < c.deadline {
		return nil
	}
	// 原生每次更新只推进一次，截止时间沿用上次截止值累加。
	c.deadline += c.interval
	if c.timer {
		if runtime == nil {
			return fmt.Errorf("定时事件缺少脚本运行时")
		}
		if _, _, err := runtime.DispatchEvent(c.owner, c.event, nil); err != nil {
			return err
		}
		c.remaining--
		c.finished = c.remaining == 0
		return nil
	}
	if c.increasing {
		c.current += c.step
	} else {
		c.current -= c.step
	}
	if c.current > c.maximum {
		c.current, c.increasing = c.maximum, false
		c.remaining--
		c.finished = c.remaining == 0
	}
	if c.current < c.minimum {
		c.current, c.increasing = c.minimum, true
		c.remaining--
		c.finished = c.remaining == 0
	}
	if err := c.submit(c.current); err != nil {
		return err
	}
	if c.finished && c.event != 0 {
		if runtime == nil {
			return fmt.Errorf("ctrl 完成事件缺少脚本运行时")
		}
		_, _, err := runtime.DispatchEvent(c.owner, c.event, nil)
		return err
	}
	return nil
}

// Update 按原生毫秒时钟推进当前控制器；回调中新建的控制器从下次更新开始。
func (d *Desktop) Update(now uint32, runtime *script.Runtime) error {
	d.clock = now
	images := make(map[*script.Object]*ImgEx, len(d.Images))
	for _, img := range d.Images {
		images[img.Object] = img
	}
	atoms := make(map[*script.Object]*AtomSystem, len(d.AtomSystems))
	for _, a := range d.AtomSystems {
		atoms[a.Object] = a
	}
	controllers := make(map[*script.Object][]*Controller)
	for _, controller := range d.Controllers {
		controllers[controller.owner] = append(controllers[controller.owner], controller)
	}
	paths := make(map[*script.Object]*PathController)
	positions := make(map[*script.Object]*AutoPosition)
	for _, wnd := range d.Windows {
		if wnd.AutoPosition != nil {
			positions[wnd.Object] = wnd.AutoPosition
		}
		if wnd.Path != nil {
			paths[wnd.Object] = wnd.Path
		}
	}
	var order []*script.Object
	visited := make(map[*script.Object]bool)
	var visit func(*script.Object)
	visit = func(object *script.Object) {
		if object == nil || visited[object] {
			return
		}
		visited[object] = true
		order = append(order, object)
		for _, child := range object.Children {
			visit(child)
		}
	}
	visit(d.Object)
	for _, wnd := range d.Windows {
		visit(wnd.Object)
	}
	for _, controller := range d.Controllers {
		visit(controller.owner)
	}
	for _, img := range d.Images {
		visit(img.Object)
	}
	// 图像更新先处理加载事件，再委派基类更新自己的绑定和子对象。
	for _, object := range order {
		if a := atoms[object]; a != nil {
			a.update()
		}
		if img := images[object]; img != nil && img.loaded {
			if runtime == nil {
				return fmt.Errorf("图片完成事件缺少脚本运行时")
			}
			_, _, err := runtime.DispatchEvent(img.Object, 0x1a406c75, nil)
			img.loaded = false
			if err != nil {
				return err
			}
		}
		for _, controller := range controllers[object] {
			if err := controller.update(now, runtime); err != nil {
				return err
			}
		}
		if position := positions[object]; position != nil {
			if err := position.update(d, now); err != nil {
				return err
			}
		}
		if path := paths[object]; path != nil {
			if err := path.update(runtime); err != nil {
				return err
			}
		}
	}
	active := d.Controllers[:0]
	for _, controller := range d.Controllers {
		if !controller.finished {
			active = append(active, controller)
		}
	}
	d.Controllers = active
	return nil
}

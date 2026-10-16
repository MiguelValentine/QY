package objsys

import "QY/internal/script"

// View 保存脚本中的视口对象。
// 当前入口只依赖窗口布局、父子关系和接口登记，因此复用 Wnd 的宿主语义。
type View struct {
	*Wnd
}

// NewView 创建视口对象，并继承桌面提供的图片加载能力。
func NewView(desktop *Desktop) *View {
	return &View{Wnd: NewWnd(desktop)}
}

// RegisterViewFactory 登记 view 类型，使入口脚本可以继续构造真实场景。
func RegisterViewFactory(runtime *script.Runtime, desktop *Desktop) {
	runtime.RegisterObjectFactory(0x771f6e8b, func(*script.Object) (*script.Object, error) {
		view := NewView(desktop)
		desktop.Windows = append(desktop.Windows, view.Wnd)
		return view.Object, nil
	})
}

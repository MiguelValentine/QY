package objsys

import (
	"bytes"
	"errors"
	"fmt"
	"time"

	"QY/internal/fbase"
	"QY/internal/script"
)

// ErrWindowUnavailable 表示脚本已到达窗口操作，但尚无实际窗口后端。
var ErrWindowUnavailable = errors.New("窗口后端尚未初始化")

// ErrFontUnavailable 表示窗口存在，但尚未接入实际字体重建能力。
var ErrFontUnavailable = errors.New("字体后端尚未初始化")

// DesktopWindow 接收桌面根对象已恢复的窗口操作；文本保留客户端原始编码。
type DesktopWindow interface {
	SetTitle(text []byte) error
}

// DesktopFonts 将字体字符集写入接到实际绘图字体的重建流程。
type DesktopFonts interface {
	SetFontCharset(charset uint32) error
}

// DesktopSize 把根对象逻辑尺寸同步到宿主窗口和绘图表面。
// 原生窗口边框补偿由各平台后端处理，不作为脚本尺寸暴露。
type DesktopSize interface {
	SetSize(width, height int32) error
	Size() (width, height int32, err error)
}

// DesktopUpdates 将脚本场景更新接入窗口的主线程循环。
type DesktopUpdates interface {
	SetUpdate(func() error)
}

// Desktop 保存桌面宿主与原生延迟读取的配置；路径赋值不立即加载图像。
type Desktop struct {
	Object          *script.Object
	Windows         []*Wnd
	Texts           []*Text
	Images          []*ImgEx
	Controllers     []*Controller
	AtomSystems     []*AtomSystem
	atomRandomState uint32
	clock           uint32
	ToolTips        *script.Object
	Interfaces      map[uint32]InterfaceEntry
	PathMappings    fbase.PathMappings
	Background      Background
	AboutImagePath  []byte
	AboutText       []byte
	// ResourceDirectoryPath 对应原生保存的最近一次目录来源，即使加载失败也保留。
	ResourceDirectoryPath  []byte
	ResourceDirectoryError error
	resourceEntries        []resourceDirectoryEntry
	readDirectory          func([]byte) ([][]byte, error)
	reportResourceError    func(error)
}

// NewDesktopObject 对接 objsys:0x10060da0 的已确认调用分支。
// 未恢复的哈希交还运行时查找，不能直接作为成功调用。
func NewDesktopObject(window DesktopWindow) *script.Object {
	return NewDesktopObjectWithSystem(window, NewSystemState())
}

// NewDesktopObjectWithSystem 让系统指令和桌面属性共享原生全局字体状态。
func NewDesktopObjectWithSystem(window DesktopWindow, system *SystemState) *script.Object {
	return NewDesktop(window, system).Object
}

// NewDesktop 创建桌面及其脚本对象；关于配置保留原始编码，按C字符串截断。
func NewDesktop(window DesktopWindow, system *SystemState) *Desktop {
	if system == nil {
		system = NewSystemState()
	}
	system.rebuildFonts = func(charset uint32) error {
		fonts, ok := window.(DesktopFonts)
		if !ok {
			return ErrFontUnavailable
		}
		return fonts.SetFontCharset(charset)
	}
	desktop := &Desktop{atomRandomState: uint32(time.Now().Unix())}
	object := &script.Object{Members: make(map[uint32]*script.Value)}
	desktop.Object = object
	object.BindMember = desktop.Background.bind
	object.ReadMember = func(key uint32) (script.Value, bool, error) {
		switch key {
		case 0x9eea611e, 0xdbb6c77b:
			// pdesktop 的原生类型4值携带当前桌面的标识和宿主指针。
			return script.Value{Kind: "object", Object: object}, true, nil
		case 0x6f297615:
			return script.Value{Kind: "int", Integer: int32(system.FontCharset)}, true, nil
		case 0x96712ccc, 0x4f7d48c6, 0x55e750c5:
			sized, ok := window.(DesktopSize)
			if !ok {
				return script.Value{}, true, fmt.Errorf("%w：无法读取逻辑窗口尺寸", ErrWindowUnavailable)
			}
			width, height, err := sized.Size()
			if err != nil {
				return script.Value{}, true, err
			}
			if key == 0x4f7d48c6 {
				return script.Value{Kind: "int", Integer: width}, true, nil
			}
			if key == 0x55e750c5 {
				return script.Value{Kind: "int", Integer: height}, true, nil
			}
			return script.Value{Kind: "tuple", Items: []script.Value{
				{Kind: "int", Integer: width},
				{Kind: "int", Integer: height},
			}}, true, nil
		default:
			return desktop.readInterface(object, key)
		}
	}
	object.WriteMember = func(key uint32, value script.Value) (bool, error) {
		switch key {
		case 0x9eea611e:
			return true, fmt.Errorf("pdesktop 是只读宿主属性")
		case 0x6f297615:
			if value.Kind != "int" {
				return true, fmt.Errorf("字体字符集属性需要整数")
			}
			return true, system.setFontCharset(uint32(value.Integer))
		case 0x96712ccc:
			// 原生仅给出两个抽取描述；更多元素的越界行为尚未恢复。
			if value.Kind != "tuple" || len(value.Items) != 2 ||
				value.Items[0].Kind != "int" || value.Items[1].Kind != "int" {
				return true, fmt.Errorf("窗口尺寸属性需要宽和高两个整数")
			}
			sized, ok := window.(DesktopSize)
			if !ok {
				return true, fmt.Errorf("%w：无法设置逻辑窗口尺寸", ErrWindowUnavailable)
			}
			return true, sized.SetSize(value.Items[0].Integer, value.Items[1].Integer)
		default:
			return false, nil
		}
	}
	object.CallMember = func(key uint32, arguments []script.Value) (script.Value, bool, error) {
		if value, handled, err := callInterface(desktop, &desktop.Interfaces, key, arguments); handled || err != nil {
			return value, handled, err
		}
		if key == 0x112e4b8f {
			if len(arguments) < 2 || arguments[0].Kind != "string" || arguments[1].Kind != "string" {
				return script.Value{}, true, fmt.Errorf("路径映射需要前两个参数为字符串")
			}
			registered, err := desktop.PathMappings.Register(arguments[0].Text, arguments[1].Text)
			if err != nil {
				return script.Value{}, true, err
			}
			value := script.Value{Kind: "int"}
			if registered {
				value.Integer = 1
			}
			return value, true, nil
		}
		if key == 0xaf665c57 {
			if len(arguments) != 1 || arguments[0].Kind != "string" {
				return script.Value{}, true, fmt.Errorf("资源目录调用需要单个字符串")
			}
			err := desktop.loadResourceDirectory(arguments[0].Text)
			return arguments[0], true, err
		}
		if key == 0x2dc090dd {
			if len(arguments) != 1 || arguments[0].Kind != "object" {
				return script.Value{}, true, fmt.Errorf("RegToolTips 需要一个对象参数")
			}
			desktop.ToolTips = nil
			// 原生先保存对象标识，再经桌面的对象登记表验证；无效标识清零。
			for _, wnd := range desktop.Windows {
				if wnd.Object == arguments[0].Object {
					desktop.ToolTips = wnd.Object
					break
				}
			}
			return arguments[0], true, nil
		}
		switch key {
		case 0xd53b302d, 0x780aea8e, 0x2afbfe28:
		default:
			return script.Value{}, false, nil
		}
		if len(arguments) != 1 || arguments[0].Kind != "string" {
			return script.Value{}, true, fmt.Errorf("桌面调用 0x%08x 需要一个字符串参数", key)
		}
		// 这两条原生分支仅复制字符串；加载和展示属于后续独立调用。
		switch key {
		case 0x780aea8e:
			desktop.AboutImagePath = bytes.Clone(nulBytes(arguments[0].Text))
			return arguments[0], true, nil
		case 0x2afbfe28:
			desktop.AboutText = bytes.Clone(nulBytes(arguments[0].Text))
			return arguments[0], true, nil
		}
		if window == nil {
			return script.Value{}, true, fmt.Errorf("%w：无法设置游戏窗口标题", ErrWindowUnavailable)
		}
		text := arguments[0].Text
		if end := bytes.IndexByte(text, 0); end >= 0 {
			text = text[:end]
		}
		if err := window.SetTitle(bytes.Clone(text)); err != nil {
			return script.Value{}, true, err
		}
		// 原生分支不写回参数，调用表达式沿用传入的字符串值。
		return arguments[0], true, nil
	}
	return desktop
}

package objsys

import (
	"errors"
	"image"
	"strings"
	"testing"

	"QY/internal/script"
)

func TestImgFrameMemberSelectsResourceFrame(t *testing.T) {
	loader, err := NewLoader("../../CLIENT")
	if err != nil {
		t.Fatal(err)
	}
	desktop := NewDesktop(nil, nil)
	loader.configureDesktopResources(desktop)
	img := NewImgEx(desktop)

	read, handled, err := img.Object.ReadMember(imageFrameMemberHash)
	if err != nil || !handled || read.Kind != "int" || read.Integer != 0 {
		t.Fatalf("frame 默认值错误：value=%+v handled=%t err=%v", read, handled, err)
	}
	if handled, err := img.Object.WriteMember(0xa06413cf, script.Value{
		Kind: "string", Text: []byte("in/img/map/root/land_02.ale"),
	}); err != nil || !handled {
		t.Fatalf("加载多帧资源失败：handled=%t err=%v", handled, err)
	}
	if img.FrameIndex != 0 || img.Width != 130 || img.Height != 99 {
		t.Fatalf("资源初始帧状态错误：index=%d size=%dx%d",
			img.FrameIndex, img.Width, img.Height)
	}

	img.X, img.Y, img.Dirty = 272, 206, false
	if handled, err := img.Object.WriteMember(imageFrameMemberHash, script.Value{
		Kind: "int", Integer: 1,
	}); err != nil || !handled {
		t.Fatalf("选择第二帧失败：handled=%t err=%v", handled, err)
	}
	if img.FrameIndex != 1 || img.Width != 275 || img.Height != 202 ||
		img.FrameOffsetX != -79 || img.FrameOffsetY != -57 ||
		img.X != 272 || img.Y != 206 || !img.Dirty {
		t.Fatalf("第二帧状态错误：index=%d size=%dx%d offset=(%d,%d) pos=(%d,%d) dirty=%t",
			img.FrameIndex, img.Width, img.Height, img.FrameOffsetX, img.FrameOffsetY,
			img.X, img.Y, img.Dirty)
	}
	read, handled, err = img.Object.ReadMember(imageFrameMemberHash)
	if err != nil || !handled || read.Kind != "int" || read.Integer != 1 {
		t.Fatalf("frame getter 未返回已选索引：value=%+v handled=%t err=%v", read, handled, err)
	}

	img.Dirty = false
	if handled, err := img.Object.WriteMember(imageFrameMemberHash, script.Value{
		Kind: "int", Integer: 1,
	}); err != nil || !handled || img.Dirty {
		t.Fatalf("重复写入相同 frame 应无副作用：handled=%t dirty=%t err=%v",
			handled, img.Dirty, err)
	}

	if handled, err := img.Object.WriteMember(imageFrameMemberHash, script.Value{
		Kind: "int", Integer: 2,
	}); err != nil || !handled {
		t.Fatalf("原生允许保存超范围帧索引：handled=%t err=%v", handled, err)
	}
	if img.FrameIndex != 2 || img.Width != 0 || img.Height != 0 ||
		img.FrameOffsetX != 0 || img.FrameOffsetY != 0 || !img.Dirty {
		t.Fatalf("超范围帧未映射为空几何：index=%d size=%dx%d offset=(%d,%d) dirty=%t",
			img.FrameIndex, img.Width, img.Height, img.FrameOffsetX, img.FrameOffsetY, img.Dirty)
	}

	img.Dirty = false
	if handled, err := img.Object.WriteMember(imageFrameMemberHash, script.Value{
		Kind: "string", Text: []byte("1"),
	}); !handled || err == nil || img.FrameIndex != 2 || img.Dirty {
		t.Fatalf("非整数写入应被拒绝且不改变状态：handled=%t index=%d dirty=%t err=%v",
			handled, img.FrameIndex, img.Dirty, err)
	}
}

func TestImgExLoadsJPEGAndKeepsPerWriteDefault(t *testing.T) {
	loader, err := NewLoader("../../CLIENT")
	if err != nil {
		t.Fatal(err)
	}
	desktop := NewDesktop(nil, nil)
	loader.configureDesktopResources(desktop)
	img := NewImgEx(desktop)

	source := []byte("IN/IMG/BK.JPG")
	value := script.Value{Kind: "tuple", Items: []script.Value{
		{Kind: "string", Text: source},
		{Kind: "int", Integer: 100},
	}}
	if handled, err := img.Object.WriteMember(0xa06413cf, value); err != nil || !handled {
		t.Fatalf("显式参数的 JPEG 赋值失败：handled=%t err=%v", handled, err)
	}
	if string(img.Source) != "in/img/bk.jpg" || img.LoadFlags != 200 ||
		img.Resource == nil || img.Resource.Bitmap == nil ||
		img.Resource.Bitmap.Bounds() != image.Rect(0, 0, 800, 600) ||
		img.Width != 800 || img.Height != 600 {
		t.Fatalf("JPEG 资源状态错误：source=%q flags=%d size=%dx%d resource=%+v",
			img.Source, img.LoadFlags, img.Width, img.Height, img.Resource)
	}
	source[0] = 'X'
	read, handled, err := img.Object.ReadMember(0xa06413cf)
	if err != nil || !handled || read.Kind != "string" || string(read.Text) != "in/img/bk.jpg" {
		t.Fatalf("src getter 返回错误：value=%+v handled=%t err=%v", read, handled, err)
	}
	read.Text[0] = 'Y'
	if string(img.Source) != "in/img/bk.jpg" {
		t.Fatal("src getter 暴露了内部可变字节")
	}

	if handled, err := img.Object.WriteMember(0xa06413cf, script.Value{
		Kind: "string", Text: []byte("in/img/bk.jpg"),
	}); err != nil || !handled || img.LoadFlags != 196 {
		t.Fatalf("省略参数时未使用默认98：handled=%t flags=%d err=%v", handled, img.LoadFlags, err)
	}
	if handled, err := img.Object.WriteMember(0xa06413cf, script.Value{
		Kind: "tuple", Items: []script.Value{
			{Kind: "string", Text: []byte("")},
			{Kind: "int", Integer: 100},
		},
	}); err != nil || !handled {
		t.Fatalf("清空图片失败：handled=%t err=%v", handled, err)
	}
	if len(img.Source) != 0 || img.Resource != nil || img.Width != 800 || img.Height != 600 {
		t.Fatalf("空路径应清除图像但保留尺寸：source=%q resource=%+v size=%dx%d",
			img.Source, img.Resource, img.Width, img.Height)
	}
}

func TestImgExRejectsInvalidSourceValuesAndMissingLoader(t *testing.T) {
	desktop := NewDesktop(nil, nil)
	img := NewImgEx(desktop)
	for _, value := range []script.Value{
		{Kind: "tuple"},
		{Kind: "tuple", Items: []script.Value{{Kind: "int", Integer: 1}}},
		{Kind: "tuple", Items: []script.Value{
			{Kind: "string", Text: []byte("in/img/bk.jpg")},
			{Kind: "string", Text: []byte("100")},
		}},
		{Kind: "tuple", Items: []script.Value{
			{Kind: "string", Text: []byte("in/img/bk.jpg")},
			{Kind: "int", Integer: 100},
			{Kind: "int", Integer: 1},
		}},
	} {
		if handled, err := img.Object.WriteMember(0xa06413cf, value); !handled || err == nil {
			t.Fatalf("非法 src 值未被拒绝：value=%+v handled=%t err=%v", value, handled, err)
		}
	}
	if handled, err := img.Object.WriteMember(0xa06413cf, script.Value{
		Kind: "string", Text: []byte("in/img/bk.jpg"),
	}); !handled || err == nil || !strings.Contains(err.Error(), "缺少图片资源加载器") {
		t.Fatalf("缺少 loader 时未明确失败：handled=%t err=%v", handled, err)
	}
}

func TestExecuteRegistersRealImgExBeforeFirstUnimplementedMember(t *testing.T) {
	loader, err := NewLoader("../../CLIENT")
	if err != nil {
		t.Fatal(err)
	}
	loader.ResourceCacheDir = t.TempDir()
	system := NewSystemState()
	desktop := NewDesktop(&titleRecorder{}, system)
	loader.configureDesktopResources(desktop)
	desktop.readDirectory = func([]byte) ([][]byte, error) {
		return nil, ErrResourceReadFailed
	}

	programs, err := loader.compileStartup("index.fcc")
	if err != nil {
		t.Fatal(err)
	}
	runtime := script.NewRuntime()
	runtime.HandleDirective = system.HandleDirective
	runtime.CurrentObject = desktop.Object
	RegisterWindowFactory(runtime, desktop)
	RegisterTextFactory(runtime, desktop)
	RegisterImageFactory(runtime, desktop)
	RegisterAtomFactory(runtime, desktop)
	script.RegisterCoreBuiltins(runtime)
	var native *script.NativeError
	if err := runtime.Execute(programs[0]); !errors.As(err, &native) || native.Code != 8 {
		t.Fatalf("SYSTEM.COD 未返回预期的可忽略原生错误：%v", err)
	}
	err = runtime.Execute(programs[1])
	if err == nil || !strings.Contains(err.Error(), "index.fcc:0x51c2") ||
		!strings.Contains(err.Error(), "对象类 0x771f6e8b") {
		t.Fatalf("真实 index 未到预期的下一个未实现调用：%v", err)
	}
	if !errors.Is(desktop.ResourceDirectoryError, ErrResourceReadFailed) {
		t.Fatalf("目录读取失败状态未保留：%v", desktop.ResourceDirectoryError)
	}
	if len(desktop.Images) == 0 {
		t.Fatal("入口未构造任何真实 imgex 图片对象")
	}
	background := desktop.Images[0]
	if string(background.Source) != "in/img/bk.jpg" ||
		background.LoadFlags != 200 ||
		background.Resource == nil || background.Resource.Bitmap == nil ||
		background.Resource.Bitmap.Bounds() != image.Rect(0, 0, 800, 600) ||
		background.Width != 800 || background.Height != 600 {
		t.Fatalf("入口背景未按真实 JPEG 参数加载：source=%q flags=%d size=%dx%d resource=%+v",
			background.Source, background.LoadFlags, background.Width, background.Height, background.Resource)
	}
	if background.Controller == nil || background.Alpha != 0 {
		t.Fatalf("背景动画没有同步提交初值：alpha=%d ctrl=%+v", background.Alpha, background.Controller)
	}
	if len(desktop.Images) < 2 {
		t.Fatal("真实入口没有构造 Logo 图片")
	}
	logo := desktop.Images[1]
	if string(logo.Source) != "in/img/logo.ale" || logo.Stretch || logo.LoadFlags != 200 ||
		logo.Width != 275 || logo.Height != 223 || logo.Resource == nil || len(logo.Resource.Frames) != 1 {
		t.Fatalf("真实 Logo 未按普通 img 加载：%+v", logo)
	}
	if len(desktop.Images) != 17 {
		t.Fatalf("真实地图和三个按钮构造后的图片数量=%d，期望17", len(desktop.Images))
	}
	land := desktop.Images[2]
	if land.X != 272 || land.Y != 206 || land.PointMode != 1 ||
		string(land.Source) != "in/img/map/root/land_02.ale" ||
		land.Width != 130 || land.Height != 99 || land.Resource == nil || len(land.Resource.Frames) != 2 {
		t.Fatalf("带参数 land 构造未设置真实位置/属性/资源：%+v", land)
	}
	for index, source := range []string{"land_02.ale", "land_03.ale", "land_01.ale",
		"land_04.ale", "land_05.ale", "land_06.ale"} {
		first, second := desktop.Images[2+index*2], desktop.Images[3+index*2]
		if string(first.Source) != "in/img/map/root/"+source ||
			string(second.Source) != string(first.Source) || first.FrameIndex != 0 ||
			second.FrameIndex != 1 || second.Object.Owner != first.Object.Owner ||
			first.Resource == nil || second.Resource == nil || len(second.Resource.Frames) != 2 {
			t.Fatalf("地图%d的 CreateObj 子图像帧或所属对象错误：first=%+v second=%+v",
				index, first, second)
		}
	}
	highlight := desktop.Images[3]
	if highlight.Width != 275 || highlight.Height != 202 ||
		highlight.FrameOffsetX != -79 || highlight.FrameOffsetY != -57 {
		t.Fatalf("地图第二帧未应用 frame 几何：%+v", highlight)
	}
	var timer *Controller
	for _, wnd := range desktop.Windows {
		if wnd.Object == background.Object.Owner {
			timer = wnd.namedControllers[0x23a3d969]
			break
		}
	}
	if timer == nil || !timer.timer || timer.remaining != -1 || timer.event != 0xe9f41305 ||
		timer.deadline != 0 || timer.interval != 120000 {
		t.Fatalf("真实入口的命名音乐定时器参数错误：%+v", timer)
	}
	if len(desktop.AtomSystems) != 2 {
		t.Fatalf("真实入口应构造 mousefire 与 upatom，实际粒子系统数=%d", len(desktop.AtomSystems))
	}
	mouseFire := desktop.AtomSystems[0]
	if mouseFire.Object.ClassName != 0xce9677c1 ||
		mouseFire.colors != [3]uint32{0x00ff9966, 0x00ffbbbb, 0x00bb8800} ||
		mouseFire.accelerationX != 0 || mouseFire.accelerationY != float32(-0.29999998211860657) ||
		mouseFire.Width != 800 || mouseFire.Height != 600 {
		t.Fatalf("真实 mousefire 初始化状态错误：%+v", mouseFire)
	}
	if desktop.AtomSystems[1].Object.ClassName != 0x31ff71de {
		t.Fatalf("第二个粒子系统不是 upatom：%#x", desktop.AtomSystems[1].Object.ClassName)
	}
	// 初始化失败后只诊断已有对象；音乐回调依赖的后续全局对象尚未构造。
	updateErr := desktop.Update(0, runtime)
	if updateErr == nil || !strings.Contains(updateErr.Error(), "index.fcc:0x4238") ||
		!strings.Contains(updateErr.Error(), "未定义名称 0x9975bdf1") {
		t.Fatalf("已有对象更新未越过 CallSub 或未保留后续未初始化错误：%v", updateErr)
	}
}

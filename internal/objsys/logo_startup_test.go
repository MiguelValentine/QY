package objsys

import (
	"errors"
	"testing"

	"QY/internal/script"
	"QY/internal/symbol"
)

func TestRealLogoStartupPathCompletesOnIn(t *testing.T) {
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
	startupErr := runtime.Execute(programs[1])
	if startupErr != nil {
		t.Logf("入口后续停止点（保留原始错误）：%v", startupErr)
	}
	t.Logf("入口构造图片总数=%d", len(desktop.Images))
	for index, img := range desktop.Images {
		var ownerClass uint32
		if img.Object.Owner != nil {
			ownerClass = img.Object.Owner.ClassName
		}
		t.Logf("图片[%d] object=%p source=%q frame=%d owner=%p ownerClass=0x%08x",
			index, img.Object, img.Source, img.FrameIndex, img.Object.Owner, ownerClass)
	}

	var logo *ImgEx
	for _, img := range desktop.Images {
		if string(img.Source) == "in/img/logo.ale" {
			logo = img
			break
		}
	}
	if logo == nil {
		t.Fatalf("入口错误前没有构造真实 Logo：startupErr=%v，图片数=%d",
			startupErr, len(desktop.Images))
	}
	if logo.Resource == nil || len(logo.Resource.Frames) != 1 ||
		logo.Width != 275 || logo.Height != 223 {
		t.Fatalf("Logo 资源状态异常：source=%q size=%dx%d resource=%+v",
			logo.Source, logo.Width, logo.Height, logo.Resource)
	}

	// 只用真实 Logo 对象推进动画，避免桌面其他子系统的未恢复回调阻断此项验证。
	animationDesktop := &Desktop{
		Object:  logo.Object,
		Windows: []*Wnd{logo.Wnd},
		Images:  []*ImgEx{logo},
	}
	if err := animationDesktop.Update(1, runtime); err != nil {
		t.Fatalf("Logo OnLoaded 派发失败：%v，位置=(%d,%d)",
			err, logo.X, logo.Y)
	}
	if logo.X != 27 || logo.Y != 790 || logo.Path == nil ||
		logo.Path.targetX != 0 || logo.Path.targetY != -200 ||
		logo.Path.event != symbol.StringTableHash("OnIn") {
		t.Fatalf("Logo OnLoaded 未绑定预期 path：位置=(%d,%d)，path=%+v",
			logo.X, logo.Y, logo.Path)
	}

	for tick := uint32(2); tick <= 128 && (logo.Path == nil || !logo.Path.finished); tick++ {
		if err := animationDesktop.Update(tick, runtime); err != nil {
			t.Fatalf("Logo path/OnIn 在 tick=%d 失败：%v，位置=(%d,%d)，path=%+v",
				tick, err, logo.X, logo.Y, logo.Path)
		}
	}
	if logo.Path == nil || !logo.Path.finished || logo.X != 27 || logo.Y != 590 {
		t.Fatalf("Logo path 未回到原位：位置=(%d,%d)，path=%+v",
			logo.X, logo.Y, logo.Path)
	}
}

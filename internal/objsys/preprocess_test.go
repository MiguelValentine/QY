package objsys

import (
	"bytes"
	"errors"
	"net/http"
	"reflect"
	"strings"
	"testing"

	"QY/internal/script"
)

type startupFailureTransport struct {
	requests int
}

func (transport *startupFailureTransport) RoundTrip(request *http.Request) (*http.Response, error) {
	transport.requests++
	return nil, errors.New("测试资源服务器不可用")
}

func TestRealStartupContinuesAfterResourceDownloadFailure(t *testing.T) {
	loader, err := NewLoader("../../CLIENT")
	if err != nil {
		t.Fatal(err)
	}
	transport := &startupFailureTransport{}
	loader.ResourceHTTPClient = &http.Client{Transport: transport}
	loader.ResourceCacheDir = t.TempDir()
	var diagnostics []error
	loader.ReportDiagnostic = func(err error) { diagnostics = append(diagnostics, err) }
	err = loader.ExecuteWithWindow("index.fcc", &titleRecorder{})
	if err == nil || !strings.Contains(err.Error(), "com/ctrl.fcc:0xb2a") ||
		!strings.Contains(err.Error(), "未定义名称 0x1bc7abd3") || transport.requests != 10 {
		t.Fatalf("资源请求失败后没有继续真实入口：requests=%d err=%v", transport.requests, err)
	}
	if len(diagnostics) != 2 || !errors.Is(diagnostics[1], ErrResourceReadFailed) {
		t.Fatalf("实际获取失败诊断丢失：%v", diagnostics)
	}
}

func TestCompileRealStartupScripts(t *testing.T) {
	loader, err := NewLoader("../../CLIENT")
	if err != nil {
		t.Fatal(err)
	}
	for _, entry := range []string{"index.fcc", "in/login.fcc", "com/client.fcc", "lobby/lobby.fcc", "home/lobby/regman.fcc"} {
		t.Run(entry, func(t *testing.T) {
			program, err := loader.Compile(entry)
			if err != nil {
				t.Fatal(err)
			}
			if len(program.Body) == 0 {
				t.Fatal("真实脚本没有生成语法树")
			}
			if entry == "index.fcc" {
				want := []string{"com/newtip.fcc", "com/kele8com.fcc", "com/ctrl.fcc", "com/misc.fcc", "com/fMenu.fcc"}
				if !reflect.DeepEqual(program.Includes, want) {
					t.Fatalf("入口的活动包含文件=%v", program.Includes)
				}
				if len(program.Directives) != 1 || program.Directives[0].Kind != 1650 {
					t.Fatalf("入口系统指令未保留：%v", program.Directives)
				}
			}
		})
	}
}

func TestSourceContextConstants(t *testing.T) {
	loader, err := NewLoader("../../CLIENT")
	if err != nil {
		t.Fatal(err)
	}
	root, err := loader.scriptSource("index.fcc", true)
	if err != nil {
		t.Fatal(err)
	}
	child, err := loader.scriptSource(`com\ctrl.fcc`, false)
	if err != nil {
		t.Fatal(err)
	}
	for _, test := range []struct {
		key    uint32
		parent string
		child  string
	}{
		{0x2dc4903a, "", "com/"},
		{0xc25d0866, "index.fcc", "ctrl.fcc"},
		{0x332d0004, "index.fcc", "com/ctrl.fcc"},
	} {
		if !bytes.Equal(root.Constants[test.key].Text, []byte(test.parent)) ||
			!bytes.Equal(child.Constants[test.key].Text, []byte(test.child)) {
			t.Fatalf("来源常量 0x%08x 不正确", test.key)
		}
	}
	if root.Constants[0x60b53ad3].Value != 1 || !reflect.DeepEqual(child.Undefines, []uint32{0x60b53ad3}) {
		t.Fatal("主入口标志未按包含上下文切换")
	}
}

func TestExecuteContinuesAfterNativeSystemError(t *testing.T) {
	loader, err := NewLoader("../../CLIENT")
	if err != nil {
		t.Fatal(err)
	}
	var diagnostics []error
	loader.ReportDiagnostic = func(err error) {
		diagnostics = append(diagnostics, err)
	}
	err = loader.Execute("index.fcc")
	if !errors.Is(err, ErrExecutionUnavailable) || !errors.Is(err, ErrWindowUnavailable) ||
		!strings.Contains(err.Error(), "index.fcc:0x4a") {
		t.Fatalf("没有继续到入口窗口操作：%v", err)
	}
	window := &titleRecorder{}
	err = loader.ExecuteWithWindow("index.fcc", window)
	if !errors.Is(err, ErrExecutionUnavailable) || errors.Is(err, ErrWindowUnavailable) ||
		window.calls != 1 || window.fontCalls != 1 || window.sizeCalls != 1 ||
		!strings.Contains(err.Error(), "com/kele8com.fcc:0x39e") ||
		!errors.Is(err, ErrResourceNetworkUnavailable) {
		t.Fatalf("入口设置应在系统脚本完成后执行：calls=%d fonts=%d sizes=%d err=%v", window.calls, window.fontCalls, window.sizeCalls, err)
	}
	if len(diagnostics) != 2 {
		t.Fatalf("系统原生错误应逐次报告：%v", diagnostics)
	}
	for _, diagnostic := range diagnostics {
		var native *script.NativeError
		if !errors.As(diagnostic, &native) || native.Code != 8 ||
			!strings.Contains(diagnostic.Error(), "res$SYSTEM.COD:0x7316") {
			t.Fatalf("报告的系统错误丢失位置或原生错误码：%v", diagnostic)
		}
	}
}

func TestRealEntryInitializesBackgroundLayoutAndInterface(t *testing.T) {
	loader, err := NewLoader("../../CLIENT")
	if err != nil {
		t.Fatal(err)
	}
	programs, err := loader.compileStartup("index.fcc")
	if err != nil {
		t.Fatal(err)
	}
	runtime := script.NewRuntime()
	system := NewSystemState()
	desktop := NewDesktop(&titleRecorder{}, system)
	loader.configureDesktopResources(desktop)
	runtime.CurrentObject = desktop.Object
	runtime.HandleDirective = system.HandleDirective
	RegisterWindowFactory(runtime, desktop)
	RegisterTextFactory(runtime, desktop)
	script.RegisterCoreBuiltins(runtime)
	var native *script.NativeError
	if err := runtime.Execute(programs[0]); !errors.As(err, &native) || native.Code != 8 {
		t.Fatalf("系统脚本未报告预期原生错误：%v", err)
	}
	err = runtime.Execute(programs[1])
	if !errors.Is(err, ErrResourceNetworkUnavailable) || !strings.Contains(err.Error(), "com/kele8com.fcc:0x39e") {
		t.Fatalf("入口未明确报告资源网络后端缺失：%v", err)
	}
	mappings := desktop.PathMappings.Entries()
	if len(mappings) != 1 || string(mappings[0].Source) != `118.190.38.92\world\kele8\` ||
		string(mappings[0].Target) != "kele8com" {
		t.Fatalf("真实入口没有登记预期资源路径映射：%+v", mappings)
	}
	if string(desktop.ResourceDirectoryPath) != "http://118.190.38.92/world/kele8/files_dir.dz" ||
		desktop.ResourceDirectoryError != nil {
		t.Fatalf("目录请求参数或未执行状态不正确：path=%q err=%v",
			desktop.ResourceDirectoryPath, desktop.ResourceDirectoryError)
	}
	if !desktop.Background.NullBound || desktop.Background.Kind != "color" ||
		desktop.Background.Color565 != 0x018c {
		t.Fatalf("入口空绑定未保留系统背景记录：%+v", desktop.Background)
	}
	for _, wnd := range desktop.Windows {
		if wnd.Object.Owner != desktop.Object || wnd.Width != 800 || wnd.Height != 600 {
			continue
		}
		if wnd.Background.Kind != "color" || wnd.Background.Color565 != 0 || wnd.Background.NullBound {
			t.Fatalf("入口主容器背景错误：%+v", wnd.Background)
		}
		for _, entry := range wnd.Interfaces {
			if string(entry.Name) == "kele8com" && entry.Object != nil && entry.Object.Owner == wnd.Object {
				return
			}
		}
		t.Fatal("主容器没有登记真实 kele8com 子对象")
	}
	t.Fatal("真实入口未按父尺寸构造800×600主容器")
}

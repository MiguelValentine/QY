package objsys

import (
	"errors"
	"fmt"
	"os"
	"path"
	"path/filepath"
	"strings"
	"time"

	"QY/internal/script"
)

// ErrExecutionUnavailable 表示资源已准备，但运行所需能力仍未恢复。
var ErrExecutionUnavailable = errors.New("脚本执行器、图形/ALE 和插件玩法尚未完整恢复")

// Reference 是字符串池中的资源候选；它不能证明运行时一定会加载该资源。
type Reference struct {
	Member     string `json:"member"`
	Offset     int    `json:"offset"`
	RawPath    string `json:"raw_path"`
	Kind       string `json:"kind"`
	ClientPath string `json:"client_path"`
	Available  bool   `json:"available"`
	Issue      string `json:"issue,omitempty"`
}

// Preparation 保存入口解析结果以及启动前仍需补齐的能力。
type Preparation struct {
	Entry          string      `json:"entry"`
	Members        int         `json:"members"`
	Tokens         int         `json:"tokens"`
	References     []Reference `json:"candidate_references"`
	MissingRuntime []string    `json:"missing_runtime"`
}

// Prepare 读取真实入口文件，只检查字符串池中完整的资源路径，不联网、不执行脚本。
// 引用可能位于条件分支或供动态加载使用，缺失候选不会直接判定入口必然失败。
func (l *Loader) Prepare(entry string) (*Preparation, error) {
	module, err := l.Load(entry)
	if err != nil {
		return nil, err
	}
	report := &Preparation{
		Entry:      entry,
		Members:    len(module.Members),
		References: []Reference{},
		MissingRuntime: []string{
			"完整脚本语义和内置对象",
			"图形/ALE、音频及窗口事件",
			"PacMan、Showdown 插件玩法",
		},
	}
	entry = strings.ReplaceAll(entry, "\\", "/")
	for _, member := range module.Members {
		if member.Document == nil {
			continue
		}
		report.Tokens += len(member.Document.Tokens)
		for _, value := range member.Document.Strings {
			name, kind, ok := referencePath(value.Raw)
			if !ok {
				continue
			}
			ref := Reference{Member: member.Name, Offset: value.Offset, RawPath: string(value.Raw), Kind: kind}
			// 原始相对路径以入口脚本所在目录为候选基准，保留原文以便复核。
			candidate := path.Join(path.Dir(entry), name)
			if strings.HasPrefix(name, "/") {
				candidate = name
			}
			ref.ClientPath = candidate
			resolved, resolveErr := l.Resolve(candidate)
			if resolveErr != nil {
				ref.Issue = resolveErr.Error()
			} else {
				relative, relErr := filepath.Rel(l.root, resolved)
				if relErr != nil {
					return nil, relErr
				}
				ref.ClientPath = filepath.ToSlash(relative)
				info, statErr := os.Stat(resolved)
				if statErr != nil {
					ref.Issue = statErr.Error()
				} else if !info.Mode().IsRegular() {
					ref.Issue = "候选路径不是普通文件"
				} else {
					ref.Available = true
				}
			}
			report.References = append(report.References, ref)
		}
	}
	return report, nil
}

// Execute 通过真实入口的预处理、编译和 Go 求值路径，返回首个未恢复的运行能力。
func (l *Loader) Execute(entry string) error {
	return l.ExecuteWithWindow(entry, nil)
}

// ExecuteWithWindow 将已创建的实际窗口接入入口；其余运行能力仍逐项检查。
func (l *Loader) ExecuteWithWindow(entry string, window DesktopWindow) error {
	programs, err := l.compileStartup(entry)
	if err != nil {
		return err
	}
	runtime := script.NewRuntime()
	system := NewSystemState()
	runtime.HandleDirective = system.HandleDirective
	desktop := NewDesktop(window, system)
	l.configureDesktopResources(desktop)
	runtime.CurrentObject = desktop.Object
	RegisterWindowFactory(runtime, desktop)
	RegisterTextFactory(runtime, desktop)
	RegisterImageFactory(runtime, desktop)
	RegisterAtomFactory(runtime, desktop)
	RegisterViewFactory(runtime, desktop)
	script.RegisterCoreBuiltins(runtime)
	if updates, ok := window.(DesktopUpdates); ok {
		started := time.Now()
		updates.SetUpdate(func() error {
			return desktop.Update(uint32(time.Since(started)/time.Millisecond), runtime)
		})
	}
	for index, program := range programs {
		if err := runtime.Execute(program); err != nil {
			var native *script.NativeError
			// 原生 0x100601a4 执行系统脚本后不检查返回值，继续构造桌面。
			// 仅恢复已知原生错误的继续路径，未实现功能不能当作该错误忽略。
			if index == 0 && errors.As(err, &native) {
				if l.ReportDiagnostic != nil {
					l.ReportDiagnostic(err)
				}
				continue
			}
			return fmt.Errorf("%w：入口 %q：%w", ErrExecutionUnavailable, entry, err)
		}
	}
	return fmt.Errorf("%w：入口 %q 已执行支持的脚本，图形、事件循环及插件尚不能运行游戏",
		ErrExecutionUnavailable, entry)
}

func referencePath(raw []byte) (string, string, bool) {
	if len(raw) == 0 {
		return "", "", false
	}
	for _, b := range raw {
		// 此处只识别完整 ASCII 路径，不把脚本文本、换行或二进制数据误作路径。
		if b < 0x20 || b > 0x7e || b == '"' || b == '<' || b == '>' || b == '|' || b == '*' || b == '?' {
			return "", "", false
		}
	}
	name := strings.ReplaceAll(string(raw), "\\", "/")
	switch strings.ToLower(path.Ext(name)) {
	case ".fcc":
		return name, "fcc", true
	case ".dll":
		return name, "dll", true
	default:
		return "", "", false
	}
}

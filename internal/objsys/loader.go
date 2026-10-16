// objsys 包提供客户端资源加载；已恢复的 DLL 算法直接调用 Go 函数。
package objsys

import (
	"fmt"
	"net/http"
	"os"
	"path/filepath"
	"strings"

	"QY/internal/fc0a"
	"QY/internal/fcc"
)

// Loader 将资源查找范围限定到客户端目录。
type Loader struct {
	root string
	// ReportDiagnostic 接收启动过程中已确认由原生调用者忽略的脚本错误。
	ReportDiagnostic func(error)
	// ResourceHTTPClient 用于真实资源获取；nil 时明确报告尚未启用网络。
	ResourceHTTPClient *http.Client
	// ResourceCacheDir 保存运行时下载，空值使用系统用户缓存目录。
	ResourceCacheDir string
}

// Module 保存一份 FCC 解包后的全部成员。
type Module struct {
	Path    string   `json:"path"`
	Members []Script `json:"members"`
}

// Script 保留资源原始内容以及已经验证的 FC0A 结构。
type Script struct {
	Name     string         `json:"name"`
	Format   string         `json:"format"`
	Document *fc0a.Document `json:"document,omitempty"`
	Data     []byte         `json:"-"`
}

// NewLoader 解析根目录符号链接，并确认该路径是目录。
func NewLoader(root string) (*Loader, error) {
	absolute, err := filepath.Abs(root)
	if err != nil {
		return nil, err
	}
	absolute, err = filepath.EvalSymlinks(absolute)
	if err != nil {
		return nil, err
	}
	stat, err := os.Stat(absolute)
	if err != nil {
		return nil, err
	}
	if !stat.IsDir() {
		return nil, fmt.Errorf("objsys: 客户端路径必须是目录")
	}
	return &Loader{root: absolute}, nil
}

// Resolve 兼容 Windows 分隔符和不区分大小写的资源名。
// 大小写冲突和越过客户端目录的符号链接均返回错误。
func (l *Loader) Resolve(name string) (string, error) {
	name = strings.ReplaceAll(name, "\\", "/")
	if name == "" || strings.HasPrefix(name, "/") || strings.Contains(name, ":") {
		return "", fmt.Errorf("objsys: 无效资源路径 %q", name)
	}
	clean := filepath.Clean(filepath.FromSlash(name))
	if clean == "." || clean == ".." || strings.HasPrefix(clean, ".."+string(filepath.Separator)) {
		return "", fmt.Errorf("objsys: 资源路径越界 %q", name)
	}
	current := l.root
	for _, component := range strings.Split(clean, string(filepath.Separator)) {
		entries, err := os.ReadDir(current)
		if err != nil {
			return "", err
		}
		matched := ""
		for _, entry := range entries {
			if strings.EqualFold(entry.Name(), component) {
				if matched != "" {
					return "", fmt.Errorf("objsys: 路径大小写冲突 %q", name)
				}
				matched = entry.Name()
			}
		}
		if matched == "" {
			return "", fmt.Errorf("objsys: 资源不存在 %q", name)
		}
		current, err = filepath.EvalSymlinks(filepath.Join(current, matched))
		if err != nil {
			return "", err
		}
		rel, err := filepath.Rel(l.root, current)
		if err != nil || rel == ".." || strings.HasPrefix(rel, ".."+string(filepath.Separator)) {
			return "", fmt.Errorf("objsys: 资源符号链接越界 %q", name)
		}
	}
	return current, nil
}

// Load 直接读取客户端 FCC，不依赖分析阶段提取的文件和原始 DLL。
func (l *Loader) Load(name string) (*Module, error) {
	path, err := l.Resolve(name)
	if err != nil {
		return nil, err
	}
	stat, err := os.Stat(path)
	if err != nil {
		return nil, err
	}
	if !stat.Mode().IsRegular() || stat.Size() > fc0a.MaxDocumentSize {
		return nil, fmt.Errorf("objsys: 资源必须是小于 %d 字节的普通文件", fc0a.MaxDocumentSize)
	}
	data, err := os.ReadFile(path)
	if err != nil {
		return nil, err
	}
	return decodeModule(name, data)
}

func decodeModule(name string, data []byte) (*Module, error) {
	members, err := fcc.Open(data)
	if err != nil {
		return nil, fmt.Errorf("%s: %w", name, err)
	}
	module := &Module{Path: name}
	for _, member := range members {
		if len(member.Data) < 4 {
			return nil, fmt.Errorf("%s/%s: 资源头被截断", name, member.Name)
		}
		script := Script{Name: member.Name, Format: string(member.Data[:4]), Data: member.Data}
		if script.Format == "FC0A" {
			script.Document, err = fc0a.Parse(member.Data)
			if err != nil {
				return nil, fmt.Errorf("%s/%s: %w", name, member.Name, err)
			}
		} else if script.Format != "FCTB" {
			return nil, fmt.Errorf("%s/%s: 未支持资源格式 %q", name, member.Name, script.Format)
		}
		module.Members = append(module.Members, script)
	}
	return module, nil
}

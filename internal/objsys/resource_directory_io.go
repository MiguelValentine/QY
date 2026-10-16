package objsys

import (
	"bytes"
	"fmt"
	"os"
	"path/filepath"
	"strings"

	"QY/internal/fcc"
)

// configureDesktopResources 把实际资源读取接入桌面，缓存与客户端原件分离。
func (l *Loader) configureDesktopResources(desktop *Desktop) {
	desktop.Background.loadImage = l.loadImageResource
	desktop.reportResourceError = l.ReportDiagnostic
	desktop.readDirectory = func(source []byte) ([][]byte, error) {
		cacheRoot := l.ResourceCacheDir
		if cacheRoot == "" {
			directory, err := os.UserCacheDir()
			if err != nil {
				return nil, err
			}
			cacheRoot = filepath.Join(directory, "qy-fcrunner")
		}
		cacheRoot, err := filepath.Abs(cacheRoot)
		if err != nil {
			return nil, err
		}
		nativePath, handled, err := desktop.PathMappings.ResolveURL(source, []byte(cacheRoot+string(filepath.Separator)))
		if err != nil {
			return nil, err
		}
		if !handled {
			return nil, fmt.Errorf("资源目录 URL 未匹配已恢复的路径规则")
		}
		cachePath := filepath.Clean(strings.ReplaceAll(string(nativePath), `\`, "/"))
		relative, err := filepath.Rel(cacheRoot, cachePath)
		if err != nil || relative == ".." || strings.HasPrefix(relative, ".."+string(filepath.Separator)) {
			return nil, fmt.Errorf("资源缓存路径超出缓存目录")
		}
		// 缓存时间与目录校验字段的完整判定尚未恢复，当前每次从实际后端获取。
		data, err := fetchResourceHTTP(l.ResourceHTTPClient, string(nulBytes(source)))
		if err != nil {
			return nil, err
		}
		if err := writeResourceCache(cachePath, data); err != nil {
			return nil, fmt.Errorf("%w：写入缓存：%w", ErrResourceReadFailed, err)
		}
		return decodeResourceDirectoryLines(data)
	}
}

func decodeResourceDirectoryLines(data []byte) ([][]byte, error) {
	payload, split, err := fcc.DecodeText(data)
	if err != nil {
		return nil, fmt.Errorf("%w：文本解码：%w", ErrResourceReadFailed, err)
	}
	if !split {
		return nil, nil
	}
	return bytes.Split(payload, []byte("\r\n")), nil
}

// writeResourceCache 完整写入临时文件后替换缓存，失败不留下半份资源。
func writeResourceCache(path string, data []byte) error {
	directory := filepath.Dir(path)
	if err := os.MkdirAll(directory, 0o755); err != nil {
		return err
	}
	file, err := os.CreateTemp(directory, ".download-*")
	if err != nil {
		return err
	}
	defer os.Remove(file.Name())
	if _, err := file.Write(data); err != nil {
		_ = file.Close()
		return err
	}
	if err := file.Close(); err != nil {
		return err
	}
	return os.Rename(file.Name(), path)
}

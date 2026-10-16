package objsys

import (
	"errors"
	"fmt"
	"io"
	"net/http"
)

// ErrResourceNetworkUnavailable 表示资源请求尚未配置实际网络后端。
var ErrResourceNetworkUnavailable = errors.New("资源网络后端尚未启用")

// ErrResourceReadFailed 表示实际获取已失败，可沿原生目录加载失败分支继续。
var ErrResourceReadFailed = errors.New("资源获取失败")

const maxTextResourceBytes = 64 << 20

// fetchResourceHTTP 使用 Go HTTP 后端执行资源请求，不把错误响应当作资源内容。
// 原生获取器最多尝试十轮；HTTP 后端的超时由传入客户端设置。
func fetchResourceHTTP(client *http.Client, source string) ([]byte, error) {
	if client == nil {
		return nil, ErrResourceNetworkUnavailable
	}
	var last error
	for attempt := 0; attempt < 10; attempt++ {
		response, err := client.Get(source)
		if err != nil {
			last = err
			continue
		}
		data, readErr := io.ReadAll(io.LimitReader(response.Body, maxTextResourceBytes+1))
		closeErr := response.Body.Close()
		switch {
		case response.StatusCode < 200 || response.StatusCode >= 300:
			last = fmt.Errorf("HTTP 状态 %d", response.StatusCode)
		case readErr != nil:
			last = readErr
		case closeErr != nil:
			last = closeErr
		case len(data) > maxTextResourceBytes:
			return nil, fmt.Errorf("%w：%q 超过 64 MiB", ErrResourceReadFailed, source)
		default:
			return data, nil
		}
	}
	return nil, fmt.Errorf("%w：%q：%w", ErrResourceReadFailed, source, last)
}

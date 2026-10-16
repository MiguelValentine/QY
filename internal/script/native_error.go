package script

import "fmt"

// NativeError 表示已经恢复的原生脚本错误，与尚未实现的能力区分。
type NativeError struct {
	Code    int
	Message string
}

func (e *NativeError) Error() string {
	return fmt.Sprintf("原生脚本错误 %d：%s", e.Code, e.Message)
}

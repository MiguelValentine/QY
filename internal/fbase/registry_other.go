//go:build !windows

package fbase

import "errors"

// ErrRegistryUnavailable 表示当前平台没有实现Windows注册表读取。
var ErrRegistryUnavailable = errors.New("Windows注册表不可用")

// ReadMachineString 在非Windows平台返回明确的不可用错误。
func ReadMachineString(subkey, name string) ([]byte, error) {
	return nil, ErrRegistryUnavailable
}

//go:build windows

package fbase

import (
	"errors"
	"fmt"
	"strings"
	"syscall"
	"unsafe"
)

const (
	hkeyLocalMachine  = uintptr(0x80000002)
	keyQueryValue     = uintptr(0x0001)
	keyWOW6432        = uintptr(0x0200)
	registryMaxBytes  = 0x2000
	errorFileNotFound = syscall.Errno(2)
	errorPathNotFound = syscall.Errno(3)
	errorMoreData     = syscall.Errno(234)
)

var (
	advapi32         = syscall.NewLazyDLL("advapi32.dll")
	regOpenKeyExA    = advapi32.NewProc("RegOpenKeyExA")
	regQueryValueExA = advapi32.NewProc("RegQueryValueExA")
	regCloseKey      = advapi32.NewProc("RegCloseKey")
)

// ErrRegistryUnavailable 表示当前平台没有实现Windows注册表读取。
var ErrRegistryUnavailable = errors.New("Windows注册表不可用")

// ReadMachineString 读取 HKLM\\SOFTWARE\\XXT\\<subkey> 中的ANSI字符串原始字节。
// 字符串以第一个NUL为止，最大读取长度与原生FBase实现一致，为8192字节。
func ReadMachineString(subkey, name string) ([]byte, error) {
	if strings.IndexByte(subkey, 0) >= 0 || strings.IndexByte(name, 0) >= 0 {
		return nil, errors.New("注册表路径或名称包含NUL")
	}
	path := "SOFTWARE\\XXT\\"
	path += subkey
	keyPath, err := syscall.BytePtrFromString(path)
	if err != nil {
		return nil, fmt.Errorf("注册表子键无效: %w", err)
	}
	valueName, err := syscall.BytePtrFromString(name)
	if err != nil {
		return nil, fmt.Errorf("注册表值名称无效: %w", err)
	}

	var key uintptr
	status, _, _ := regOpenKeyExA.Call(
		hkeyLocalMachine,
		uintptr(unsafe.Pointer(keyPath)),
		0,
		keyQueryValue|keyWOW6432,
		uintptr(unsafe.Pointer(&key)),
	)
	if status != 0 {
		return missingRegistryEntry(status)
	}
	defer regCloseKey.Call(key)

	data := make([]byte, registryMaxBytes)
	size := uint32(len(data))
	status, _, _ = regQueryValueExA.Call(
		key,
		uintptr(unsafe.Pointer(valueName)),
		0,
		0,
		uintptr(unsafe.Pointer(&data[0])),
		uintptr(unsafe.Pointer(&size)),
	)
	if status != 0 {
		return missingRegistryEntry(status)
	}
	if size > uint32(len(data)) {
		return nil, fmt.Errorf("注册表值超过%d字节", registryMaxBytes)
	}
	data = data[:size]
	if nul := strings.IndexByte(string(data), 0); nul >= 0 {
		data = data[:nul]
	}
	return data, nil
}

func missingRegistryEntry(status uintptr) ([]byte, error) {
	errno := syscall.Errno(status)
	if errno == errorFileNotFound || errno == errorPathNotFound {
		return []byte{}, nil
	}
	if errno == errorMoreData {
		return nil, fmt.Errorf("注册表值超过%d字节: %w", registryMaxBytes, errno)
	}
	return nil, fmt.Errorf("读取注册表失败: %w", errno)
}

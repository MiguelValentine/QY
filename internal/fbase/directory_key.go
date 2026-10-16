package fbase

import (
	"bytes"
	"errors"
	"fmt"

	"QY/internal/symbol"
)

var ErrDirectoryPathNonASCII = errors.New("fbase: 目录路径包含不支持的非 ASCII 字节")

var directoryPathDotReplacements = [][]byte{
	[]byte(`\.\`),
	[]byte(`/.\`),
	[]byte(`/./`),
	[]byte(`\./`),
}

// DirectoryPathHash 按 objsys.dll 与 FBase.dll 的路径处理流程计算目录键。
func DirectoryPathHash(input []byte) (uint32, error) {
	value := cloneBytes(cString(input))
	for i, ch := range value {
		if ch >= 0x80 {
			return 0, fmt.Errorf("%w: 偏移 %d", ErrDirectoryPathNonASCII, i)
		}
		if ch == '/' {
			value[i] = '\\'
		} else if ch >= 'A' && ch <= 'Z' {
			value[i] = ch + ('a' - 'A')
		}
	}

	value = resolveDotSegments(value)
	for _, old := range directoryPathDotReplacements {
		value = bytes.ReplaceAll(value, old, []byte{'/'})
	}

	return symbol.StringTableHash(string(value)), nil
}

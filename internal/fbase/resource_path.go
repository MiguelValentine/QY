package fbase

import (
	"bytes"
	"fmt"

	"QY/internal/symbol"
)

// ResolveURL 按 FBase #217 将 HTTP URL 转为本地资源路径。
// root 是调用方提供的本地缓存根目录；返回路径使用 Windows 反斜杠。
func (m *PathMappings) ResolveURL(source, root []byte) (path []byte, handled bool, err error) {
	source = cString(source)
	if !bytes.HasPrefix(source, []byte(pathMappingPrefix)) {
		return nil, false, nil
	}

	normalized := resolveDotSegments(normalizePathMappingSource(source))
	extensionIndex := bytes.LastIndexByte(normalized, '.')
	extension := []byte(nil)
	stem := normalized
	if extensionIndex >= 0 {
		extension = normalized[extensionIndex+1:]
		stem = normalized[:extensionIndex]
	}

	m.mu.RLock()
	defer m.mu.RUnlock()

	for _, entry := range m.entries {
		if !bytes.HasPrefix(stem, entry.Source) {
			continue
		}

		remainder := stem[len(entry.Source):]
		if bytes.Equal(extension, []byte("dll")) {
			return appendPath(root, entry.Target, []byte{'\\'}, remainder, []byte(".dll")), true, nil
		}

		hashInput := make([]byte, 0, len(extension)+len(remainder))
		hashInput = append(hashInput, extension...)
		hashInput = append(hashInput, remainder...)
		hash := symbol.StringTableHash(string(hashInput))
		return appendPath(root, entry.Target, []byte{'\\'}, []byte(fmt.Sprintf("%08X.fch", hash))), true, nil
	}

	unmapped := bytes.ReplaceAll(normalized, []byte{':'}, []byte{'_'})
	unmapped = bytes.ReplaceAll(unmapped, []byte{'\\'}, []byte{'@'})
	return appendPath(root, unmapped), true, nil
}

// SplitResourcePath 按 FBase #216 拆分目录和文件名。
// 目录结果在存在分隔符时总以反斜杠结尾。
func SplitResourcePath(source []byte) (directory, basename []byte) {
	source = cString(source)
	index := bytes.LastIndexAny(source, `/\`)
	if index < 0 {
		return nil, cloneBytes(source)
	}
	directory = append(cloneBytes(source[:index]), '\\')
	basename = cloneBytes(source[index+1:])
	return directory, basename
}

func resolveDotSegments(value []byte) []byte {
	parts := bytes.Split(value, []byte{'\\'})
	stack := make([][]byte, 0, len(parts))
	for i, part := range parts {
		if bytes.Equal(part, []byte("..")) && i < len(parts)-1 {
			if len(stack) > 0 {
				stack = stack[:len(stack)-1]
			}
			continue
		}
		stack = append(stack, part)
	}
	return bytes.Join(stack, []byte{'\\'})
}

func appendPath(parts ...[]byte) []byte {
	var result []byte
	for i, part := range parts {
		if len(part) == 0 {
			continue
		}
		if i == 0 {
			result = cloneBytes(part)
			if result[len(result)-1] != '\\' && result[len(result)-1] != '/' {
				result = append(result, '\\')
			}
			continue
		}
		result = append(result, part...)
	}
	return result
}

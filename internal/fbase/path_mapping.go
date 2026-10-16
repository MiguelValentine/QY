package fbase

import (
	"bytes"
	"errors"
	"fmt"
	"sync"
)

const (
	pathMappingPrefix      = "http://"
	pathMappingCapacity    = 19
	pathMappingBufferBytes = 0x104
	pathMappingMaxBytes    = pathMappingBufferBytes - 1
)

var ErrPathMappingValueTooLong = errors.New("fbase: 路径映射字符串超过原生缓冲区")

// PathMapping 是路径映射表的一项只读快照。
type PathMapping struct {
	Source []byte
	Target []byte
}

// PathMappings 保存 FBase #215 使用的进程内路径映射表。
type PathMappings struct {
	mu      sync.RWMutex
	entries []PathMapping
}

// Register 按 FBase #215 的规则添加或替换映射。
// 源 URL 去掉 http:// 前缀、转为小写并把斜杠统一为反斜杠；目标保持原样。
// 字符串遵循 C 字符串语义；超出原生固定缓冲区时返回错误，不截断。
func (m *PathMappings) Register(source, target []byte) (bool, error) {
	source = cString(source)
	target = cString(target)

	if !bytes.HasPrefix(source, []byte(pathMappingPrefix)) {
		return false, nil
	}
	source = normalizePathMappingSource(source)

	if len(source) > pathMappingMaxBytes {
		return false, fmt.Errorf("%w: source 长度 %d，最大 %d", ErrPathMappingValueTooLong, len(source), pathMappingMaxBytes)
	}
	if len(target) > pathMappingMaxBytes {
		return false, fmt.Errorf("%w: target 长度 %d，最大 %d", ErrPathMappingValueTooLong, len(target), pathMappingMaxBytes)
	}

	m.mu.Lock()
	defer m.mu.Unlock()

	// 原生实现先检查表容量，达到上限时连已有键的替换也会拒绝。
	if len(m.entries) >= pathMappingCapacity {
		return false, nil
	}

	for i := range m.entries {
		if bytes.Equal(m.entries[i].Source, source) {
			m.entries[i].Target = cloneBytes(target)
			return true, nil
		}
	}

	m.entries = append(m.entries, PathMapping{
		Source: cloneBytes(source),
		Target: cloneBytes(target),
	})
	return true, nil
}

// Entries 返回保持注册顺序的独立快照；修改返回切片不会改变映射表。
func (m *PathMappings) Entries() []PathMapping {
	m.mu.RLock()
	defer m.mu.RUnlock()

	entries := make([]PathMapping, len(m.entries))
	for i := range m.entries {
		entries[i] = PathMapping{
			Source: cloneBytes(m.entries[i].Source),
			Target: cloneBytes(m.entries[i].Target),
		}
	}
	return entries
}

func normalizePathMappingSource(source []byte) []byte {
	normalized := cloneBytes(source[len(pathMappingPrefix):])
	for i, value := range normalized {
		if value >= 'A' && value <= 'Z' {
			normalized[i] = value + ('a' - 'A')
		} else if value == '/' {
			normalized[i] = '\\'
		}
	}
	return normalized
}

func cString(value []byte) []byte {
	if end := bytes.IndexByte(value, 0); end >= 0 {
		return value[:end]
	}
	return value
}

func cloneBytes(value []byte) []byte {
	return append([]byte(nil), value...)
}

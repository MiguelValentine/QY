package objsys

import (
	"bytes"
	"errors"
	"fmt"

	"QY/internal/fbase"
)

// loadResourceDirectory 只对实际获取失败使用原生继续路径，未实现的能力仍返回错误。
func (d *Desktop) loadResourceDirectory(source []byte) error {
	d.ResourceDirectoryPath = bytes.Clone(nulBytes(source))
	d.ResourceDirectoryError = nil
	if !bytes.HasPrefix(d.ResourceDirectoryPath, []byte("http://")) {
		return nil
	}
	if d.readDirectory == nil {
		return fmt.Errorf("资源目录读取后端尚未初始化")
	}
	lines, err := d.readDirectory(d.ResourceDirectoryPath)
	if err != nil {
		if !errors.Is(err, ErrResourceReadFailed) {
			return err
		}
		d.ResourceDirectoryError = err
		if d.reportResourceError != nil {
			d.reportResourceError(err)
		}
		return nil
	}
	directory := resourceDirectoryBase(d.ResourceDirectoryPath)
	entries, err := parseResourceDirectory(directory, lines)
	if err != nil {
		return err
	}
	for _, entry := range entries {
		entry.DirectoryKey, err = fbase.DirectoryPathHash(entry.Path)
		if err != nil {
			return err
		}
		replaced := false
		for index := range d.resourceEntries {
			if d.resourceEntries[index].DirectoryKey == entry.DirectoryKey {
				d.resourceEntries[index] = entry
				replaced = true
				break
			}
		}
		if !replaced {
			d.resourceEntries = append(d.resourceEntries, entry)
		}
	}
	return nil
}

// resourceDirectoryBase 对应 FBase #216 的首个输出，末尾统一追加反斜杠。
func resourceDirectoryBase(source []byte) []byte {
	source = nulBytes(source)
	last := bytes.LastIndexAny(source, `/\`)
	if last < 0 {
		return nil
	}
	return append(bytes.Clone(source[:last]), '\\')
}

// resourceDirectoryEntry 保留原生目录记录的路径和三个尚未命名的数值字段。
type resourceDirectoryEntry struct {
	Path         []byte
	DirectoryKey uint32
	Value14      uint32
	Value18      uint32
	Value1C      uint32
}

// parseResourceDirectory 对应 objsys!0x1001a2f0 的逐行展开和逗号字段读取。
func parseResourceDirectory(directory []byte, lines [][]byte) ([]resourceDirectoryEntry, error) {
	var previous []byte
	var entries []resourceDirectoryEntry
	for index, line := range lines {
		line = nulBytes(line)
		if len(line) <= 3 {
			continue
		}
		name, rest, ok := fbase.NextWord(line, ',')
		if !ok {
			return nil, fmt.Errorf("资源目录第 %d 行缺少路径", index+1)
		}
		name = bytes.Clone(name)
		if len(name) != 0 && (name[0] == '+' || name[0] == '*') {
			if len(name) < 2 {
				return nil, fmt.Errorf("资源目录第 %d 行路径前缀被截断", index+1)
			}
			length := fbase.DecodeDirectoryNumberPrefix(name[1:], 1)
			suffix := name[2:]
			if name[0] == '*' {
				if uint64(length) > uint64(len(suffix)) {
					return nil, fmt.Errorf("资源目录第 %d 行前缀长度编码被截断", index+1)
				}
				count := length
				length = fbase.DecodeDirectoryNumberPrefix(suffix, int32(count))
				suffix = suffix[count:]
			}
			// 原生字符串可扩长；这里不复现超出前一路径范围的未初始化字节。
			if uint64(length) > uint64(len(previous)) {
				return nil, fmt.Errorf("资源目录第 %d 行前缀超出前一路径", index+1)
			}
			name = append(bytes.Clone(previous[:length]), suffix...)
		}
		previous = bytes.Clone(name)
		var fields [3]uint32
		for field := range fields {
			var value []byte
			value, rest, ok = fbase.NextWord(rest, ',')
			if !ok {
				return nil, fmt.Errorf("资源目录第 %d 行缺少数值字段 %d", index+1, field+1)
			}
			fields[field] = fbase.DecodeDirectoryNumber(value)
		}
		fullPath := append(bytes.Clone(nulBytes(directory)), name...)
		entries = append(entries, resourceDirectoryEntry{
			Path: fullPath, Value14: fields[0], Value1C: fields[1], Value18: fields[2],
		})
	}
	return entries, nil
}

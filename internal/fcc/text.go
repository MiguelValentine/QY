package fcc

import (
	"bytes"
	"fmt"
)

// DecodeText 复现 objsys 文本读取器的外壳处理，split 表示应构造 CRLF 行集合。
// FC0A 编译数据保留文件头，不生成文本行；未知的四字节文件头读取失败。
func DecodeText(data []byte) (payload []byte, split bool, err error) {
	if len(data) == 0 {
		return nil, false, fmt.Errorf("%w: 文本资源为空", ErrInvalid)
	}
	switch {
	case bytes.HasPrefix(data, []byte("XY20")):
		members, err := Open(data)
		if err != nil {
			return nil, false, err
		}
		for _, member := range members {
			payload = append(payload, member.Data...)
		}
		if len(payload) == 0 {
			return nil, false, fmt.Errorf("%w: CAB 文本负载为空", ErrInvalid)
		}
		return payload, !bytes.HasPrefix(payload, []byte("FC0A")), nil
	case bytes.HasPrefix(data, []byte("!CD1")):
		payload := xorWords(data[4:], uint32(len(data)-4))
		if len(payload) == 0 {
			return nil, false, fmt.Errorf("%w: !CD1 文本负载为空", ErrInvalid)
		}
		return payload, !bytes.HasPrefix(payload, []byte("FC0A")), nil
	case bytes.HasPrefix(data, []byte("FC0A")):
		return bytes.Clone(data), false, nil
	default:
		if len(data) < 4 {
			return bytes.Clone(data), true, nil
		}
		return nil, false, ErrUnknownFormat
	}
}

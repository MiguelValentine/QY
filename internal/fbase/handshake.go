package fbase

import (
	"errors"
	"fmt"
)

const (
	HandshakePrefix  = "XXT "
	HandshakeVersion = "VCM1"
	HandshakeMinSize = 9
	HandshakeMaxSize = 128
)

var ErrInvalidHandshake = errors.New("fbase: invalid handshake")

// HandshakeHeader 仅包含原生解析器确认的固定标记前缀。其余字节保持不透明：
// 原生代码会按配置分支解析种子并格式化 NGOL 内容。
type HandshakeHeader struct {
	Prefix  [4]byte
	Version [4]byte
	Rest    []byte
}

// ParseHandshakeHeader 校验 objsys.dll 地址 0x1001de81-0x1001dece 检查的
// 长度范围和两个 4 字节标记，不推断 Rest 的含义。
func ParseHandshakeHeader(packet []byte) (HandshakeHeader, error) {
	if len(packet) < HandshakeMinSize || len(packet) > HandshakeMaxSize {
		return HandshakeHeader{}, fmt.Errorf("%w: size %d outside [%d,%d]",
			ErrInvalidHandshake, len(packet), HandshakeMinSize, HandshakeMaxSize)
	}
	if string(packet[:4]) != HandshakePrefix {
		return HandshakeHeader{}, fmt.Errorf("%w: missing %q marker", ErrInvalidHandshake, HandshakePrefix)
	}
	if string(packet[4:8]) != HandshakeVersion {
		return HandshakeHeader{}, fmt.Errorf("%w: missing %q marker", ErrInvalidHandshake, HandshakeVersion)
	}
	var h HandshakeHeader
	copy(h.Prefix[:], packet[:4])
	copy(h.Version[:], packet[4:8])
	h.Rest = packet[8:]
	return h, nil
}

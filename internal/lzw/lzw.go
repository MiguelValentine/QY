// lzw 包解码 FBase.dll 序号 #882 使用的 LZW 数据流。
package lzw

import (
	"encoding/binary"
	"errors"
	"fmt"
)

const (
	clearCode = 0x100
	endCode   = 0x101
	firstCode = 0x102
	maxCode   = 0xFFF
)

var (
	ErrTruncated  = errors.New("lzw: truncated code stream")
	ErrInvalid    = errors.New("lzw: invalid code stream")
	ErrOutputSize = errors.New("lzw: decoded size does not match expected size")
)

// Decode 解码 FBase LZW 数据流，并要求结果恰为 outputSize 字节，
// 与原生调用方的长度校验保持一致。
func Decode(src []byte, outputSize int) ([]byte, error) {
	if outputSize < 0 {
		return nil, fmt.Errorf("%w: negative size %d", ErrOutputSize, outputSize)
	}

	reader := bitReader{src: src}
	out := make([]byte, 0, outputSize)
	var prefix [maxCode + 1]int16
	var suffix [maxCode + 1]byte
	var stack [maxCode + 1]byte

	reset := func() (next, width int) {
		for i := range prefix {
			prefix[i] = -2
		}
		for i := 0; i < 256; i++ {
			suffix[i] = byte(i)
		}
		return firstCode, 9
	}

	next, width := reset()
	previous := -1
	for {
		code, err := reader.read(width)
		if err != nil {
			return nil, err
		}
		switch code {
		case clearCode:
			next, width = reset()
			previous = -1
			continue
		case endCode:
			if len(out) != outputSize {
				return nil, fmt.Errorf("%w: got %d, want %d", ErrOutputSize, len(out), outputSize)
			}
			return out, nil
		}
		if code < 0 || code > maxCode {
			return nil, fmt.Errorf("%w: code %d out of range", ErrInvalid, code)
		}

		var first byte
		if code < 256 || (code < next && prefix[code] != -2) {
			n, err := expandCode(code, next, &prefix, &suffix, &stack)
			if err != nil {
				return nil, err
			}
			first = stack[n-1]
			if len(out)+n > outputSize {
				return nil, fmt.Errorf("%w: decoded output exceeds %d bytes", ErrOutputSize, outputSize)
			}
			for i := n - 1; i >= 0; i-- {
				out = append(out, stack[i])
			}
		} else if code == next && previous >= 0 {
			n, err := expandCode(previous, next, &prefix, &suffix, &stack)
			if err != nil {
				return nil, err
			}
			first = stack[n-1]
			if len(out)+n+1 > outputSize {
				return nil, fmt.Errorf("%w: decoded output exceeds %d bytes", ErrOutputSize, outputSize)
			}
			for i := n - 1; i >= 0; i-- {
				out = append(out, stack[i])
			}
			out = append(out, first)
		} else {
			return nil, fmt.Errorf("%w: undefined code %d (next %d)", ErrInvalid, code, next)
		}

		if previous >= 0 && next <= maxCode {
			prefix[next] = int16(previous)
			suffix[next] = first
			next++
			if next == 1<<width && width < 12 {
				width++
			}
		}
		previous = code
	}
}

func expandCode(code, next int, prefix *[maxCode + 1]int16, suffix *[maxCode + 1]byte, stack *[maxCode + 1]byte) (int, error) {
	if code >= 0 && code < 256 {
		stack[0] = byte(code)
		return 1, nil
	}
	n := 0
	for code >= 0 && code < next && prefix[code] != -2 {
		if n >= len(stack) {
			return 0, fmt.Errorf("%w: dictionary chain overflow", ErrInvalid)
		}
		stack[n] = suffix[code]
		n++
		code = int(prefix[code])
	}
	if code < 0 || code >= 256 || n == 0 {
		return 0, fmt.Errorf("%w: malformed dictionary chain", ErrInvalid)
	}
	if n >= len(stack) {
		return 0, fmt.Errorf("%w: dictionary chain overflow", ErrInvalid)
	}
	stack[n] = byte(code)
	return n + 1, nil
}

type bitReader struct {
	src []byte
	bit int
}

func (r *bitReader) read(width int) (int, error) {
	start := r.bit
	end := start + width
	if end > len(r.src)*8 {
		return 0, ErrTruncated
	}
	byteOffset := start >> 3
	shift := uint(start & 7)
	var word uint32
	available := len(r.src) - byteOffset
	switch {
	case available >= 4:
		word = binary.LittleEndian.Uint32(r.src[byteOffset : byteOffset+4])
	default:
		for i := 0; i < available; i++ {
			word |= uint32(r.src[byteOffset+i]) << (8 * i)
		}
	}
	r.bit = end
	return int((word >> shift) & uint32((1<<width)-1)), nil
}

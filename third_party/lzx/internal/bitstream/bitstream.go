package bitstream

import (
	"bufio"
	"errors"
	"io"
)

type BitStream struct {
	Internal io.Reader

	// 当前缓存的数据位。
	cachedData int64
	// cachedData 中缓存的位数。
	cacheSize int
}

func New(reader io.Reader) *BitStream {
	// 使用带缓冲的读取器优化小块读取。
	return &BitStream{Internal: bufio.NewReader(reader)}
}

// ReadBits 从数据流读取 c 位并推进读取位置。
func (b *BitStream) ReadBits(c int) (int64, error) {
	bits, err := b.PeekBits(c)
	if err != nil {
		return 0, err
	}
	b.cacheSize -= c
	b.cachedData = b.cachedData & (1<<b.cacheSize - 1)
	return bits, nil
}

// PeekBits 从数据流读取 c 位，但不推进读取位置。
func (b *BitStream) PeekBits(c int) (int64, error) {
	if c > 32 {
		return 0, errors.New("invalid bit read")
	}
	for c > b.cacheSize {
		// 读取新的数据。
		var nextData [2]byte
		if _, err := io.ReadFull(b.Internal, nextData[:]); err != nil {
			if err == io.EOF {
				err = io.ErrUnexpectedEOF
			}
			return 0, err
		}
		b.cachedData = b.cachedData<<16 | int64(nextData[1])<<8 | int64(nextData[0])
		b.cacheSize += 16
	}
	result := b.cachedData >> (b.cacheSize - c)
	return result, nil
}

// 将数据流对齐到下一个 16 位边界。
func (b *BitStream) Align() {
	b.cacheSize -= b.cacheSize % 16 // 对齐到 16 位。
	b.cachedData = b.cachedData & (1<<b.cacheSize - 1)
}

// BitsLeft 返回数据流中当前缓存的位数。
func (b *BitStream) BitsLeft() int {
	return b.cacheSize
}

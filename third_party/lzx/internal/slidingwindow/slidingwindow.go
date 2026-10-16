package slidingwindow

import "errors"

// SlidingWindow 实现一个包含 n 个字节的窗口，新字节会覆盖旧字节。
// 窗口范围内的历史字节仍可通过回溯查找。
type SlidingWindow struct {
	windowData []byte

	position int
}

func New(size int) *SlidingWindow {
	return &SlidingWindow{
		windowData: make([]byte, size),
		position:   0,
	}
}

var ErrInvalidOffset = errors.New("invalid offset")

func (s *SlidingWindow) Lookback(offset int) (byte, error) {
	if offset < 0 || offset > len(s.windowData) {
		return 0, ErrInvalidOffset
	}
	return s.windowData[(s.position-offset+len(s.windowData))%len(s.windowData)], nil
}

func (s *SlidingWindow) Add(b byte) {
	s.windowData[s.position] = b
	s.position = (s.position + 1) % len(s.windowData)
}

func (s *SlidingWindow) Size() int {
	return len(s.windowData)
}

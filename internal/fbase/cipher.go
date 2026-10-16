// fbase 包实现从 FBase.dll 反汇编恢复的网络字节变换，不加载或调用原始 DLL。
package fbase

import (
	"errors"
	"fmt"
	"math/bits"
)

const (
	// ModeB 表示原生 B 模式的 32 轮反馈变换。
	ModeB byte = 'B'
	// ModeL 表示原生 L 模式的可打印字节变换。
	ModeL byte = 'L'
)

var ErrInvalidMode = errors.New("fbase: mode must be 'B' or 'L'")

// Cipher 保存单条字节流的滚动状态。每条连接、每个流应单独创建实例；
// 不要并发共享同一个实例。
//
// 原生发送和接收路径使用同一变换并更新状态，因此两个方向都调用 Transform。
type Cipher struct {
	state uint32
	mode  byte
}

// NewCipher 使用调用方提供的原生种子创建流变换器。
func NewCipher(seed uint32, mode byte) (*Cipher, error) {
	if mode != ModeB && mode != ModeL {
		return nil, fmt.Errorf("%w: %q", ErrInvalidMode, mode)
	}
	return &Cipher{state: seed, mode: mode}, nil
}

// State 返回当前滚动状态，便于与负责对端分帧的代码协同。
func (c *Cipher) State() uint32 { return c.state }

// Mode 返回所选原生变换模式（'B' 或 'L'）。
func (c *Cipher) Mode() byte { return c.mode }

// Transform 对字节切片原地执行原生变换并推进流状态。连续处理多个分块，
// 等价于一次处理这些分块拼接后的数据。原生发送与接收调用点使用相同算法；
// 两端从相同种子开始时可用于相反方向的变换。
func (c *Cipher) Transform(buf []byte) error {
	if c == nil {
		return errors.New("fbase: nil Cipher")
	}
	switch c.mode {
	case ModeB:
		for i := range buf {
			buf[i] ^= byte(c.nextBByte())
		}
	case ModeL:
		for i, b := range buf {
			if b < 0x30 || b > 0x7d {
				continue
			}
			key := byte(0x1f)
			switch {
			case c.state&1 != 0:
				key = 0x1e
			case c.state&0x11 != 0:
				key = 0x1d
			case c.state&2 != 0:
				key = 0x1c
			}
			candidate := b ^ key
			if candidate >= 0x30 && candidate <= 0x7d {
				buf[i] = candidate
				c.state++
			}
		}
	default:
		return ErrInvalidMode
	}
	return nil
}

// nextBByte 对应 FBase.dll 地址 0x10030660 的 32 次反馈迭代。原生奇偶标志
// 来自字节交换后的反馈值与原低 16 位异或，再将结果的两个字节异或；
// 这等价于统计反馈值全部位的奇偶性。
func (c *Cipher) nextBByte() uint32 {
	for n := 0; n < 32; n++ {
		feedback := c.state & 0xe7bd2161
		c.state <<= 1
		if bits.OnesCount32(feedback)&1 != 0 {
			c.state++
		}
	}
	return c.state
}

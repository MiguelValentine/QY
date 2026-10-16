// symbol 包实现 FBase.dll 字符串表使用的桶哈希。
package symbol

import (
	"encoding/binary"
	"math/bits"
)

const maxNativeHashInput = 0x2000

// StringTableHash 返回 FBase.dll 字符串表路径（导出 #627 和 #858）产生的
// 32 位桶哈希。该值不是插件注册时传入的类 ID。
//
// 与原生 C 字符串函数一样，哈希在首个 NUL 处结束，最多读取 8192 字节。
// 这里对应字符串表以映射参数 0 调用 #858 的路径，不应用 FBase 的字符映射表。
func StringTableHash(name string) uint32 {
	n := 0
	for n < len(name) && n < maxNativeHashInput && name[n] != 0 {
		n++
	}
	if n == 0 {
		return 0
	}

	// FBase #858 将临时缓冲区补 NUL 至 4 字节边界，再追加两个固定 DWORD。
	blocks := (n + 3) / 4
	data := make([]byte, (blocks+2)*4)
	copy(data, name[:n])
	binary.LittleEndian.PutUint32(data[blocks*4:], 0x9be74448)
	binary.LittleEndian.PutUint32(data[(blocks+1)*4:], 0x66f42c48)

	key := uint32(0xf4fa8928)
	a := uint32(0x37a8470e)
	b := uint32(0x7758b42b)
	state := uint32(0x267b0b11)

	// 原生循环每轮都会重新装载 EBX 常量，再与旋转后的 key 异或。
	for i := 0; i < blocks+2; i++ {
		key = bits.RotateLeft32(key, 1)
		state = 0x267b0b11 ^ key
		word := binary.LittleEndian.Uint32(data[i*4:])
		a ^= word
		b ^= word

		x := (state + b) | 0x02040801
		x &= 0xbfef7fdf
		product := uint64(a) * uint64(x)
		low, high := uint32(product), uint32(product>>32)
		carryIn := uint64(0)
		if high != 0 { // x86 MUL 在高 DWORD 非零时置 CF。
			carryIn = 1
		}
		sum := uint64(low) + uint64(high) + carryIn // ADC 将高低双字与进位相加。
		newA := uint32(sum)
		if sum>>32 != 0 { // ADC 0, low 会消耗前一条指令产生的进位。
			newA++
		}

		y := (state + a) | 0x00804021
		y &= 0x7dfefbff
		product = uint64(b) * uint64(y)
		low, high = uint32(product), uint32(product>>32)
		carryIn = uint64(high >> 31)                  // ADD high, high 根据最高位设置 CF。
		sum = uint64(low) + uint64(high<<1) + carryIn // ADC 翻倍后的高 DWORD 与低 DWORD。
		newB := uint32(sum)
		if sum>>32 != 0 { // 进位时条件跳转不成立，执行后续的加二指令。
			newB += 2
		}
		a, b = newA, newB
	}
	return a ^ b
}

// fc0a 包读取对象系统使用的标记流和字符串池，保留未知标记的原值。
package fc0a

import (
	"encoding/binary"
	"fmt"

	"QY/internal/lzw"
)

// MaxDocumentSize 限制单份脚本大小及其全部数据块的累计解压大小。
const MaxDocumentSize = 128 << 20

// String 保留池中字符串的原始字节，避免字符集转换造成信息丢失。
type String struct {
	Offset int    `json:"offset"`
	Raw    []byte `json:"raw"`
}

// Token 表示一个标记；数据块解压后放入 Blob，其他标记仅保留类型和值。
type Token struct {
	Offset     int    `json:"offset"`
	Kind       uint16 `json:"kind"`
	Value      uint32 `json:"value"`
	Compressed bool   `json:"compressed,omitempty"`
	Blob       []byte `json:"blob,omitempty"`
}

// Document 对应文件头、标记流和字符串池三个部分。
type Document struct {
	CompatibilityA uint32   `json:"compatibility_a"`
	CompatibilityB uint32   `json:"compatibility_b"`
	CodeSize       uint32   `json:"code_size"`
	PoolSize       uint32   `json:"pool_size"`
	Tokens         []Token  `json:"tokens"`
	Strings        []String `json:"strings"`
}

// Parse 按原生读取器的布局解析文件，并验证每个长度和压缩块。
// 标记结构已恢复，但解析成功并不表示已实现脚本语言的执行语义。
func Parse(data []byte) (*Document, error) {
	if len(data) < 20 || string(data[:4]) != "FC0A" {
		return nil, fmt.Errorf("fc0a: 文件头无效")
	}
	if len(data) > MaxDocumentSize {
		return nil, fmt.Errorf("fc0a: 文件超过 %d 字节限制", MaxDocumentSize)
	}
	d := &Document{
		CompatibilityA: binary.LittleEndian.Uint32(data[4:]),
		CompatibilityB: binary.LittleEndian.Uint32(data[8:]),
		CodeSize:       binary.LittleEndian.Uint32(data[12:]),
		PoolSize:       binary.LittleEndian.Uint32(data[16:]),
	}
	if uint64(d.CodeSize)+uint64(d.PoolSize)+20 != uint64(len(data)) {
		return nil, fmt.Errorf("fc0a: 代码段和字符串池长度与文件大小不符")
	}
	codeEnd := 20 + int(d.CodeSize)
	totalBlobBytes := uint64(0)
	for pos := 20; pos < codeEnd; {
		if codeEnd-pos < 6 {
			return nil, fmt.Errorf("fc0a: 偏移 %#x 的标记被截断", pos)
		}
		t := Token{Offset: pos, Kind: binary.LittleEndian.Uint16(data[pos:]), Value: binary.LittleEndian.Uint32(data[pos+2:])}
		pos += 6
		if t.Kind == 4 {
			totalBlobBytes += uint64(t.Value)
			if totalBlobBytes > MaxDocumentSize {
				return nil, fmt.Errorf("fc0a: 偏移 %#x 的累计解压数据超过限制", t.Offset)
			}
			size := int(t.Value)
			if size >= 512 {
				// 大块数据带有额外的有符号长度；非正值表示后面仍是原始数据。
				if codeEnd-pos < 4 {
					return nil, fmt.Errorf("fc0a: 压缩长度被截断")
				}
				packedSize := int32(binary.LittleEndian.Uint32(data[pos:]))
				pos += 4
				if packedSize > 0 {
					size = int(packedSize)
					t.Compressed = true
				}
			}
			if size > codeEnd-pos {
				return nil, fmt.Errorf("fc0a: 偏移 %#x 的数据块越界", t.Offset)
			}
			if t.Compressed {
				var err error
				t.Blob, err = lzw.Decode(data[pos:pos+size], int(t.Value))
				if err != nil {
					return nil, fmt.Errorf("fc0a: 偏移 %#x 解压失败: %w", t.Offset, err)
				}
			} else {
				t.Blob = append([]byte(nil), data[pos:pos+size]...)
			}
			pos += size
		}
		d.Tokens = append(d.Tokens, t)
	}
	for pos := codeEnd; pos < len(data); {
		if len(data)-pos < 2 {
			return nil, fmt.Errorf("fc0a: 字符串长度被截断")
		}
		size := int(binary.LittleEndian.Uint16(data[pos:]))
		pos += 2
		if size > len(data)-pos {
			return nil, fmt.Errorf("fc0a: 偏移 %#x 的字符串越界", pos)
		}
		raw := append([]byte(nil), data[pos:pos+size]...)
		d.Strings = append(d.Strings, String{Offset: pos, Raw: raw})
		pos += size
	}
	return d, nil
}

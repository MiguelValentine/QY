package fcc

import (
	"bytes"
	"encoding/binary"
	"errors"
	"os"
	"testing"
)

func TestDecodeTextDistinguishesRawAndCompiledTextHeaders(t *testing.T) {
	for _, test := range []struct {
		input string
		want  string
		split bool
	}{
		{"a", "a", true},
		{"FC0Aline\r\nnext", "FC0Aline\r\nnext", false},
	} {
		input := []byte(test.input)
		data, split, err := DecodeText(input)
		if err != nil || split != test.split || string(data) != test.want {
			t.Fatalf("文本外壳解码错误：input=%q data=%q split=%t err=%v", test.input, data, split, err)
		}
		input[0] = 'X'
		if string(data) != test.want {
			t.Fatal("文本结果与原始输入共享可变字节")
		}
	}
	if _, _, err := DecodeText(nil); err == nil {
		t.Fatal("空文件未返回读取错误")
	}
	if _, _, err := DecodeText([]byte("plain text")); err != ErrUnknownFormat {
		t.Fatalf("未知文件头没有失败：%v", err)
	}
}

func TestDecodeTextCD1PreservesNativeInvalidHeaderState(t *testing.T) {
	for _, test := range []struct {
		plain string
		want  string
		split bool
	}{
		{"FC0Aline\r\nnext", "FC0Aline\r\nnext", false},
		{"plain text", "plain text", true},
	} {
		plain := []byte(test.plain)
		input := append([]byte("!CD1"), xorWords(plain, uint32(len(plain)))...)
		data, split, err := DecodeText(input)
		if err != nil || split != test.split || string(data) != test.want {
			t.Fatalf("!CD1 文本状态错误：data=%q split=%t err=%v", data, split, err)
		}
	}
}

func TestDecodeTextXY20UsesDecodedMemberWithoutStrippingItsHeader(t *testing.T) {
	data, err := os.ReadFile("../../CLIENT/index.fcc")
	if err != nil {
		t.Fatal(err)
	}
	if !bytes.HasPrefix(data, []byte("XY20")) {
		t.Fatal("真实入口没有使用预期 XY20 外壳")
	}
	members, err := Open(data)
	if err != nil || len(members) != 1 {
		t.Fatalf("入口容器错误：members=%d err=%v", len(members), err)
	}
	payload, split, err := DecodeText(data)
	if err != nil || split || !bytes.Equal(payload, members[0].Data) {
		t.Fatalf("XY20 文本读取没有保留成员内容：split=%t err=%v", split, err)
	}
}

func TestDecodeTextXY20ConcatenatesStoredCABMembersInFileOrder(t *testing.T) {
	for _, test := range []struct {
		name      string
		members   [][]byte
		want      string
		wantSplit bool
	}{
		{
			name:      "跨成员形成编译头",
			members:   [][]byte{[]byte("FC"), []byte("0Acompiled\r\ncontent")},
			want:      "FC0Acompiled\r\ncontent",
			wantSplit: false,
		},
		{
			name:      "普通文本成员顺序拼接",
			members:   [][]byte{[]byte("first\r\n"), []byte("second\r\n")},
			want:      "first\r\nsecond\r\n",
			wantSplit: true,
		},
	} {
		t.Run(test.name, func(t *testing.T) {
			payload, split, err := DecodeText(wrapTextXY20(makeStoredCAB(test.members)))
			if err != nil || split != test.wantSplit || string(payload) != test.want {
				t.Fatalf("XY20 成员拼接错误：payload=%q split=%t err=%v", payload, split, err)
			}
		})
	}
}

func TestDecodeTextRejectsEmptyCD1Payload(t *testing.T) {
	if _, _, err := DecodeText([]byte("!CD1")); !errors.Is(err, ErrInvalid) {
		t.Fatalf("空 !CD1 负载应失败：%v", err)
	}
}

func makeStoredCAB(members [][]byte) []byte {
	var contents []byte
	fileTable := make([]byte, 0)
	for index, member := range members {
		entry := make([]byte, 16)
		binary.LittleEndian.PutUint32(entry[0:4], uint32(len(member)))
		binary.LittleEndian.PutUint32(entry[4:8], uint32(len(contents)))
		binary.LittleEndian.PutUint16(entry[8:10], 0)
		binary.LittleEndian.PutUint16(entry[14:16], 0x20)
		fileTable = append(fileTable, entry...)
		fileTable = append(fileTable, []byte("member"+string(rune('0'+index)))...)
		fileTable = append(fileTable, 0)
		contents = append(contents, member...)
	}

	const headerSize = 36
	const folderSize = 8
	fileOffset := headerSize + folderSize
	dataOffset := fileOffset + len(fileTable)
	cab := make([]byte, dataOffset+8+len(contents))
	copy(cab[:4], "MSCF")
	binary.LittleEndian.PutUint32(cab[8:12], uint32(len(cab)))
	binary.LittleEndian.PutUint32(cab[16:20], uint32(fileOffset))
	cab[24], cab[25] = 3, 1
	binary.LittleEndian.PutUint16(cab[26:28], 1)
	binary.LittleEndian.PutUint16(cab[28:30], uint16(len(members)))
	binary.LittleEndian.PutUint32(cab[36:40], uint32(dataOffset))
	binary.LittleEndian.PutUint16(cab[40:42], 1)
	binary.LittleEndian.PutUint16(cab[42:44], 0)
	copy(cab[fileOffset:dataOffset], fileTable)
	binary.LittleEndian.PutUint16(cab[dataOffset+4:dataOffset+6], uint16(len(contents)))
	binary.LittleEndian.PutUint16(cab[dataOffset+6:dataOffset+8], uint16(len(contents)))
	copy(cab[dataOffset+8:], contents)
	return cab
}

func wrapTextXY20(cab []byte) []byte {
	encoded := xorWords(cab, uint32(len(cab)))
	copy(encoded[:4], "XY20")
	return encoded
}

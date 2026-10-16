package fbase

import "testing"

func TestDirectoryDigitMatchesInitializedTable(t *testing.T) {
	for i := 0; i < 64; i++ {
		var ch byte
		switch {
		case i < 10:
			ch = byte('0' + i)
		case i < 36:
			ch = byte('A' + i - 10)
		case i == 36:
			ch = '_'
		case i == 37:
			ch = '`'
		default:
			ch = byte('a' + i - 38)
		}
		if got := directoryDigit(ch); got != uint32(i) {
			t.Errorf("字符 %q 解码为%d，期望%d", ch, got, i)
		}
	}
	for _, ch := range []byte(" !@{}~\x80") {
		if got := directoryDigit(ch); got != 0 {
			t.Errorf("未映射字符 %#x 解码为%d，期望0", ch, got)
		}
	}
}

func TestDecodeDirectoryNumber(t *testing.T) {
	tests := []struct {
		name  string
		input []byte
		want  uint32
	}{
		{name: "空值", input: nil, want: 0},
		{name: "字符表端点", input: []byte("0z"), want: 63},
		{name: "累积", input: []byte("1A"), want: 74},
		{name: "空格停止", input: []byte("1 2"), want: 1},
		{name: "首字节为空格仍查表", input: []byte(" 1"), want: 1},
		{name: "未知字节映射为零", input: []byte("1!A"), want: 4106},
		{name: "NUL截断", input: []byte{'1', 'A', 0, 'z'}, want: 74},
		{name: "32位回绕", input: []byte("zzzzzzz"), want: ^uint32(0)},
	}
	for _, test := range tests {
		t.Run(test.name, func(t *testing.T) {
			if got := DecodeDirectoryNumber(test.input); got != test.want {
				t.Fatalf("解码 %#v 得到%d（%#x），期望%d（%#x）", test.input, got, got, test.want, test.want)
			}
		})
	}
}

func TestDecodeDirectoryNumberPrefixCount(t *testing.T) {
	tests := []struct {
		name  string
		input []byte
		count int32
		want  uint32
	}{
		{name: "负计数仍取首字节", input: []byte("1Az"), count: -2, want: 1},
		{name: "零计数仍取首字节", input: []byte("1Az"), count: 0, want: 1},
		{name: "单字符", input: []byte("1Az"), count: 1, want: 1},
		{name: "指定两字符", input: []byte("1Az"), count: 2, want: 74},
		{name: "指定三字符", input: []byte("1Az"), count: 3, want: 4799},
		{name: "计数超过NUL边界", input: []byte{'1', 'A', 0, 'z'}, count: 8, want: 74},
		{name: "空格按普通表项解码", input: []byte("1 2"), count: 3, want: 4098},
		{name: "计数超过输入长度", input: []byte("1A"), count: 8, want: 74},
		{name: "32位回绕", input: []byte("zzzzzzz"), count: 7, want: ^uint32(0)},
		{name: "空值", input: nil, count: 5, want: 0},
	}
	for _, test := range tests {
		t.Run(test.name, func(t *testing.T) {
			if got := DecodeDirectoryNumberPrefix(test.input, test.count); got != test.want {
				t.Fatalf("解码 %#v（计数%d）得到%d（%#x），期望%d（%#x）", test.input, test.count, got, got, test.want, test.want)
			}
		})
	}
}

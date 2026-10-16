package main

import (
	"strings"
	"testing"

	"QY/internal/symbol"
)

func TestScanFindsPrintableNameAfterBinaryPrefix(t *testing.T) {
	name := "CPacManItemSys"
	data := append([]byte{0x01, 0x02, 0xff}, []byte(name)...)
	data = append(data, 0)

	matches := scan("sample.bin", data, symbol.StringTableHash(name))
	if len(matches) != 1 {
		t.Fatalf("匹配数量 = %d，期望 1：%+v", len(matches), matches)
	}
	if matches[0].FileOffset != 3 || matches[0].Text != name {
		t.Fatalf("候选 = %+v，期望偏移 3、名称 %q", matches[0], name)
	}
}

func TestScanFindsSharedPrintableTail(t *testing.T) {
	data := []byte("prefix_shared_tail\x00")
	name := "tail"

	matches := scan("sample.bin", data, symbol.StringTableHash(name))
	if len(matches) != 1 {
		t.Fatalf("匹配数量 = %d，期望 1：%+v", len(matches), matches)
	}
	if matches[0].FileOffset != uint64(strings.Index(string(data), name)) || matches[0].Text != name {
		t.Fatalf("共享尾部候选 = %+v，期望名称 %q", matches[0], name)
	}
}

func TestScanIgnoresUnterminatedRange(t *testing.T) {
	name := "unterminated"
	matches := scan("sample.bin", []byte(name), symbol.StringTableHash(name))
	if len(matches) != 0 {
		t.Fatalf("未终止范围不应产生候选：%+v", matches)
	}
}

func TestScanLimitsCandidateLengthTo8192(t *testing.T) {
	data := append([]byte(strings.Repeat("a", maxCandidateLength+1)), 0)
	name := strings.Repeat("a", maxCandidateLength)

	matches := scan("sample.bin", data, symbol.StringTableHash(name))
	if len(matches) != 1 {
		t.Fatalf("匹配数量 = %d，期望 1：%+v", len(matches), matches)
	}
	if matches[0].FileOffset != 1 || matches[0].Text != name {
		t.Fatalf("超长范围候选偏移或长度错误：偏移=%d，名称长度=%d", matches[0].FileOffset, len(matches[0].Text))
	}
}

func TestScanFindsOriginalCompleteName(t *testing.T) {
	name := "showdown"
	matches := scan("sample.bin", append([]byte(name), 0), symbol.StringTableHash(name))
	if len(matches) != 1 || matches[0].FileOffset != 0 || matches[0].Text != name {
		t.Fatalf("原始完整名称匹配错误：%+v", matches)
	}
}

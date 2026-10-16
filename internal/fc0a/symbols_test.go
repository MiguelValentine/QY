package fc0a

import (
	"bytes"
	"fmt"
	"os"
	"path/filepath"
	"testing"

	"QY/internal/symbol"
)

func TestStringCandidatesCopiesAllMatches(t *testing.T) {
	raw := []byte("name\x00suffix")
	hash := symbol.StringTableHash("name")
	doc := &Document{Strings: []String{
		{Raw: raw},
		{Raw: []byte("name")},
		{Raw: []byte("other")},
	}}

	candidates := doc.StringCandidates(hash)
	if len(candidates) != 2 {
		t.Fatalf("候选数量 = %d，期望 2", len(candidates))
	}
	if !bytes.Equal(candidates[0], raw) || !bytes.Equal(candidates[1], []byte("name")) {
		t.Fatalf("候选未保留原始字节：%q", candidates)
	}
	candidates[0][0] = 'X'
	if raw[0] != 'n' {
		t.Fatal("返回的候选与字符串池共享底层字节")
	}
}

func TestTokenText(t *testing.T) {
	raw := []byte{0xff, 'x'}
	hash := symbol.StringTableHash(string(raw))
	doc := &Document{Strings: []String{{Raw: raw}}}
	tests := []struct {
		name  string
		token Token
		want  string
	}{
		{"词法名称优先", Token{Kind: 200, Value: 123}, "="},
		{"有符号整数", Token{Kind: 2, Value: 0xffffffff}, "-1"},
		{"非UTF8字符串", Token{Kind: 3, Value: hash}, `字符串 ["\xffx"]`},
		{"缺失字符串", Token{Kind: 3, Value: 0x12345678}, "字符串哈希 0x12345678"},
		{"数据块", Token{Kind: 4, Value: 513}, "数据块（513 字节）"},
		{"符号候选", Token{Kind: 6, Value: hash}, fmt.Sprintf(`符号哈希 0x%08x（字符串池候选：["\xffx"]）`, hash)},
		{"未知标记", Token{Kind: 77, Value: 0xabcdef01}, "未知标记 kind=77 value=0xabcdef01"},
	}
	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			if got := doc.TokenText(tt.token); got != tt.want {
				t.Errorf("TokenText() = %q，期望 %q", got, tt.want)
			}
		})
	}
}

func TestClientKind3TokensResolveToLocalPool(t *testing.T) {
	const wantFiles = 625
	const wantTokens = 135643
	files, tokens := 0, 0
	err := filepath.WalkDir("../../analysis/decoded", func(path string, entry os.DirEntry, err error) error {
		if err != nil || entry.IsDir() {
			return err
		}
		data, err := os.ReadFile(path)
		if err != nil {
			return err
		}
		if len(data) < 4 || string(data[:4]) != "FC0A" {
			return nil
		}
		doc, err := Parse(data)
		if err != nil {
			return err
		}
		files++
		for _, token := range doc.Tokens {
			if token.Kind != 3 {
				continue
			}
			tokens++
			if len(doc.StringCandidates(token.Value)) == 0 {
				return fmt.Errorf("%s 偏移 %#x 的 kind 3 哈希 0x%08x 未命中本文件字符串池",
					path, token.Offset, token.Value)
			}
		}
		return nil
	})
	if err != nil {
		t.Fatal(err)
	}
	if files != wantFiles || tokens != wantTokens {
		t.Fatalf("扫描 %d 份 FC0A、%d 个 kind 3 标记；期望 %d 份、%d 个",
			files, tokens, wantFiles, wantTokens)
	}
}

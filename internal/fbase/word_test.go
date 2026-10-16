package fbase

import (
	"bytes"
	"testing"
)

func TestNextWordDevcodeSequence(t *testing.T) {
	input := []byte("  alpha; beta;;gamma")
	var got [][]byte
	for {
		word, rest, ok := NextWord(input, ';')
		if !ok {
			break
		}
		got = append(got, append([]byte(nil), word...))
		input = rest
	}
	want := [][]byte{[]byte("alpha"), []byte("beta"), []byte("gamma")}
	if len(got) != len(want) {
		t.Fatalf("词数=%d，期望%d：%q", len(got), len(want), got)
	}
	for i := range want {
		if !bytes.Equal(got[i], want[i]) {
			t.Errorf("第%d词=%q，期望%q", i, got[i], want[i])
		}
	}
}

func TestNextWordKeepsNestedSeparatorsAndHighBytes(t *testing.T) {
	input := []byte{'a', '{', 'b', ';', '{', 'c', '}', '}', 0x80, 'd', ';', 'e'}
	word, rest, ok := NextWord(input, ';')
	if !ok || !bytes.Equal(word, input[:10]) || !bytes.Equal(rest, input[11:]) {
		t.Fatalf("结果 word=%v rest=%v ok=%v", word, rest, ok)
	}
}

func TestNextWordQuotedWord(t *testing.T) {
	input := []byte(`"a;\"b";tail`)
	word, rest, ok := NextWord(input, ';')
	if !ok || string(word) != `a;\"b` || string(rest) != "tail" {
		t.Fatalf("结果 word=%q rest=%q ok=%v", word, rest, ok)
	}
}

func TestNextWordQuoteEscapeIndexBehavior(t *testing.T) {
	input := []byte(`"a\\"b";tail`)
	word, rest, ok := NextWord(input, ';')
	if !ok || string(word) != `a\\` || string(rest) != "tail" {
		t.Fatalf("结果 word=%q rest=%q ok=%v", word, rest, ok)
	}
}

func TestNextWordQuotedHighByteSkipsFollowingByte(t *testing.T) {
	input := []byte{'"', 'a', 0x80, '"', 'x', '"', ';', 't'}
	word, rest, ok := NextWord(input, ';')
	want := []byte{'a', 0x80, '"', 'x'}
	if !ok || !bytes.Equal(word, want) || !bytes.Equal(rest, []byte("t")) {
		t.Fatalf("结果 word=%v rest=%v ok=%v", word, rest, ok)
	}
}

func TestNextWordDoesNotTrimHighBytes(t *testing.T) {
	input := []byte{0x80, 'x', ';', 'y'}
	word, rest, ok := NextWord(input, ';')
	if !ok || !bytes.Equal(word, input[:2]) || !bytes.Equal(rest, input[3:]) {
		t.Fatalf("结果 word=%v rest=%v ok=%v", word, rest, ok)
	}
}

func TestNextWordTrimsTrailingWhitespace(t *testing.T) {
	word, rest, ok := NextWord([]byte("first \t"), ';')
	if !ok || string(word) != "first" || len(rest) != 0 {
		t.Fatalf("结果 word=%q rest=%q ok=%v", word, rest, ok)
	}
}

func TestNextWordCommentIsCheckedOnlyOnce(t *testing.T) {
	word, rest, ok := NextWord([]byte("/*one*//*two*/tail;next"), ';')
	if !ok || string(word) != "/*two*/tail" || string(rest) != "next" {
		t.Fatalf("结果 word=%q rest=%q ok=%v", word, rest, ok)
	}
}

func TestNextWordCommentRequiresStrictlyMoreThanFourBytes(t *testing.T) {
	word, _, ok := NextWord([]byte("/**/"), ';')
	if !ok || string(word) != "/**/" {
		t.Fatalf("四字节注释不应被前置注释分支剥离：word=%q ok=%v", word, ok)
	}
}

func TestNextWordUsesSemicolonForTrimRegardlessOfDelimiter(t *testing.T) {
	word, rest, ok := NextWord([]byte(";first:second"), ':')
	if !ok || string(word) != "first" || string(rest) != "second" {
		t.Fatalf("结果 word=%q rest=%q ok=%v", word, rest, ok)
	}
}

func TestNextWordTrimsCommentsAndControlSeparators(t *testing.T) {
	input := []byte(" ; /* 注释; */\tfirst\x1fsecond;")
	word, rest, ok := NextWord(input, ';')
	if !ok || string(word) != "first" || string(rest) != "second" {
		t.Fatalf("结果 word=%q rest=%q ok=%v", word, rest, ok)
	}
}

func TestNextWordStopsAtCStringNUL(t *testing.T) {
	input := []byte{'x', ';', 'y', 0, ';', 'z'}
	word, rest, ok := NextWord(input, ';')
	if !ok || string(word) != "x" || string(rest) != "y" {
		t.Fatalf("结果 word=%q rest=%q ok=%v", word, rest, ok)
	}
}

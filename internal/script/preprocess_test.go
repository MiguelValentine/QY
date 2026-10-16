package script

import (
	"fmt"
	"reflect"
	"strings"
	"testing"

	"QY/internal/fc0a"
)

func testLexeme(kind uint16, value uint32, source, text string) Lexeme {
	return Lexeme{
		Token:  fc0a.Token{Kind: kind, Value: value},
		Source: source,
		Text:   []byte(text),
	}
}

func testDirective(kind uint16, source string, args ...Lexeme) []Lexeme {
	result := []Lexeme{testLexeme(kind, 0, source, "")}
	result = append(result, args...)
	return append(result, testLexeme(lineEnd, 0, source, ""))
}

func withoutLineEnds(tokens []Lexeme) []Lexeme {
	result := make([]Lexeme, 0, len(tokens))
	for _, token := range tokens {
		if token.Kind != lineEnd {
			result = append(result, token)
		}
	}
	return result
}

func TestPreprocessSequenceSharesMacrosAndSeparatesPrograms(t *testing.T) {
	system := Source{Name: "system.cod", Constants: map[uint32]Lexeme{
		2: testLexeme(2, 10, "system.cod", ""),
	}}
	system.Tokens = testDirective(1600, system.Name,
		testLexeme(6, 1, system.Name, "ZTOP"), testLexeme(2, 0x6fffffff, system.Name, ""))
	system.Tokens = append(system.Tokens, testLexeme(6, 2, system.Name, "CONTEXT"))
	system.Tokens = append(system.Tokens, testDirective(1650, system.Name,
		testLexeme(6, 3, system.Name, "system-directive"))...)
	entry := Source{Name: "index.cod", Tokens: []Lexeme{
		testLexeme(6, 1, "index.cod", "ZTOP"), testLexeme(6, 2, "index.cod", "CONTEXT"),
	}}
	entry.Tokens = append(entry.Tokens, testDirective(1650, entry.Name,
		testLexeme(6, 4, entry.Name, "entry-directive"))...)
	results, err := PreprocessSequence([]Source{system, entry}, nil)
	if err != nil {
		t.Fatal(err)
	}
	if len(results) != 2 {
		t.Fatalf("程序数=%d", len(results))
	}
	first, second := withoutLineEnds(results[0].Tokens), withoutLineEnds(results[1].Tokens)
	if len(first) != 1 || first[0].Value != 10 {
		t.Fatalf("系统上下文常量未生效：%+v", first)
	}
	if len(second) != 2 || second[0].Kind != 2 || second[0].Value != 0x6fffffff ||
		second[1].Kind != 6 || second[1].Value != 2 {
		t.Fatalf("用户宏应共享，来源常量应还原：%+v", second)
	}
	if len(results[0].Directives) != 1 || results[0].Directives[0].Source != system.Name ||
		len(results[1].Directives) != 1 || results[1].Directives[0].Source != entry.Name {
		t.Fatalf("执行指令跨程序混合：%+v", results)
	}
}

func TestPreprocessNestedInactiveBranchesDoNotActivateElse(t *testing.T) {
	const sourceName = "root.cod"
	tokens := testDirective(1601, sourceName, testLexeme(6, 1, sourceName, "OUTER"))
	tokens = append(tokens, testDirective(1601, sourceName, testLexeme(6, 2, sourceName, "INNER"))...)
	tokens = append(tokens, testDirective(1603, sourceName)...)
	tokens = append(tokens, testLexeme(2, 77, sourceName, ""))
	tokens = append(tokens, testDirective(1604, sourceName)...)
	tokens = append(tokens, testDirective(1604, sourceName)...)

	result, err := Preprocess(Source{Name: sourceName, Tokens: tokens}, nil)
	if err != nil {
		t.Fatal(err)
	}
	if got := withoutLineEnds(result.Tokens); len(got) != 0 {
		t.Fatalf("父分支未激活时，内层 #else 不应输出标记：%+v", result.Tokens)
	}
}

func TestPreprocessMacroExpansionAndPushPop(t *testing.T) {
	const sourceName = "macro.cod"
	var tokens []Lexeme
	tokens = append(tokens, testDirective(1600, sourceName,
		testLexeme(6, 10, sourceName, "G"),
		testLexeme(101, 0, sourceName, "("),
		testLexeme(6, 11, sourceName, "x"),
		testLexeme(213, 0, sourceName, ","),
		testLexeme(6, 12, sourceName, "y"),
		testLexeme(980, 0, sourceName, ")"),
		testLexeme(6, 11, sourceName, "x"),
		testLexeme(801, 0, sourceName, "+"),
		testLexeme(6, 12, sourceName, "y"),
	)...)
	tokens = append(tokens, testDirective(1600, sourceName,
		testLexeme(6, 20, sourceName, "F"),
		testLexeme(101, 0, sourceName, "("),
		testLexeme(6, 21, sourceName, "a"),
		testLexeme(213, 0, sourceName, ","),
		testLexeme(6, 22, sourceName, "b"),
		testLexeme(980, 0, sourceName, ")"),
		testLexeme(6, 21, sourceName, "a"),
		testLexeme(213, 0, sourceName, ","),
		testLexeme(6, 22, sourceName, "b"),
	)...)
	tokens = append(tokens, testDirective(1600, sourceName,
		testLexeme(6, 30, sourceName, "A"),
		testLexeme(2, 1, sourceName, ""),
	)...)
	tokens = append(tokens, testDirective(1630, sourceName)...)
	tokens = append(tokens, testDirective(1605, sourceName, testLexeme(6, 30, sourceName, "A"))...)
	tokens = append(tokens, testDirective(1600, sourceName,
		testLexeme(6, 31, sourceName, "B"),
		testLexeme(2, 2, sourceName, ""),
	)...)
	tokens = append(tokens, testLexeme(6, 30, sourceName, "A"))
	tokens = append(tokens, testLexeme(lineEnd, 0, sourceName, ""))
	tokens = append(tokens, testDirective(1640, sourceName)...)

	invocation := []Lexeme{
		testLexeme(6, 20, sourceName, "F"),
		testLexeme(101, 0, sourceName, "("),
		testLexeme(2, 9, sourceName, ""),
		testLexeme(213, 0, sourceName, ","),
		testLexeme(6, 10, sourceName, "G"),
		testLexeme(101, 0, sourceName, "("),
		testLexeme(2, 3, sourceName, ""),
		testLexeme(213, 0, sourceName, ","),
		testLexeme(2, 4, sourceName, ""),
		testLexeme(980, 0, sourceName, ")"),
		testLexeme(980, 0, sourceName, ")"),
	}
	tokens = append(tokens, invocation...)
	tokens = append(tokens, testLexeme(lineEnd, 0, sourceName, ""))
	tokens = append(tokens, testLexeme(6, 30, sourceName, "A"), testLexeme(6, 31, sourceName, "B"))

	result, err := Preprocess(Source{Name: sourceName, Tokens: tokens}, nil)
	if err != nil {
		t.Fatal(err)
	}
	wantKinds := []uint16{6, 2, 213, 2, 801, 2, 2, 6}
	wantValues := []uint32{30, 9, 0, 3, 0, 4, 1, 31}
	got := withoutLineEnds(result.Tokens)
	if len(got) != len(wantKinds) {
		t.Fatalf("展开标记数=%d，期望 %d：%+v", len(got), len(wantKinds), got)
	}
	for i, token := range got {
		if token.Kind != wantKinds[i] || token.Value != wantValues[i] {
			t.Errorf("标记[%d]=(%d,%d)，期望 (%d,%d)", i, token.Kind, token.Value, wantKinds[i], wantValues[i])
		}
		if token.Source != sourceName {
			t.Errorf("标记[%d] 来源丢失：%q", i, token.Source)
		}
	}
}

func TestPreprocessInactiveIncludeDoesNotCallResolver(t *testing.T) {
	const sourceName = "root.cod"
	tokens := testDirective(1601, sourceName, testLexeme(6, 1, sourceName, "DISABLED"))
	tokens = append(tokens, testDirective(1610, sourceName, testLexeme(3, 2, sourceName, "not-loaded.cod"))...)
	tokens = append(tokens, testDirective(1604, sourceName)...)

	resolverCalls := 0
	result, err := Preprocess(Source{Name: sourceName, Tokens: tokens}, func(from, requested string) (Source, error) {
		resolverCalls++
		return Source{}, fmt.Errorf("不应解析 %s 中的 %s", from, requested)
	})
	if err != nil {
		t.Fatal(err)
	}
	if resolverCalls != 0 || len(result.Includes) != 0 || len(withoutLineEnds(result.Tokens)) != 0 {
		t.Fatalf("未激活 include 被处理：调用=%d，包含=%v，标记=%+v", resolverCalls, result.Includes, result.Tokens)
	}
}

func TestPreprocessIncludeUsesFirstStringAndIgnoresTrailingTokens(t *testing.T) {
	const sourceName = "root.cod"
	const requestedName = "sub/child.cod"
	tokens := testDirective(1610, sourceName,
		testLexeme(3, 1, sourceName, requestedName),
		testLexeme(1230, 0, sourceName, ";"),
		testLexeme(6, 2, sourceName, "ignored"),
	)
	included := Source{Name: requestedName, Tokens: []Lexeme{
		testLexeme(6, 3, requestedName, "child"),
		testLexeme(lineEnd, 0, requestedName, ""),
	}}
	resolverCalls := 0
	result, err := Preprocess(Source{Name: sourceName, Tokens: tokens}, func(from, requested string) (Source, error) {
		resolverCalls++
		if from != sourceName || requested != requestedName {
			t.Fatalf("resolver 参数=(%q,%q)，期望 (%q,%q)", from, requested, sourceName, requestedName)
		}
		return included, nil
	})
	if err != nil {
		t.Fatal(err)
	}
	if resolverCalls != 1 || !reflect.DeepEqual(result.Includes, []string{requestedName}) {
		t.Fatalf("包含文件未按首个字符串解析：调用=%d，记录=%v", resolverCalls, result.Includes)
	}
	if len(withoutLineEnds(result.Tokens)) != 1 || result.Tokens[0].Value != 3 {
		t.Fatalf("include 后续标记不应作为额外路径或脚本语句：%+v", result.Tokens)
	}
}

func TestPreprocessUndefUsesFirstNameAndIgnoresTrailingTokens(t *testing.T) {
	const sourceName = "undef.cod"
	tokens := testDirective(1600, sourceName,
		testLexeme(6, 10, sourceName, "A"),
		testLexeme(2, 1, sourceName, "1"),
	)
	tokens = append(tokens, testDirective(1605, sourceName,
		testLexeme(6, 10, sourceName, "A"),
		testLexeme(101, 0, sourceName, "("),
		testLexeme(6, 11, sourceName, "ignored"),
		testLexeme(980, 0, sourceName, ")"),
		testLexeme(1230, 0, sourceName, ";"),
	)...)
	tokens = append(tokens,
		testLexeme(6, 10, sourceName, "A"),
		testLexeme(lineEnd, 0, sourceName, ""),
	)

	result, err := Preprocess(Source{Name: sourceName, Tokens: tokens}, nil)
	if err != nil {
		t.Fatal(err)
	}
	got := withoutLineEnds(result.Tokens)
	if len(got) != 1 || got[0].Kind != 6 || got[0].Value != 10 {
		t.Fatalf("#undef 应只删除首个名称并忽略尾随标记：%+v", got)
	}
}

func TestPreprocessPreservesIncludedSourceAndStringText(t *testing.T) {
	const rootName = "root.cod"
	const includedName = "sub/child.cod"
	root := Source{
		Name: rootName,
		Tokens: testDirective(1610, rootName,
			testLexeme(3, 1, rootName, "sub/child.cod"),
		),
	}
	included := Source{
		Name: includedName,
		Tokens: []Lexeme{
			testLexeme(3, 0x1234, includedName, ""),
			testLexeme(lineEnd, 0, includedName, ""),
		},
	}
	included.Tokens[0].Text = []byte{0x41, 0xff, 0x00}

	result, err := Preprocess(root, func(from, requested string) (Source, error) {
		if from != rootName || requested != "sub/child.cod" {
			t.Fatalf("resolver 参数=(%q,%q)", from, requested)
		}
		return included, nil
	})
	if err != nil {
		t.Fatal(err)
	}
	if !reflect.DeepEqual(result.Includes, []string{includedName}) {
		t.Fatalf("包含记录=%v", result.Includes)
	}
	if len(result.Tokens) != 3 {
		t.Fatalf("包含后标记数=%d", len(result.Tokens))
	}
	if result.Tokens[0].Source != includedName || !reflect.DeepEqual(result.Tokens[0].Text, []byte{0x41, 0xff, 0x00}) {
		t.Fatalf("包含来源或原始字符串字节丢失：%+v", result.Tokens[0])
	}
	if result.Tokens[1].Kind != lineEnd || result.Tokens[1].Source != includedName {
		t.Fatalf("包含文件行结束标记来源丢失：%+v", result.Tokens[1])
	}
	if result.Tokens[2].Kind != lineEnd || result.Tokens[2].Source != rootName {
		t.Fatalf("include 指令后的父文件行结束标记丢失：%+v", result.Tokens[2])
	}
}

func TestPreprocessRejectsRecursionAndMalformedConditions(t *testing.T) {
	tests := []struct {
		name   string
		tokens []Lexeme
		want   string
	}{
		{
			name: "递归宏",
			tokens: append(
				testDirective(1600, "recursive.cod",
					testLexeme(6, 1, "recursive.cod", "A"),
					testLexeme(6, 1, "recursive.cod", "A"),
				),
				testLexeme(6, 1, "recursive.cod", "A"),
			),
			want: "宏递归引用",
		},
		{
			name:   "缺少endif",
			tokens: testDirective(1601, "missing.cod", testLexeme(6, 2, "missing.cod", "X")),
			want:   "缺少 #endif",
		},
		{
			name:   "无匹配endif",
			tokens: testDirective(1604, "orphan.cod"),
			want:   "没有对应条件",
		},
		{
			name: "重复else",
			tokens: append(
				append(
					testDirective(1601, "else.cod", testLexeme(6, 3, "else.cod", "X")),
					testDirective(1603, "else.cod")...,
				),
				testDirective(1603, "else.cod")...,
			),
			want: "重复 #else",
		},
	}

	for _, test := range tests {
		t.Run(test.name, func(t *testing.T) {
			_, err := Preprocess(Source{Name: test.name, Tokens: test.tokens}, nil)
			if err == nil || !strings.Contains(err.Error(), test.want) {
				t.Fatalf("错误=%v，期望包含 %q", err, test.want)
			}
		})
	}
}

func TestPreprocessRejectsIncludeDepthOverflow(t *testing.T) {
	root := Source{Name: "root.cod"}
	root.Tokens = testDirective(1610, root.Name, testLexeme(3, 1, root.Name, "child.cod"))
	child := Source{Name: "child.cod"}
	child.Tokens = testDirective(1610, child.Name, testLexeme(3, 1, child.Name, "root.cod"))
	resolver := func(from, requested string) (Source, error) {
		if from == root.Name && requested == child.Name {
			return child, nil
		}
		if from == child.Name && requested == root.Name {
			return root, nil
		}
		if from != root.Name && from != child.Name {
			return Source{}, fmt.Errorf("unexpected source: %s", from)
		}
		if requested != root.Name && requested != child.Name {
			return Source{}, fmt.Errorf("unexpected include: %s", requested)
		}
		return Source{}, fmt.Errorf("unexpected include: %s", requested)
	}

	_, err := Preprocess(root, resolver)
	if err == nil || !strings.Contains(err.Error(), "包含文件深度超过") {
		t.Fatalf("期望包含深度错误，实际：%v", err)
	}
}

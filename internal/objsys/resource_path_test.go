package objsys

import (
	"testing"

	"QY/internal/script"
)

func TestDesktopPathMappingReturnsIntegerAndNeedsNoWindow(t *testing.T) {
	desktop := NewDesktop(nil, nil)
	for _, test := range []struct {
		source string
		target string
		want   int32
	}{
		{"http://example.test/world/", "local", 1},
		{"http://example.test/world/", "replacement", 1},
		{"https://example.test/world/", "unsupported", 0},
	} {
		args := []script.Value{
			{Kind: "string", Text: []byte(test.source)},
			{Kind: "string", Text: []byte(test.target)},
		}
		value, handled, err := desktop.Object.CallMember(0x112e4b8f, args)
		if err != nil || !handled || value.Kind != "int" || value.Integer != test.want {
			t.Fatalf("路径映射返回错误：value=%+v handled=%t err=%v", value, handled, err)
		}
	}
	entries := desktop.PathMappings.Entries()
	if len(entries) != 1 || string(entries[0].Target) != "replacement" {
		t.Fatalf("路径映射未接到 FBase 表：%+v", entries)
	}
	for _, args := range [][]script.Value{
		nil,
		{{Kind: "string"}},
		{{Kind: "int"}, {Kind: "string"}},
		{{Kind: "string"}, {Kind: "object"}},
	} {
		if _, handled, err := desktop.Object.CallMember(0x112e4b8f, args); !handled || err == nil {
			t.Fatalf("非法路径映射参数没有失败：handled=%t err=%v", handled, err)
		}
	}
	if len(desktop.PathMappings.Entries()) != 1 {
		t.Fatal("无效参数改变了路径映射")
	}
	extra := []script.Value{
		{Kind: "string", Text: []byte("http://example.test/extra/")},
		{Kind: "string", Text: []byte("extra")},
		{Kind: "object"},
	}
	value, handled, err := desktop.Object.CallMember(0x112e4b8f, extra)
	if err != nil || !handled || value.Kind != "int" || value.Integer != 1 {
		t.Fatalf("原生 ss 参数抽取应忽略额外参数：value=%+v handled=%t err=%v", value, handled, err)
	}
}

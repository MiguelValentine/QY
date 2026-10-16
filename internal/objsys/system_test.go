package objsys

import (
	"errors"
	"strings"
	"testing"

	"QY/internal/fbase"
	"QY/internal/fc0a"
	"QY/internal/script"
	"QY/internal/symbol"
)

func systemDirective(name string, kind uint16, value string) script.Directive {
	argument := script.Lexeme{
		Token: fc0a.Token{Kind: kind, Value: symbol.StringTableHash(value)},
		Text:  []byte(value),
	}
	return script.Directive{
		Kind: 1650, Source: "system_test.cod", Offset: 0x32,
		Arguments: []script.Lexeme{
			{Token: fc0a.Token{Kind: 6, Value: symbol.StringTableHash(name)}},
			argument,
		},
	}
}

func TestSystemCharsetUsesIndependentFontState(t *testing.T) {
	state := NewSystemState()
	for _, test := range []struct {
		name string
		want uint32
	}{
		{"BIG5", 136}, {"DEFAULT", 1}, {"GB2312", 134},
	} {
		if err := state.HandleDirective(systemDirective("charset", 6, test.name)); err != nil {
			t.Fatal(err)
		}
		if state.FontCharset != test.want || state.DisplayCharset != 134 {
			t.Fatalf("%s：字体字符集=%d，系统字符集=%d", test.name, state.FontCharset, state.DisplayCharset)
		}
	}
}

func TestSystemDevcodeUsesInstalledListWithoutRequiringMatch(t *testing.T) {
	for _, test := range []struct {
		list string
		want bool
	}{
		{"", false}, {"x", false}, {"other;FW@kele8_Ver103", true},
		{"FW@kele8_Ver103;other", true}, {"fw@kele8_ver103", false},
		{` ; "FW@kele8_Ver103";other`, true},
		{"FW@kele8_Ver103\x00other", true}, {"other\x00;FW@kele8_Ver103", false},
	} {
		t.Run(test.list, func(t *testing.T) {
			state := NewSystemState()
			state.DevCodeMatch = true
			state.readRegistry = func(subkey, name string) ([]byte, error) {
				if subkey != "fc2dev" || name != "devcode" {
					t.Fatalf("读取错误的本机设置：%q/%q", subkey, name)
				}
				return []byte(test.list), nil
			}
			if err := state.HandleDirective(systemDirective("devcode", 3, "FW@kele8_Ver103")); err != nil {
				t.Fatal(err)
			}
			if state.DevCodeMatch != test.want || !state.RegistryAvailable {
				t.Fatalf("匹配状态=%t，可读取=%t", state.DevCodeMatch, state.RegistryAvailable)
			}
		})
	}
}

func TestSystemDevcodePreservesReaderFailure(t *testing.T) {
	sentinel := errors.New("读取失败")
	state := NewSystemState()
	state.DevCodeMatch = true
	state.readRegistry = func(_, _ string) ([]byte, error) { return nil, sentinel }
	err := state.HandleDirective(systemDirective("devcode", 3, "example"))
	if !errors.Is(err, sentinel) || state.DevCodeMatch {
		t.Fatalf("未保留读取错误或未清除上次匹配：%v，%+v", err, state)
	}
	state.readRegistry = func(_, _ string) ([]byte, error) { return nil, fbase.ErrRegistryUnavailable }
	if err := state.HandleDirective(systemDirective("devcode", 3, "example")); err != nil ||
		state.DevCodeMatch || state.RegistryAvailable {
		t.Fatalf("无注册表平台的缺省状态不正确：%v，%+v", err, state)
	}
}

func TestSystemRejectsMalformedAndUnsupportedDirectives(t *testing.T) {
	for _, directive := range []script.Directive{
		{Kind: 1620}, {Kind: 1650},
		systemDirective("unknown", 3, "value"),
		systemDirective("charset", 3, "GB2312"),
		systemDirective("charset", 6, "gb2312"),
		systemDirective("devcode", 6, "value"),
	} {
		state := NewSystemState()
		if err := state.HandleDirective(directive); err == nil {
			t.Fatalf("接受了未恢复或无效的指令：%+v", directive)
		}
	}
}

func TestRealIndexInitializesSystemBeforeRootCall(t *testing.T) {
	loader, err := NewLoader("../../CLIENT")
	if err != nil {
		t.Fatal(err)
	}
	program, err := loader.Compile("index.fcc")
	if err != nil {
		t.Fatal(err)
	}
	state := NewSystemState()
	state.readRegistry = func(_, _ string) ([]byte, error) { return nil, nil }
	runtime := script.NewRuntime()
	runtime.HandleDirective = state.HandleDirective
	err = runtime.Execute(program)
	if err == nil || !strings.Contains(err.Error(), "index.fcc:0x4a") ||
		!strings.Contains(err.Error(), "0xd53b302d") {
		t.Fatalf("未在首个待恢复根对象调用处停止：%v", err)
	}
	if !state.RegistryAvailable || state.DevCodeMatch {
		t.Fatalf("系统指令没有先完成真实初始化：%+v", state)
	}
}

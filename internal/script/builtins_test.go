package script

import (
	"bytes"
	"strings"
	"testing"

	"QY/internal/symbol"
)

func TestRegisterCoreBuiltins(t *testing.T) {
	runtime := NewRuntime()
	RegisterCoreBuiltins(runtime)

	tests := []struct {
		name string
		args []Value
		want Value
	}{
		{"strlen", []Value{{Kind: "string", Text: []byte("hello")}}, integer(5)},
		{"strlen", []Value{{Kind: "string", Text: []byte{'a', 0, 'b'}}}, integer(1)},
		{"left", []Value{{Kind: "string", Text: []byte("hello")}, integer(2)}, Value{Kind: "string", Text: []byte("he")}},
		{"left", []Value{{Kind: "string", Text: []byte("hello")}, integer(8)}, Value{Kind: "string"}},
		{"right", []Value{{Kind: "string", Text: []byte("hello")}, integer(2)}, Value{Kind: "string", Text: []byte("lo")}},
		{"right", []Value{{Kind: "string", Text: []byte("hello")}, integer(8)}, Value{Kind: "string"}},
		{"mid", []Value{{Kind: "string", Text: []byte("hello")}, integer(1), integer(3)}, Value{Kind: "string", Text: []byte("ell")}},
		{"mid", []Value{{Kind: "string", Text: []byte("hello")}, integer(-2), integer(-1)}, Value{Kind: "string", Text: []byte("hello")}},
		{"mid", []Value{{Kind: "string", Text: []byte("hello")}, integer(3), integer(-1)}, Value{Kind: "string", Text: []byte("lo")}},
		{"atoi", []Value{{Kind: "string", Text: []byte("-42")}}, integer(-42)},
		{"atoi", []Value{{Kind: "string", Text: []byte("  -12tail")}}, integer(0)},
		{"atoi", []Value{{Kind: "string", Text: []byte("+7")}}, integer(0)},
		{"atoi", []Value{{Kind: "string", Text: []byte("12tail")}}, integer(12)},
		{"atoi", []Value{{Kind: "string", Text: []byte("not a number")}}, integer(0)},
		{"atoi", []Value{{Kind: "string", Text: []byte("2147483648")}}, integer(-2147483648)},
		{"str", []Value{integer(-42)}, Value{Kind: "string", Text: []byte("-42")}},
		{"abs", []Value{integer(-42)}, integer(42)},
		{"min", []Value{integer(7), integer(-2), integer(3)}, integer(-2)},
		{"max", []Value{integer(7), integer(-2), integer(3)}, integer(7)},
		{"RGB", []Value{integer(1), integer(2), integer(3)}, integer(-16711165)},
	}

	for _, test := range tests {
		t.Run(test.name+"/"+string(test.want.Kind), func(t *testing.T) {
			function := runtime.hosts[symbol.StringTableHash(test.name)]
			if function == nil {
				t.Fatalf("%s未按名称哈希登记", test.name)
			}
			got, err := function(test.args)
			if err != nil {
				t.Fatal(err)
			}
			if got.Kind != test.want.Kind || got.Integer != test.want.Integer || !bytes.Equal(got.Text, test.want.Text) {
				t.Fatalf("结果=(%+v)，期望=(%+v)", got, test.want)
			}
		})
	}
}

func TestCoreBuiltinsRejectUnsupportedCalls(t *testing.T) {
	runtime := NewRuntime()
	RegisterCoreBuiltins(runtime)

	tests := []struct {
		name string
		args []Value
		want string
	}{
		{"strlen", nil, "需要1个参数"},
		{"left", []Value{{Kind: "string"}, Value{Kind: "null"}}, "必须是整数"},
		{"mid", []Value{{Kind: "int"}, integer(0), integer(1)}, "必须是字符串"},
		{"min", []Value{integer(1)}, "至少需要2个参数"},
		{"max", []Value{integer(1), {Kind: "float"}}, "必须是整数"},
		{"RGB", []Value{integer(1), integer(2)}, "需要3个参数"},
	}
	for _, test := range tests {
		t.Run(test.name, func(t *testing.T) {
			function := runtime.hosts[symbol.StringTableHash(test.name)]
			if function == nil {
				t.Fatalf("%s未登记", test.name)
			}
			_, err := function(test.args)
			if err == nil || !strings.Contains(err.Error(), test.want) {
				t.Fatalf("错误=%v，期望包含%q", err, test.want)
			}
		})
	}
}

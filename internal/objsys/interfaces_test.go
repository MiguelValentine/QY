package objsys

import (
	"bytes"
	"strings"
	"testing"

	"QY/internal/script"
	"QY/internal/symbol"
)

func TestInterfaceRegistrationStoresSeparateObjectReferences(t *testing.T) {
	desktop := NewDesktop(nil, nil)
	child := NewWnd(desktop)
	desktop.Windows = append(desktop.Windows, child)
	raw := []byte("kele8com\x00ignored")
	args := []script.Value{{Kind: "string", Text: raw}, {Kind: "object", Object: child.Object}}
	value, handled, err := desktop.Object.CallMember(0xaabd9f0e, args)
	if err != nil || !handled || value.Kind != "tuple" || len(value.Items) != 2 ||
		value.Items[1].Object != child.Object {
		t.Fatalf("接口登记失败或改写表达式值：value=%+v handled=%t err=%v", value, handled, err)
	}
	key := symbol.StringTableHash("kele8com")
	entry := desktop.Interfaces[key]
	if !bytes.Equal(entry.Name, []byte("kele8com")) || entry.Object != child.Object {
		t.Fatalf("接口记录错误：%+v", entry)
	}
	raw[0] = 'x'
	if string(entry.Name) != "kele8com" {
		t.Fatal("接口名称与调用方缓冲区共享存储")
	}
	if _, exists := desktop.Object.Members[key]; exists {
		t.Fatal("接口登记覆盖了普通脚本成员")
	}
	args[0].Text = []byte("kele8com")
	args[1].Object = desktop.Object
	if _, _, err := desktop.Object.CallMember(0xaabd9f0e, args); err != nil {
		t.Fatal(err)
	}
	if len(desktop.Interfaces) != 1 || desktop.Interfaces[key].Object != desktop.Object {
		t.Fatal("同名接口没有替换原记录")
	}
	if _, _, err := child.Object.CallMember(0xaabd9f0e, args); err != nil {
		t.Fatal(err)
	}
	if len(child.Interfaces) != 1 || desktop.Interfaces[key].Object != desktop.Object {
		t.Fatal("子窗口接口表未独立保存")
	}
}

func TestInterfaceRegistrationRejectsInvalidInputBeforeMutation(t *testing.T) {
	desktop := NewDesktop(nil, nil)
	object := script.Value{Kind: "object", Object: desktop.Object}
	for _, args := range [][]script.Value{
		nil,
		{{Kind: "string"}},
		{{Kind: "int"}, object},
		{{Kind: "string"}, {Kind: "int"}},
		{{Kind: "string", Text: []byte(strings.Repeat("a", 32))}, object},
		{{Kind: "string"}, {Kind: "object"}},
		{{Kind: "string"}, {Kind: "object", Object: &script.Object{}}},
	} {
		if _, handled, err := desktop.Object.CallMember(0xaabd9f0e, args); !handled || err == nil {
			t.Fatalf("非法接口登记没有失败：args=%+v handled=%t err=%v", args, handled, err)
		}
		if len(desktop.Interfaces) != 0 {
			t.Fatal("失败改变了接口记录")
		}
	}
	for _, name := range []string{"", strings.Repeat("a", 31)} {
		args := []script.Value{{Kind: "string", Text: []byte(name)}, object}
		if _, handled, err := desktop.Object.CallMember(0xaabd9f0e, args); !handled || err != nil {
			t.Fatalf("合法长度未接收：len=%d handled=%t err=%v", len(name), handled, err)
		}
	}
	wnd := NewWnd(nil)
	if _, handled, err := wnd.Object.CallMember(0xdeadbeef, nil); handled || err != nil {
		t.Fatalf("未知调用被接管：handled=%t err=%v", handled, err)
	}
}

func TestInterfaceLookupUsesOwnerChainAndNearestRegistration(t *testing.T) {
	desktop := NewDesktop(nil, nil)
	parent := NewWnd(desktop)
	child := NewWnd(desktop)
	sibling := NewWnd(desktop)
	desktop.Windows = append(desktop.Windows, parent, child, sibling)
	if err := parent.Object.Reparent(desktop.Object); err != nil {
		t.Fatal(err)
	}
	if err := child.Object.Reparent(parent.Object); err != nil {
		t.Fatal(err)
	}
	if err := sibling.Object.Reparent(desktop.Object); err != nil {
		t.Fatal(err)
	}
	register := func(host, target *script.Object) {
		t.Helper()
		args := []script.Value{{Kind: "string", Text: []byte("example")}, {Kind: "object", Object: target}}
		if _, handled, err := host.CallMember(0xaabd9f0e, args); !handled || err != nil {
			t.Fatalf("接口登记失败：handled=%t err=%v", handled, err)
		}
	}
	read := func(host, want *script.Object) {
		t.Helper()
		value, handled, err := host.ReadMember(symbol.StringTableHash("m_i_example"))
		if err != nil || !handled || value.Kind != "object" || value.Object != want {
			t.Fatalf("接口读取错误：value=%+v handled=%t err=%v", value, handled, err)
		}
	}
	register(desktop.Object, desktop.Object)
	read(child.Object, desktop.Object)
	register(parent.Object, parent.Object)
	read(child.Object, parent.Object)
	read(sibling.Object, desktop.Object)
	register(child.Object, child.Object)
	read(child.Object, child.Object)
	read(parent.Object, parent.Object)
	if _, handled, err := child.Object.ReadMember(symbol.StringTableHash("m_i_missing")); handled || err != nil {
		t.Fatalf("缺失接口被错误接管：handled=%t err=%v", handled, err)
	}
}

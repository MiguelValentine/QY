package script

import (
	"strings"
	"testing"

	"QY/internal/fc0a"
)

func classDefinition(name, base uint32, body *Node) *Node {
	return &Node{
		Form:  "class",
		Token: Lexeme{Token: fc0a.Token{Kind: 1520}},
		Header: []Lexeme{
			{Token: fc0a.Token{Kind: 6, Value: name}},
			{Token: fc0a.Token{Kind: 1220}},
			{Token: fc0a.Token{Kind: 6, Value: base}},
		},
		Children: []*Node{body},
	}
}

func TestClassDeclarationStoresDefinitionWithoutRunningInitializer(t *testing.T) {
	runtime := NewRuntime()
	runtime.CurrentObject = &Object{}
	// 未知调用在类声明时不得运行；该节点必须保留给实例构造阶段。
	body := &Node{Form: "block", Children: []*Node{
		{Form: "expression", Children: []*Node{
			{Form: "call", Children: []*Node{{Form: "name", Token: Lexeme{Token: fc0a.Token{Kind: 6, Value: 77}}}}},
		}},
	}}
	if err := runtime.Execute(&Program{Body: []*Node{classDefinition(11, 22, body)}}); err != nil {
		t.Fatal(err)
	}
	class := runtime.CurrentObject.Classes[11]
	if class == nil || class.Name != 11 || class.Base != 22 || class.Body != body || class.scope != runtime.globals {
		t.Fatalf("类定义没有完整保留：%+v", class)
	}
	other := &Object{}
	runtime.CurrentObject = other
	if err := runtime.Execute(&Program{Body: []*Node{classDefinition(11, 33, body)}}); err != nil {
		t.Fatal(err)
	}
	if class.Base != 22 || other.Classes[11].Base != 33 {
		t.Fatal("不同对象共享了类登记表")
	}
	if err := runtime.Execute(&Program{Body: []*Node{classDefinition(11, 44, body)}}); err != nil || other.Classes[11].Base != 44 {
		t.Fatalf("重复类名没有替换定义：%v", err)
	}
}

func TestClassDeclarationRejectsMissingOwnerAndMalformedHeader(t *testing.T) {
	runtime := NewRuntime()
	definition := classDefinition(11, 22, &Node{Form: "block"})
	if err := runtime.Execute(&Program{Body: []*Node{definition}}); err == nil || !strings.Contains(err.Error(), "当前对象") {
		t.Fatalf("缺少类表宿主却报告成功：%v", err)
	}
	runtime.CurrentObject = &Object{}
	definition.Header = definition.Header[:1]
	if err := runtime.Execute(&Program{Body: []*Node{definition}}); err == nil || len(runtime.CurrentObject.Classes) != 0 {
		t.Fatalf("不完整的类定义被登记：%v", err)
	}
}

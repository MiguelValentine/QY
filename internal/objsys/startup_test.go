package objsys

import (
	"testing"

	"QY/internal/script"
	"QY/internal/symbol"
)

func TestCompileStartupUsesEmbeddedSystemSource(t *testing.T) {
	loader, err := NewLoader("../../CLIENT")
	if err != nil {
		t.Fatal(err)
	}

	source, err := loader.systemSource()
	if err != nil {
		t.Fatal(err)
	}
	if source.Name != "res$SYSTEM.COD" {
		t.Fatalf("系统脚本来源=%q，预期来自内嵌 SYSTEM.COD", source.Name)
	}

	const ztop = "ZTOP"
	ztopHash := symbol.StringTableHash(ztop)
	if ztopHash != 0x81e69173 {
		t.Fatalf("ZTOP 哈希=0x%08x，预期 0x81e69173", ztopHash)
	}
	foundDefinition := false
	for i := 0; i+2 < len(source.Tokens); i++ {
		if source.Tokens[i].Kind == 1600 &&
			source.Tokens[i+1].Kind == 6 && source.Tokens[i+1].Value == ztopHash &&
			source.Tokens[i+2].Kind == 2 && source.Tokens[i+2].Value == 0x6fffffff {
			foundDefinition = true
			break
		}
	}
	if !foundDefinition {
		t.Fatal("内嵌 SYSTEM.COD 未包含 ZTOP=0x6fffffff 宏定义")
	}

	programs, err := loader.compileStartup("index.fcc")
	if err != nil {
		t.Fatal(err)
	}
	if len(programs) != 2 {
		t.Fatalf("启动程序数=%d，预期 SYSTEM.COD 与入口各一份", len(programs))
	}
	for i, program := range programs {
		if program == nil || len(program.Body) == 0 {
			t.Fatalf("启动程序 %d 没有生成语法树主体", i)
		}
	}

	ptTextHash := symbol.StringTableHash("PtText")
	foundSystemClass := false
	for _, node := range programs[0].Body {
		if node.Form == "class" && len(node.Header) > 0 && node.Header[0].Value == ptTextHash {
			foundSystemClass = true
			break
		}
	}
	if !foundSystemClass {
		t.Fatal("SYSTEM.COD AST 中未找到 PtText 系统类")
	}

	zorderHash := symbol.StringTableHash("zorder")
	foundExpandedEntryAssignment := false
	walkNodes(programs[1].Body, func(node *script.Node) {
		if node.Form != "binary" || node.Token.Kind != 200 || len(node.Children) != 2 {
			return
		}
		left, expression := node.Children[0], node.Children[1]
		if left.Form != "name" || left.Token.Value != zorderHash ||
			node.Token.Source != "com/newtip.fcc" ||
			expression.Form != "binary" || expression.Token.Kind != 801 || len(expression.Children) != 2 {
			return
		}
		base, offset := expression.Children[0], expression.Children[1]
		if base.Form == "literal" && base.Token.Kind == 2 && base.Token.Value == 0x6fffffff &&
			offset.Form == "literal" && offset.Token.Kind == 2 && offset.Token.Value == 8000 {
			foundExpandedEntryAssignment = true
		}
	})
	if !foundExpandedEntryAssignment {
		t.Fatal("入口 AST 未将 newtip 的 zorder=ZTOP+8000 展开为 0x6fffffff+8000")
	}
}

func walkNodes(nodes []*script.Node, visit func(*script.Node)) {
	for _, node := range nodes {
		if node == nil {
			continue
		}
		visit(node)
		walkNodes(node.Children, visit)
	}
}

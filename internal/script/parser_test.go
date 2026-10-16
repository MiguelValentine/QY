package script

import (
	"strings"
	"testing"
)

func parseTestProgram(tokens ...Lexeme) (*Program, error) {
	return Parse(&Preprocessed{Tokens: tokens})
}

func parserToken(kind uint16, value uint32, text string) Lexeme {
	return testLexeme(kind, value, "parser_test.cod", text)
}

func TestParseExpressionPrecedence(t *testing.T) {
	program, err := parseTestProgram(
		parserToken(6, 1, "a"),
		parserToken(801, 0, "+"),
		parserToken(6, 2, "b"),
		parserToken(851, 0, "*"),
		parserToken(6, 3, "c"),
		parserToken(1230, 0, ";"),
	)
	if err != nil {
		t.Fatal(err)
	}
	if len(program.Body) != 1 {
		t.Fatalf("顶层节点数=%d，期望 1", len(program.Body))
	}
	root := program.Body[0].Children[0]
	if root.Form != "binary" || root.Token.Kind != 801 || len(root.Children) != 2 {
		t.Fatalf("加法 AST 结构错误：%+v", root)
	}
	right := root.Children[1]
	if right.Form != "binary" || right.Token.Kind != 851 {
		t.Fatalf("乘法未优先结合：%+v", right)
	}
}

func TestParseTupleAssignment(t *testing.T) {
	program, err := parseTestProgram(
		parserToken(101, 0, "("),
		parserToken(6, 1, "a"),
		parserToken(213, 0, ","),
		parserToken(6, 2, "b"),
		parserToken(980, 0, ")"),
		parserToken(200, 0, "="),
		parserToken(101, 0, "("),
		parserToken(6, 3, "c"),
		parserToken(213, 0, ","),
		parserToken(6, 4, "d"),
		parserToken(980, 0, ")"),
		parserToken(1230, 0, ";"),
	)
	if err != nil {
		t.Fatal(err)
	}
	assignment := program.Body[0].Children[0]
	if assignment.Form != "binary" || assignment.Token.Kind != 200 {
		t.Fatalf("根节点不是赋值：%+v", assignment)
	}
	for side, tuple := range assignment.Children {
		if tuple.Form != "binary" || tuple.Token.Kind != 213 {
			t.Errorf("赋值第 %d 侧不是逗号组合：%+v", side, tuple)
		}
	}
}

func TestParseFunctionDeclarationAndCallArguments(t *testing.T) {
	program, err := parseTestProgram(
		parserToken(1532, 0, "void"),
		parserToken(6, 1, "f"),
		parserToken(101, 0, "("),
		parserToken(1530, 0, "int"),
		parserToken(6, 2, "x"),
		parserToken(213, 0, ","),
		parserToken(1531, 0, "string"),
		parserToken(6, 3, "y"),
		parserToken(980, 0, ")"),
		parserToken(1230, 0, ";"),
		parserToken(6, 4, "f"),
		parserToken(101, 0, "("),
		parserToken(2, 10, "1"),
		parserToken(213, 0, ","),
		parserToken(3, 11, "\"x\""),
		parserToken(980, 0, ")"),
		parserToken(1230, 0, ";"),
	)
	if err != nil {
		t.Fatal(err)
	}
	if len(program.Body) != 2 {
		t.Fatalf("顶层节点数=%d，期望 2", len(program.Body))
	}
	function := program.Body[0]
	if function.Form != "function" || len(function.Children) != 2 {
		t.Fatalf("函数声明结构错误：%+v", function)
	}
	for i, wantName := range []string{"x", "y"} {
		param := function.Children[i]
		if param.Form != "parameter" || len(param.Header) != 1 || string(param.Header[0].Text) != wantName {
			t.Errorf("参数[%d]结构错误：%+v", i, param)
		}
	}
	call := program.Body[1].Children[0]
	if call.Form != "call" || len(call.Children) != 3 {
		t.Fatalf("双实参调用结构错误：%+v", call)
	}
}

func TestParseClosureBlockExpression(t *testing.T) {
	program, err := parseTestProgram(
		parserToken(1534, 0, "var"),
		parserToken(6, 1, "callback"),
		parserToken(200, 0, "="),
		parserToken(1100, 0, "{"),
		parserToken(1514, 0, "return"),
		parserToken(2, 7, "7"),
		parserToken(1230, 0, ";"),
		parserToken(1101, 0, "}"),
		parserToken(1230, 0, ";"),
	)
	if err != nil {
		t.Fatal(err)
	}
	initializer := program.Body[0].Children[0].Children[0]
	if initializer.Form != "closure" || len(initializer.Children) != 1 {
		t.Fatalf("变量初始化表达式不是闭包：%+v", initializer)
	}
	body := initializer.Children[0]
	if body.Form != "block" || len(body.Children) != 1 || body.Children[0].Form != "return" {
		t.Fatalf("闭包块结构错误：%+v", body)
	}
}

func TestParseStyleAndModifier(t *testing.T) {
	program, err := parseTestProgram(
		parserToken(1521, 0, "style"),
		parserToken(1220, 0, ":"),
		parserToken(6, 20, "base"),
		parserToken(1230, 0, ";"),
		parserToken(1210, 0, "?"),
		parserToken(6, 21, "visible"),
		parserToken(1230, 0, ";"),
	)
	if err != nil {
		t.Fatal(err)
	}
	if len(program.Body) != 2 || program.Body[0].Form != "apply-style" {
		t.Fatalf("style 应解析为 style 应用语句：%+v", program.Body)
	}
	modified := program.Body[1]
	if modified.Form != "expression" || len(modified.Modifiers) != 1 || modified.Modifiers[0].Kind != 1210 {
		t.Fatalf("问号修饰符未保留：%+v", modified)
	}
}

func TestParseReportsMalformedSyntaxLocation(t *testing.T) {
	_, err := parseTestProgram(
		parserToken(6, 1, "call"),
		parserToken(101, 0, "("),
		parserToken(6, 2, "value"),
	)
	if err == nil {
		t.Fatal("缺少右括号的调用应返回错误")
	}
	if !strings.Contains(err.Error(), "parser_test.cod") || !strings.Contains(err.Error(), "需要 kind=980") {
		t.Fatalf("错误未包含来源和预期标记：%v", err)
	}
}

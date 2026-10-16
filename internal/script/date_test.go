package script

import (
	"errors"
	"testing"
	"time"

	"QY/internal/symbol"
)

func TestLocalDatePreservesCalendarComponents(t *testing.T) {
	now := time.Date(2026, 10, 16, 23, 59, 58, 987654321, time.FixedZone("test", 8*60*60))
	want := Date{Year: 2026, Month: 10, DayOfWeek: 5, Day: 16,
		Hour: 23, Minute: 59, Second: 58, Millisecond: 987}
	if got := localDate(now); got != want {
		t.Fatalf("本地日期=%+v，期望%+v", got, want)
	}
	if _, err := builtinGetLocalTime([]Value{integer(1)}); err == nil {
		t.Fatal("未拒绝当前不支持的时钟参数")
	}
}

func TestMakeDateCopiesWordsWithoutNormalization(t *testing.T) {
	value, err := builtinMakeDate([]Value{integer(2005), integer(12), integer(1)})
	if err != nil || value.Kind != "date" || value.Date != (Date{Year: 2005, Month: 12, Day: 1}) {
		t.Fatalf("三参数日期=%+v err=%v", value, err)
	}
	value, err = builtinMakeDate([]Value{
		integer(65537), integer(-1), integer(0), integer(25), integer(61), integer(62),
	})
	if err != nil || value.Date != (Date{Year: 1, Month: 65535, Hour: 25, Minute: 61, Second: 62}) {
		t.Fatalf("日期分量被规范化=%+v err=%v", value, err)
	}
	for _, arguments := range [][]Value{
		nil, {integer(1), integer(2)}, {integer(1), integer(2), {Kind: "string"}},
		{integer(1), integer(1), integer(1), integer(1), integer(1), integer(1), integer(1)},
	} {
		if _, err := builtinMakeDate(arguments); err == nil {
			t.Fatalf("未拒绝无效参数：%+v", arguments)
		}
	}
}

func TestDateDeclarationKeepsTypedValue(t *testing.T) {
	tokens := []Lexeme{
		runtimeToken(1535, 0, "date"), runtimeToken(6, 1, "today"),
		runtimeToken(200, 0, "="), runtimeToken(6, symbol.StringTableHash("MakeDate"), "MakeDate"),
		runtimeToken(101, 0, "("), runtimeToken(2, 2005, "2005"),
		runtimeToken(213, 0, ","), runtimeToken(2, 12, "12"),
		runtimeToken(213, 0, ","), runtimeToken(2, 1, "1"),
		runtimeToken(980, 0, ")"), runtimeToken(1230, 0, ";"),
	}
	program, err := Parse(&Preprocessed{Tokens: tokens})
	if err != nil {
		t.Fatal(err)
	}
	runtime := NewRuntime()
	RegisterCoreBuiltins(runtime)
	if err := runtime.Execute(program); err != nil {
		t.Fatal(err)
	}
	value, ok := runtime.Global(1)
	if !ok || value.Kind != "date" || value.Date != (Date{Year: 2005, Month: 12, Day: 1}) {
		t.Fatalf("日期变量=%+v exists=%t", value, ok)
	}
}

func TestDateCmpPreservesOriginalCallbackArgumentSlot(t *testing.T) {
	arguments := []Value{
		{Kind: "date", Date: Date{Year: 2026, Month: 10, Day: 16}},
		{Kind: "date", Date: Date{Year: 2005, Month: 12, Day: 1}},
	}
	value, err := builtinDateCmp(arguments)
	if err != nil || value.Kind != "tuple" || len(value.Items) != 2 ||
		value.Items[0].Date != arguments[0].Date || value.Items[1].Date != arguments[1].Date {
		t.Fatalf("空回调改变参数值：%+v err=%v", value, err)
	}
	arguments[0].Date.Year = 1
	if value.Items[0].Date.Year != 2026 {
		t.Fatal("回调结果引用了可变的宿主参数切片")
	}
	if _, err := builtinDateCmp([]Value{integer(0), integer(1)}); err == nil {
		t.Fatal("尚未恢复的参数形态没有明确拒绝")
	}
}

func TestDateCmpComparisonReportsNativeTypeError(t *testing.T) {
	date := Value{Kind: "date", Date: Date{Year: 2005, Month: 12, Day: 1}}
	value, err := builtinDateCmp([]Value{date, date})
	if err != nil {
		t.Fatal(err)
	}
	result, err := binary(602, value, integer(0))
	var native *NativeError
	if !errors.As(err, &native) || native.Code != 8 || result.Kind != "" {
		t.Fatalf("tuple 比较不应产生布尔结果：%+v err=%v", result, err)
	}
	runtime := NewRuntime()
	runtime.SetGlobal(1, value)
	expression := &Node{Form: "binary", Token: runtimeToken(602, 0, ">"), Children: []*Node{
		{Form: "name", Token: runtimeToken(6, 1, "result")},
		{Form: "literal", Token: runtimeToken(2, 0, "0")},
	}}
	err = runtime.Execute(&Program{Body: []*Node{{Form: "expression", Children: []*Node{expression}}}})
	if !errors.As(err, &native) || native.Code != 8 {
		t.Fatalf("表达式位置包装丢失原生错误码：%v", err)
	}
}

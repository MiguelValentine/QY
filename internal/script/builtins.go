package script

import (
	"bytes"
	"fmt"
	"strconv"

	"QY/internal/symbol"
)

// RegisterCoreBuiltins 登记已从 objsys.dll 静态恢复的纯内置函数。
func RegisterCoreBuiltins(runtime *Runtime) {
	builtins := map[string]HostFunction{
		"strlen":       builtinStrlen,
		"left":         builtinLeft,
		"right":        builtinRight,
		"mid":          builtinMid,
		"atoi":         builtinAtoi,
		"str":          builtinStr,
		"abs":          builtinAbs,
		"min":          builtinMin,
		"max":          builtinMax,
		"RGB":          builtinRGB,
		"GetLocalTime": builtinGetLocalTime,
		"MakeDate":     builtinMakeDate,
		"DateCmp":      builtinDateCmp,
	}
	for name, function := range builtins {
		runtime.Register(symbol.StringTableHash(name), function)
	}
}

func requireArgumentCount(name string, arguments []Value, count int) error {
	if len(arguments) != count {
		return fmt.Errorf("%s需要%d个参数，收到%d个", name, count, len(arguments))
	}
	return nil
}

func requireInteger(name string, value Value) (int32, error) {
	if value.Kind != "int" {
		return 0, fmt.Errorf("%s参数必须是整数", name)
	}
	return value.Integer, nil
}

func requireString(name string, value Value) ([]byte, error) {
	if value.Kind != "string" {
		return nil, fmt.Errorf("%s参数必须是字符串", name)
	}
	return value.Text, nil
}

func cString(value []byte) []byte {
	if end := bytes.IndexByte(value, 0); end >= 0 {
		return value[:end]
	}
	return value
}

func builtinStrlen(arguments []Value) (Value, error) {
	if err := requireArgumentCount("strlen", arguments, 1); err != nil {
		return Value{}, err
	}
	text, err := requireString("strlen", arguments[0])
	if err != nil {
		return Value{}, err
	}
	return integer(int32(len(cString(text)))), nil
}

func builtinLeft(arguments []Value) (Value, error) {
	if err := requireArgumentCount("left", arguments, 2); err != nil {
		return Value{}, err
	}
	text, err := requireString("left", arguments[0])
	if err != nil {
		return Value{}, err
	}
	count, err := requireInteger("left", arguments[1])
	if err != nil {
		return Value{}, err
	}
	text = cString(text)
	if count < 0 || int64(count) > int64(len(text)) {
		return Value{Kind: "string"}, nil
	}
	return Value{Kind: "string", Text: bytes.Clone(text[:int(count)])}, nil
}

func builtinRight(arguments []Value) (Value, error) {
	if err := requireArgumentCount("right", arguments, 2); err != nil {
		return Value{}, err
	}
	text, err := requireString("right", arguments[0])
	if err != nil {
		return Value{}, err
	}
	count, err := requireInteger("right", arguments[1])
	if err != nil {
		return Value{}, err
	}
	text = cString(text)
	start := int64(len(text)) - int64(count)
	if start < 0 || start > int64(len(text)) {
		return Value{Kind: "string"}, nil
	}
	return Value{Kind: "string", Text: bytes.Clone(text[int(start):])}, nil
}

func builtinMid(arguments []Value) (Value, error) {
	if err := requireArgumentCount("mid", arguments, 3); err != nil {
		return Value{}, err
	}
	text, err := requireString("mid", arguments[0])
	if err != nil {
		return Value{}, err
	}
	start, err := requireInteger("mid", arguments[1])
	if err != nil {
		return Value{}, err
	}
	length, err := requireInteger("mid", arguments[2])
	if err != nil {
		return Value{}, err
	}
	text = cString(text)
	if start < 0 {
		start = 0
	}
	if int64(start) > int64(len(text)) {
		return Value{Kind: "string"}, nil
	}
	if length < 0 {
		length = int32(int64(len(text)) - int64(start))
	}
	end := int64(start) + int64(length)
	if end > int64(len(text)) {
		end = int64(len(text))
	}
	if end <= int64(start) {
		return Value{Kind: "string"}, nil
	}
	return Value{Kind: "string", Text: bytes.Clone(text[int(start):int(end)])}, nil
}

func builtinAtoi(arguments []Value) (Value, error) {
	if err := requireArgumentCount("atoi", arguments, 1); err != nil {
		return Value{}, err
	}
	text, err := requireString("atoi", arguments[0])
	if err != nil {
		return Value{}, err
	}
	text = cString(text)
	negative := false
	if len(text) > 0 && text[0] == '-' {
		negative = true
		text = text[1:]
	}
	if len(text) == 0 || text[0] < '0' || text[0] > '9' {
		return integer(0), nil
	}
	var value uint32
	for _, character := range text {
		if character < '0' || character > '9' {
			break
		}
		value = value*10 + uint32(character-'0')
	}
	if negative {
		value = -value
	}
	return integer(int32(value)), nil
}

func builtinStr(arguments []Value) (Value, error) {
	if err := requireArgumentCount("str", arguments, 1); err != nil {
		return Value{}, err
	}
	value, err := requireInteger("str", arguments[0])
	if err != nil {
		return Value{}, err
	}
	return Value{Kind: "string", Text: []byte(strconv.FormatInt(int64(value), 10))}, nil
}

func builtinAbs(arguments []Value) (Value, error) {
	if err := requireArgumentCount("abs", arguments, 1); err != nil {
		return Value{}, err
	}
	value, err := requireInteger("abs", arguments[0])
	if err != nil {
		return Value{}, err
	}
	if value < 0 {
		value = -value
	}
	return integer(value), nil
}

func builtinMin(arguments []Value) (Value, error) {
	return builtinExtremum("min", arguments, true)
}

func builtinMax(arguments []Value) (Value, error) {
	return builtinExtremum("max", arguments, false)
}

func builtinExtremum(name string, arguments []Value, minimum bool) (Value, error) {
	if len(arguments) < 2 {
		return Value{}, fmt.Errorf("%s至少需要2个参数，收到%d个", name, len(arguments))
	}
	result, err := requireInteger(name, arguments[0])
	if err != nil {
		return Value{}, err
	}
	for _, argument := range arguments[1:] {
		value, err := requireInteger(name, argument)
		if err != nil {
			return Value{}, err
		}
		if (minimum && value < result) || (!minimum && value > result) {
			result = value
		}
	}
	return integer(result), nil
}

func builtinRGB(arguments []Value) (Value, error) {
	if err := requireArgumentCount("RGB", arguments, 3); err != nil {
		return Value{}, err
	}
	red, err := requireInteger("RGB", arguments[0])
	if err != nil {
		return Value{}, err
	}
	green, err := requireInteger("RGB", arguments[1])
	if err != nil {
		return Value{}, err
	}
	blue, err := requireInteger("RGB", arguments[2])
	if err != nil {
		return Value{}, err
	}
	value := (red|int32(-256))<<8 | green
	value = value<<8 | blue
	return integer(value), nil
}

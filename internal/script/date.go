package script

import (
	"fmt"
	"time"
)

// Date 保留 Win32 SYSTEMTIME 的八个 WORD，避免日期分量被时区转换或规范化。
type Date struct {
	Year, Month, DayOfWeek, Day       uint16
	Hour, Minute, Second, Millisecond uint16
}

// localDate 按 GetLocalTime 的字段顺序保留本地日历时间。
func localDate(now time.Time) Date {
	return Date{
		Year: uint16(now.Year()), Month: uint16(now.Month()),
		DayOfWeek: uint16(now.Weekday()), Day: uint16(now.Day()),
		Hour: uint16(now.Hour()), Minute: uint16(now.Minute()),
		Second: uint16(now.Second()), Millisecond: uint16(now.Nanosecond() / 1000000),
	}
}

func builtinGetLocalTime(arguments []Value) (Value, error) {
	if err := requireArgumentCount("GetLocalTime", arguments, 0); err != nil {
		return Value{}, err
	}
	return Value{Kind: "date", Date: localDate(time.Now())}, nil
}

func builtinMakeDate(arguments []Value) (Value, error) {
	if len(arguments) < 3 || len(arguments) > 6 {
		return Value{}, fmt.Errorf("MakeDate 需要3到6个整数参数")
	}
	var parts [6]uint16
	for i, argument := range arguments {
		value, err := requireInteger("MakeDate", argument)
		if err != nil {
			return Value{}, err
		}
		// 原生只复制整数低 WORD，不对日历分量做规范化。
		parts[i] = uint16(value)
	}
	return Value{Kind: "date", Date: Date{
		Year: parts[0], Month: parts[1], Day: parts[2],
		Hour: parts[3], Minute: parts[4], Second: parts[5],
	}}, nil
}

func builtinDateCmp(arguments []Value) (Value, error) {
	if len(arguments) != 2 || arguments[0].Kind != "date" || arguments[1].Kind != "date" {
		return Value{}, fmt.Errorf("DateCmp 当前仅恢复两个日期参数的原始空回调路径")
	}
	// 此版本登记的原生回调只有 xor eax,eax;ret，不改写参数值槽。
	return Value{Kind: "tuple", Items: append([]Value(nil), arguments...)}, nil
}

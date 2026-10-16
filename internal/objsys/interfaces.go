package objsys

import (
	"bytes"
	"fmt"

	"QY/internal/script"
	"QY/internal/symbol"
)

// InterfaceEntry 保留原生接口表中的原始名称与有效对象引用。
type InterfaceEntry struct {
	Name   []byte
	Object *script.Object
}

func (d *Desktop) readInterface(receiver *script.Object, key uint32) (script.Value, bool, error) {
	if d == nil {
		return script.Value{}, false, nil
	}
	visited := make(map[*script.Object]bool)
	for current := receiver; current != nil; current = current.Owner {
		if visited[current] {
			return script.Value{}, true, fmt.Errorf("接口查找的所属对象链包含循环")
		}
		visited[current] = true
		var entries map[uint32]InterfaceEntry
		if current == d.Object {
			entries = d.Interfaces
		} else {
			for _, wnd := range d.Windows {
				if wnd.Object == current {
					entries = wnd.Interfaces
					break
				}
			}
		}
		for _, entry := range entries {
			// Go 的成员访问只有名称哈希，使用登记时保留的原名复现 m_i_ 入口。
			if symbol.StringTableHash("m_i_"+string(entry.Name)) == key && d.containsObject(entry.Object) {
				return script.Value{Kind: "object", Object: entry.Object}, true, nil
			}
		}
	}
	return script.Value{}, false, nil
}

func (d *Desktop) containsObject(object *script.Object) bool {
	if d == nil || object == nil {
		return false
	}
	if object == d.Object {
		return true
	}
	for _, wnd := range d.Windows {
		if wnd.Object == object {
			return true
		}
	}
	for _, text := range d.Texts {
		if text.Object == object {
			return true
		}
	}
	return false
}

func callInterface(desktop *Desktop, entries *map[uint32]InterfaceEntry, key uint32, arguments []script.Value) (script.Value, bool, error) {
	if key != 0xaabd9f0e {
		return script.Value{}, false, nil
	}
	if len(arguments) < 2 || arguments[0].Kind != "string" || arguments[1].Kind != "object" {
		return script.Value{}, true, fmt.Errorf("RegInterface 需要名称字符串和对象参数")
	}
	name := nulBytes(arguments[0].Text)
	if len(name) >= 32 {
		return script.Value{}, true, fmt.Errorf("RegInterface 名称不能达到32字节")
	}
	target := arguments[1].Object
	if !desktop.containsObject(target) {
		return script.Value{}, true, fmt.Errorf("RegInterface 目标未登记为有效宿主对象")
	}
	if *entries == nil {
		*entries = make(map[uint32]InterfaceEntry)
	}
	// 原生先登记 m_i_ 名称供属性解析，独立接口表仍以原名哈希为键。
	hash := symbol.StringTableHash(string(name))
	(*entries)[hash] = InterfaceEntry{Name: bytes.Clone(name), Object: target}
	// 0x10059620 不改写传入的值槽，表达式沿用参数 tuple。
	return script.Value{Kind: "tuple", Items: append([]script.Value(nil), arguments...)}, true, nil
}

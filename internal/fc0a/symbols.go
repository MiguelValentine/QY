package fc0a

import (
	"fmt"
	"strconv"
	"strings"

	"QY/internal/symbol"
)

// StringCandidates 返回与给定字符串哈希匹配的池项副本，并保留所有候选项。
func (d *Document) StringCandidates(hash uint32) [][]byte {
	if d == nil {
		return nil
	}
	var candidates [][]byte
	for _, value := range d.Strings {
		if symbol.StringTableHash(string(value.Raw)) == hash {
			candidates = append(candidates, append([]byte(nil), value.Raw...))
		}
	}
	return candidates
}

// TokenText 返回便于检查的标记文本；无法确定含义的标记保留原始数值。
func (d *Document) TokenText(token Token) string {
	if name, ok := KindName(token.Kind); ok {
		return name
	}
	switch token.Kind {
	case 2:
		return strconv.FormatInt(int64(int32(token.Value)), 10)
	case 3:
		candidates := d.StringCandidates(token.Value)
		if len(candidates) == 0 {
			return fmt.Sprintf("字符串哈希 0x%08x", token.Value)
		}
		return "字符串 " + quoteCandidates(candidates)
	case 4:
		return fmt.Sprintf("数据块（%d 字节）", token.Value)
	case 6:
		candidates := d.StringCandidates(token.Value)
		if len(candidates) == 0 {
			return fmt.Sprintf("符号哈希 0x%08x（未解析）", token.Value)
		}
		return fmt.Sprintf("符号哈希 0x%08x（字符串池候选：%s）", token.Value, quoteCandidates(candidates))
	default:
		return fmt.Sprintf("未知标记 kind=%d value=0x%08x", token.Kind, token.Value)
	}
}

func quoteCandidates(candidates [][]byte) string {
	quoted := make([]string, len(candidates))
	for i, candidate := range candidates {
		quoted[i] = strconv.Quote(string(candidate))
	}
	return "[" + strings.Join(quoted, ", ") + "]"
}

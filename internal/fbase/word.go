package fbase

// NextWord 按FBase #688的devcode调用参数路径提取一个分号分隔词。
// 它对应第三参数为0、第四参数为1的调用：先执行#704式前置清理，
// 再扫描一个词；返回的word和rest均引用input的底层数组。
func NextWord(input []byte, delimiter byte) (word, rest []byte, ok bool) {
	input = cStringBytes(input)
	input = trimWordPrefix(input)
	if len(input) == 0 {
		return nil, nil, false
	}

	start := 0
	end := 0
	next := len(input)

	if input[0] == '"' || input[0] == '\'' {
		quote := input[0]
		escapeIndex := 0
		i := 1
		for i < len(input) {
			if input[i]&0x80 != 0 {
				i += 2
				continue
			}
			if input[i] == '\\' && i != escapeIndex {
				escapeIndex = i + 1
			}
			if input[i] == quote {
				if i != escapeIndex {
					break
				}
			}
			i++
		}
		start, end = 1, i
		if i < len(input) {
			i++
		}
		for i < len(input) {
			ch := input[i]
			if ch&0x80 == 0 && ch == delimiter {
				next = i + 1
				break
			}
			i++
		}
	} else {
		depth := 0
		for i, ch := range input {
			if ch == '{' && ch != delimiter {
				depth++
			} else if ch == '}' {
				depth--
			}

			if depth >= 1 {
				continue
			}
			if ch == delimiter || ch&0x80 == 0 && ch > 0 && ch < 0x20 {
				end, next = i, i+1
				break
			}
			end = i + 1
		}
	}

	word = input[start:end]
	rest = input[next:]
	return word, rest, true
}

// cStringBytes限制扫描范围到FBase字符串对象的首个NUL。
func cStringBytes(input []byte) []byte {
	for i, ch := range input {
		if ch == 0 {
			return input[:i]
		}
	}
	return input
}

// trimWordPrefix复现#704在第四参数为1时的单次注释剥离和两端裁剪。
func trimWordPrefix(input []byte) []byte {
	start := 0
	for start < len(input) && (isTrimByte(input[start]) || input[start] == ';') {
		start++
	}
	input = input[start:]

	// 原函数只在开头检查一次注释，且要求起始位置严格小于长度减四。
	if len(input) > 4 && input[0] == '/' && input[1] == '*' {
		for i := 2; i < len(input)-1; i++ {
			if input[i] == '*' && input[i+1] == '/' {
				start = i + 2
				for start < len(input) && (isTrimByte(input[start]) || input[start] == ';') {
					start++
				}
				input = input[start:]
				break
			}
		}
	}

	// #704逐字节写NUL再缩短长度，但当尾部全部可裁时会留下第一个字节。
	if len(input) > 1 {
		end := len(input) - 1
		for end > 0 && (isTrimByte(input[end]) || input[end] == ';') {
			end--
		}
		input = input[:end+1]
	}
	return input
}

func isTrimByte(ch byte) bool {
	return ch&0x80 == 0 && ch <= 0x20
}

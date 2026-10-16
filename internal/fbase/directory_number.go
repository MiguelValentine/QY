package fbase

// DecodeDirectoryNumber复现FBase #681的6位数字解码。
func DecodeDirectoryNumber(input []byte) uint32 {
	input = directoryCString(input)
	if len(input) == 0 {
		return 0
	}

	value := directoryDigit(input[0])
	for _, ch := range input[1:] {
		if ch == ' ' {
			break
		}
		value = value<<6 + directoryDigit(ch)
	}
	return value
}

// DecodeDirectoryNumberPrefix复现FBase #682的限长6位数字解码。
func DecodeDirectoryNumberPrefix(input []byte, count int32) uint32 {
	input = directoryCString(input)
	if len(input) == 0 {
		return 0
	}

	value := directoryDigit(input[0])
	if count <= 1 {
		return value
	}
	for i := int32(1); i < count && int64(i) < int64(len(input)); i++ {
		value = value<<6 + directoryDigit(input[i])
	}
	return value
}

func directoryCString(input []byte) []byte {
	for i, ch := range input {
		if ch == 0 {
			return input[:i]
		}
	}
	return input
}

func directoryDigit(ch byte) uint32 {
	switch {
	case ch >= '0' && ch <= '9':
		return uint32(ch - '0')
	case ch >= 'A' && ch <= 'Z':
		return uint32(ch-'A') + 10
	case ch == '_':
		return 36
	case ch == '`':
		return 37
	case ch >= 'a' && ch <= 'z':
		return uint32(ch-'a') + 38
	default:
		return 0
	}
}

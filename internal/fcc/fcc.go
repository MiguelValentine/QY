// fcc 包还原客户端资源外壳，并在内存中提取 CAB 成员。
package fcc

import (
	"bytes"
	"encoding/binary"
	"errors"
	"fmt"
	"io"
	"math/bits"
	"path"
	"strings"

	"github.com/NextronSystems/lzx"
)

// Kind 标记 FCC 解包后识别出的外层格式。
type Kind string

const (
	KindXY20CAB Kind = "xy20-cab"
	KindCD1Raw  Kind = "cd1-raw"
	KindRawFC0A Kind = "raw-fc0a"
	KindRawFCTB Kind = "raw-fctb"
)

const (
	maxCABMembers  = 1 << 16
	maxFolderBytes = 512 << 20
)

var (
	ErrUnknownFormat = errors.New("fcc: unknown format")
	ErrInvalid       = errors.New("fcc: invalid data")
)

var lfsrMask = uint32(0xE7BD2160)

// Decode 将 XY20 或 !CD1 外壳解码为 CAB、FC0A 字节流；裸 FC0A/FCTB 原样复制返回。
func Decode(data []byte) ([]byte, Kind, error) {
	switch {
	case len(data) >= 4 && string(data[:4]) == "XY20":
		decoded := xorWords(data, uint32(len(data)))
		copy(decoded[:4], "MSCF")
		if len(decoded) < 12 || binary.LittleEndian.Uint32(decoded[8:12]) != uint32(len(decoded)) {
			return nil, "", fmt.Errorf("%w: decoded CAB length mismatch", ErrInvalid)
		}
		return decoded, KindXY20CAB, nil
	case len(data) >= 4 && string(data[:4]) == "!CD1":
		decoded := xorWords(data[4:], uint32(len(data)-4))
		if !bytes.HasPrefix(decoded, []byte("FC0A")) {
			return nil, "", fmt.Errorf("%w: !CD1 payload lacks FC0A signature", ErrInvalid)
		}
		return decoded, KindCD1Raw, nil
	case len(data) >= 4 && string(data[:4]) == "FC0A":
		return append([]byte(nil), data...), KindRawFC0A, nil
	case len(data) >= 4 && string(data[:4]) == "FCTB":
		return append([]byte(nil), data...), KindRawFCTB, nil
	default:
		return nil, "", ErrUnknownFormat
	}
}

// xorWords 以负载长度为种子，每四字节推进一次状态；不足四字节的尾部保留原值。
func xorWords(data []byte, seed uint32) []byte {
	decoded := append([]byte(nil), data...)
	state := seed
	for offset := 0; offset+4 <= len(data); offset += 4 {
		state = nextWord(state)
		word := binary.LittleEndian.Uint32(data[offset:offset+4]) ^ state
		binary.LittleEndian.PutUint32(decoded[offset:offset+4], word)
	}
	return decoded
}

// nextWord 执行原生反馈寄存器的 32 轮移位，不能与网络 B 模式的掩码混用。
func nextWord(state uint32) uint32 {
	for i := 0; i < 32; i++ {
		// 反馈位等于掩码后 32 位的奇偶校验。
		if bits.OnesCount32(state&lfsrMask)&1 != 0 {
			state = state<<1 | 1
		} else {
			state <<= 1
		}
	}
	return state
}

// Member 保存 CAB 内的单个文件；裸负载使用空 Name。
type Member struct {
	Name string
	Data []byte
}

type cabFolder struct {
	offset      uint32
	dataBlocks  uint16
	compression uint16
}

type cabFile struct {
	name       string
	size       uint32
	folderOff  uint32
	folderID   uint16
	attributes uint16
}

// Open 解码 FCC；CAB 结果展开为成员，裸 FC0A/FCTB 作为单个匿名成员返回。
func Open(data []byte) ([]Member, error) {
	decoded, kind, err := Decode(data)
	if err != nil {
		return nil, err
	}
	if kind != KindXY20CAB {
		return []Member{{Data: decoded}}, nil
	}
	return openCAB(decoded)
}

// openCAB 分别读取文件夹表与文件表，检查边界后才提取成员。
// 头部偏移 16 指向文件表，文件夹表则位于可变长头部之后。
func openCAB(cab []byte) ([]Member, error) {
	if len(cab) < 36 || string(cab[:4]) != "MSCF" {
		return nil, fmt.Errorf("%w: truncated CAB header", ErrInvalid)
	}
	cabSize := binary.LittleEndian.Uint32(cab[8:12])
	fileOffset := binary.LittleEndian.Uint32(cab[16:20])
	folderCount := int(binary.LittleEndian.Uint16(cab[26:28]))
	fileCount := int(binary.LittleEndian.Uint16(cab[28:30]))
	flags := binary.LittleEndian.Uint16(cab[30:32])
	if cabSize != uint32(len(cab)) || folderCount == 0 || fileCount == 0 ||
		fileCount > maxCABMembers || folderCount > maxCABMembers {
		return nil, fmt.Errorf("%w: inconsistent CAB header", ErrInvalid)
	}

	pos := 36
	// 保留区长度分别占两字节、一字节和一字节，不可统一按字节读取。
	var headerReserve uint16
	var folderReserve, dataReserve uint8
	if flags&0x0004 != 0 {
		if !has(cab, pos, 4) {
			return nil, fmt.Errorf("%w: truncated CAB reserve sizes", ErrInvalid)
		}
		headerReserve = binary.LittleEndian.Uint16(cab[pos : pos+2])
		folderReserve, dataReserve = cab[pos+2], cab[pos+3]
		pos += 4 + int(headerReserve)
		if pos > len(cab) {
			return nil, fmt.Errorf("%w: CAB header reserve exceeds file", ErrInvalid)
		}
	}
	for _, bit := range []uint16{0x0001, 0x0002} {
		if flags&bit != 0 {
			var err error
			pos, err = skipCString(cab, pos)
			if err != nil {
				return nil, err
			}
			pos, err = skipCString(cab, pos)
			if err != nil {
				return nil, err
			}
		}
	}
	folderTableEnd := uint64(pos) + uint64(folderCount)*uint64(8+folderReserve)
	if fileOffset < uint32(folderTableEnd) || folderTableEnd > uint64(len(cab)) {
		return nil, fmt.Errorf("%w: invalid CAB folder table offset", ErrInvalid)
	}

	folders := make([]cabFolder, folderCount)
	for i := range folders {
		folders[i] = cabFolder{
			offset:      binary.LittleEndian.Uint32(cab[pos : pos+4]),
			dataBlocks:  binary.LittleEndian.Uint16(cab[pos+4 : pos+6]),
			compression: binary.LittleEndian.Uint16(cab[pos+6 : pos+8]),
		}
		pos += 8 + int(folderReserve)
	}

	if uint64(fileOffset) > uint64(len(cab)) {
		return nil, fmt.Errorf("%w: invalid CAB file table location", ErrInvalid)
	}
	filePos := int(fileOffset)
	files := make([]cabFile, 0, fileCount)
	for i := 0; i < fileCount; i++ {
		if !has(cab, filePos, 16) {
			return nil, fmt.Errorf("%w: truncated CAB file entry", ErrInvalid)
		}
		file := cabFile{
			size:       binary.LittleEndian.Uint32(cab[filePos : filePos+4]),
			folderOff:  binary.LittleEndian.Uint32(cab[filePos+4 : filePos+8]),
			folderID:   binary.LittleEndian.Uint16(cab[filePos+8 : filePos+10]),
			attributes: binary.LittleEndian.Uint16(cab[filePos+14 : filePos+16]),
		}
		filePos += 16
		start := filePos
		for filePos < len(cab) && cab[filePos] != 0 {
			filePos++
		}
		if filePos == len(cab) || filePos == start {
			return nil, fmt.Errorf("%w: invalid CAB member name", ErrInvalid)
		}
		file.name = string(cab[start:filePos])
		filePos++
		if file.folderID >= 0xFFFD || int(file.folderID) >= folderCount {
			return nil, fmt.Errorf("%w: split or continued CAB folders are unsupported", ErrInvalid)
		}
		if _, err := safeName(file.name); err != nil {
			return nil, err
		}
		files = append(files, file)
	}

	folderData := make([][]byte, folderCount)
	for i, folder := range folders {
		expected := uint64(0)
		for _, file := range files {
			if int(file.folderID) == i {
				end := uint64(file.folderOff) + uint64(file.size)
				if end > maxFolderBytes {
					return nil, fmt.Errorf("%w: CAB folder output exceeds size limit", ErrInvalid)
				}
				if end > expected {
					expected = end
				}
			}
		}
		decoded, err := decodeFolder(cab, folder, dataReserve, int(expected))
		if err != nil {
			return nil, fmt.Errorf("fcc: decode CAB folder %d: %w", i, err)
		}
		folderData[i] = decoded
	}

	members := make([]Member, 0, len(files))
	seen := make(map[string]struct{}, len(files))
	for _, file := range files {
		name, _ := safeName(file.name)
		key := strings.ToLower(name)
		if _, exists := seen[key]; exists {
			return nil, fmt.Errorf("%w: duplicate CAB member path %q", ErrInvalid, file.name)
		}
		seen[key] = struct{}{}
		end := uint64(file.folderOff) + uint64(file.size)
		if end > uint64(len(folderData[file.folderID])) {
			return nil, fmt.Errorf("%w: CAB member exceeds decoded folder", ErrInvalid)
		}
		// 目录项不包含文件负载，因此不放入返回结果。
		if file.attributes&0x10 != 0 {
			continue
		}
		body := folderData[file.folderID][file.folderOff:end]
		members = append(members, Member{Name: name, Data: append([]byte(nil), body...)})
	}
	if len(members) == 0 {
		return nil, fmt.Errorf("%w: CAB contains no file members", ErrInvalid)
	}
	return members, nil
}

// decodeFolder 验证各 CFDATA 记录的长度和校验和，再合并连续压缩流。
// 同一文件夹内的记录共享 LZX 字典，不能分别创建解压器。
func decodeFolder(cab []byte, folder cabFolder, dataReserve uint8, expected int) ([]byte, error) {
	if expected > maxFolderBytes || folder.offset > uint32(len(cab)) {
		return nil, fmt.Errorf("%w: folder exceeds limits", ErrInvalid)
	}
	var compressed bytes.Buffer
	var uncompressedTotal uint64
	pos := int(folder.offset)
	for i := 0; i < int(folder.dataBlocks); i++ {
		if !has(cab, pos, 8) {
			return nil, fmt.Errorf("%w: truncated CFDATA header", ErrInvalid)
		}
		checksum := binary.LittleEndian.Uint32(cab[pos : pos+4])
		compressedSize := int(binary.LittleEndian.Uint16(cab[pos+4 : pos+6]))
		uncompressedSize := int(binary.LittleEndian.Uint16(cab[pos+6 : pos+8]))
		uncompressedTotal += uint64(uncompressedSize)
		if uncompressedTotal > maxFolderBytes {
			return nil, fmt.Errorf("%w: CAB folder output exceeds size limit", ErrInvalid)
		}
		start := pos + 8 + int(dataReserve)
		end := start + compressedSize
		if end < start || end > len(cab) || uncompressedSize > 32768 {
			return nil, fmt.Errorf("%w: CFDATA bounds invalid", ErrInvalid)
		}
		record := cab[pos+4 : pos+8]
		calculated := cabChecksum(cab[start:end], cabChecksum(record, 0))
		if checksum != 0 && calculated != checksum {
			return nil, fmt.Errorf("%w: CFDATA checksum mismatch", ErrInvalid)
		}
		compressed.Write(cab[start:end])
		pos = end
	}
	if uint64(expected) > uncompressedTotal {
		return nil, fmt.Errorf("%w: CAB file entries exceed folder data", ErrInvalid)
	}
	outputSize := int(uncompressedTotal)
	compressionType := folder.compression & 0x000F
	switch compressionType {
	case 0: // 未压缩
		output := compressed.Bytes()
		if len(output) != outputSize {
			return nil, fmt.Errorf("%w: stored folder length mismatch", ErrInvalid)
		}
		return append([]byte(nil), output...), nil
	case 3: // LZX 压缩
		windowBits := int(folder.compression >> 8 & 0x001F)
		if windowBits < 15 || windowBits > 21 {
			return nil, fmt.Errorf("%w: unsupported LZX window size %d", ErrInvalid, windowBits)
		}
		// LZX 哈夫曼解码按 16 位预读；在已验证边界的流尾补两个零字节。
		stream := append(compressed.Bytes(), 0, 0)
		reader, err := lzx.NewWithSize(bytes.NewReader(stream), 1<<windowBits, 0, int64(outputSize))
		if err != nil {
			return nil, err
		}
		output := make([]byte, outputSize)
		n, readErr := io.ReadFull(reader, output)
		if n != outputSize {
			return nil, fmt.Errorf("LZX output truncated at %d/%d bytes: %w", n, len(output), readErr)
		}
		// 不额外读取 EOF：CAB 文件夹由 CFDATA 的未压缩长度确定边界。
		return output, nil
	default:
		return nil, fmt.Errorf("%w: CAB compression type %d is unsupported", ErrInvalid, compressionType)
	}
}

// cabChecksum 对完整双字做小端异或，尾部一至三字节按 CAB 的特殊顺序拼接。
func cabChecksum(data []byte, seed uint32) uint32 {
	checksum := seed
	for len(data) >= 4 {
		checksum ^= binary.LittleEndian.Uint32(data[:4])
		data = data[4:]
	}
	if len(data) != 0 {
		var tail uint32
		for _, value := range data {
			tail = tail<<8 | uint32(value)
		}
		checksum ^= tail
	}
	return checksum
}

// safeName 拒绝绝对路径、上级目录和 Windows 路径歧义，避免成员名越过提取目录。
func safeName(name string) (string, error) {
	name = strings.ReplaceAll(name, "\\", "/")
	if name == "" || strings.HasPrefix(name, "/") || strings.ContainsRune(name, 0) || strings.Contains(name, ":") {
		return "", fmt.Errorf("%w: unsafe CAB member path %q", ErrInvalid, name)
	}
	for _, part := range strings.Split(name, "/") {
		if part == "" || part == "." || part == ".." || strings.HasSuffix(part, ".") || strings.HasSuffix(part, " ") {
			return "", fmt.Errorf("%w: unsafe CAB member path %q", ErrInvalid, name)
		}
	}
	clean := path.Clean(name)
	if clean == "." || clean != name {
		return "", fmt.Errorf("%w: unsafe CAB member path %q", ErrInvalid, name)
	}
	return clean, nil
}

// skipCString 跳过 CAB 头中的零结尾字符串，并拒绝缺少终止符的输入。
func skipCString(data []byte, pos int) (int, error) {
	if pos >= len(data) {
		return pos, fmt.Errorf("%w: truncated CAB string", ErrInvalid)
	}
	for pos < len(data) && data[pos] != 0 {
		pos++
	}
	if pos == len(data) {
		return pos, fmt.Errorf("%w: unterminated CAB string", ErrInvalid)
	}
	return pos + 1, nil
}

func has(data []byte, offset, size int) bool {
	return offset >= 0 && size >= 0 && offset <= len(data)-size
}

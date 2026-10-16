package objsys

import (
	"bytes"
	"debug/pe"
	"encoding/binary"
	"fmt"
	"math"
	"unicode/utf16"
)

const (
	peResourceDirectoryIndex = 2
	peResourceNameFlag       = uint32(0x80000000)
	peResourceOffsetMask     = uint32(0x7fffffff)
	peResourceHeaderSize     = uint32(16)
	peResourceEntrySize      = uint32(8)
)

type peResourceReader struct {
	data      []byte
	sections  []*pe.Section
	directory pe.DataDirectory
}

type peResourceEntry struct {
	name   uint32
	target uint32
}

func readPEResource(data []byte, resourceType string, resourceName string, language uint32) ([]byte, error) {
	file, err := pe.NewFile(bytes.NewReader(data))
	if err != nil {
		return nil, fmt.Errorf("解析 PE 文件失败：%w", err)
	}
	directory, ok := resourceDataDirectory(file.OptionalHeader)
	if !ok || directory.VirtualAddress == 0 || directory.Size == 0 {
		return nil, fmt.Errorf("PE 文件没有资源目录")
	}
	reader := peResourceReader{
		data:      data,
		sections:  file.Sections,
		directory: directory,
	}

	typeEntry, found, err := reader.findNamedEntry(0, resourceType)
	if err != nil {
		return nil, fmt.Errorf("查找资源类型 %q 失败：%w", resourceType, err)
	}
	if !found {
		return nil, fmt.Errorf("找不到资源类型 %q", resourceType)
	}
	if typeEntry.target&peResourceNameFlag == 0 {
		return nil, fmt.Errorf("资源类型 %q 的目录项格式无效", resourceType)
	}

	nameEntry, found, err := reader.findNamedEntry(typeEntry.target&peResourceOffsetMask, resourceName)
	if err != nil {
		return nil, fmt.Errorf("查找资源名称 %q 失败：%w", resourceName, err)
	}
	if !found {
		return nil, fmt.Errorf("找不到资源名称 %q", resourceName)
	}
	if nameEntry.target&peResourceNameFlag == 0 {
		return nil, fmt.Errorf("资源名称 %q 的目录项格式无效", resourceName)
	}

	languageEntry, found, err := reader.findIDEntry(nameEntry.target&peResourceOffsetMask, language)
	if err != nil {
		return nil, fmt.Errorf("查找资源语言 %d 失败：%w", language, err)
	}
	if !found {
		return nil, fmt.Errorf("找不到资源语言 %d", language)
	}
	if languageEntry.target&peResourceNameFlag != 0 {
		return nil, fmt.Errorf("资源语言 %d 的目录项格式无效", language)
	}

	dataEntry, err := reader.directoryBytes(languageEntry.target, 16)
	if err != nil {
		return nil, fmt.Errorf("读取资源数据项失败：%w", err)
	}
	resourceRVA := binary.LittleEndian.Uint32(dataEntry[0:4])
	resourceSize := binary.LittleEndian.Uint32(dataEntry[4:8])
	offset, err := reader.rvaToFileOffset(resourceRVA, uint64(resourceSize))
	if err != nil {
		return nil, fmt.Errorf("资源数据范围无效：%w", err)
	}
	result := make([]byte, resourceSize)
	copy(result, data[offset:offset+int(resourceSize)])
	return result, nil
}

func resourceDataDirectory(optionalHeader any) (pe.DataDirectory, bool) {
	switch header := optionalHeader.(type) {
	case *pe.OptionalHeader32:
		if header.NumberOfRvaAndSizes <= peResourceDirectoryIndex {
			return pe.DataDirectory{}, false
		}
		return header.DataDirectory[peResourceDirectoryIndex], true
	case *pe.OptionalHeader64:
		if header.NumberOfRvaAndSizes <= peResourceDirectoryIndex {
			return pe.DataDirectory{}, false
		}
		return header.DataDirectory[peResourceDirectoryIndex], true
	default:
		return pe.DataDirectory{}, false
	}
}

func (r *peResourceReader) findNamedEntry(directoryOffset uint32, desired string) (peResourceEntry, bool, error) {
	entries, err := r.directoryEntries(directoryOffset)
	if err != nil {
		return peResourceEntry{}, false, err
	}
	for _, entry := range entries {
		if entry.name&peResourceNameFlag == 0 {
			continue
		}
		name, err := r.readName(entry.name & peResourceOffsetMask)
		if err != nil {
			return peResourceEntry{}, false, err
		}
		if name == desired {
			return entry, true, nil
		}
	}
	return peResourceEntry{}, false, nil
}

func (r *peResourceReader) findIDEntry(directoryOffset uint32, desired uint32) (peResourceEntry, bool, error) {
	entries, err := r.directoryEntries(directoryOffset)
	if err != nil {
		return peResourceEntry{}, false, err
	}
	for _, entry := range entries {
		if entry.name&peResourceNameFlag == 0 && entry.name == desired {
			return entry, true, nil
		}
	}
	return peResourceEntry{}, false, nil
}

func (r *peResourceReader) directoryEntries(directoryOffset uint32) ([]peResourceEntry, error) {
	header, err := r.directoryBytes(directoryOffset, peResourceHeaderSize)
	if err != nil {
		return nil, err
	}
	namedCount := uint64(binary.LittleEndian.Uint16(header[12:14]))
	idCount := uint64(binary.LittleEndian.Uint16(header[14:16]))
	count := namedCount + idCount
	if count > math.MaxUint32/uint64(peResourceEntrySize) {
		return nil, fmt.Errorf("资源目录项数量溢出")
	}
	entriesOffset := uint64(directoryOffset) + uint64(peResourceHeaderSize)
	entriesSize := count * uint64(peResourceEntrySize)
	if entriesOffset > math.MaxUint32 || entriesSize > math.MaxUint32 {
		return nil, fmt.Errorf("资源目录项范围溢出")
	}
	entriesData, err := r.directoryBytes(uint32(entriesOffset), uint32(entriesSize))
	if err != nil {
		return nil, err
	}
	entries := make([]peResourceEntry, count)
	for index := range entries {
		offset := index * int(peResourceEntrySize)
		entries[index] = peResourceEntry{
			name:   binary.LittleEndian.Uint32(entriesData[offset : offset+4]),
			target: binary.LittleEndian.Uint32(entriesData[offset+4 : offset+8]),
		}
	}
	return entries, nil
}

func (r *peResourceReader) readName(nameOffset uint32) (string, error) {
	lengthBytes, err := r.directoryBytes(nameOffset, 2)
	if err != nil {
		return "", err
	}
	length := uint64(binary.LittleEndian.Uint16(lengthBytes))
	if length > math.MaxUint32/2 {
		return "", fmt.Errorf("资源名称长度溢出")
	}
	nameData, err := r.directoryBytes(nameOffset+2, uint32(length*2))
	if err != nil {
		return "", err
	}
	units := make([]uint16, length)
	for index := range units {
		units[index] = binary.LittleEndian.Uint16(nameData[index*2 : index*2+2])
	}
	if !validUTF16(units) {
		return "", fmt.Errorf("资源名称包含无效 UTF-16")
	}
	return string(utf16.Decode(units)), nil
}

func validUTF16(units []uint16) bool {
	for index := 0; index < len(units); index++ {
		unit := units[index]
		switch {
		case unit >= 0xd800 && unit <= 0xdbff:
			if index+1 >= len(units) || units[index+1] < 0xdc00 || units[index+1] > 0xdfff {
				return false
			}
			index++
		case unit >= 0xdc00 && unit <= 0xdfff:
			return false
		}
	}
	return true
}

func (r *peResourceReader) directoryBytes(relativeOffset uint32, size uint32) ([]byte, error) {
	end := uint64(relativeOffset) + uint64(size)
	if end > uint64(r.directory.Size) {
		return nil, fmt.Errorf("资源目录结构超出声明范围")
	}
	rva := uint64(r.directory.VirtualAddress) + uint64(relativeOffset)
	if rva > math.MaxUint32 || uint64(size) > math.MaxUint32-rva {
		return nil, fmt.Errorf("资源目录 RVA 溢出")
	}
	offset, err := r.rvaToFileOffset(uint32(rva), uint64(size))
	if err != nil {
		return nil, err
	}
	return r.data[offset : offset+int(size)], nil
}

func (r *peResourceReader) rvaToFileOffset(rva uint32, size uint64) (int, error) {
	endRVA := uint64(rva) + size
	if endRVA > uint64(math.MaxUint32)+1 {
		return 0, fmt.Errorf("RVA 范围溢出")
	}
	found := -1
	for _, section := range r.sections {
		start := uint64(section.VirtualAddress)
		rawSize := uint64(section.Size)
		if uint64(rva) < start || uint64(rva)-start > rawSize || size > rawSize-(uint64(rva)-start) {
			continue
		}
		offset := uint64(section.Offset) + (uint64(rva) - start)
		if offset > uint64(len(r.data)) || size > uint64(len(r.data))-offset {
			return 0, fmt.Errorf("RVA 映射超出文件范围")
		}
		if found >= 0 {
			return 0, fmt.Errorf("RVA 同时映射到多个节")
		}
		found = int(offset)
	}
	if found < 0 {
		return 0, fmt.Errorf("RVA 不属于任何节的原始数据")
	}
	return found, nil
}

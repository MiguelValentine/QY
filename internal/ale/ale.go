// ale 包解析已确认布局的 ALE v3 容器。
package ale

import (
	"encoding/binary"
	"errors"
	"fmt"
	"math"
)

const (
	maxFileSize  = 512 << 20
	maxDimension = 1 << 15
	maxPixels    = 1 << 28
)

var (
	ErrUnknownFormat = errors.New("ale: 未知文件格式")
	ErrUnsupported   = errors.New("ale: 不支持的版本")
	ErrInvalid       = errors.New("ale: 数据无效")
)

// File 保存 ALE v3 容器头和图像块。帧载荷仍是原始字节，尚未解码。
type File struct {
	Version uint16
	Frames  []Frame
}

// Frame 保存一个帧块的已知元数据及未解释载荷。
type Frame struct {
	Length   uint32
	Reserved uint32
	Width    uint32
	Height   uint32
	OffsetX  int32
	OffsetY  int32
	Payload  []byte
}

// Row 保存 ALE v3 帧载荷中的一条原始编码行记录。
type Row struct {
	SkipHeader uint16
	Header     uint16
	Length     uint16
	Data       []byte
}

// RowTable 保存帧载荷中的前缀字段和编码行记录。
type RowTable struct {
	Header uint16
	Rows   []Row
}

// Sample 保存一列的透明度代表值及可恢复的原始 u16 数据。
type Sample struct {
	Alpha      uint8
	AlphaExact bool
	RawU16     uint16
	HasRawU16  bool
}

// Parse 解析 ALE v3 容器。帧载荷切片引用输入 data，调用方不应修改它。
func Parse(data []byte) (*File, error) {
	if len(data) < 4 || string(data[:4]) != "ALE\x00" {
		return nil, ErrUnknownFormat
	}
	if len(data) < 16 {
		return nil, fmt.Errorf("%w: 文件头被截断", ErrInvalid)
	}
	if len(data) > maxFileSize {
		return nil, fmt.Errorf("%w: 文件超过大小上限", ErrInvalid)
	}

	version := binary.LittleEndian.Uint16(data[4:6])
	if version != 3 {
		return nil, fmt.Errorf("%w: ALE v%d", ErrUnsupported, version)
	}
	blocksLength := binary.LittleEndian.Uint32(data[6:10])
	frameCount := int(binary.LittleEndian.Uint16(data[10:12]))
	if frameCount == 0 {
		return nil, fmt.Errorf("%w: 帧数量为零", ErrInvalid)
	}

	// 长度字段至少4字节，后续已知元数据至少20字节，终止符另占4字节。
	if uint64(blocksLength) > uint64(len(data))-16 {
		return nil, fmt.Errorf("%w: 帧块总长度超出文件边界", ErrInvalid)
	}
	if uint64(blocksLength)+16 != uint64(len(data)) {
		return nil, fmt.Errorf("%w: 帧块总长度与文件长度不符", ErrInvalid)
	}

	frames := make([]Frame, 0, frameCount)
	pos := 12
	blocksEnd := pos + int(blocksLength)
	for i := 0; i < frameCount; i++ {
		if pos > blocksEnd-4 {
			return nil, fmt.Errorf("%w: 第%d帧长度字段被截断", ErrInvalid, i)
		}
		length := binary.LittleEndian.Uint32(data[pos : pos+4])
		if length < 24 {
			return nil, fmt.Errorf("%w: 第%d帧长度小于已知头部", ErrInvalid, i)
		}
		next := uint64(pos) + uint64(length)
		if next > uint64(blocksEnd) || next > math.MaxInt {
			return nil, fmt.Errorf("%w: 第%d帧超出帧块边界", ErrInvalid, i)
		}

		block := data[pos:int(next)]
		width := binary.LittleEndian.Uint32(block[8:12])
		height := binary.LittleEndian.Uint32(block[12:16])
		if width == 0 || height == 0 || width > maxDimension || height > maxDimension ||
			uint64(width)*uint64(height) > maxPixels {
			return nil, fmt.Errorf("%w: 第%d帧尺寸超出支持范围", ErrInvalid, i)
		}
		frames = append(frames, Frame{
			Length:   length,
			Reserved: binary.LittleEndian.Uint32(block[4:8]),
			Width:    width,
			Height:   height,
			OffsetX:  int32(binary.LittleEndian.Uint32(block[16:20])),
			OffsetY:  int32(binary.LittleEndian.Uint32(block[20:24])),
			Payload:  block[24:],
		})
		pos = int(next)
	}
	if pos != blocksEnd {
		return nil, fmt.Errorf("%w: 帧数量与帧块总长度不一致", ErrInvalid)
	}
	if len(data)-pos != 4 || string(data[pos:]) != "END\x00" {
		return nil, fmt.Errorf("%w: 终止标记缺失或文件尾存在多余数据", ErrInvalid)
	}

	return &File{Version: version, Frames: frames}, nil
}

// ParseRows 解析已确认的行记录边界，所有未知字段和编码数据均按原值保留。
// 返回的 Data 切片引用帧载荷，调用方不应修改它。
func (f Frame) ParseRows() (*RowTable, error) {
	if len(f.Payload) < 2 {
		return nil, fmt.Errorf("%w: 行表前缀被截断", ErrInvalid)
	}

	table := &RowTable{
		Header: binary.LittleEndian.Uint16(f.Payload[:2]),
	}
	pos := 2
	rowPosition := uint64(0)
	for pos < len(f.Payload) {
		if len(f.Payload)-pos < 2 {
			return nil, fmt.Errorf("%w: 第%d行字段被截断", ErrInvalid, len(table.Rows))
		}

		row := Row{Header: binary.LittleEndian.Uint16(f.Payload[pos : pos+2])}
		pos += 2
		if int16(row.Header) < 0 {
			row.SkipHeader = row.Header
			skip := uint64(-int32(int16(row.SkipHeader)))
			if rowPosition > uint64(f.Height) || skip > uint64(f.Height)-rowPosition {
				return nil, fmt.Errorf("%w: 第%d行跳过标记超出帧高", ErrInvalid, len(table.Rows))
			}
			rowPosition += skip
			if len(f.Payload)-pos < 2 {
				return nil, fmt.Errorf("%w: 第%d行跳过标记后缺少行字段", ErrInvalid, len(table.Rows))
			}
			row.Header = binary.LittleEndian.Uint16(f.Payload[pos : pos+2])
			pos += 2
		}

		if rowPosition >= uint64(f.Height) {
			return nil, fmt.Errorf("%w: 第%d行超出帧高", ErrInvalid, len(table.Rows))
		}
		if len(f.Payload)-pos < 2 {
			return nil, fmt.Errorf("%w: 第%d行长度字段被截断", ErrInvalid, len(table.Rows))
		}
		row.Length = binary.LittleEndian.Uint16(f.Payload[pos : pos+2])
		pos += 2
		if int(row.Length) > len(f.Payload)-pos {
			return nil, fmt.Errorf("%w: 第%d行数据超出帧载荷", ErrInvalid, len(table.Rows))
		}
		row.Data = f.Payload[pos : pos+int(row.Length)]
		pos += int(row.Length)
		table.Rows = append(table.Rows, row)
		rowPosition++
	}

	return table, nil
}

// DecodeRow 按 FBase 行编码命令解码透明度和原始 u16 数据，不解释其颜色格式。
func DecodeRow(row Row, width uint32) ([]Sample, error) {
	if width > maxDimension {
		return nil, fmt.Errorf("%w: 行宽超出支持范围", ErrInvalid)
	}
	out := make([]Sample, 0, int(width))
	pos := 0
	commands := uint32(0)

	appendRun := func(alpha uint8, exact bool, count uint32) error {
		if count > width-uint32(len(out)) {
			return fmt.Errorf("%w: 解码像素数超出行宽", ErrInvalid)
		}
		for i := uint32(0); i < count; i++ {
			out = append(out, Sample{Alpha: alpha, AlphaExact: exact})
		}
		return nil
	}
	readU16 := func() (uint16, error) {
		if len(row.Data)-pos < 2 {
			return 0, fmt.Errorf("%w: u16 像素数据被截断", ErrInvalid)
		}
		value := binary.LittleEndian.Uint16(row.Data[pos : pos+2])
		pos += 2
		return value, nil
	}

	for pos < len(row.Data) {
		transparent := uint32(0)
		for {
			if pos >= len(row.Data) {
				if commands == uint32(row.Header) {
					break
				}
				return nil, fmt.Errorf("%w: 透明度计数被截断", ErrInvalid)
			}
			count := row.Data[pos]
			pos++
			if count != 0xff {
				transparent += uint32(count)
				break
			}
			if pos >= len(row.Data) || row.Data[pos] != 0 {
				return nil, fmt.Errorf("%w: 透明度扩展命令无效", ErrInvalid)
			}
			pos++
			transparent += 0xff
			commands++
		}
		if err := appendRun(0, false, transparent); err != nil {
			return nil, err
		}
		if pos == len(row.Data) {
			break
		}
		if commands > uint32(row.Header) {
			return nil, fmt.Errorf("%w: 命令数量超过行头声明", ErrInvalid)
		}

		command := row.Data[pos]
		pos++
		switch {
		case command >= 0xa0 && command <= 0xbf:
			count := uint32(command & 0x1f)
			if err := appendRun(0x11, true, count); err != nil {
				return nil, err
			}
			commands++
		case command >= 0xc0 && command <= 0xfe:
			for {
				alpha := (command & 0x1f) << 3
				value, err := readU16()
				if err != nil {
					return nil, err
				}
				if uint32(len(out)) >= width {
					return nil, fmt.Errorf("%w: 解码像素数超出行宽", ErrInvalid)
				}
				out = append(out, Sample{Alpha: alpha, RawU16: value, HasRawU16: true})
				if command <= 0xdf {
					break
				}
				if pos >= len(row.Data) {
					return nil, fmt.Errorf("%w: 连续像素命令缺少结束标记", ErrInvalid)
				}
				command = row.Data[pos]
				pos++
				if command < 0xc0 || command > 0xfe {
					return nil, fmt.Errorf("%w: 像素命令类型无效", ErrInvalid)
				}
			}
			commands++
		case command >= 1 && command <= 0x7f:
			count := uint32(command)
			if count > width-uint32(len(out)) {
				return nil, fmt.Errorf("%w: 不透明度段超出行宽", ErrInvalid)
			}
			for i := uint32(0); i < count; i++ {
				value, err := readU16()
				if err != nil {
					return nil, err
				}
				out = append(out, Sample{Alpha: 0xff, RawU16: value, HasRawU16: true})
			}
			commands++
			for count == 0x7f && len(row.Data)-pos >= 2 &&
				row.Data[pos] == 0 && row.Data[pos+1] <= 0x7f &&
				len(row.Data)-pos-2 >= int(row.Data[pos+1])*2 {
				pos++
				if pos >= len(row.Data) {
					return nil, fmt.Errorf("%w: 不透明度分块缺少尾段计数", ErrInvalid)
				}
				count = uint32(row.Data[pos])
				pos++
				if count > width-uint32(len(out)) {
					return nil, fmt.Errorf("%w: 不透明度段超出行宽", ErrInvalid)
				}
				for i := uint32(0); i < count; i++ {
					value, err := readU16()
					if err != nil {
						return nil, err
					}
					out = append(out, Sample{Alpha: 0xff, RawU16: value, HasRawU16: true})
				}
				commands++
			}
		default:
			return nil, fmt.Errorf("%w: 未知像素命令 %#02x", ErrInvalid, command)
		}
	}

	if commands != uint32(row.Header) {
		return nil, fmt.Errorf("%w: 命令数量与行头不符", ErrInvalid)
	}
	if pos != len(row.Data) {
		return nil, fmt.Errorf("%w: 行命令后存在多余数据", ErrInvalid)
	}
	if uint32(len(out)) < width {
		if err := appendRun(0, false, width-uint32(len(out))); err != nil {
			return nil, err
		}
	}
	return out, nil
}

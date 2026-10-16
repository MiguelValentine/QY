package lzx

import (
	"encoding/binary"
	"fmt"
	"io"

	"github.com/NextronSystems/lzx/internal/bitstream"
	"github.com/NextronSystems/lzx/internal/slidingwindow"
)

type persistentData struct {
	// Window 保存 LZX 解压过程中不断更新的滑动窗口。
	Window *slidingwindow.SlidingWindow
	// R0、R1、R2 保存最近三次匹配使用的偏移。
	R0, R1, R2 uint32

	// IntelStarted 表示是否启用 Intel E8 指令地址转换。
	IntelStarted bool
	// IntelFileSize 是 Intel E8 转换使用的原始文件大小。
	IntelFileSize uint32
	// IntelCursorPosition 是 Intel E8 转换在输出流中的当前位置。
	IntelCursorPosition int

	// ResetInterval 指定位流的重置间隔；为 0 时不按此间隔重置。
	ResetInterval int

	// 两个切片分别保存主树和长度树的码长，新块以增量方式更新它们。
	MainTreeLengths      []byte
	SecondaryTreeLengths []byte

	// ProcessedBytes 统计已解压字节数，用于重置间隔和 32 KiB 帧边界判断。
	ProcessedBytes int
	// 未压缩块长度为奇数时，下一个块头前还有一个填充字节。
	uncompressedPadding bool
}

func readBlockHeader(stream *bitstream.BitStream, data *persistentData) (io.Reader, error) {
	if data.uncompressedPadding {
		var padding [1]byte
		if _, err := io.ReadFull(stream.Internal, padding[:]); err != nil {
			return nil, err
		}
		data.uncompressedPadding = false
	}
	// 读取下一个压缩块的头部。
	blockType, err := stream.ReadBits(3)
	if err != nil {
		return nil, err
	}
	currentBlockType := blocktype(blockType)
	uncompressedBlockSize, err := stream.ReadBits(24)
	if err != nil {
		return nil, err
	}

	var blockReader io.Reader

	switch currentBlockType {
	case uncompressed:
		// 原始块头要求丢弃 1 至 16 位，已经对齐时也要消耗一个完整字。
		paddingBits := stream.BitsLeft()
		if paddingBits == 0 {
			paddingBits = 16
		}
		if _, err := stream.ReadBits(paddingBits); err != nil {
			return nil, err
		}
		var r0, r1, r2 uint32
		if err := binary.Read(stream.Internal, binary.LittleEndian, &r0); err != nil {
			return nil, err
		}
		if err := binary.Read(stream.Internal, binary.LittleEndian, &r1); err != nil {
			return nil, err
		}
		if err := binary.Read(stream.Internal, binary.LittleEndian, &r2); err != nil {
			return nil, err
		}
		blockReader = &uncompressedReader{
			Reader:         stream.Internal,
			persistentData: data,
		}
		data.R0, data.R1, data.R2 = r0, r1, r2
		data.IntelStarted = true
		data.uncompressedPadding = uncompressedBlockSize&1 != 0
	case aligned, verbatim:
		compressed := compressedReader{
			Reader:         stream,
			persistentData: data,
		}
		if currentBlockType == aligned {
			alignedTree, err := readTree(stream, alignedTreeLengthSize, alignedTreeSize)
			if err != nil {
				return nil, err
			}
			compressed.alignedTree = *alignedTree
		}
		windowBits := 0
		size := data.Window.Size()
		for size > 1 {
			windowBits++
			size = size >> 1
		}
		if data.MainTreeLengths == nil {
			data.MainTreeLengths = make([]byte, mainTreeSize)
		}
		mainTree, err := buildTree(stream, data.MainTreeLengths, []interval{{0, numChars}, {numChars, numChars + int64(positionSlots[windowBits-15])<<3}}, false)
		if err != nil {
			return nil, err
		}
		compressed.mainTree = *mainTree
		if compressed.mainTree.PathLengths[0xE8] != 0 {
			data.IntelStarted = true
		}

		if data.SecondaryTreeLengths == nil {
			data.SecondaryTreeLengths = make([]byte, secondaryNumElements)
		}
		lengthTree, err := buildTree(stream, data.SecondaryTreeLengths, []interval{{0, secondaryNumElements}}, true)
		if err != nil {
			return nil, err
		}
		compressed.lengthTree = *lengthTree
		blockReader = &compressed
	default:
		return nil, fmt.Errorf("invalid block type %d", blockType)
	}
	return io.LimitReader(expectNoEofReader{blockReader}, uncompressedBlockSize), nil
}

type expectNoEofReader struct {
	Internal io.Reader
}

func (e expectNoEofReader) Read(d []byte) (int, error) {
	n, err := e.Internal.Read(d)
	if err == io.EOF {
		err = io.ErrUnexpectedEOF
	}
	return n, err
}

type uncompressedReader struct {
	Reader io.Reader

	*persistentData
}

func (u uncompressedReader) Read(p []byte) (n int, err error) {
	n, err = u.Reader.Read(p)
	// 后续压缩块可以引用原始块中的数据，必须维护同一份字典和帧计数。
	for _, value := range p[:n] {
		u.Window.Add(value)
	}
	u.ProcessedBytes += n
	return n, err
}

type compressedReader struct {
	Reader *bitstream.BitStream

	mainTree    Tree
	lengthTree  Tree
	alignedTree Tree

	remainingBytes int

	*persistentData
}

const frameSize = 0x8000

func (c *compressedReader) Read(data []byte) (n int, err error) {
	for n < len(data) {
		if c.remainingBytes == 0 {
			if c.ProcessedBytes != 0 && ((c.ResetInterval > 0 && c.ProcessedBytes%c.ResetInterval == 0) || c.ProcessedBytes%frameSize == 0) {
				c.Reader.Align()
			}
			c.remainingBytes, err = c.ReadElement()
			if err != nil {
				return n, err
			}
		}
		for c.remainingBytes > 0 && n < len(data) {
			data[n], err = c.Window.Lookback(c.remainingBytes)
			if err != nil {
				return n, err
			}
			c.remainingBytes--
			c.ProcessedBytes++
			n++
		}
	}
	return n, nil
}

func (c *compressedReader) ReadElement() (n int, err error) {
	mainElement, err := c.mainTree.Decode(c.Reader)
	if err != nil {
		return n, err
	}
	if mainElement < numChars {
		c.Window.Add(uint8(mainElement))
		n++
		return n, nil
	}
	mainElement -= numChars
	matchLength := mainElement & numPrimaryLengths
	if matchLength == numPrimaryLengths {
		encodedLength, err := c.lengthTree.Decode(c.Reader)
		if err != nil {
			return n, err
		}
		matchLength += encodedLength
	}
	matchLength += minMatch

	positionSlot := mainElement >> 3
	var matchOffset uint32
	switch positionSlot {
	case 0:
		matchOffset = c.R0
	case 1:
		matchOffset = c.R1
		c.R0, c.R1 = c.R1, c.R0
	case 2:
		matchOffset = c.R2
		c.R0, c.R2 = c.R2, c.R0
	default: // 此分支使用新偏移，而非重复最近的偏移。
		var (
			verbatimBits int64
			alignedBits  uint16
		)
		var extra int
		if int(positionSlot) >= len(extraBits) {
			extra = extraBitsMax
		} else {
			extra = extraBits[positionSlot]
		}
		switch {
		case extra >= 3 && c.alignedTree.MaxDepth > 0: // 存在对齐树编码的位。
			verbatimBits, err = c.Reader.ReadBits(extra - 3)
			if err != nil {
				return n, err
			}
			alignedBits, err = c.alignedTree.Decode(c.Reader)
			if err != nil {
				return n, err
			}
			verbatimBits = verbatimBits << 3
		case extra > 0: // 只包含直接编码的位。
			verbatimBits, err = c.Reader.ReadBits(extra)
			if err != nil {
				return n, err
			}
		default: // 没有直接编码的附加位。
		}
		matchOffset = positionBase[positionSlot] + uint32(verbatimBits) + uint32(alignedBits) - 2
		c.R0, c.R1, c.R2 = matchOffset, c.R0, c.R1
	}
	for matchLength > 0 {
		lookbackByte, err := c.Window.Lookback(int(matchOffset))
		if err != nil {
			return n, err
		}
		c.Window.Add(lookbackByte)
		matchLength--
		n++
	}
	return n, nil
}

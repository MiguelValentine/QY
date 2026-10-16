package lzx

import (
	"errors"
	"math"

	"github.com/NextronSystems/lzx/internal/bitstream"
)

func readTree(stream *bitstream.BitStream, lengthBits int, size int) (*Tree, error) {
	var lengths = make([]byte, size)
	for i := 0; i < len(lengths); i++ {
		treeEntry, err := stream.ReadBits(lengthBits)
		if err != nil {
			return nil, err
		}
		lengths[i] = uint8(treeEntry)
	}

	return buildTable(lengths, false)
}

func buildTable(lengths []byte, allowEmpty bool) (*Tree, error) {
	if len(lengths) > math.MaxUint16 {
		return nil, errors.New("too many codes")
	}

	var maxLength byte
	for _, length := range lengths {
		if length > maxLength {
			maxLength = length
		}
	}

	// 合理性检查：码长必须能构成有效的树。
	// CAB 允许没有长匹配的块携带空长度树；主树和预树仍须有效。
	if maxLength == 0 && allowEmpty {
		return &Tree{PathLengths: lengths}, nil
	}
	err := verifyLengthsMatch(lengths, maxLength)
	if err != nil {
		return nil, err
	}

	huffmanTree := make([]uint16, 1<<maxLength)
	position := 0

	for bit := uint8(1); bit <= maxLength; bit++ {
		amount := 1 << (maxLength - bit)
		for code := uint16(0); code < uint16(len(lengths)); code++ {
			if lengths[code] == bit {
				for j := 0; j < amount; j++ {
					if position >= len(huffmanTree) {
						return nil, errors.New("bad tree")
					}
					huffmanTree[position] = code
					position++
				}
			}
		}
	}
	if position != len(huffmanTree) {
		return nil, errors.New("bad tree")
	}

	return &Tree{
		PathLengths: lengths,
		HuffmanTree: huffmanTree,
		MaxDepth:    int(maxLength),
	}, nil
}

// verifyLengthsMatch 检查给定码长能否构成有效的前缀无歧义编码。
// 例如，最大码长为 4 时，4、4、3、2、1 可以是有效码长。
// 所有码长对应的路径必须构成一棵有效的树，即所有 2^(maxLength - length)
// 之和必须等于 2^maxLength。
func verifyLengthsMatch(lengths []byte, maxLength byte) error {
	code := 0
	for _, cl := range lengths {
		if cl > 0 {
			code += 1 << (maxLength - cl)
		}
	}

	if code != 1<<maxLength {
		return errors.New("invalid tree lengths")
	}
	return nil
}

type Tree struct {
	PathLengths []byte
	MaxDepth    int
	HuffmanTree []uint16
}

func (t Tree) Decode(stream *bitstream.BitStream) (uint16, error) {
	if t.MaxDepth == 0 {
		return 0, errors.New("attempted to decode an empty Huffman tree")
	}
	// 最多只需读取与最大深度相同数量的位，即可确定编码。
	nextBits, err := stream.PeekBits(t.MaxDepth)
	if err != nil {
		return 0, err
	}
	code := t.HuffmanTree[nextBits]
	// 编码实际占用的位数由 t.PathLengths[code] 给出。
	// 消耗这些位；PeekBits 已读取过它们，因此忽略返回值。
	_, _ = stream.ReadBits(int(t.PathLengths[code]))
	return code, nil
}

type interval struct {
	from int64
	last int64
}

func buildTree(stream *bitstream.BitStream, lengths []byte, intervals []interval, allowEmpty bool) (*Tree, error) {
	for _, interval := range intervals {
		preTree, err := readTree(stream, 4, preTreeSize)
		if err != nil {
			return nil, err
		}
		for i := interval.from; i < interval.last; {
			k, err := preTree.Decode(stream)
			if err != nil {
				return nil, err
			}
			switch k {
			case 17, 18:
				var j int64
				if k == 17 {
					j, err = stream.ReadBits(4)
					if err != nil {
						return nil, err
					}
					j += 4
				} else {
					j, err = stream.ReadBits(5)
					if err != nil {
						return nil, err
					}
					j += 20

				}
				if i+j >= interval.last {
					j = interval.last - i
				}
				for ; j > 0; j-- {
					lengths[i] = 0
					i++
				}
			case 19:
				j, err := stream.ReadBits(1)
				if err != nil {
					return nil, err
				}
				j += 4
				if i+j >= interval.last {
					j = interval.last - i
				}
				k, err := preTree.Decode(stream)
				if err != nil {
					return nil, err
				}
				m := (uint16(lengths[i]) - k + 17) % 17
				for ; j > 0; j-- {
					lengths[i] = uint8(m)
					i++
				}
			default:
				lengths[i] = uint8((uint16(lengths[i]) - k + 17) % 17)
				i++
			}
		}
	}
	return buildTable(lengths, allowEmpty)
}

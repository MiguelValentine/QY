package fcc

import (
	"bytes"
	"encoding/binary"
	"encoding/json"
	"fmt"
	"io"
	"os"
	"path/filepath"
	"testing"

	"github.com/NextronSystems/lzx"
)

func TestLZXReadBufferSizesPreserveCABOutput(t *testing.T) {
	root := filepath.Clean(filepath.Join("..", ".."))
	manifestData, err := os.ReadFile(filepath.Join(root, "analysis/evidence/decode-verification.json"))
	if err != nil {
		t.Fatal(err)
	}
	var manifest verificationManifest
	if err := json.Unmarshal(manifestData, &manifest); err != nil {
		t.Fatal(err)
	}

	for _, sourceName := range []string{"map/dk2_01.fcc", "map/park_in.fcc"} {
		sourceName := sourceName
		t.Run(sourceName, func(t *testing.T) {
			source, err := os.ReadFile(filepath.Join(root, "CLIENT", filepath.FromSlash(sourceName)))
			if err != nil {
				t.Fatal(err)
			}
			cab, kind, err := Decode(source)
			if err != nil {
				t.Fatal(err)
			}
			if kind != KindXY20CAB {
				t.Fatalf("Decode 格式 = %q，期望 %q", kind, KindXY20CAB)
			}

			stream, outputSize, windowBits, err := lzxFolderStream(cab)
			if err != nil {
				t.Fatal(err)
			}
			expectedPath, err := decodedOutputPath(manifest, sourceName)
			if err != nil {
				t.Fatal(err)
			}
			expected, err := os.ReadFile(filepath.Join(root, filepath.FromSlash(expectedPath)))
			if err != nil {
				t.Fatal(err)
			}
			if len(expected) != outputSize {
				t.Fatalf("参考输出长度 = %d，CAB 文件夹长度 = %d", len(expected), outputSize)
			}

			for _, bufferSize := range []int{1, 3, 4096, 32768} {
				t.Run(fmt.Sprintf("读取缓冲区_%d", bufferSize), func(t *testing.T) {
					reader, err := lzx.NewWithSize(
						bytes.NewReader(stream),
						1<<windowBits,
						0,
						int64(outputSize),
					)
					if err != nil {
						t.Fatal(err)
					}
					got := make([]byte, outputSize)
					if _, err := io.ReadFull(&sizedReader{reader: reader, size: bufferSize}, got); err != nil {
						t.Fatalf("LZX 输出被截断: %v", err)
					}
					if !bytes.Equal(got, expected) {
						t.Fatalf("LZX 输出与参考 tmp.cod 不一致，缓冲区=%d，SHA256=%s", bufferSize, digest(got))
					}
				})
			}
		})
	}
}

type sizedReader struct {
	reader io.Reader
	size   int
}

func (r *sizedReader) Read(data []byte) (int, error) {
	if len(data) > r.size {
		data = data[:r.size]
	}
	return r.reader.Read(data)
}

func lzxFolderStream(cab []byte) ([]byte, int, int, error) {
	if len(cab) < 36 || string(cab[:4]) != "MSCF" {
		return nil, 0, 0, fmt.Errorf("CAB 头无效")
	}
	folderCount := int(binary.LittleEndian.Uint16(cab[26:28]))
	flags := binary.LittleEndian.Uint16(cab[30:32])
	if folderCount != 1 {
		return nil, 0, 0, fmt.Errorf("folder 数量为 %d，期望 1", folderCount)
	}
	pos := 36
	var folderReserve, dataReserve uint8
	if flags&0x0004 != 0 {
		if len(cab)-pos < 4 {
			return nil, 0, 0, fmt.Errorf("CAB 保留区头被截断")
		}
		headerReserve := int(binary.LittleEndian.Uint16(cab[pos : pos+2]))
		folderReserve, dataReserve = cab[pos+2], cab[pos+3]
		pos += 4 + headerReserve
	}
	for _, flag := range []uint16{0x0001, 0x0002} {
		if flags&flag == 0 {
			continue
		}
		for i := 0; i < 2; i++ {
			if pos >= len(cab) {
				return nil, 0, 0, fmt.Errorf("CAB 字符串被截断")
			}
			for pos < len(cab) && cab[pos] != 0 {
				pos++
			}
			if pos == len(cab) {
				return nil, 0, 0, fmt.Errorf("CAB 字符串缺少结束符")
			}
			pos++
		}
	}
	if pos+8+int(folderReserve) > len(cab) {
		return nil, 0, 0, fmt.Errorf("CAB folder 表被截断")
	}
	dataOffset := int(binary.LittleEndian.Uint32(cab[pos : pos+4]))
	blockCount := int(binary.LittleEndian.Uint16(cab[pos+4 : pos+6]))
	compression := binary.LittleEndian.Uint16(cab[pos+6 : pos+8])
	if compression&0x000F != 3 {
		return nil, 0, 0, fmt.Errorf("CAB 压缩类型为 %d，期望 LZX", compression&0x000F)
	}
	windowBits := int(compression>>8) & 0x001F
	if windowBits < 15 || windowBits > 21 {
		return nil, 0, 0, fmt.Errorf("LZX 窗口位数无效: %d", windowBits)
	}

	var stream bytes.Buffer
	outputSize := 0
	for block := 0; block < blockCount; block++ {
		if dataOffset < 0 || dataOffset+8 > len(cab) {
			return nil, 0, 0, fmt.Errorf("CFDATA 头被截断")
		}
		compressedSize := int(binary.LittleEndian.Uint16(cab[dataOffset+4 : dataOffset+6]))
		uncompressedSize := int(binary.LittleEndian.Uint16(cab[dataOffset+6 : dataOffset+8]))
		start := dataOffset + 8 + int(dataReserve)
		end := start + compressedSize
		if start < dataOffset || end < start || end > len(cab) {
			return nil, 0, 0, fmt.Errorf("CFDATA 数据越界")
		}
		stream.Write(cab[start:end])
		outputSize += uncompressedSize
		dataOffset = end
	}
	// LZX 哈夫曼解码器会按 16 位预读，末尾补零不属于压缩负载。
	stream.Write([]byte{0, 0})
	return stream.Bytes(), outputSize, windowBits, nil
}

func decodedOutputPath(manifest verificationManifest, source string) (string, error) {
	for _, entry := range manifest.Entries {
		if entry.Source == source {
			if len(entry.Outputs) != 1 {
				return "", fmt.Errorf("参考输出数量为 %d，期望 1", len(entry.Outputs))
			}
			return entry.Outputs[0].Path, nil
		}
	}
	return "", fmt.Errorf("参考清单中没有 %q", source)
}

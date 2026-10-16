package ale

import (
	"bytes"
	"encoding/binary"
	"encoding/hex"
	"encoding/json"
	"errors"
	"os"
	"path/filepath"
	"testing"
)

func TestParseClientSamples(t *testing.T) {
	root := filepath.Clean(filepath.Join("..", ".."))
	tests := []struct {
		path       string
		frames     []Frame
		blocksSize uint32
	}{
		{
			path:       "CLIENT/act/img/bullet/bullet.ale",
			blocksSize: 418,
			frames: []Frame{
				{Length: 209, Reserved: 0, Width: 7, Height: 7, OffsetX: 0, OffsetY: 0},
				{Length: 209, Reserved: 0, Width: 7, Height: 7, OffsetX: 0, OffsetY: 0},
			},
		},
		{
			path:       "CLIENT/bout/pool/snooker/img/maxpos.ale",
			blocksSize: 252,
			frames: []Frame{
				{Length: 252, Reserved: 0, Width: 8, Height: 8, OffsetX: -3, OffsetY: -2},
			},
		},
		{
			path:       "CLIENT/act/snow/img/ui/man_01.ale",
			blocksSize: 3510,
			frames: []Frame{
				{Length: 3510, Reserved: 0, Width: 62, Height: 28, OffsetX: 0, OffsetY: 0},
			},
		},
	}

	for _, test := range tests {
		test := test
		t.Run(test.path, func(t *testing.T) {
			data, err := os.ReadFile(filepath.Join(root, filepath.FromSlash(test.path)))
			if err != nil {
				t.Fatal(err)
			}
			file, err := Parse(data)
			if err != nil {
				t.Fatal(err)
			}
			if file.Version != 3 || len(file.Frames) != len(test.frames) {
				t.Fatalf("版本/帧数 = %d/%d，期望 3/%d", file.Version, len(file.Frames), len(test.frames))
			}
			if got := binary.LittleEndian.Uint32(data[6:10]); got != test.blocksSize {
				t.Fatalf("帧块总长度 = %d，期望 %d", got, test.blocksSize)
			}
			for i, want := range test.frames {
				got := file.Frames[i]
				if got.Length != want.Length || got.Reserved != want.Reserved ||
					got.Width != want.Width || got.Height != want.Height ||
					got.OffsetX != want.OffsetX || got.OffsetY != want.OffsetY {
					t.Errorf("第%d帧 = %+v，期望 %+v", i, got, want)
				}
				if len(got.Payload) != int(got.Length)-24 {
					t.Errorf("第%d帧载荷长度 = %d，期望 %d", i, len(got.Payload), got.Length-24)
				}
			}
		})
	}
}

func TestParseRowsClientSamples(t *testing.T) {
	root := filepath.Clean(filepath.Join("..", ".."))
	bulletHeaders := []uint16{2, 1, 3, 3, 3, 1, 1}
	bulletLengths := []uint16{23, 22, 22, 22, 22, 22, 22}
	maxposHeaders := []uint16{1, 3, 3, 3, 3, 1, 1, 2}
	maxposLengths := []uint16{22, 24, 24, 24, 24, 25, 25, 26}
	manLengths := make([]uint16, 28)
	for i := range manLengths {
		manLengths[i] = 126
		if i >= 16 {
			manLengths[i] = uint16(126 - (i-15)*2)
		}
	}

	tests := []struct {
		path       string
		frameCount int
		headers    []uint16
		lengths    []uint16
		prefix     uint16
	}{
		{
			path:       "CLIENT/act/img/bullet/bullet.ale",
			frameCount: 2,
			headers:    bulletHeaders,
			lengths:    bulletLengths,
			prefix:     7,
		},
		{
			path:       "CLIENT/bout/pool/snooker/img/maxpos.ale",
			frameCount: 1,
			headers:    maxposHeaders,
			lengths:    maxposLengths,
			prefix:     8,
		},
		{
			path:       "CLIENT/act/snow/img/ui/man_01.ale",
			frameCount: 1,
			headers:    make([]uint16, 28),
			lengths:    manLengths,
			prefix:     28,
		},
	}
	for i := range tests[2].headers {
		tests[2].headers[i] = 1
	}

	for _, test := range tests {
		test := test
		t.Run(test.path, func(t *testing.T) {
			data, err := os.ReadFile(filepath.Join(root, filepath.FromSlash(test.path)))
			if err != nil {
				t.Fatal(err)
			}
			file, err := Parse(data)
			if err != nil {
				t.Fatal(err)
			}
			if len(file.Frames) != test.frameCount {
				t.Fatalf("帧数 = %d，期望 %d", len(file.Frames), test.frameCount)
			}
			for frameIndex, frame := range file.Frames {
				table, err := frame.ParseRows()
				if err != nil {
					t.Fatalf("第%d帧行表解析失败：%v", frameIndex, err)
				}
				if table.Header != test.prefix || len(table.Rows) != len(test.headers) {
					t.Fatalf("第%d帧行表前缀/行数 = %d/%d，期望 %d/%d",
						frameIndex, table.Header, len(table.Rows), test.prefix, len(test.headers))
				}
				for rowIndex, row := range table.Rows {
					if row.SkipHeader != 0 || row.Header != test.headers[rowIndex] ||
						row.Length != test.lengths[rowIndex] || len(row.Data) != int(row.Length) {
						t.Errorf("第%d帧第%d行 = %+v，期望头/长度 %d/%d",
							frameIndex, rowIndex, row, test.headers[rowIndex], test.lengths[rowIndex])
					}
					if len(row.Data) > 0 && &row.Data[0] != &frame.Payload[2] {
						offset := 2
						for i := 0; i < rowIndex; i++ {
							offset += 4 + int(table.Rows[i].Length)
						}
						if &row.Data[0] != &frame.Payload[offset+4] {
							t.Errorf("第%d帧第%d行数据未保留原载荷切片", frameIndex, rowIndex)
						}
					}
				}
			}
		})
	}
}

func TestDecodeRowsClientSamples(t *testing.T) {
	root := filepath.Clean(filepath.Join("..", ".."))
	for _, path := range []string{
		"CLIENT/act/img/bullet/bullet.ale",
		"CLIENT/bout/pool/snooker/img/maxpos.ale",
		"CLIENT/act/snow/img/ui/man_01.ale",
	} {
		t.Run(path, func(t *testing.T) {
			data, err := os.ReadFile(filepath.Join(root, filepath.FromSlash(path)))
			if err != nil {
				t.Fatal(err)
			}
			file, err := Parse(data)
			if err != nil {
				t.Fatal(err)
			}
			for frameIndex, frame := range file.Frames {
				table, err := frame.ParseRows()
				if err != nil {
					t.Fatal(err)
				}
				for rowIndex, row := range table.Rows {
					samples, err := DecodeRow(row, frame.Width)
					if err != nil {
						t.Errorf("第%d帧第%d行解码失败：%v", frameIndex, rowIndex, err)
						continue
					}
					if len(samples) != int(frame.Width) {
						t.Errorf("第%d帧第%d行像素数 = %d，期望 %d",
							frameIndex, rowIndex, len(samples), frame.Width)
					}
				}
			}
		})
	}
}

func TestDecodeRowCommands(t *testing.T) {
	tests := []struct {
		name  string
		row   Row
		width uint32
		check func(*testing.T, []Sample)
	}{
		{
			name:  "普通量化透明度与原始u16",
			row:   Row{Header: 1, Data: []byte{0, 0xe1, 0x34, 0x12, 0xc2, 0x78, 0x56}},
			width: 3,
			check: func(t *testing.T, got []Sample) {
				if got[0] != (Sample{Alpha: 8, RawU16: 0x1234, HasRawU16: true}) ||
					got[1] != (Sample{Alpha: 16, RawU16: 0x5678, HasRawU16: true}) ||
					got[2] != (Sample{Alpha: 0, AlphaExact: false}) {
					t.Fatalf("样本 = %+v", got)
				}
			},
		},
		{
			name:  "精确特殊透明度",
			row:   Row{Header: 1, Data: []byte{0, 0xa3}},
			width: 4,
			check: func(t *testing.T, got []Sample) {
				for i := 0; i < 3; i++ {
					if got[i] != (Sample{Alpha: 0x11, AlphaExact: true}) {
						t.Fatalf("特殊样本[%d] = %+v", i, got[i])
					}
				}
				if got[3] != (Sample{Alpha: 0, AlphaExact: false}) {
					t.Fatalf("行尾补齐样本 = %+v", got[3])
				}
			},
		},
		{
			name: "长透明段扩展",
			row: Row{Header: 3, Data: []byte{
				0xff, 0, 0xff, 0, 1, 1, 0x34, 0x12,
			}},
			width: 512,
			check: func(t *testing.T, got []Sample) {
				for i := 0; i < 511; i++ {
					if got[i].Alpha != 0 || got[i].AlphaExact {
						t.Fatalf("透明样本[%d] = %+v", i, got[i])
					}
				}
				if got[511] != (Sample{Alpha: 0xff, RawU16: 0x1234, HasRawU16: true}) {
					t.Fatalf("末尾样本 = %+v", got[511])
				}
			},
		},
		{
			name: "长不透明段分块",
			row: Row{Header: 2, Data: func() []byte {
				data := []byte{0, 0x7f}
				for i := 0; i < 127; i++ {
					data = append(data, byte(i), byte(i>>8))
				}
				data = append(data, 0, 2, 0xaa, 0xbb, 0xcc, 0xdd)
				return data
			}()},
			width: 129,
			check: func(t *testing.T, got []Sample) {
				if got[126].RawU16 != 126 || got[127].RawU16 != 0xbbaa ||
					got[128].RawU16 != 0xddcc || !got[128].HasRawU16 {
					t.Fatalf("分块末尾样本 = %+v", got[126:])
				}
			},
		},
		{
			name: "127项后零透明前缀",
			row: Row{Header: 2, Data: func() []byte {
				data := []byte{0, 0x7f}
				for i := 0; i < 127; i++ {
					data = append(data, byte(i), byte(i>>8))
				}
				return append(data, 0, 0xc8, 0xaa, 0xbb)
			}()},
			width: 128,
			check: func(t *testing.T, got []Sample) {
				if got[126].RawU16 != 126 || got[127] != (Sample{
					Alpha: 0x40, RawU16: 0xbbaa, HasRawU16: true,
				}) {
					t.Fatalf("末尾样本 = %+v", got[126:])
				}
			},
		},
	}

	for _, test := range tests {
		test := test
		t.Run(test.name, func(t *testing.T) {
			got, err := DecodeRow(test.row, test.width)
			if err != nil {
				t.Fatal(err)
			}
			if len(got) != int(test.width) {
				t.Fatalf("样本数 = %d，期望 %d", len(got), test.width)
			}
			test.check(t, got)
		})
	}
}

func TestDecodeRowRejectsMalformedData(t *testing.T) {
	tests := []struct {
		name  string
		row   Row
		width uint32
	}{
		{"u16像素截断", Row{Header: 1, Data: []byte{0, 1, 0xaa}}, 1},
		{"未知命令", Row{Header: 1, Data: []byte{0, 0x80}}, 1},
		{"命令数量不符", Row{Header: 2, Data: []byte{0, 1, 0xaa, 0xbb}}, 1},
		{"透明扩展无效", Row{Header: 1, Data: []byte{0xff, 1}}, 1},
		{"像素数超宽", Row{Header: 1, Data: []byte{0, 2, 0, 0, 0, 0}}, 1},
		{"行宽超限", Row{}, maxDimension + 1},
	}
	for _, test := range tests {
		test := test
		t.Run(test.name, func(t *testing.T) {
			_, err := DecodeRow(test.row, test.width)
			if !errors.Is(err, ErrInvalid) {
				t.Fatalf("错误 = %v，期望 ErrInvalid", err)
			}
		})
	}
}

func TestDecodeRowsNativeOracle(t *testing.T) {
	type oracleCase struct {
		Name     string   `json:"name"`
		Width    uint32   `json:"width"`
		Mode     uint32   `json:"mode"`
		AlphaHex string   `json:"alpha_hex"`
		RawU16   []uint16 `json:"raw_u16"`
		Header   uint16   `json:"header"`
		DataHex  string   `json:"data_hex"`
	}
	type oracleEvidence struct {
		DLLSHA256 string       `json:"dll_sha256"`
		Cases     []oracleCase `json:"cases"`
	}

	data, err := os.ReadFile(filepath.Join("..", "..", "analysis", "evidence", "ale-row-oracle.json"))
	if err != nil {
		t.Fatal(err)
	}
	var evidence oracleEvidence
	if err := json.Unmarshal(data, &evidence); err != nil {
		t.Fatal(err)
	}
	if evidence.DLLSHA256 == "" || len(evidence.Cases) == 0 {
		t.Fatalf("原生编码器证据缺少 DLL 摘要或样本")
	}

	for _, test := range evidence.Cases {
		test := test
		t.Run(test.Name, func(t *testing.T) {
			alphaValues, err := hex.DecodeString(test.AlphaHex)
			if err != nil {
				t.Fatal(err)
			}
			if len(alphaValues) != len(test.RawU16) || uint32(len(alphaValues)) != test.Width {
				t.Fatalf("输入长度与行宽/u16 数量不一致")
			}
			encoded, err := hex.DecodeString(test.DataHex)
			if err != nil {
				t.Fatal(err)
			}
			samples, err := DecodeRow(Row{Header: test.Header, Data: encoded}, test.Width)
			if err != nil {
				t.Fatal(err)
			}
			for i, alpha := range alphaValues {
				want := Sample{Alpha: 0, AlphaExact: false}
				switch {
				case alpha < 8:
				case alpha == 0x11 && test.Mode != 0:
					want.Alpha = 0x11
					want.AlphaExact = true
				case alpha > 0xf5:
					want.Alpha = 0xff
					want.RawU16 = test.RawU16[i]
					want.HasRawU16 = true
				default:
					want.Alpha = alpha & 0xf8
					want.RawU16 = test.RawU16[i]
					want.HasRawU16 = true
				}
				if samples[i] != want {
					t.Errorf("第%d项 alpha=%#02x 得到 %+v，期望 %+v", i, alpha, samples[i], want)
				}
			}
		})
	}
}

func TestParseRowsPreservesSkipAndUnknownFields(t *testing.T) {
	frame := Frame{
		Height: 4,
		Payload: []byte{
			0x34, 0x12, // 未解释前缀
			0xfe, 0xff, // 跳过两行
			0x78, 0x56, // 未解释行字段
			0x02, 0x00, // 编码数据长度
			0xaa, 0xbb,
		},
	}
	table, err := frame.ParseRows()
	if err != nil {
		t.Fatal(err)
	}
	if table.Header != 0x1234 || len(table.Rows) != 1 {
		t.Fatalf("行表 = %+v", table)
	}
	row := table.Rows[0]
	if row.SkipHeader != 0xfffe || row.Header != 0x5678 || row.Length != 2 ||
		!bytes.Equal(row.Data, []byte{0xaa, 0xbb}) {
		t.Fatalf("行记录 = %+v", row)
	}
}

func TestParseRowsRejectsMalformedData(t *testing.T) {
	tests := []struct {
		name    string
		height  uint32
		payload []byte
	}{
		{"前缀截断", 1, []byte{1}},
		{"行字段截断", 1, []byte{1, 0, 1}},
		{"跳过标记截断", 4, []byte{1, 0, 0xfe, 0xff}},
		{"行长度截断", 1, []byte{1, 0, 1, 0, 1}},
		{"行数据超界", 1, []byte{1, 0, 1, 0, 3, 0, 0xaa}},
		{"行数超出帧高", 1, []byte{1, 0, 1, 0, 0, 0, 1, 0, 0, 0}},
		{"跳过行数超出帧高", 1, []byte{1, 0, 0xfe, 0xff, 1, 0, 0, 0}},
	}
	for _, test := range tests {
		test := test
		t.Run(test.name, func(t *testing.T) {
			_, err := (Frame{Height: test.height, Payload: test.payload}).ParseRows()
			if !errors.Is(err, ErrInvalid) {
				t.Fatalf("错误 = %v，期望 ErrInvalid", err)
			}
		})
	}
}

func TestParseRejectsUnsupportedContainers(t *testing.T) {
	for name, data := range map[string][]byte{
		"ALE v1": append([]byte("ALE\x00\x01\x00"), make([]byte, 10)...),
		"ALE v2": append([]byte("ALE\x00\x02\x00"), make([]byte, 10)...),
		"AEX":    []byte("AEX\x00"),
	} {
		t.Run(name, func(t *testing.T) {
			_, err := Parse(data)
			if name == "AEX" && !errors.Is(err, ErrUnknownFormat) {
				t.Fatalf("错误 = %v，期望 ErrUnknownFormat", err)
			}
			if name != "AEX" && !errors.Is(err, ErrUnsupported) {
				t.Fatalf("错误 = %v，期望 ErrUnsupported", err)
			}
		})
	}
}

func TestParseRejectsMalformedData(t *testing.T) {
	source, err := os.ReadFile(filepath.Join("..", "..", "CLIENT", "bout", "pool", "snooker", "img", "maxpos.ale"))
	if err != nil {
		t.Fatal(err)
	}
	tests := []struct {
		name   string
		mutate func([]byte) []byte
	}{
		{"截断帧", func(data []byte) []byte { return data[:len(data)-5] }},
		{"帧块总长度错误", func(data []byte) []byte {
			binary.LittleEndian.PutUint32(data[6:10], 251)
			return data
		}},
		{"帧长度错误", func(data []byte) []byte {
			binary.LittleEndian.PutUint32(data[12:16], 0xffffffff)
			return data
		}},
		{"帧数量与长度不符", func(data []byte) []byte {
			binary.LittleEndian.PutUint16(data[10:12], 2)
			return data
		}},
		{"尺寸超限", func(data []byte) []byte {
			binary.LittleEndian.PutUint32(data[20:24], maxDimension+1)
			return data
		}},
		{"终止标记错误", func(data []byte) []byte {
			copy(data[len(data)-4:], "BAD\x00")
			return data
		}},
		{"文件尾有多余数据", func(data []byte) []byte { return append(data, 0) }},
	}

	for _, test := range tests {
		t.Run(test.name, func(t *testing.T) {
			data := append([]byte(nil), source...)
			_, err := Parse(test.mutate(data))
			if !errors.Is(err, ErrInvalid) {
				t.Fatalf("错误 = %v，期望 ErrInvalid", err)
			}
		})
	}
}

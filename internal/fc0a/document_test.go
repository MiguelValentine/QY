package fc0a

import (
	"encoding/binary"
	"os"
	"path/filepath"
	"testing"
)

func TestClientDocuments(t *testing.T) {
	count, compressed := 0, 0
	err := filepath.WalkDir("../../analysis/decoded", func(path string, entry os.DirEntry, err error) error {
		if err != nil || entry.IsDir() {
			return err
		}
		data, err := os.ReadFile(path)
		if err != nil {
			return err
		}
		if len(data) < 4 || string(data[:4]) != "FC0A" {
			return nil
		}
		doc, err := Parse(data)
		if err != nil {
			t.Errorf("%s: %v", path, err)
			return nil
		}
		for _, token := range doc.Tokens {
			if token.Compressed {
				compressed++
				if len(token.Blob) != int(token.Value) {
					t.Errorf("%s: 解压长度不符", path)
				}
			}
		}
		count++
		return nil
	})
	if err != nil {
		t.Fatal(err)
	}
	if count != 625 || compressed != 177 {
		t.Fatalf("解析 %d 个 FC0A，%d 个压缩块；预期 625、177", count, compressed)
	}
}

func TestMalformedDocuments(t *testing.T) {
	header := make([]byte, 20)
	copy(header, "FC0A")
	for _, data := range [][]byte{nil, []byte("FC0A"), append(append([]byte(nil), header...), 0)} {
		if _, err := Parse(data); err == nil {
			t.Fatal("接受了无效文件")
		}
	}
	binary.LittleEndian.PutUint32(header[12:], 6)
	for _, kind := range []uint16{2, 4} {
		data := append(append([]byte(nil), header...), make([]byte, 6)...)
		binary.LittleEndian.PutUint16(data[20:], kind)
		binary.LittleEndian.PutUint32(data[22:], 513)
		_, err := Parse(data)
		if kind == 4 && err == nil {
			t.Fatal("接受了截断的数据块")
		}
		if kind == 2 && err != nil {
			t.Fatal(err)
		}
	}
}

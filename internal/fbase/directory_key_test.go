package fbase

import (
	"errors"
	"testing"

	"QY/internal/symbol"
)

func TestDirectoryPathHashNormalization(t *testing.T) {
	tests := []struct {
		name  string
		input []byte
		want  []byte
	}{
		{name: "小写与斜杠", input: []byte(`DATA/Map/File.DZ`), want: []byte(`data\map\file.dz`)},
		{name: "上级目录", input: []byte(`DATA\Map\..\File.DZ`), want: []byte(`data\file.dz`)},
		{name: "点目录", input: []byte(`DATA\.\File.DZ`), want: []byte(`data/file.dz`)},
		{name: "NUL 截断", input: []byte{'D', 'A', 'T', 'A', 0, '/', 'X'}, want: []byte(`data`)},
	}
	for _, test := range tests {
		t.Run(test.name, func(t *testing.T) {
			got, err := DirectoryPathHash(test.input)
			if err != nil {
				t.Fatalf("DirectoryPathHash(%q) 出错：%v", test.input, err)
			}
			if want := symbol.StringTableHash(string(test.want)); got != want {
				t.Fatalf("DirectoryPathHash(%q) = %#08x，期望 %#08x", test.input, got, want)
			}
		})
	}
}

func TestDirectoryPathHashCaseAndSeparatorEquivalence(t *testing.T) {
	first, err := DirectoryPathHash([]byte(`DATA/Map/File.DZ`))
	if err != nil {
		t.Fatal(err)
	}
	second, err := DirectoryPathHash([]byte(`data\map\file.dz`))
	if err != nil {
		t.Fatal(err)
	}
	if first != second {
		t.Fatalf("大小写或分隔符不同导致哈希不一致：%#08x != %#08x", first, second)
	}
}

func TestDirectoryPathHashRejectsNonASCII(t *testing.T) {
	if _, err := DirectoryPathHash([]byte{'D', 'A', 'T', 'A', '\\', 0xE4}); !errors.Is(err, ErrDirectoryPathNonASCII) {
		t.Fatalf("非 ASCII 输入错误 = %v，期望 %v", err, ErrDirectoryPathNonASCII)
	}
	if got, err := DirectoryPathHash([]byte{'D', 0, 0xE4}); err != nil || got != symbol.StringTableHash("d") {
		t.Fatalf("NUL 后非 ASCII 字节应被忽略，得到 %#08x、%v", got, err)
	}
}

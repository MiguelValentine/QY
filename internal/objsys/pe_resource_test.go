package objsys

import (
	"crypto/sha256"
	"encoding/binary"
	"encoding/hex"
	"os"
	"testing"
)

func TestReadPEResourceFromClientDLL(t *testing.T) {
	data, err := os.ReadFile("../../CLIENT/objsys.dll")
	if err != nil {
		t.Fatal(err)
	}
	resource, err := readPEResource(data, "IMG", "TOOLTIPS.ALE", 2052)
	if err != nil {
		t.Fatal(err)
	}
	if len(resource) != 990 {
		t.Fatalf("资源长度 = %d，期望 990", len(resource))
	}
	const offset = 842104
	if string(resource) != string(data[offset:offset+990]) {
		t.Fatal("资源内容与预期原始文件区间不一致")
	}
	sum := sha256.Sum256(resource)
	const expectedHash = "03600b4d0c9c8ebc222a8092479841dfab92e29adf680222b621d9207c5a4b04"
	if hex.EncodeToString(sum[:]) != expectedHash {
		t.Fatalf("资源 SHA-256 = %s，期望 %s", hex.EncodeToString(sum[:]), expectedHash)
	}

	resource[0] ^= 0xff
	if data[offset] == resource[0] {
		t.Fatal("返回内容不是独立副本")
	}
}

func TestReadPEResourceRequiresExactNameAndLanguage(t *testing.T) {
	data, err := os.ReadFile("../../CLIENT/objsys.dll")
	if err != nil {
		t.Fatal(err)
	}
	for _, test := range []struct {
		name     string
		language uint32
	}{
		{name: "MISSING.ALE", language: 2052},
		{name: "TOOLTIPS.ALE", language: 1033},
	} {
		if _, err := readPEResource(data, "IMG", test.name, test.language); err == nil {
			t.Errorf("缺失名称或语言时未返回错误：名称=%q，语言=%d", test.name, test.language)
		}
	}
}

func TestReadPEResourceRejectsTruncatedPE(t *testing.T) {
	if _, err := readPEResource([]byte("MZ"), "IMG", "TOOLTIPS.ALE", 2052); err == nil {
		t.Fatal("截断的 PE 输入未返回错误")
	}
}

func TestReadPEResourceRejectsOutOfBoundsDirectory(t *testing.T) {
	data, err := os.ReadFile("../../CLIENT/objsys.dll")
	if err != nil {
		t.Fatal(err)
	}
	malformed := append([]byte(nil), data...)
	peOffset := int(binary.LittleEndian.Uint32(malformed[0x3c:0x40]))
	optionalHeaderOffset := peOffset + 4 + 20
	magic := binary.LittleEndian.Uint16(malformed[optionalHeaderOffset : optionalHeaderOffset+2])
	directoryOffset := 96
	if magic == 0x20b {
		directoryOffset = 112
	} else if magic != 0x10b {
		t.Fatalf("未知可选头格式：%#x", magic)
	}
	resourceSizeOffset := optionalHeaderOffset + directoryOffset + 2*8 + 4
	binary.LittleEndian.PutUint32(malformed[resourceSizeOffset:resourceSizeOffset+4], 1)

	if _, err := readPEResource(malformed, "IMG", "TOOLTIPS.ALE", 2052); err == nil {
		t.Fatal("资源目录越界时未返回错误")
	}
}

package objsys

import (
	"bytes"
	"encoding/binary"
	"errors"
	"os"
	"testing"

	"QY/internal/ale"
)

func TestReadPEResourceTooltipsAEXFormat(t *testing.T) {
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
	if string(resource[:4]) != "AEX\x00" {
		t.Fatalf("资源签名 = %q，期望 AEX\\x00", resource[:4])
	}
	if bytes.Contains(resource[4:], []byte("ALE\x00")) {
		t.Fatal("AEX 载荷中出现了直接嵌入的 ALE\\0 标记，需重新确认封装关系")
	}
	if _, err := ale.Parse(resource); !errors.Is(err, ale.ErrUnknownFormat) {
		t.Fatalf("ALE v3 解析器对 AEX 签名的返回值 = %v，期望 ErrUnknownFormat", err)
	}
	if len(resource) < 0x24 {
		t.Fatalf("AEX 头被截断：%d 字节", len(resource))
	}
	t.Logf("AEX 标记字段 0x04..0x0b=%q；DWORD 0x0c/0x10/0x14/0x18/0x1c=%d/%d/%d/%d/%d",
		resource[4:12],
		binary.LittleEndian.Uint32(resource[0x0c:0x10]),
		binary.LittleEndian.Uint32(resource[0x10:0x14]),
		binary.LittleEndian.Uint32(resource[0x14:0x18]),
		binary.LittleEndian.Uint32(resource[0x18:0x1c]),
		binary.LittleEndian.Uint32(resource[0x1c:0x20]))
}

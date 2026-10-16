package fc0a

import (
	"bytes"
	"debug/pe"
	"encoding/binary"
	"os"
	"path/filepath"
	"testing"
)

func TestKindNamesMatchClientStaticTable(t *testing.T) {
	const tableRVA = uint32(0xb60f8)
	const entrySize = 36
	const terminatorKind = uint32(2000)

	dllPath := filepath.Join("..", "..", "CLIENT", "objsys.dll")
	dllBytes, err := os.ReadFile(dllPath)
	if err != nil {
		t.Fatal(err)
	}
	peFile, err := pe.NewFile(bytes.NewReader(dllBytes))
	if err != nil {
		t.Fatal(err)
	}
	defer peFile.Close()

	var tableOffset uint32
	found := false
	for _, section := range peFile.Sections {
		delta := tableRVA - section.VirtualAddress
		if tableRVA < section.VirtualAddress || delta >= section.Size {
			continue
		}
		if delta+entrySize > section.Size {
			t.Fatalf("token 表跨越 PE section 边界")
		}
		tableOffset = section.Offset + delta
		found = true
		break
	}
	if !found {
		t.Fatalf("找不到 RVA %#x 所在的 PE section", tableRVA)
	}

	got := make(map[uint16]string)
	terminated := false
	for offset := tableOffset; uint64(offset)+entrySize <= uint64(len(dllBytes)); offset += entrySize {
		kind := binary.LittleEndian.Uint32(dllBytes[offset : offset+4])
		if kind == terminatorKind {
			terminated = true
			break
		}
		nameBytes := dllBytes[offset+4 : offset+entrySize]
		end := bytes.IndexByte(nameBytes, 0)
		if end < 0 {
			t.Fatalf("kind %d 的名称没有零结尾", kind)
		}
		if kind > 0xffff {
			t.Fatalf("kind 超出 uint16: %d", kind)
		}
		if _, exists := got[uint16(kind)]; exists {
			t.Fatalf("PE 静态表重复 kind %d", kind)
		}
		got[uint16(kind)] = string(nameBytes[:end])
	}
	if !terminated {
		t.Fatalf("RVA %#x 的静态表没有终止项", tableRVA)
	}
	if len(got) != len(tokenKinds) {
		t.Fatalf("Go 表有 %d 项，PE 静态表有 %d 项", len(tokenKinds), len(got))
	}
	for kind, want := range got {
		if name, ok := KindName(kind); !ok || name != want {
			t.Errorf("KindName(%d) = %q, %t；PE 表为 %q", kind, name, ok, want)
		}
	}
	for _, kind := range []uint16{2, 3, 4, 5, 6, 1900} {
		if name, ok := KindName(kind); ok {
			t.Errorf("未在静态表中的 kind %d 被错误命名为 %q", kind, name)
		}
	}
	for kind := range tokenKinds {
		if _, ok := got[kind]; !ok {
			t.Errorf("Go 表多出 PE 静态表没有的 kind %d (%s)", kind, tokenKinds[kind])
		}
	}
}

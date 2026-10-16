package objsys

import (
	"bytes"
	"errors"
	"strings"
	"testing"

	"QY/internal/fbase"
	"QY/internal/script"
)

func TestResourceDirectoryExpandsPathsAndPreservesNativeFields(t *testing.T) {
	directory := []byte("http://example.test/world/")
	lines := [][]byte{
		[]byte(""),
		[]byte("alpha/beta,10,_,z"),
		[]byte("+6other,1,2,3"),
		[]byte("*12final,4,5,6"),
	}
	entries, err := parseResourceDirectory(directory, lines)
	if err != nil {
		t.Fatal(err)
	}
	if len(entries) != 3 || string(entries[0].Path) != "http://example.test/world/alpha/beta" ||
		string(entries[1].Path) != "http://example.test/world/alpha/other" ||
		string(entries[2].Path) != "http://example.test/world/alfinal" {
		t.Fatalf("路径展开错误：%+v", entries)
	}
	if entries[0].Value14 != 64 || entries[0].Value1C != 36 || entries[0].Value18 != 63 {
		t.Fatalf("数值没有按原生字段位置登记：%+v", entries[0])
	}
	directory[0], lines[1][0] = 'X', 'X'
	if string(entries[0].Path) != "http://example.test/world/alpha/beta" {
		t.Fatal("目录记录与输入共享可变字节")
	}
}

func TestResourceDirectorySupportsMultiDigitPrefixLength(t *testing.T) {
	first := strings.Repeat("x", 70) + "/first"
	entries, err := parseResourceDirectory([]byte("base/"), [][]byte{
		[]byte(first + ",0,0,0"),
		[]byte("*210tail,0,0,0\x00ignored"),
	})
	if err != nil {
		t.Fatal(err)
	}
	want := "base/" + strings.Repeat("x", 64) + "tail"
	if len(entries) != 2 || string(entries[1].Path) != want {
		t.Fatalf("多位前缀长度展开错误：%+v", entries)
	}
	if !bytes.Equal(entries[0].Path, []byte("base/"+first)) {
		t.Fatal("后续前缀处理改变了此前记录")
	}
}

func TestResourceDirectoryRejectsInvalidBackReferencesAndMissingFields(t *testing.T) {
	for _, lines := range [][][]byte{
		{[]byte("+1file,0,0,0")},
		{[]byte("*3x,0,0,0")},
		{[]byte("path,0,0")},
	} {
		if entries, err := parseResourceDirectory(nil, lines); err == nil || entries != nil {
			t.Fatalf("无效目录不应产生可用记录：entries=%+v err=%v", entries, err)
		}
	}
}

func TestDesktopDirectoryCallContinuesOnlyAfterActualReadFailure(t *testing.T) {
	desktop := NewDesktop(nil, nil)
	source := []byte("http://example.test/files_dir.dz")
	args := []script.Value{{Kind: "string", Text: source}}
	desktop.readDirectory = func(got []byte) ([][]byte, error) {
		if !bytes.Equal(got, source) {
			t.Fatalf("目录读取参数=%q", got)
		}
		return nil, ErrResourceNetworkUnavailable
	}
	if _, handled, err := desktop.Object.CallMember(0xaf665c57, args); !handled ||
		!errors.Is(err, ErrResourceNetworkUnavailable) || desktop.ResourceDirectoryError != nil {
		t.Fatalf("缺少能力不应进入原生失败继续路径：handled=%t err=%v", handled, err)
	}
	var diagnostic error
	desktop.reportResourceError = func(err error) { diagnostic = err }
	desktop.readDirectory = func([]byte) ([][]byte, error) { return nil, ErrResourceReadFailed }
	value, handled, err := desktop.Object.CallMember(0xaf665c57, args)
	if err != nil || !handled || value.Kind != "string" || !bytes.Equal(value.Text, source) ||
		!errors.Is(desktop.ResourceDirectoryError, ErrResourceReadFailed) || diagnostic == nil {
		t.Fatalf("实际读取失败未保留来源和参数返回：value=%+v handled=%t err=%v", value, handled, err)
	}
	source[0] = 'X'
	if string(desktop.ResourceDirectoryPath) != "http://example.test/files_dir.dz" {
		t.Fatal("目录来源没有独立保存")
	}
}

func TestDesktopDirectoryCallRegistersParsedValues(t *testing.T) {
	desktop := NewDesktop(nil, nil)
	desktop.readDirectory = func([]byte) ([][]byte, error) {
		return [][]byte{[]byte("in/login.fcc,10,_,z")}, nil
	}
	_, handled, err := desktop.Object.CallMember(0xaf665c57, []script.Value{
		{Kind: "string", Text: []byte("http://example.test/world/files_dir.dz")},
	})
	if err != nil || !handled || len(desktop.resourceEntries) != 1 {
		t.Fatalf("目录没有登记：handled=%t err=%v entries=%+v", handled, err, desktop.resourceEntries)
	}
	entry := desktop.resourceEntries[0]
	if string(entry.Path) != `http://example.test/world\in/login.fcc` ||
		entry.Value14 != 64 || entry.Value1C != 36 || entry.Value18 != 63 {
		t.Fatalf("目录条目错误：%+v", entry)
	}
}

func TestDesktopDirectoryRegistrationReplacesNormalizedHashKey(t *testing.T) {
	desktop := NewDesktop(nil, nil)
	desktop.readDirectory = func([]byte) ([][]byte, error) {
		return [][]byte{[]byte("in/login.fcc,10,_,z")}, nil
	}
	for _, source := range []string{
		"http://example.test/world/files_dir.dz",
		"http://example.test/WORLD/files_dir.dz",
	} {
		_, handled, err := desktop.Object.CallMember(0xaf665c57, []script.Value{
			{Kind: "string", Text: []byte(source)},
		})
		if err != nil || !handled {
			t.Fatalf("登记目录 %q 失败：handled=%t err=%v", source, handled, err)
		}
	}
	if len(desktop.resourceEntries) != 1 {
		t.Fatalf("规范化后相同的哈希键未覆盖：%+v", desktop.resourceEntries)
	}
	entry := desktop.resourceEntries[0]
	if string(entry.Path) != `http://example.test/WORLD\in/login.fcc` {
		t.Fatalf("覆盖后未保留新记录路径：%q", entry.Path)
	}
	key, err := fbase.DirectoryPathHash(entry.Path)
	if err != nil || entry.DirectoryKey != key {
		t.Fatalf("登记键与原生路径哈希不符：key=%08x want=%08x err=%v", entry.DirectoryKey, key, err)
	}
}

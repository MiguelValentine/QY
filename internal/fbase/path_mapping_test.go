package fbase

import (
	"bytes"
	"errors"
	"fmt"
	"testing"

	"QY/internal/symbol"
)

func TestPathMappingsRegisterNormalizesSourceAndReplacesInPlace(t *testing.T) {
	var mappings PathMappings

	added, err := mappings.Register([]byte("http://example.test/base"), []byte("assets/"))
	if err != nil || !added {
		t.Fatalf("新增映射结果=(%v, %v)，期望(true, nil)", added, err)
	}
	added, err = mappings.Register([]byte("http://other.test/Path"), []byte("other/"))
	if err != nil || !added {
		t.Fatalf("新增第二项结果=(%v, %v)，期望(true, nil)", added, err)
	}
	added, err = mappings.Register([]byte("http://EXAMPLE.test/base"), []byte("replacement/"))
	if err != nil || !added {
		t.Fatalf("替换映射结果=(%v, %v)，期望(true, nil)", added, err)
	}

	entries := mappings.Entries()
	if len(entries) != 2 {
		t.Fatalf("条目数=%d，期望2", len(entries))
	}
	if string(entries[0].Source) != "example.test\\base" || string(entries[0].Target) != "replacement/" {
		t.Fatalf("替换后的首项=%q => %q", entries[0].Source, entries[0].Target)
	}
	if string(entries[1].Source) != "other.test\\path" {
		t.Fatalf("替换不应改变注册顺序：第二项源=%q", entries[1].Source)
	}
}

func TestPathMappingsPrefixAndNormalizedSource(t *testing.T) {
	var mappings PathMappings

	added, err := mappings.Register([]byte("HTTP://example.test"), []byte("ignored"))
	if err != nil || added || len(mappings.Entries()) != 0 {
		t.Fatalf("大写前缀应被拒绝：added=%v err=%v entries=%v", added, err, mappings.Entries())
	}
	added, err = mappings.Register([]byte("http://example.test"), []byte("lower"))
	if err != nil || !added {
		t.Fatalf("标准小写前缀应接受：added=%v err=%v", added, err)
	}
	added, err = mappings.Register([]byte("http://EXAMPLE.test"), []byte("upper"))
	if err != nil || !added || len(mappings.Entries()) != 1 || string(mappings.Entries()[0].Target) != "upper" {
		t.Fatalf("scheme 后的源路径应转小写并覆盖旧键：added=%v err=%v entries=%v", added, err, mappings.Entries())
	}
}

func TestPathMappingsCapacityRejectsReplacementWhenFull(t *testing.T) {
	var mappings PathMappings
	for i := 0; i < pathMappingCapacity; i++ {
		source := []byte("http://entry-" + string(rune('a'+i)))
		added, err := mappings.Register(source, []byte("target"))
		if err != nil || !added {
			t.Fatalf("第%d项注册失败：added=%v err=%v", i, added, err)
		}
	}
	added, err := mappings.Register([]byte("http://overflow"), []byte("target"))
	if err != nil || added {
		t.Fatalf("容量耗尽应返回(false, nil)：added=%v err=%v", added, err)
	}

	added, err = mappings.Register([]byte("http://entry-a"), []byte("updated"))
	if err != nil || added {
		t.Fatalf("容量耗尽时应在查重前拒绝替换：added=%v err=%v", added, err)
	}
	if len(mappings.Entries()) != pathMappingCapacity {
		t.Fatalf("拒绝替换不应改变条目数：%d", len(mappings.Entries()))
	}
}

func TestPathMappingsUsesCStringSemantics(t *testing.T) {
	var mappings PathMappings
	added, err := mappings.Register(
		[]byte{'h', 't', 't', 'p', ':', '/', '/', 'a', 0, 'x'},
		[]byte{'t', 'a', 'r', 'g', 'e', 't', 0, 'x'},
	)
	if err != nil || !added {
		t.Fatalf("含NUL输入注册失败：added=%v err=%v", added, err)
	}
	entries := mappings.Entries()
	if len(entries) != 1 || !bytes.Equal(entries[0].Source, []byte("a")) || !bytes.Equal(entries[0].Target, []byte("target")) {
		t.Fatalf("应只保留首个NUL之前的字节：%q => %q", entries[0].Source, entries[0].Target)
	}

	added, err = mappings.Register([]byte("not-http\x00http://later"), []byte("unused"))
	if err != nil || added || len(mappings.Entries()) != 1 {
		t.Fatalf("首个NUL前没有有效前缀时应拒绝：added=%v err=%v", added, err)
	}
}

func TestPathMappingsRejectsInputsBeyondNativeBuffers(t *testing.T) {
	var mappings PathMappings
	max := pathMappingMaxBytes
	source := append([]byte("http://"), bytes.Repeat([]byte{'s'}, max)...)
	if added, err := mappings.Register(source, bytes.Repeat([]byte{'t'}, max)); err != nil || !added {
		t.Fatalf("259字节字符串应可存储：added=%v err=%v", added, err)
	}

	tooLongSource := append(append([]byte("http://"), bytes.Repeat([]byte{'s'}, max)...), 'x')
	if added, err := mappings.Register(tooLongSource, []byte("target")); added || !errors.Is(err, ErrPathMappingValueTooLong) {
		t.Fatalf("超长源应返回明确错误：added=%v err=%v", added, err)
	}
	if added, err := mappings.Register([]byte("http://new"), bytes.Repeat([]byte{'t'}, max+1)); added || !errors.Is(err, ErrPathMappingValueTooLong) {
		t.Fatalf("超长目标应返回明确错误：added=%v err=%v", added, err)
	}
	if len(mappings.Entries()) != 1 {
		t.Fatalf("超长输入不应改变映射表：%d", len(mappings.Entries()))
	}
}

func TestPathMappingsCopiesInputsAndReturnsDetachedSnapshots(t *testing.T) {
	var mappings PathMappings
	source := []byte("http://original")
	target := []byte("target")
	if added, err := mappings.Register(source, target); err != nil || !added {
		t.Fatalf("注册失败：added=%v err=%v", added, err)
	}

	source[7] = 'X'
	target[0] = 'X'
	first := mappings.Entries()
	first[0].Source[7] = 'Y'
	first[0].Target[0] = 'Y'
	first[0] = PathMapping{}

	second := mappings.Entries()
	if string(second[0].Source) != "original" || string(second[0].Target) != "target" {
		t.Fatalf("输入或快照不应与内部状态共享底层数组：%q => %q", second[0].Source, second[0].Target)
	}
}

func TestResolveURLUsesMappedDLLPath(t *testing.T) {
	var mappings PathMappings
	if added, err := mappings.Register([]byte("http://example.test/assets"), []byte("downloads")); err != nil || !added {
		t.Fatalf("注册映射失败：added=%v err=%v", added, err)
	}

	got, handled, err := mappings.ResolveURL([]byte("http://EXAMPLE.test/assets/sub/file.dll"), []byte(`C:\cache\`))
	if err != nil || !handled {
		t.Fatalf("解析结果 handled=%v err=%v", handled, err)
	}
	want := `C:\cache\downloads\\sub\file.dll`
	if string(got) != want {
		t.Fatalf("解析路径=%q，期望%q", got, want)
	}
}

func TestResolveURLUsesMappedFCHHash(t *testing.T) {
	var mappings PathMappings
	if added, err := mappings.Register([]byte("http://example.test/assets"), []byte("downloads")); err != nil || !added {
		t.Fatalf("注册映射失败：added=%v err=%v", added, err)
	}

	got, handled, err := mappings.ResolveURL([]byte("http://example.test/assets/files_dir.dz"), []byte(`C:\cache\`))
	if err != nil || !handled {
		t.Fatalf("解析结果 handled=%v err=%v", handled, err)
	}
	hash := symbol.StringTableHash(`dz\files_dir`)
	want := `C:\cache\downloads\` + fmt.Sprintf("%08X.fch", hash)
	if string(got) != want {
		t.Fatalf("解析路径=%q，期望%q", got, want)
	}
}

func TestResolveURLUsesNativeUnmappedPathSanitizing(t *testing.T) {
	var mappings PathMappings
	got, handled, err := mappings.ResolveURL([]byte("http://example.test:80/assets/file"), []byte(`C:\cache\`))
	if err != nil || !handled {
		t.Fatalf("解析结果 handled=%v err=%v", handled, err)
	}
	if want := `C:\cache\example.test_80@assets@file`; string(got) != want {
		t.Fatalf("未映射路径=%q，期望%q", got, want)
	}
}

func TestResolveURLRejectsNonHTTPInput(t *testing.T) {
	var mappings PathMappings
	if got, handled, err := mappings.ResolveURL([]byte("https://example.test/file"), []byte(`C:\cache\`)); err != nil || handled || got != nil {
		t.Fatalf("非HTTP输入应不处理：path=%q handled=%v err=%v", got, handled, err)
	}
}

func TestSplitResourcePath(t *testing.T) {
	tests := []struct {
		input, directory, basename string
	}{
		{`dir/sub/file.dz`, `dir/sub\`, `file.dz`},
		{`dir\sub\`, `dir\sub\`, ``},
		{`file.dz`, ``, `file.dz`},
		{`/file.dz`, `\`, `file.dz`},
	}
	for _, test := range tests {
		directory, basename := SplitResourcePath([]byte(test.input))
		if string(directory) != test.directory || string(basename) != test.basename {
			t.Errorf("SplitResourcePath(%q)=(%q,%q)，期望(%q,%q)", test.input, directory, basename, test.directory, test.basename)
		}
	}
}

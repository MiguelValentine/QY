package objsys

import (
	"errors"
	"net/http"
	"net/http/httptest"
	"os"
	"path/filepath"
	"strings"
	"testing"

	"QY/internal/script"
)

func TestResourceDirectoryLoadsHTTPBytesIntoCacheAndDesktop(t *testing.T) {
	body := "in/login.fcc,10,_,z\r\n+3option.fcc,1,2,3\r\n"
	wireData := wrapDirectoryCD1([]byte(body))
	server := httptest.NewServer(http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		if r.URL.Path != "/files_dir.dz" {
			t.Errorf("请求了非目录资源：%q", r.URL.Path)
		}
		_, _ = w.Write(wireData)
	}))
	defer server.Close()
	loader, err := NewLoader("../../CLIENT")
	if err != nil {
		t.Fatal(err)
	}
	loader.ResourceCacheDir = t.TempDir()
	loader.ResourceHTTPClient = server.Client()
	desktop := NewDesktop(nil, nil)
	loader.configureDesktopResources(desktop)
	if _, err := desktop.PathMappings.Register([]byte(server.URL+"/"), []byte("mapped")); err != nil {
		t.Fatal(err)
	}
	source := []byte(server.URL + "/files_dir.dz")
	value, handled, err := desktop.Object.CallMember(0xaf665c57, []script.Value{{Kind: "string", Text: source}})
	if err != nil || !handled || value.Kind != "string" || string(value.Text) != string(source) {
		t.Fatalf("真实资源获取没有回到脚本：value=%+v handled=%t err=%v", value, handled, err)
	}
	nativePath, _, err := desktop.PathMappings.ResolveURL(source, []byte(loader.ResourceCacheDir+"/"))
	if err != nil {
		t.Fatal(err)
	}
	cachePath := filepath.FromSlash(strings.ReplaceAll(string(nativePath), `\`, "/"))
	cached, err := os.ReadFile(cachePath)
	if err != nil || string(cached) != string(wireData) {
		t.Fatalf("下载缓存与实际响应不同：data=%q err=%v", cached, err)
	}
	if len(desktop.resourceEntries) != 2 ||
		string(desktop.resourceEntries[1].Path) != server.URL+`\in/option.fcc` ||
		desktop.ResourceDirectoryError != nil {
		t.Fatalf("实际响应没有完成条目解析：entries=%+v err=%v", desktop.resourceEntries, desktop.ResourceDirectoryError)
	}
}

func TestResourceDirectoryTextUsesStrictCRLFAndRetainsEmptyLines(t *testing.T) {
	lines, err := decodeResourceDirectoryLines(wrapDirectoryCD1([]byte("a\r\n\r\nb\nc\r\n")))
	if err != nil || len(lines) != 4 || string(lines[0]) != "a" ||
		len(lines[1]) != 0 || string(lines[2]) != "b\nc" || len(lines[3]) != 0 {
		t.Fatalf("文本分行与原生规则不符：lines=%q err=%v", lines, err)
	}
	if _, err := decodeResourceDirectoryLines(nil); !errors.Is(err, ErrResourceReadFailed) {
		t.Fatalf("空响应没有使用实际读取失败语义：%v", err)
	}
}

func TestResourceDirectoryCompiledPayloadIsNotSplit(t *testing.T) {
	payload := []byte("FC0Acompiled\r\ncontent")
	lines, err := decodeResourceDirectoryLines(wrapDirectoryCD1(payload))
	if err != nil || len(lines) != 0 {
		t.Fatalf("编译内容应保留为未拆分负载：lines=%q err=%v", lines, err)
	}
}

func TestResourceDirectoryRejectsUnknownContainerHeader(t *testing.T) {
	if _, err := decodeResourceDirectoryLines([]byte("NOPEdirectory\r\n")); !errors.Is(err, ErrResourceReadFailed) {
		t.Fatalf("未知四字节头应作为读取失败：%v", err)
	}
}

func wrapDirectoryCD1(payload []byte) []byte {
	const mask = uint32(0xE7BD2160)
	encoded := append([]byte(nil), payload...)
	state := uint32(len(payload))
	for offset := 0; offset+4 <= len(payload); offset += 4 {
		for bit := 0; bit < 32; bit++ {
			parity := 0
			for value := state & mask; value != 0; value &= value - 1 {
				parity ^= 1
			}
			state <<= 1
			state |= uint32(parity)
		}
		word := uint32(payload[offset]) |
			uint32(payload[offset+1])<<8 |
			uint32(payload[offset+2])<<16 |
			uint32(payload[offset+3])<<24
		word ^= state
		encoded[offset] = byte(word)
		encoded[offset+1] = byte(word >> 8)
		encoded[offset+2] = byte(word >> 16)
		encoded[offset+3] = byte(word >> 24)
	}
	return append([]byte("!CD1"), encoded...)
}

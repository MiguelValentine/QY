package objsys

import (
	"errors"
	"net/http"
	"net/http/httptest"
	"testing"
)

func TestResourceHTTPReadsActualResponseAndRetriesFailures(t *testing.T) {
	requests := 0
	server := httptest.NewServer(http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		requests++
		if r.URL.Path != "/files_dir.dz" {
			t.Errorf("资源请求路径=%q", r.URL.Path)
		}
		if requests < 3 {
			w.WriteHeader(http.StatusServiceUnavailable)
			return
		}
		_, _ = w.Write([]byte("path,0,0,0\r\n"))
	}))
	defer server.Close()
	data, err := fetchResourceHTTP(server.Client(), server.URL+"/files_dir.dz")
	if err != nil || string(data) != "path,0,0,0\r\n" || requests != 3 {
		t.Fatalf("资源获取结果错误：data=%q requests=%d err=%v", data, requests, err)
	}
}

func TestResourceHTTPDistinguishesUnavailableBackendFromObservedFailure(t *testing.T) {
	if _, err := fetchResourceHTTP(nil, "http://example.test/files_dir.dz"); !errors.Is(err, ErrResourceNetworkUnavailable) ||
		errors.Is(err, ErrResourceReadFailed) {
		t.Fatalf("未配置后端被当成实际获取失败：%v", err)
	}
	requests := 0
	server := httptest.NewServer(http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		requests++
		http.Error(w, "missing", http.StatusNotFound)
	}))
	defer server.Close()
	data, err := fetchResourceHTTP(server.Client(), server.URL)
	if data != nil || !errors.Is(err, ErrResourceReadFailed) || requests != 10 {
		t.Fatalf("获取失败未保留十次真实请求结果：data=%q requests=%d err=%v", data, requests, err)
	}
}

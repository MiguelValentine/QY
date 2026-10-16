package lzx

import (
	"bytes"
	"crypto/sha256"
	"fmt"
	"io"
	"os"
	"testing"
)

func TestNew(t *testing.T) {
	compressedFile, err := os.Open("testdata/compressed")
	if err != nil {
		t.Fatal(err)
	}
	defer compressedFile.Close()
	lzxReader, err := New(compressedFile, 2097152, 0)
	if err != nil {
		t.Fatal(err)
	}
	uncompressedData, err := io.ReadAll(io.LimitReader(lzxReader, 866304))
	if err != nil {
		t.Fatalf("Error after %d bytes: %v", len(uncompressedData), err)
	}
	hash := sha256.Sum256(uncompressedData)
	if fmt.Sprintf("%X", hash) != "ACB2F8E42147DE389D9D5172CE97CE2782E564A01A8E9E636CF981A81D36884C" {
		t.Fatalf("hash mismatch on unpacked data, was %X", hash)
	}
}

func TestNewWithSizeStopsAtContainerBoundary(t *testing.T) {
	compressed, err := os.ReadFile("testdata/compressed")
	if err != nil {
		t.Fatal(err)
	}
	reader, err := NewWithSize(bytes.NewReader(compressed), 1<<21, 0, 866304)
	if err != nil {
		t.Fatal(err)
	}
	data, err := io.ReadAll(reader)
	if err != nil {
		t.Fatal(err)
	}
	if len(data) != 866304 {
		t.Fatalf("输出长度=%d", len(data))
	}
	if got := fmt.Sprintf("%X", sha256.Sum256(data)); got != "ACB2F8E42147DE389D9D5172CE97CE2782E564A01A8E9E636CF981A81D36884C" {
		t.Fatalf("输出哈希不匹配: %s", got)
	}
	var tail [1]byte
	if n, err := reader.Read(tail[:]); n != 0 || err != io.EOF {
		t.Fatalf("容器边界后的读取=%d,%v", n, err)
	}
}

func FuzzNewPanic(f *testing.F) {
	compressedData, err := os.ReadFile("testdata/compressed")
	if err != nil {
		f.Fatal(err)
	}
	f.Add(compressedData, 2097152, 0)
	f.Fuzz(func(t *testing.T, data []byte, windowSize int, resetInterval int) {
		lzxReader, err := New(bytes.NewReader(data), windowSize, resetInterval)
		if err != nil {
			return
		}
		_, _ = io.ReadAll(lzxReader) // 忽略错误，只检查是否发生 panic。
	})
}

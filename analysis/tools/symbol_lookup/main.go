package main

import (
	"encoding/json"
	"fmt"
	"io"
	"os"
	"strconv"

	"QY/internal/symbol"
)

const maxCandidateLength = 0x2000

// 扫描每个 NUL 之前可打印 ASCII 后缀中的候选；候选可能是共享尾部，不证明其为原始符号。
type match struct {
	Path       string `json:"path"`
	FileOffset uint64 `json:"file_offset"`
	Text       string `json:"text"`
	Hash       string `json:"hash"`
}

func main() {
	if err := run(os.Args[1:], os.Stdout); err != nil {
		fmt.Fprintln(os.Stderr, err)
		os.Exit(1)
	}
}

func run(args []string, out io.Writer) error {
	if len(args) < 2 {
		return fmt.Errorf("用法：go run ./analysis/tools/symbol_lookup <哈希> <二进制文件> [二进制文件...]")
	}
	target, err := strconv.ParseUint(args[0], 0, 32)
	if err != nil {
		return fmt.Errorf("无效哈希 %q：%w", args[0], err)
	}

	matches := make([]match, 0)
	for _, path := range args[1:] {
		data, err := os.ReadFile(path)
		if err != nil {
			return fmt.Errorf("读取 %q 失败：%w", path, err)
		}
		matches = append(matches, scan(path, data, uint32(target))...)
	}

	encoder := json.NewEncoder(out)
	encoder.SetIndent("", "  ")
	return encoder.Encode(matches)
}

func scan(path string, data []byte, target uint32) []match {
	var matches []match
	for end, segmentStart := 0, 0; end < len(data); end++ {
		if data[end] != 0 {
			continue
		}

		suffixStart := end
		for suffixStart > segmentStart && data[suffixStart-1] >= 0x20 && data[suffixStart-1] <= 0x7e {
			suffixStart--
		}
		firstStart := suffixStart
		if end-firstStart > maxCandidateLength {
			firstStart = end - maxCandidateLength
		}
		for start := firstStart; start < end; start++ {
			text := string(data[start:end])
			if symbol.StringTableHash(text) == target {
				matches = append(matches, match{
					Path:       path,
					FileOffset: uint64(start),
					Text:       text,
					Hash:       fmt.Sprintf("0x%08x", target),
				})
			}
		}
		segmentStart = end + 1
	}
	return matches
}

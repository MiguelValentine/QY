package main

import (
	"bytes"
	"encoding/binary"
	"encoding/json"
	"image"
	"image/png"
	"os"
	"path/filepath"
	"strconv"
	"strings"
	"testing"

	"QY/internal/objsys"
)

func TestImageExportsPNGWithoutOverwriting(t *testing.T) {
	root := t.TempDir()
	resource := filepath.Join(root, "sample.ale")
	payload := []byte{0, 0, 1, 0, 4, 0, 0, 1, 0, 0xf8}
	frameLength := uint32(24 + len(payload))
	data := make([]byte, 12+int(frameLength)+4)
	copy(data[:4], "ALE\x00")
	binary.LittleEndian.PutUint16(data[4:6], 3)
	binary.LittleEndian.PutUint32(data[6:10], frameLength)
	binary.LittleEndian.PutUint16(data[10:12], 1)
	binary.LittleEndian.PutUint32(data[12:16], frameLength)
	binary.LittleEndian.PutUint32(data[20:24], 1)
	binary.LittleEndian.PutUint32(data[24:28], 1)
	copy(data[36:], payload)
	copy(data[len(data)-4:], "END\x00")
	if err := os.WriteFile(resource, data, 0600); err != nil {
		t.Fatal(err)
	}

	outputPath := filepath.Join(t.TempDir(), "preview.png")
	var output bytes.Buffer
	if err := run([]string{"-client", root, "image", "sample.ale", outputPath}, &output); err != nil {
		t.Fatalf("image 导出失败: %v", err)
	}
	file, err := os.Open(outputPath)
	if err != nil {
		t.Fatal(err)
	}
	decoded, err := png.Decode(file)
	closeErr := file.Close()
	if err != nil {
		t.Fatalf("输出不是有效 PNG: %v", err)
	}
	if closeErr != nil {
		t.Fatal(closeErr)
	}
	r, g, b, a := decoded.At(0, 0).RGBA()
	if decoded.Bounds() != image.Rect(0, 0, 1, 1) || r != 248*257 || g != 0 || b != 0 || a != 0xffff {
		t.Fatalf("PNG 内容不符合预期：范围=%v 像素=%v", decoded.Bounds(), decoded.At(0, 0))
	}

	before, err := os.ReadFile(outputPath)
	if err != nil {
		t.Fatal(err)
	}
	if err := run([]string{"-client", root, "image", "sample.ale", outputPath}, &output); err == nil {
		t.Fatal("image 覆盖了已有输出文件")
	}
	after, err := os.ReadFile(outputPath)
	if err != nil {
		t.Fatal(err)
	}
	if !bytes.Equal(before, after) {
		t.Fatal("拒绝覆盖后已有 PNG 内容发生变化")
	}
	if err := run([]string{"-client", root, "image", "sample.ale", filepath.Join(t.TempDir(), "bad.png"), "1"}, &output); err == nil {
		t.Fatal("image 接受越界帧序号")
	}
}

func TestCheckClientCorpus(t *testing.T) {
	if _, err := os.Stat("CLIENT"); err != nil {
		if os.IsNotExist(err) {
			t.Skip("未提供本地 CLIENT 样本目录")
		}
		t.Fatal(err)
	}

	var output bytes.Buffer
	if err := run([]string{"-client", "CLIENT", "check"}, &output); err != nil {
		t.Fatalf("check 真实客户端失败: %v\n%s", err, output.String())
	}

	for _, count := range []string{"626 个 FCC", "625 个 FC0A", "177 个压缩块", "1 个 FCTB"} {
		if !strings.Contains(output.String(), count) {
			t.Errorf("check 输出未包含 %q，实际输出：%s", count, output.String())
		}
	}
}

func TestInspectIndexOutputsFC0ADocumentJSON(t *testing.T) {
	if _, err := os.Stat("CLIENT/index.fcc"); err != nil {
		if os.IsNotExist(err) {
			t.Skip("未提供本地 CLIENT/index.fcc 样本")
		}
		t.Fatal(err)
	}

	var output bytes.Buffer
	if err := run([]string{"-client", "CLIENT", "inspect", "index.fcc"}, &output); err != nil {
		t.Fatalf("inspect index.fcc 失败: %v", err)
	}

	var module objsys.Module
	if err := json.Unmarshal(output.Bytes(), &module); err != nil {
		t.Fatalf("inspect 输出不是有效 JSON: %v\n%s", err, output.String())
	}
	if module.Path != "index.fcc" {
		t.Errorf("模块路径 = %q，期望 index.fcc", module.Path)
	}
	if len(module.Members) == 0 {
		t.Fatal("index.fcc 未输出任何资源成员")
	}

	hasDocument := false
	for _, member := range module.Members {
		if member.Format == "FC0A" && member.Document != nil {
			hasDocument = true
			if len(member.Document.Tokens) == 0 {
				t.Errorf("FC0A 文档 %q 没有标记", member.Name)
			}
			if len(member.Document.Strings) == 0 {
				t.Errorf("FC0A 文档 %q 没有字符串池", member.Name)
			}
		}
	}
	if !hasDocument {
		t.Fatal("inspect JSON 中未包含可解析的 FC0A 文档")
	}
}

func TestPrepareDefaultsToIndexAndReportsRuntimeGaps(t *testing.T) {
	if _, err := os.Stat("CLIENT/index.fcc"); err != nil {
		if os.IsNotExist(err) {
			t.Skip("未提供本地 CLIENT/index.fcc 样本")
		}
		t.Fatal(err)
	}

	for _, args := range [][]string{{"prepare"}, {"prepare", "index.fcc"}} {
		var output bytes.Buffer
		if err := run(args, &output); err != nil {
			t.Fatalf("命令 %v 失败: %v", args, err)
		}
		var report objsys.Preparation
		if err := json.Unmarshal(output.Bytes(), &report); err != nil {
			t.Fatalf("命令 %v 输出不是有效 JSON: %v", args, err)
		}
		if report.Entry != "index.fcc" {
			t.Errorf("命令 %v 的入口 = %q，期望 index.fcc", args, report.Entry)
		}
		if report.Tokens == 0 || len(report.References) == 0 {
			t.Errorf("命令 %v 未返回真实入口标记或候选引用", args)
		}
		if len(report.MissingRuntime) == 0 {
			t.Errorf("命令 %v 未列出缺失运行能力", args)
		}
	}
}

func TestTokensIndexPrintsStructuredRowsAndHonestPlaceholders(t *testing.T) {
	if _, err := os.Stat("CLIENT/index.fcc"); err != nil {
		if os.IsNotExist(err) {
			t.Skip("未提供本地 CLIENT/index.fcc 样本")
		}
		t.Fatal(err)
	}

	var output bytes.Buffer
	if err := run([]string{"tokens", "index.fcc"}, &output); err != nil {
		t.Fatalf("tokens index.fcc 失败: %v", err)
	}
	text := output.String()
	for _, expected := range []string{
		"成员: ",
		"偏移\t类型\t数值\t标记",
		"class",
		"#include",
		"符号哈希",
		"未知标记",
	} {
		if !strings.Contains(text, expected) {
			t.Errorf("tokens 输出缺少 %q", expected)
		}
	}

	rows := 0
	for _, line := range strings.Split(text, "\n") {
		fields := strings.Split(line, "\t")
		if len(fields) != 4 || !strings.HasPrefix(fields[0], "0x") {
			continue
		}
		if len(fields[0]) != 10 {
			t.Errorf("偏移不是八位十六进制: %q", fields[0])
		}
		if _, err := strconv.ParseUint(fields[0][2:], 16, 32); err != nil {
			t.Errorf("偏移格式无效 %q: %v", fields[0], err)
		}
		if _, err := strconv.ParseUint(fields[1], 10, 16); err != nil {
			t.Errorf("kind 不是十进制整数 %q: %v", fields[1], err)
		}
		if len(fields[2]) != 10 || !strings.HasPrefix(fields[2], "0x") {
			t.Errorf("数值不是八位十六进制: %q", fields[2])
		} else if _, err := strconv.ParseUint(fields[2][2:], 16, 32); err != nil {
			t.Errorf("数值格式无效 %q: %v", fields[2], err)
		}
		rows++
	}
	if rows == 0 {
		t.Fatal("tokens 输出中没有标记数据行")
	}
}

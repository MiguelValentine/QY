package main

import (
	"bytes"
	"errors"
	"os"
	"strings"
	"testing"

	"QY/internal/objsys"
)

func TestCommandErrorsAndHelp(t *testing.T) {
	var output bytes.Buffer
	if err := run(nil, &output); err != nil || !strings.Contains(output.String(), "用法") {
		t.Fatalf("帮助输出异常: %v", err)
	}
	for _, args := range [][]string{
		{"inspect"},
		{"inspect", "../outside"},
		{"unknown"},
	} {
		if err := run(args, &output); err == nil {
			t.Fatalf("命令未返回预期错误: %v", args)
		}
	}
}

func TestRunDistinguishesUnavailableRuntimeFromMissingEntry(t *testing.T) {
	if _, err := os.Stat("CLIENT/index.fcc"); err != nil {
		if os.IsNotExist(err) {
			t.Skip("未提供本地 CLIENT/index.fcc 样本")
		}
		t.Fatal(err)
	}

	var output bytes.Buffer
	err := run([]string{"run"}, &output)
	if !errors.Is(err, objsys.ErrExecutionUnavailable) {
		t.Fatalf("run 默认入口错误 = %v，期望 ErrExecutionUnavailable", err)
	}

	output.Reset()
	err = run([]string{"run", "missing-entry-for-test.fcc"}, &output)
	if err == nil {
		t.Fatal("run 对缺失入口未返回资源错误")
	}
	if errors.Is(err, objsys.ErrExecutionUnavailable) {
		t.Fatalf("缺失入口被错误归类为运行能力缺失: %v", err)
	}
	if !strings.Contains(err.Error(), "资源不存在") {
		t.Fatalf("缺失入口错误没有说明资源不存在: %v", err)
	}
}

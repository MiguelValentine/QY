package objsys

import (
	"encoding/binary"
	"errors"
	"os"
	"path/filepath"
	"strings"
	"testing"
)

func TestPreparePreservesConditionalReferences(t *testing.T) {
	root := t.TempDir()
	if err := os.Mkdir(filepath.Join(root, "scripts"), 0700); err != nil {
		t.Fatal(err)
	}
	if err := os.WriteFile(filepath.Join(root, "Present.fcc"), []byte("FC0A"), 0600); err != nil {
		t.Fatal(err)
	}
	if err := os.Mkdir(filepath.Join(root, "scripts", "directory.dll"), 0700); err != nil {
		t.Fatal(err)
	}
	data := make([]byte, 20)
	copy(data, "FC0A")
	for _, name := range []string{"../present.FCC", `bin\showdown.dll`, "../../outside.fcc", "http://example.test/a.dll", "directory.dll", "任意文本.fcc"} {
		var length [2]byte
		binary.LittleEndian.PutUint16(length[:], uint16(len(name)))
		data = append(data, length[:]...)
		data = append(data, name...)
	}
	binary.LittleEndian.PutUint32(data[16:], uint32(len(data)-20))
	if err := os.WriteFile(filepath.Join(root, "scripts", "entry.fcc"), data, 0600); err != nil {
		t.Fatal(err)
	}
	loader, err := NewLoader(root)
	if err != nil {
		t.Fatal(err)
	}
	report, err := loader.Prepare("scripts/entry.fcc")
	if err != nil {
		t.Fatal(err)
	}
	if len(report.References) != 5 {
		t.Fatalf("资源候选数=%d，预期5", len(report.References))
	}
	if !report.References[0].Available || report.References[0].ClientPath != "Present.fcc" {
		t.Fatalf("相对路径或大小写匹配失败: %+v", report.References[0])
	}
	for _, ref := range report.References[1:] {
		if ref.Available || ref.Issue == "" {
			t.Fatalf("缺失或越界的候选没有说明: %+v", ref)
		}
	}
	if report.References[1].RawPath != `bin\showdown.dll` {
		t.Fatal("修改了原始引用")
	}
	if err := loader.Execute("scripts/entry.fcc"); err == nil ||
		errors.Is(err, ErrExecutionUnavailable) || !strings.Contains(err.Error(), "objsys.dll") {
		t.Fatalf("未报告缺失的系统脚本资源载体: %v", err)
	}
	if err := loader.Execute("missing.fcc"); err == nil || errors.Is(err, ErrExecutionUnavailable) {
		t.Fatalf("掩盖了资源加载错误: %v", err)
	}
}

func TestPrepareRealIndex(t *testing.T) {
	loader, err := NewLoader("../../CLIENT")
	if err != nil {
		t.Fatal(err)
	}
	report, err := loader.Prepare("index.fcc")
	if err != nil {
		t.Fatal(err)
	}
	if report.Tokens == 0 || len(report.References) == 0 {
		t.Fatal("真实入口的标记或资源候选为空")
	}
	for _, ref := range report.References {
		if strings.EqualFold(ref.RawPath, "in/login.fcc") {
			if !ref.Available {
				t.Fatal("入口的登录资源未找到")
			}
			return
		}
	}
	t.Fatal("未找到入口中的登录资源候选")
}

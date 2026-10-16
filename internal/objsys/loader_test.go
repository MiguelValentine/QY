package objsys

import (
	"os"
	"path/filepath"
	"testing"
)

func TestResolveWindowsPaths(t *testing.T) {
	root := t.TempDir()
	if err := os.Mkdir(filepath.Join(root, "Data"), 0700); err != nil {
		t.Fatal(err)
	}
	target := filepath.Join(root, "Data", "Index.FCC")
	if err := os.WriteFile(target, []byte("FC0A"), 0600); err != nil {
		t.Fatal(err)
	}
	target, err := filepath.EvalSymlinks(target)
	if err != nil {
		t.Fatal(err)
	}
	loader, err := NewLoader(root)
	if err != nil {
		t.Fatal(err)
	}
	path, err := loader.Resolve(`data\index.fcc`)
	if err != nil || path != target {
		t.Fatalf("路径 = %q，错误 = %v", path, err)
	}
	for _, bad := range []string{"../escape", "/etc/passwd", `C:\index.fcc`, ""} {
		if _, err := loader.Resolve(bad); err == nil {
			t.Fatalf("接受了无效路径 %q", bad)
		}
	}
	if err := os.Symlink(t.TempDir(), filepath.Join(root, "outside")); err != nil {
		t.Fatal(err)
	}
	if _, err := loader.Resolve("outside"); err == nil {
		t.Fatal("接受了越界符号链接")
	}
}

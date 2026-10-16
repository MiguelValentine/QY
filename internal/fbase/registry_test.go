//go:build !windows

package fbase

import (
	"errors"
	"testing"
)

func TestReadMachineStringUnavailable(t *testing.T) {
	value, err := ReadMachineString("fc2dev", "devcode")
	if !errors.Is(err, ErrRegistryUnavailable) {
		t.Fatalf("期望ErrRegistryUnavailable，得到 %v", err)
	}
	if value != nil {
		t.Fatalf("不可用时不应返回值：%q", value)
	}
}

package symbol

import "testing"

func TestStringTableHashInstructionOracle(t *testing.T) {
	// 期望值由 Unicorn 直接执行 FBase.dll VA 0x10003580 得到；
	// 这些是字符串表桶哈希，不是插件注册的类 ID。
	tests := []struct {
		name string
		want uint32
	}{
		{"CPacManItemSys", 0x7421c220},
		{"CPacManMapSys", 0x0f248d77},
		{"CPacManCoinSys", 0xbcab877e},
		{"showdown", 0x8ba03fa3},
	}
	for _, tt := range tests {
		if got := StringTableHash(tt.name); got != tt.want {
			t.Errorf("StringTableHash(%q) = %#08x, want %#08x", tt.name, got, tt.want)
		}
	}
}

func TestStringTableHashBoundaries(t *testing.T) {
	if got := StringTableHash(""); got != 0 {
		t.Fatalf("StringTableHash(empty) = %#08x, want 0", got)
	}
	if got, want := StringTableHash("ab\x00ignored"), StringTableHash("ab"); got != want {
		t.Fatalf("StringTableHash 应在 NUL 处终止：得到 %#08x，期望 %#08x", got, want)
	}
	if got, want := StringTableHash(string(make([]byte, 8193))), uint32(0); got != want {
		t.Fatalf("StringTableHash 输入以 NUL 开头时得到 %#08x，期望 %#08x", got, want)
	}
}

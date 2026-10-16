package lzw

import (
	"bytes"
	"errors"
	"testing"
)

func TestDecodeKnownPhraseAndKwKwK(t *testing.T) {
	tests := []struct {
		name  string
		codes []int
		want  []byte
	}{
		{name: "dictionary phrase", codes: []int{clearCode, 'A', 'B', 258, endCode}, want: []byte("ABAB")},
		{name: "next dictionary code", codes: []int{clearCode, 'A', 258, endCode}, want: []byte("AAA")},
		{name: "clear midstream", codes: []int{clearCode, 'A', clearCode, 'B', endCode}, want: []byte("AB")},
	}
	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			got, err := Decode(packCodes(tt.codes, 9), len(tt.want))
			if err != nil {
				t.Fatal(err)
			}
			if !bytes.Equal(got, tt.want) {
				t.Fatalf("Decode() = %q, want %q", got, tt.want)
			}
		})
	}
}

func TestDecodeWidthGrowth(t *testing.T) {
	codes := make([]int, 0, 258)
	widths := make([]int, 0, 258)
	codes = append(codes, clearCode)
	widths = append(widths, 9)
	for i := 0; i < 256; i++ {
		codes = append(codes, i)
		if i < 255 {
			widths = append(widths, 9)
		} else {
			widths = append(widths, 10)
		}
	}
	codes = append(codes, endCode)
	widths = append(widths, 10)

	want := make([]byte, 256)
	for i := range want {
		want[i] = byte(i)
	}
	got, err := Decode(packVariable(codes, widths), len(want))
	if err != nil {
		t.Fatal(err)
	}
	if !bytes.Equal(got, want) {
		t.Fatal("decoded bytes do not match literal sequence")
	}
}

func TestDecodeRejectsMalformedStreams(t *testing.T) {
	tests := []struct {
		name string
		src  []byte
		size int
		want error
	}{
		{name: "truncated", src: []byte{0x00}, size: 1, want: ErrTruncated},
		{name: "undefined code", src: packCodes([]int{clearCode, 300, endCode}, 9), size: 1, want: ErrInvalid},
		{name: "wrong output size", src: packCodes([]int{clearCode, 'A', endCode}, 9), size: 2, want: ErrOutputSize},
	}
	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			_, err := Decode(tt.src, tt.size)
			if !errors.Is(err, tt.want) {
				t.Fatalf("Decode() error = %v, want %v", err, tt.want)
			}
		})
	}
}

func packCodes(codes []int, width int) []byte {
	widths := make([]int, len(codes))
	for i := range widths {
		widths[i] = width
	}
	return packVariable(codes, widths)
}

func packVariable(codes, widths []int) []byte {
	var out []byte
	bit := 0
	for i, code := range codes {
		width := widths[i]
		for b := 0; b < width; b++ {
			if bit>>3 == len(out) {
				out = append(out, 0)
			}
			if code&(1<<b) != 0 {
				out[bit>>3] |= 1 << (bit & 7)
			}
			bit++
		}
	}
	return out
}

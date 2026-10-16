package ale

import (
	"crypto/sha256"
	"encoding/binary"
	"encoding/hex"
	"encoding/json"
	"errors"
	"image/color"
	"os"
	"testing"
)

func TestColor565MatchesNativeFullDomain(t *testing.T) {
	data, err := os.ReadFile("../../analysis/evidence/ale-color-oracle.json")
	if err != nil {
		t.Fatal(err)
	}
	var evidence struct {
		Verification struct {
			InputValues int    `json:"input_values"`
			AllMatch    bool   `json:"all_values_match"`
			NativeHash  string `json:"native_output_sha256"`
		} `json:"verification"`
	}
	if err := json.Unmarshal(data, &evidence); err != nil {
		t.Fatal(err)
	}
	if evidence.Verification.InputValues != 65536 || !evidence.Verification.AllMatch {
		t.Fatal("原生颜色转换证据不完整")
	}
	output := make([]byte, 0, 65536*4)
	for raw := 0; raw < 65536; raw++ {
		value := Color565(uint16(raw))
		output = append(output, value.B, value.G, value.R, value.A)
	}
	digest := sha256.Sum256(output)
	if got := hex.EncodeToString(digest[:]); got != evidence.Verification.NativeHash {
		t.Fatalf("Go颜色转换与原生全值域输出不一致：%s", got)
	}
}

func TestColor565UsesNativeZeroLowBits(t *testing.T) {
	for _, test := range []struct {
		raw  uint16
		want color.NRGBA
	}{
		{0, color.NRGBA{A: 255}},
		{0xf800, color.NRGBA{R: 248, A: 255}},
		{0x07e0, color.NRGBA{G: 252, A: 255}},
		{0x001f, color.NRGBA{B: 248, A: 255}},
		{0xffff, color.NRGBA{R: 248, G: 252, B: 248, A: 255}},
	} {
		if got := Color565(test.raw); got != test.want {
			t.Fatalf("原始颜色%#04x转换=%+v，期望%+v", test.raw, got, test.want)
		}
	}
}

func TestPreviewPositionsSkippedRowsAndPreservesTransparency(t *testing.T) {
	payload := []byte{3, 0}
	append16 := func(value uint16) { payload = binary.LittleEndian.AppendUint16(payload, value) }
	append16(0xffff)
	append16(1)
	append16(4)
	payload = append(payload, 1, 1, 0x00, 0xf8)
	frame := Frame{Width: 3, Height: 3, Payload: payload, OffsetX: -5}
	result, err := frame.Preview()
	if err != nil {
		t.Fatal(err)
	}
	if result.Bounds().Dx() != 3 || result.Bounds().Dy() != 3 {
		t.Fatalf("预览尺寸不正确：%v", result.Bounds())
	}
	for _, point := range [][2]int{{0, 0}, {0, 1}, {2, 1}, {1, 2}} {
		if got := result.NRGBAAt(point[0], point[1]); got != (color.NRGBA{}) {
			t.Fatalf("透明位置%v=%+v", point, got)
		}
	}
	if got := result.NRGBAAt(1, 1); got != (color.NRGBA{R: 248, A: 255}) {
		t.Fatalf("跳行后的红色像素=%+v", got)
	}
}

func TestPreviewRejectsUnknownSpecialColorAndExcessiveDimensions(t *testing.T) {
	frame := Frame{Width: 1, Height: 1, Payload: []byte{1, 0, 1, 0, 2, 0, 0, 0xa1}}
	if _, err := frame.Preview(); !errors.Is(err, ErrUnsupported) {
		t.Fatalf("未拒绝缺少颜色的特殊命令：%v", err)
	}
	for _, frame := range []Frame{
		{Width: 0, Height: 1}, {Width: 1, Height: 0},
		{Width: maxDimension + 1, Height: 1},
		{Width: 8192, Height: 8192},
	} {
		if _, err := frame.Preview(); !errors.Is(err, ErrInvalid) {
			t.Fatalf("未拒绝不合理的预览尺寸：%+v，%v", frame, err)
		}
	}
}

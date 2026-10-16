package objsys

import (
	"encoding/json"
	"os"
	"strconv"
	"testing"
)

type atomCacheOracle struct {
	NativeCache struct {
		Sprites []struct {
			Size   int32      `json:"size"`
			Pixels [][]uint16 `json:"pixels"`
		} `json:"sprites"`
		Palette []uint16 `json:"palette"`
	} `json:"native_cache"`
	Cases []struct {
		Size   int32  `json:"size"`
		Color  string `json:"color"`
		Result struct {
			Pixels [][]uint16 `json:"pixels"`
		} `json:"result"`
	} `json:"cases"`
}

func TestBuildAtomCacheMatchesNativeOracle(t *testing.T) {
	data, err := os.ReadFile("../../analysis/evidence/atomsys-cache-oracle.json")
	if err != nil {
		t.Fatal(err)
	}
	var oracle atomCacheOracle
	if err := json.Unmarshal(data, &oracle); err != nil {
		t.Fatal(err)
	}
	colors := [3]uint32{0x00ffd250, 0x00ffd2b4, 0x00000000}
	sprites, palette, err := buildAtomCache(colors)
	if err != nil {
		t.Fatal(err)
	}
	if len(oracle.NativeCache.Sprites) != len(sprites) {
		t.Fatalf("native 缓存项数=%d，期望 %d", len(oracle.NativeCache.Sprites), len(sprites))
	}
	for i, want := range oracle.NativeCache.Sprites {
		got := sprites[i]
		if got.width != want.Size || got.height != want.Size {
			t.Fatalf("缓存[%d] 尺寸=%dx%d，native=%d", i, got.width, got.height, want.Size)
		}
		for y, row := range want.Pixels {
			for x, expected := range row {
				actual := got.pixels[y*int(got.width)+x]
				if actual != expected {
					t.Fatalf("缓存[%d] 像素=(%d,%d)：native=%#04x Go=%#04x",
						i, x, y, expected, actual)
				}
			}
		}
	}
	if len(oracle.NativeCache.Palette) != len(palette) {
		t.Fatalf("native 调色板项数=%d，期望 %d", len(oracle.NativeCache.Palette), len(palette))
	}
	for i, expected := range oracle.NativeCache.Palette {
		if palette[i] != expected {
			t.Fatalf("调色板[%d]：native=%#04x Go=%#04x", i, expected, palette[i])
		}
	}
}

func TestDrawAtomRadialMatchesNativeOracle(t *testing.T) {
	data, err := os.ReadFile("../../analysis/evidence/atomsys-cache-oracle.json")
	if err != nil {
		t.Fatal(err)
	}
	var oracle atomCacheOracle
	if err := json.Unmarshal(data, &oracle); err != nil {
		t.Fatal(err)
	}
	if len(oracle.Cases) != 56 {
		t.Fatalf("native oracle 矢量数=%d，期望 56", len(oracle.Cases))
	}

	mismatches := 0
	for _, testCase := range oracle.Cases {
		color, err := strconv.ParseUint(testCase.Color, 0, 32)
		if err != nil {
			t.Fatalf("解析颜色 %q：%v", testCase.Color, err)
		}
		size := testCase.Size
		sprite := atomSprite{
			width:  size,
			height: size,
			pixels: make([]uint16, int(size*size)),
		}
		center := size / 2
		drawAtomRadial(&sprite, center, center, center+1, center+1, uint32(color))

		for y, row := range testCase.Result.Pixels {
			for x, expected := range row {
				actual := sprite.pixels[y*int(size)+x]
				if actual != expected {
					if mismatches < 40 {
						t.Errorf(
							"size=%d color=%s pixel=(%d,%d)：native=%#04x Go=%#04x",
							size,
							testCase.Color,
							x,
							y,
							expected,
							actual,
						)
					}
					mismatches++
				}
			}
		}
	}
	if mismatches > 0 {
		t.Fatalf("native 像素不匹配数：%d", mismatches)
	}
}

func TestBuildAtomCacheDimensionsAndPalette(t *testing.T) {
	sprites, palette, err := buildAtomCache([3]uint32{
		0x00ffd250,
		0x00ffd2b4,
		0x00000000,
	})
	if err != nil {
		t.Fatal(err)
	}
	wantSizes := []int32{
		5, 5, 5, 5, 5, 6, 6, 7, 7, 8, 9, 10, 11, 12, 13, 14,
		16, 17, 19, 21, 21, 19, 17, 16, 16, 14, 13, 12, 12, 11, 10, 9,
	}
	for i, sprite := range sprites {
		if sprite.width != wantSizes[i] || sprite.height != wantSizes[i] {
			t.Errorf("缓存[%d] 尺寸=%dx%d，期望 %dx%d",
				i, sprite.width, sprite.height, wantSizes[i], wantSizes[i])
		}
		if len(sprite.pixels) != int(wantSizes[i]*wantSizes[i]) {
			t.Errorf("缓存[%d] 像素数=%d，期望 %d",
				i, len(sprite.pixels), wantSizes[i]*wantSizes[i])
		}
	}
	if palette[0] != rgb565(interpolateColor(0, 0x00ffd2b4, 1, 10)) ||
		palette[7] != rgb565(interpolateColor(0, 0x00ffd2b4, 8, 10)) {
		t.Fatalf("颜色表端点不匹配：%#04x ... %#04x", palette[0], palette[7])
	}
}

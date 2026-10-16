package fbase

import (
	"bytes"
	"errors"
	"testing"
)

func TestModeBKnownVector(t *testing.T) {
	c, err := NewCipher(0x12345678, ModeB)
	if err != nil {
		t.Fatal(err)
	}
	got := []byte("native-vector")
	if err := c.Transform(got); err != nil {
		t.Fatal(err)
	}
	want := []byte{0x3b, 0x3b, 0x92, 0x1d, 0xbf, 0x2e, 0xa9, 0x03, 0x5a, 0x37, 0xf9, 0xb7, 0x33}
	if !bytes.Equal(got, want) {
		t.Fatalf("B vector = %x, want %x", got, want)
	}
	if c.State() != 0x2a4c8441 {
		t.Fatalf("B final state = %#08x, want %#08x", c.State(), uint32(0x2a4c8441))
	}
}

func TestModeLKnownVector(t *testing.T) {
	c, err := NewCipher(0, ModeL)
	if err != nil {
		t.Fatal(err)
	}
	got := []byte("AZ09-xyz~")
	if err := c.Transform(got); err != nil {
		t.Fatal(err)
	}
	if want := []byte{0x5e, 0x44, '0', '9', '-', 'd', 'g', 'e', '~'}; !bytes.Equal(got, want) {
		t.Fatalf("L vector = %x, want %x", got, want)
	}
	if c.State() != 5 {
		t.Fatalf("L final state = %d, want 5", c.State())
	}
}

func TestBothModesAreSymmetricWithFreshInitialState(t *testing.T) {
	for _, mode := range []byte{ModeB, ModeL} {
		plain := []byte{0, 1, 'A', 'Z', '0', 0x7d, 0x7e, 0xff, '9'}
		encoded := append([]byte(nil), plain...)
		enc, _ := NewCipher(0x12345678, mode)
		dec, _ := NewCipher(0x12345678, mode)
		if err := enc.Transform(encoded); err != nil {
			t.Fatal(err)
		}
		if err := dec.Transform(encoded); err != nil {
			t.Fatal(err)
		}
		if !bytes.Equal(encoded, plain) {
			t.Fatalf("mode %q round trip = %x, want %x", mode, encoded, plain)
		}
	}
}

func TestTransformChunkingMatchesSingleBuffer(t *testing.T) {
	input := []byte("packet fragments preserve the same rolling state")
	for _, mode := range []byte{ModeB, ModeL} {
		whole, _ := NewCipher(0xfedcba98, mode)
		chunked, _ := NewCipher(0xfedcba98, mode)
		want := append([]byte(nil), input...)
		got := append([]byte(nil), input...)
		if err := whole.Transform(want); err != nil {
			t.Fatal(err)
		}
		start := 0
		for _, end := range []int{0, 1, 7, 7, 19, len(got)} {
			if err := chunked.Transform(got[start:end]); err != nil {
				t.Fatal(err)
			}
			start = end
		}
		if !bytes.Equal(got, want) {
			t.Fatalf("mode %q chunked output = %x, want %x", mode, got, want)
		}
		if chunked.State() != whole.State() {
			t.Fatalf("mode %q chunk state = %#x, want %#x", mode, chunked.State(), whole.State())
		}
	}
}

func TestCipherModeAndLengthBoundaries(t *testing.T) {
	if _, err := NewCipher(0, 'X'); !errors.Is(err, ErrInvalidMode) {
		t.Fatalf("invalid mode error = %v, want ErrInvalidMode", err)
	}
	for _, mode := range []byte{ModeB, ModeL} {
		c, err := NewCipher(0, mode)
		if err != nil {
			t.Fatal(err)
		}
		before := c.State()
		if err := c.Transform(nil); err != nil {
			t.Fatal(err)
		}
		if c.State() != before {
			t.Fatalf("mode %q changed state for empty input", mode)
		}
	}
}

func TestParseHandshakeHeader(t *testing.T) {
	packet := []byte("XXT VCM1x")
	h, err := ParseHandshakeHeader(packet)
	if err != nil {
		t.Fatal(err)
	}
	if string(h.Prefix[:]) != HandshakePrefix || string(h.Version[:]) != HandshakeVersion {
		t.Fatalf("parsed markers = %q/%q", h.Prefix, h.Version)
	}
	if !bytes.Equal(h.Rest, []byte("x")) {
		t.Fatalf("opaque rest = %q, want %q", h.Rest, "x")
	}

	for _, bad := range [][]byte{
		[]byte("XXT VCM1"),
		[]byte("bad!VCM1x"),
		[]byte("XXT bad!x"),
		bytes.Repeat([]byte{'x'}, HandshakeMaxSize+1),
	} {
		if _, err := ParseHandshakeHeader(bad); !errors.Is(err, ErrInvalidHandshake) {
			t.Errorf("ParseHandshakeHeader(%q) error = %v, want ErrInvalidHandshake", bad, err)
		}
	}
}

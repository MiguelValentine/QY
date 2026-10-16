package fcc

import (
	"crypto/sha256"
	"encoding/hex"
	"encoding/json"
	"os"
	"path/filepath"
	"sort"
	"strings"
	"testing"
)

type verificationManifest struct {
	Entries []verificationEntry `json:"entries"`
}

type verificationEntry struct {
	Source        string `json:"source"`
	DecodedFormat string `json:"decoded_format"`
	DecodedSize   int    `json:"decoded_size"`
	DecodedSHA256 string `json:"decoded_sha256"`
	Outputs       []struct {
		Path   string `json:"path"`
		Size   int    `json:"size"`
		SHA256 string `json:"sha256"`
	} `json:"outputs"`
}

func TestAllClientFCCAgainstVerificationManifest(t *testing.T) {
	root := filepath.Clean(filepath.Join("..", ".."))
	manifestBytes, err := os.ReadFile(filepath.Join(root, "analysis/evidence/decode-verification.json"))
	if err != nil {
		t.Fatal(err)
	}
	var manifest verificationManifest
	if err := json.Unmarshal(manifestBytes, &manifest); err != nil {
		t.Fatal(err)
	}
	if len(manifest.Entries) != 626 {
		t.Fatalf("verification manifest has %d entries, want 626", len(manifest.Entries))
	}

	seen := make(map[string]struct{}, len(manifest.Entries))
	for _, entry := range manifest.Entries {
		entry := entry
		t.Run(entry.Source, func(t *testing.T) {
			seen[entry.Source] = struct{}{}
			sourcePath := filepath.Join(root, "CLIENT", filepath.FromSlash(entry.Source))
			source, err := os.ReadFile(sourcePath)
			if err != nil {
				t.Fatal(err)
			}
			decoded, kind, err := Decode(source)
			if err != nil {
				t.Fatal(err)
			}
			if string(kind) != entry.DecodedFormat {
				t.Fatalf("kind = %q, want %q", kind, entry.DecodedFormat)
			}
			assertDigest(t, decoded, entry.DecodedSize, entry.DecodedSHA256)

			members, err := Open(source)
			if err != nil {
				t.Fatal(err)
			}
			want := make([]string, 0, len(entry.Outputs))
			for _, output := range entry.Outputs {
				expectedPath := filepath.Join(root, filepath.FromSlash(output.Path))
				expectedBytes, err := os.ReadFile(expectedPath)
				if err != nil {
					t.Fatal(err)
				}
				assertDigest(t, expectedBytes, output.Size, output.SHA256)
				want = append(want, digestKey(output.Size, output.SHA256))
			}
			got := make([]string, 0, len(members))
			for _, member := range members {
				got = append(got, digestKey(len(member.Data), digest(member.Data)))
			}
			sort.Strings(want)
			sort.Strings(got)
			if strings.Join(got, "\n") != strings.Join(want, "\n") {
				t.Fatalf("member content hashes differ:\n got %v\nwant %v", got, want)
			}
		})
	}
	if len(seen) != 626 {
		t.Fatalf("verified %d unique source files, want 626", len(seen))
	}
}

func TestDecodeRejectsUnknownAndMalformedFormats(t *testing.T) {
	for _, input := range [][]byte{
		nil,
		[]byte("unknown"),
		[]byte("XY20"),
		[]byte("!CD1"),
	} {
		if _, _, err := Decode(input); err == nil {
			t.Fatalf("Decode(%q) unexpectedly succeeded", input)
		}
	}
}

func assertDigest(t *testing.T, data []byte, size int, want string) {
	t.Helper()
	if len(data) != size {
		t.Fatalf("size = %d, want %d", len(data), size)
	}
	if got := digest(data); got != want {
		t.Fatalf("sha256 = %s, want %s", got, want)
	}
}

func digest(data []byte) string {
	sum := sha256.Sum256(data)
	return hex.EncodeToString(sum[:])
}

func digestKey(size int, hash string) string {
	return string(rune(size)) + ":" + hash
}

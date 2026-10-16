package main

import (
	"fmt"
	"os"
	"path/filepath"
	"QY/internal/objsys"
	"QY/internal/symbol"
)

func main() {
	l, _ := objsys.NewLoader("CLIENT")
	var found int
	filepath.Walk("CLIENT", func(path string, info os.FileInfo, err error) error {
		if err != nil || info == nil || info.IsDir() || filepath.Ext(path) != ".fcc" { return nil }
		rel, _ := filepath.Rel("CLIENT", path)
		m, err := l.Load(filepath.ToSlash(rel)); if err != nil { return nil }
		for _, s := range m.Members {
			if s.Document == nil { continue }
			for _, x := range s.Document.Strings {
				if symbol.StringTableHash(string(x.Raw)) == 0x1bc7abd3 {
					fmt.Printf("%s %q\n", rel, x.Raw); found++
				}
			}
		}
		return nil
	})
	fmt.Println("found", found)
}

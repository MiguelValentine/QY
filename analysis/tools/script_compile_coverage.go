package main

import (
	"encoding/json"
	"flag"
	"fmt"
	"os"
	"path/filepath"
	"sort"
	"strings"

	"QY/internal/objsys"
)

type compileReport struct {
	SchemaVersion int            `json:"schema_version"`
	ClientRoot    string         `json:"client_root"`
	TotalFCC      int            `json:"total_fcc"`
	FC0AMembers   int            `json:"fc0a_members"`
	FCTBMembers   int            `json:"fctb_members"`
	OtherMembers  int            `json:"other_members"`
	CompileInputs int            `json:"compile_inputs"`
	CompilePassed int            `json:"compile_passed"`
	CompileFailed int            `json:"compile_failed"`
	ErrorGroups   map[string]int `json:"error_groups"`
	FCTBFiles     []string       `json:"fctb_files"`
	Entries       []entryReport  `json:"entries"`
}

type entryReport struct {
	Path       string   `json:"path"`
	Members    []string `json:"members,omitempty"`
	Compile    string   `json:"compile"`
	BodyNodes  int      `json:"body_nodes,omitempty"`
	Includes   []string `json:"includes,omitempty"`
	ErrorGroup string   `json:"error_group,omitempty"`
	Error      string   `json:"error,omitempty"`
}

func main() {
	root := flag.String("client", "CLIENT", "客户端资源目录")
	output := flag.String("out", "analysis/evidence/script-compile-coverage.json", "JSON 报告路径")
	flag.Parse()

	loader, err := objsys.NewLoader(*root)
	if err != nil {
		fail(err)
	}
	absoluteRoot, err := filepath.Abs(*root)
	if err != nil {
		fail(err)
	}
	paths, err := fccPaths(absoluteRoot)
	if err != nil {
		fail(err)
	}

	report := compileReport{
		SchemaVersion: 1,
		ClientRoot:    filepath.ToSlash(*root),
		TotalFCC:      len(paths),
		ErrorGroups:   make(map[string]int),
		FCTBFiles:     []string{},
		Entries:       make([]entryReport, 0, len(paths)),
	}
	for _, absolutePath := range paths {
		relative, err := filepath.Rel(absoluteRoot, absolutePath)
		if err != nil {
			fail(err)
		}
		name := filepath.ToSlash(relative)
		entry := entryReport{Path: name}
		module, loadErr := loader.Load(name)
		if loadErr != nil {
			entry.Compile = "failed"
		} else {
			for _, member := range module.Members {
				entry.Members = append(entry.Members, member.Format)
				switch member.Format {
				case "FC0A":
					report.FC0AMembers++
				case "FCTB":
					report.FCTBMembers++
				default:
					report.OtherMembers++
				}
			}
			if len(module.Members) == 1 && module.Members[0].Format == "FC0A" {
				report.CompileInputs++
			}
			for _, member := range module.Members {
				if member.Format == "FCTB" {
					report.FCTBFiles = append(report.FCTBFiles, name)
					break
				}
			}
		}

		program, compileErr := loader.Compile(name)
		if compileErr != nil {
			entry.Compile = "failed"
			entry.Error = compileErr.Error()
			entry.ErrorGroup = classifyError(entry.Error)
			report.CompileFailed++
			report.ErrorGroups[entry.ErrorGroup]++
		} else {
			entry.Compile = "passed"
			entry.BodyNodes = len(program.Body)
			entry.Includes = append([]string(nil), program.Includes...)
			report.CompilePassed++
		}
		report.Entries = append(report.Entries, entry)
	}
	sort.Strings(report.FCTBFiles)
	sort.Slice(report.Entries, func(i, j int) bool {
		return report.Entries[i].Path < report.Entries[j].Path
	})

	if err := os.MkdirAll(filepath.Dir(*output), 0755); err != nil {
		fail(err)
	}
	data, err := json.MarshalIndent(report, "", "  ")
	if err != nil {
		fail(err)
	}
	data = append(data, '\n')
	if err := os.WriteFile(*output, data, 0644); err != nil {
		fail(err)
	}
	fmt.Printf("共 %d 个 FCC：编译通过 %d，失败 %d；单 FC0A 入口 %d，FC0A 成员 %d，FCTB 成员 %d，其他成员 %d。\n",
		report.TotalFCC, report.CompilePassed, report.CompileFailed,
		report.CompileInputs, report.FC0AMembers, report.FCTBMembers, report.OtherMembers)
	fmt.Printf("报告：%s\n", *output)
}

func fccPaths(root string) ([]string, error) {
	var paths []string
	err := filepath.WalkDir(root, func(path string, entry os.DirEntry, err error) error {
		if err != nil {
			return err
		}
		if entry.IsDir() || !strings.EqualFold(filepath.Ext(entry.Name()), ".fcc") {
			return nil
		}
		paths = append(paths, path)
		return nil
	})
	sort.Strings(paths)
	return paths, err
}

func classifyError(message string) string {
	lower := strings.ToLower(message)
	switch {
	case strings.Contains(message, "资源不存在") || strings.Contains(message, "资源路径越界") ||
		strings.Contains(message, "包含路径"):
		return "missing_include_or_resource"
	case strings.Contains(message, "预处理指令") || strings.Contains(message, "指令 kind="):
		return "unknown_or_unhandled_directive"
	case strings.Contains(message, "#include") || strings.Contains(message, "#undef") ||
		strings.Contains(message, "#define") || strings.Contains(message, "#if") ||
		strings.Contains(message, "#else") || strings.Contains(message, "#endif") ||
		strings.Contains(message, "宏参数") || strings.Contains(message, "条件指令"):
		return "preprocessor_validation"
	case strings.Contains(message, "尚未恢复的表达式") ||
		strings.Contains(message, "尚未恢复的执行结构") ||
		strings.Contains(message, "需要 kind=") ||
		strings.Contains(message, "类或样式缺少名称") ||
		strings.Contains(message, "语法嵌套超过限制") ||
		strings.Contains(message, "函数参数类型尚未恢复") ||
		strings.Contains(message, "对象声明缺少目标"):
		return "syntax"
	case strings.Contains(message, "脚本输入") || strings.Contains(message, "未支持资源格式"):
		return "unsupported_entry_format_or_members"
	case strings.Contains(message, "尚未恢复"):
		return "unimplemented_language_behavior"
	case strings.Contains(lower, "fc0a:") || strings.Contains(lower, ": fcc:") ||
		strings.Contains(lower, "压缩"):
		return "container_or_decode"
	default:
		return "other"
	}
}

func fail(err error) {
	fmt.Fprintln(os.Stderr, err)
	os.Exit(1)
}

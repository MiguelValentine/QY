package main

import (
	"encoding/json"
	"flag"
	"fmt"
	"io"
	"os"
	"path/filepath"
	"strings"

	"QY/internal/objsys"
)

func main() {
	if err := run(os.Args[1:], os.Stdout); err != nil {
		fmt.Fprintln(os.Stderr, err)
		os.Exit(1)
	}
}

// run 分发资源解析与 Go 脚本运行命令。
func run(args []string, output io.Writer) error {
	flags := flag.NewFlagSet("fcrunner", flag.ContinueOnError)
	flags.SetOutput(output)
	root := flags.String("client", "CLIENT", "客户端资源目录")
	if err := flags.Parse(args); err != nil {
		return err
	}
	args = flags.Args()
	if len(args) == 0 {
		fmt.Fprintln(output, "用法: fcrunner [-client CLIENT] check | inspect <资源.fcc> | tokens <资源.fcc> | image <资源.ale> <输出.png> [帧序号] | preprocess [入口.fcc] | compile [入口.fcc] | prepare [入口.fcc] | run [入口.fcc]")
		fmt.Fprintln(output, "当前支持资源解包、预处理、语法解析与部分脚本求值；完整游戏运行能力仍在恢复。")
		return nil
	}
	loader, err := objsys.NewLoader(*root)
	if err != nil {
		return err
	}
	switch args[0] {
	case "image":
		return exportImage(loader, args, output)
	case "compile":
		if len(args) > 2 {
			return fmt.Errorf("compile 只接受一个入口资源路径")
		}
		entry := "index.fcc"
		if len(args) == 2 {
			entry = args[1]
		}
		program, err := loader.Compile(entry)
		if err != nil {
			return err
		}
		encoder := json.NewEncoder(output)
		encoder.SetIndent("", "  ")
		return encoder.Encode(program)
	case "preprocess":
		if len(args) > 2 {
			return fmt.Errorf("preprocess 只接受一个入口资源路径")
		}
		entry := "index.fcc"
		if len(args) == 2 {
			entry = args[1]
		}
		program, err := loader.Preprocess(entry)
		if err != nil {
			return err
		}
		encoder := json.NewEncoder(output)
		encoder.SetIndent("", "  ")
		return encoder.Encode(program)
	case "tokens":
		if len(args) != 2 {
			return fmt.Errorf("tokens 需要一个 FCC 资源路径")
		}
		module, err := loader.Load(args[1])
		if err != nil {
			return err
		}
		// 此处是保留偏移与原值的标记转储，未恢复的符号不猜测名称。
		for _, member := range module.Members {
			if _, err := fmt.Fprintf(output, "成员: %s\n", member.Name); err != nil {
				return err
			}
			if member.Document == nil {
				if _, err := fmt.Fprintln(output, "FCTB：内部结构尚未恢复"); err != nil {
					return err
				}
				continue
			}
			if _, err := fmt.Fprintln(output, "偏移\t类型\t数值\t标记"); err != nil {
				return err
			}
			for _, token := range member.Document.Tokens {
				if _, err := fmt.Fprintf(output, "0x%08x\t%d\t0x%08x\t%s\n",
					token.Offset, token.Kind, token.Value, member.Document.TokenText(token)); err != nil {
					return err
				}
			}
		}
		return nil
	case "inspect":
		if len(args) != 2 {
			return fmt.Errorf("inspect 需要一个 FCC 资源路径")
		}
		module, err := loader.Load(args[1])
		if err != nil {
			return err
		}
		encoder := json.NewEncoder(output)
		encoder.SetIndent("", "  ")
		return encoder.Encode(module)
	case "check":
		if len(args) != 1 {
			return fmt.Errorf("check 不接受额外参数")
		}
		return checkClient(loader, *root, output)
	case "run":
		if len(args) > 2 {
			return fmt.Errorf("run 只接受一个入口资源路径")
		}
		entry := "index.fcc"
		if len(args) == 2 {
			entry = args[1]
		}
		loader.ReportDiagnostic = func(err error) {
			fmt.Fprintln(output, "系统脚本诊断：", err)
		}
		return loader.Execute(entry)
	case "prepare":
		if len(args) > 2 {
			return fmt.Errorf("prepare 只接受一个入口资源路径")
		}
		entry := "index.fcc"
		if len(args) == 2 {
			entry = args[1]
		}
		report, err := loader.Prepare(entry)
		if err != nil {
			return err
		}
		encoder := json.NewEncoder(output)
		encoder.SetIndent("", "  ")
		return encoder.Encode(report)
	default:
		return fmt.Errorf("未知命令 %q", args[0])
	}
}

// checkClient 对客户端原始资源逐一解包、解压并验证记录边界。
func checkClient(loader *objsys.Loader, root string, output io.Writer) error {
	root, err := filepath.EvalSymlinks(root)
	if err != nil {
		return err
	}
	var files, documents, tokens, blobs, tables int
	err = filepath.WalkDir(root, func(path string, entry os.DirEntry, err error) error {
		if err != nil || entry.IsDir() || !strings.EqualFold(filepath.Ext(path), ".fcc") {
			return err
		}
		name, err := filepath.Rel(root, path)
		if err != nil {
			return err
		}
		module, err := loader.Load(name)
		if err != nil {
			return err
		}
		files++
		for _, member := range module.Members {
			if member.Document == nil {
				tables++
				continue
			}
			documents++
			tokens += len(member.Document.Tokens)
			for _, token := range member.Document.Tokens {
				if token.Compressed {
					blobs++
				}
			}
		}
		return nil
	})
	if err != nil {
		return err
	}
	if files == 0 {
		return fmt.Errorf("客户端目录中未找到 FCC 资源")
	}
	fmt.Fprintf(output, "校验通过：%d 个 FCC，%d 个 FC0A，%d 个标记，%d 个压缩块，%d 个 FCTB（仅识别格式）。\n",
		files, documents, tokens, blobs, tables)
	return nil
}

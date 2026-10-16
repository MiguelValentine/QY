// fcrunner 创建桌面窗口，并从原始客户端资源执行游戏入口。
package main

import (
	"flag"
	"fmt"
	"net/http"
	"os"
	"time"

	"QY/internal/gamewindow"
	"QY/internal/objsys"
)

func main() {
	root := flag.String("client", "CLIENT", "客户端资源目录")
	entry := flag.String("entry", "index.fcc", "游戏入口资源")
	network := flag.Bool("network", false, "启用客户端脚本指定的资源服务器请求")
	flag.Parse()
	if flag.NArg() != 0 {
		fmt.Fprintln(os.Stderr, "用法: fcrunner [-client CLIENT] [-entry index.fcc] [-network]")
		os.Exit(1)
	}
	if err := execute(*root, *entry, *network); err != nil {
		fmt.Fprintln(os.Stderr, err)
		os.Exit(1)
	}
}

func execute(root, entry string, network bool) error {
	loader, err := objsys.NewLoader(root)
	if err != nil {
		return err
	}
	if network {
		loader.ResourceHTTPClient = &http.Client{Timeout: 5 * time.Second}
	}
	loader.ReportDiagnostic = func(err error) {
		fmt.Fprintln(os.Stderr, "运行诊断：", err)
	}
	// 先确认入口可编译，资源错误不必打开窗口。
	if _, err := loader.Compile(entry); err != nil {
		return err
	}
	return gamewindow.Run(func(window *gamewindow.Window) error {
		return loader.ExecuteWithWindow(entry, window)
	})
}

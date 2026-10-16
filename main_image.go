package main

import (
	"fmt"
	"image/png"
	"io"
	"os"
	"strconv"

	"QY/internal/ale"
	"QY/internal/objsys"
)

func exportImage(loader *objsys.Loader, args []string, output io.Writer) error {
	if len(args) < 3 || len(args) > 4 {
		return fmt.Errorf("image 需要资源路径、PNG 输出路径和可选帧序号")
	}
	frameIndex := uint64(0)
	if len(args) == 4 {
		var err error
		frameIndex, err = strconv.ParseUint(args[3], 10, 32)
		if err != nil {
			return fmt.Errorf("image 帧序号无效 %q: %w", args[3], err)
		}
	}
	inputPath, err := loader.Resolve(args[1])
	if err != nil {
		return err
	}
	data, err := os.ReadFile(inputPath)
	if err != nil {
		return err
	}
	file, err := ale.Parse(data)
	if err != nil {
		return fmt.Errorf("%s: %w", args[1], err)
	}
	if frameIndex >= uint64(len(file.Frames)) {
		return fmt.Errorf("image 帧序号 %d 超出范围（共 %d 帧）", frameIndex, len(file.Frames))
	}
	preview, err := file.Frames[frameIndex].Preview()
	if err != nil {
		return fmt.Errorf("%s 第%d帧: %w", args[1], frameIndex, err)
	}

	out, err := os.OpenFile(args[2], os.O_WRONLY|os.O_CREATE|os.O_EXCL, 0600)
	if err != nil {
		return fmt.Errorf("创建 PNG 输出失败（不会覆盖已有文件）: %w", err)
	}
	keepOutput := false
	defer func() {
		if !keepOutput {
			_ = os.Remove(args[2])
		}
	}()
	if err := png.Encode(out, preview); err != nil {
		_ = out.Close()
		return fmt.Errorf("编码 PNG 失败: %w", err)
	}
	if err := out.Close(); err != nil {
		return fmt.Errorf("关闭 PNG 输出失败: %w", err)
	}
	keepOutput = true
	_, err = fmt.Fprintf(output, "已导出第%d帧：%s（%dx%d）\n",
		frameIndex, args[2], preview.Bounds().Dx(), preview.Bounds().Dy())
	return err
}

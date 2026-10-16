package objsys

import (
	"bytes"
	"fmt"
	"image"
	"image/gif"
	"image/jpeg"
	"os"
	"strconv"
	"strings"

	"QY/internal/ale"
)

// ImageResource 保存图片容器；帧绘制仍需使用对应格式的解码规则。
type ImageResource struct {
	Name   string
	AEX    *ale.AEXFile
	ALE    *ale.File
	Frames []ale.AEXFrame
	Bitmap image.Image
	Slice  []int32
}

// loadImageResource 读取已确认的内置 IMG 资源和客户端 ALE/AEX、JPEG 文件。
func (l *Loader) loadImageResource(name []byte) (*ImageResource, error) {
	name = nulBytes(name)
	var slice []int32
	if index := bytes.IndexByte(name, '#'); index >= 0 {
		if bytes.Equal(name, []byte("ToolTips.ale#0")) {
			return nil, fmt.Errorf("图片路径为空或带有尚未恢复的切片参数：%q", name)
		}
		raw := string(name[index+1:])
		for _, item := range strings.Split(raw, ",") {
			value, err := strconv.ParseInt(item, 10, 32)
			if err != nil {
				// mask 等文本模式由原生绘制器解释，资源读取阶段只需保留基础图片。
				continue
			}
			slice = append(slice, int32(value))
		}
		name = name[:index]
	}
	if len(name) == 0 || bytes.ContainsRune(name, '#') {
		return nil, fmt.Errorf("图片路径为空或带有尚未恢复的切片参数：%q", name)
	}
	var data []byte
	var err error
	if strings.HasPrefix(strings.ToLower(string(name)), "res$") {
		file, resolveErr := l.Resolve("objsys.dll")
		if resolveErr != nil {
			return nil, resolveErr
		}
		module, readErr := os.ReadFile(file)
		if readErr != nil {
			return nil, readErr
		}
		data, err = readPEResource(module, "IMG", strings.ToUpper(string(name[4:])), 2052)
	} else {
		file, resolveErr := l.Resolve(string(name))
		if resolveErr != nil {
			return nil, resolveErr
		}
		info, statErr := os.Stat(file)
		if statErr != nil {
			return nil, statErr
		}
		if !info.Mode().IsRegular() || info.Size() > 64<<20 {
			return nil, fmt.Errorf("图片资源必须是不超过 64 MiB 的普通文件")
		}
		data, err = os.ReadFile(file)
	}
	if err != nil {
		return nil, fmt.Errorf("图片资源 %q：%w", name, err)
	}
	result := &ImageResource{Name: string(name), Slice: slice}
	if bytes.HasPrefix(data, []byte{0xff, 0xd8}) {
		var config image.Config
		config, err = jpeg.DecodeConfig(bytes.NewReader(data))
		if err == nil {
			if config.Width <= 0 || config.Height <= 0 ||
				int64(config.Width)*int64(config.Height) > 1<<24 {
				err = fmt.Errorf("JPEG 图片尺寸超出宿主支持范围")
			} else {
				result.Bitmap, err = jpeg.Decode(bytes.NewReader(data))
			}
		}
	} else if bytes.HasPrefix(data, []byte("AEX\x00")) {
		result.AEX, err = ale.ParseAEX(data)
		if err == nil {
			result.Frames, err = result.AEX.PrepareFrames()
		}
	} else if strings.HasPrefix(strings.ToLower(string(name)), "com/") && strings.HasSuffix(strings.ToLower(string(name)), ".gif") {
		result.Bitmap, err = gif.Decode(bytes.NewReader(data))
	} else if bytes.HasPrefix(data, []byte("GIF8")) {
		result.Bitmap, err = gif.Decode(bytes.NewReader(data))
	} else {
		result.ALE, err = ale.Parse(data)
	}
	if err != nil {
		return nil, fmt.Errorf("图片资源 %q：%w", name, err)
	}
	return result, nil
}

package ale

import (
	"bytes"
	"encoding/binary"
	"fmt"
	"image"
	"image/gif"
	"image/jpeg"
)

const (
	maxAEXFileSize       = 64 << 20
	maxAEXDescriptors    = 4096
	maxAEXPayloadSize    = 16 << 20
	maxAEXGIFDimension   = 16384
	maxAEXGIFTotalPixels = 1 << 26
)

// AEXFile 保存已确认的 AEX 外层字段和最多两个嵌入图像平面。
type AEXFile struct {
	Key         [8]byte
	Metadata    [5]uint32
	Descriptors []AEXDescriptor
	Planes      [3]*AEXPlane
}

// AEXDescriptor 按原顺序保留六个 DWORD，不解释其字段语义。
type AEXDescriptor struct {
	Values [6]uint32
}

// AEXPlane 保存解密后的 GIF 或 JPEG 字节、配置和解码结果。
type AEXPlane struct {
	Payload []byte
	Config  image.Config
	GIF     *gif.GIF
	Bitmap  image.Image
}

// ParseAEX 解析 AEX 外层容器并解密、解码前两个非空图像平面。
// 输入切片不会被修改；GIF 和 JPEG 图像由标准库解码得到。
func ParseAEX(data []byte) (*AEXFile, error) {
	if len(data) < 4 || string(data[:4]) != "AEX\x00" {
		return nil, ErrUnknownFormat
	}
	if len(data) > maxAEXFileSize {
		return nil, fmt.Errorf("%w: AEX 文件超过大小上限", ErrInvalid)
	}
	if len(data) < 32 {
		return nil, fmt.Errorf("%w: AEX 固定头部被截断", ErrInvalid)
	}

	result := &AEXFile{}
	copy(result.Key[:], data[4:12])
	for i := range result.Metadata {
		start := 12 + i*4
		result.Metadata[i] = binary.LittleEndian.Uint32(data[start : start+4])
	}

	descriptorCount := uint64(result.Metadata[0])
	if descriptorCount == 0 || descriptorCount > maxAEXDescriptors {
		return nil, fmt.Errorf("%w: AEX 描述符数量超出支持范围", ErrInvalid)
	}
	if result.Metadata[4] != 0 {
		return nil, fmt.Errorf("%w: AEX 第三段数据的格式尚未确认", ErrUnsupported)
	}

	expectedLength := uint64(32) + descriptorCount*24
	for _, payloadLength := range result.Metadata[2:4] {
		if payloadLength > maxAEXPayloadSize {
			return nil, fmt.Errorf("%w: AEX 平面长度超出支持范围", ErrInvalid)
		}
		expectedLength += uint64(payloadLength)
	}
	if expectedLength != uint64(len(data)) {
		return nil, fmt.Errorf("%w: AEX 元数据长度与文件长度不符", ErrInvalid)
	}

	result.Descriptors = make([]AEXDescriptor, int(descriptorCount))
	position := 32
	for i := range result.Descriptors {
		for field := range result.Descriptors[i].Values {
			result.Descriptors[i].Values[field] = binary.LittleEndian.Uint32(data[position : position+4])
			position += 4
		}
	}

	encrypted := result.Key != [8]byte{'0', '0', '0', '0', '0', '0', '0', '0'}
	for slot, payloadLength := range result.Metadata[2:4] {
		if payloadLength == 0 {
			continue
		}
		end := position + int(payloadLength)
		payload := bytes.Clone(data[position:end])
		position = end
		if encrypted {
			for i := range payload {
				payload[i] -= result.Key[i%len(result.Key)]
			}
		}
		plane, err := decodeAEXPlane(payload)
		if err != nil {
			return nil, fmt.Errorf("%w: AEX 平面 %d：%v", ErrInvalid, slot, err)
		}
		result.Planes[slot] = plane
	}
	if position != len(data) {
		return nil, fmt.Errorf("%w: AEX 平面数据边界不一致", ErrInvalid)
	}

	return result, nil
}

func decodeAEXPlane(payload []byte) (*AEXPlane, error) {
	if bytes.HasPrefix(payload, []byte{0xff, 0xd8}) {
		config, err := jpeg.DecodeConfig(bytes.NewReader(payload))
		if err != nil {
			return nil, fmt.Errorf("JPEG 头部无效：%w", err)
		}
		if config.Width < 1 || config.Height < 1 ||
			config.Width > maxAEXGIFDimension || config.Height > maxAEXGIFDimension ||
			uint64(config.Width)*uint64(config.Height) > maxAEXGIFTotalPixels {
			return nil, fmt.Errorf("JPEG 尺寸超出支持范围")
		}
		bitmap, err := jpeg.Decode(bytes.NewReader(payload))
		if err != nil {
			return nil, fmt.Errorf("JPEG 数据无效：%w", err)
		}
		return &AEXPlane{Payload: payload, Config: config, Bitmap: bitmap}, nil
	}
	config, err := gif.DecodeConfig(bytes.NewReader(payload))
	if err != nil {
		return nil, fmt.Errorf("GIF 头部无效：%w", err)
	}
	if config.Width < 1 || config.Height < 1 ||
		config.Width > maxAEXGIFDimension || config.Height > maxAEXGIFDimension ||
		uint64(config.Width)*uint64(config.Height) > maxAEXGIFTotalPixels {
		return nil, fmt.Errorf("GIF 尺寸或格式超出支持范围")
	}

	decoded, err := gif.DecodeAll(bytes.NewReader(payload))
	if err != nil {
		return nil, fmt.Errorf("GIF 数据无效：%w", err)
	}
	if len(decoded.Image) == 0 || decoded.Config.Width != config.Width ||
		decoded.Config.Height != config.Height {
		return nil, fmt.Errorf("GIF 帧数据与头部尺寸不一致")
	}

	var totalPixels uint64
	for _, frame := range decoded.Image {
		bounds := frame.Bounds()
		width, height := bounds.Dx(), bounds.Dy()
		if width < 1 || height < 1 || width > maxAEXGIFDimension || height > maxAEXGIFDimension {
			return nil, fmt.Errorf("GIF 帧尺寸超出支持范围")
		}
		totalPixels += uint64(width) * uint64(height)
		if totalPixels > maxAEXGIFTotalPixels {
			return nil, fmt.Errorf("GIF 总帧像素数超出支持范围")
		}
	}

	return &AEXPlane{Payload: payload, Config: config, GIF: decoded}, nil
}

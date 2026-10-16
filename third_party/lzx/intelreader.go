package lzx

import (
	"encoding/binary"
	"io"
)

type intelReader struct {
	Internal io.Reader

	buffer    []byte
	readErr   error
	remaining int64

	*persistentData
}

func (i *intelReader) Read(b []byte) (int, error) {
	if len(b) == 0 {
		return 0, nil
	}
	if len(i.buffer) == 0 {
		if i.readErr != nil {
			return 0, i.readErr
		}
		if i.remaining == 0 {
			return 0, io.EOF
		}
		size := int64(frameSize)
		if i.remaining >= 0 && i.remaining < size {
			size = i.remaining
		}
		frame := make([]byte, int(size))
		n, err := io.ReadFull(i.Internal, frame)
		i.readErr = err
		if n == 0 {
			return 0, err
		}
		frame = frame[:n]
		// 地址转换按输出帧进行，既不受压缩块边界影响，也不受调用方分块影响。
		// 帧末十个字节内的指令前缀不做转换，字典始终保留转换前的数据。
		if i.IntelStarted && i.IntelFileSize != 0 && i.IntelCursorPosition/frameSize < 32768 {
			for index := 0; index < len(frame)-10; {
				if frame[index] != 0xe8 {
					index++
					continue
				}
				operand := frame[index+1 : index+5]
				absolute := int32(binary.LittleEndian.Uint32(operand))
				position := int32(i.IntelCursorPosition + index)
				fileSize := int32(i.IntelFileSize)
				if absolute >= -position && absolute < fileSize {
					relative := absolute + fileSize
					if absolute >= 0 {
						relative = absolute - position
					}
					binary.LittleEndian.PutUint32(operand, uint32(relative))
				}
				index += 5
			}
		}
		i.IntelCursorPosition += n
		if i.remaining >= 0 {
			i.remaining -= int64(n)
		}
		i.buffer = frame
	}
	n := copy(b, i.buffer)
	i.buffer = i.buffer[n:]
	return n, nil
}

package objsys

import "math"

type atomSprite struct {
	width, height int32
	pixels        []uint16
}

func buildAtomCache(colors [3]uint32) ([32]atomSprite, [8]uint16, error) {
	var sprites [32]atomSprite
	var palette [8]uint16

	for i := int32(0); i < 32; i++ {
		a := int32(57) - 3*i
		s := i
		if a < 0 {
			s = a/4 + 19
		}
		size := int32(5) + ((s*s*16)/19)/19
		center := size / 2
		sprite := atomSprite{
			width:  size,
			height: size,
			pixels: make([]uint16, int(size*size)),
		}

		centerColor := rgb565(interpolateColor(colors[2], colors[1], i, 32))
		sprite.pixels[center*size+center] = centerColor

		glow := interpolateColor(0, colors[0], 7, 10)
		drawAtomRadial(&sprite, center, center, center+1, center+1, glow)

		edge := rgb565(interpolateColor(0, colors[2], i+16, 96))
		for _, point := range [][2]int32{
			{center + 1, center + 1},
			{center - 1, center - 1},
			{center - 1, center + 1},
			{center + 1, center - 1},
		} {
			addAtomPixel(&sprite, point[0], point[1], edge)
		}
		sprites[i] = sprite
	}

	for i := int32(1); i <= 8; i++ {
		palette[i-1] = rgb565(interpolateColor(0, colors[1], i, 10))
	}
	return sprites, palette, nil
}

func interpolateColor(from, to uint32, step, denominator int32) uint32 {
	if step < 0 {
		return from
	}
	if step >= denominator {
		return to
	}
	var result uint32
	for shift := uint(0); shift < 32; shift += 8 {
		start := int32((from >> shift) & 0xff)
		end := int32((to >> shift) & 0xff)
		channel := start + (end-start)*step/denominator
		result |= uint32(channel&0xff) << shift
	}
	return result
}

func rgb565(color uint32) uint16 {
	return uint16((color>>8)&0xf800 | (color>>5)&0x07e0 | (color>>3)&0x001f)
}

func drawAtomRadial(sprite *atomSprite, centerX, centerY, radiusX, radiusY int32, color uint32) {
	if radiusX <= 0 || radiusY <= 0 {
		return
	}
	for x := -radiusX; x < radiusX; x++ {
		factor := 1 - math.Sqrt(float64(abs32(x))/float64(radiusX))
		addAtomPixel(sprite, centerX+x, centerY, scaleAtomColor(color, factor))
	}
	for y := int32(1); y < radiusY; y++ {
		factorY := float64(float32(1 - math.Sqrt(float64(y)/float64(radiusY))))
		axisColor := scaleAtomColor(color, factorY)
		addAtomPixel(sprite, centerX, centerY+y, axisColor)
		addAtomPixel(sprite, centerX, centerY-y, axisColor)

		remaining := radiusX*radiusX - (y*y*radiusX*radiusX)/(radiusY*radiusY)
		if remaining <= 0 {
			continue
		}
		xLimit := int32(math.Sqrt(float64(remaining)))
		for x := int32(1); x < xLimit; x++ {
			distance := math.Sqrt(
				float64(x*x)/(float64(radiusX)*float64(radiusX)) +
					float64(y*y)/(float64(radiusY)*float64(radiusY)),
			)
			factor := 1 - math.Sqrt(distance)
			scaled := scaleAtomColor(color, factor)
			addAtomPixel(sprite, centerX+x, centerY+y, scaled)
			addAtomPixel(sprite, centerX-x, centerY+y, scaled)
			addAtomPixel(sprite, centerX+x, centerY-y, scaled)
			addAtomPixel(sprite, centerX-x, centerY-y, scaled)
		}
	}
}

func scaleAtomColor(color uint32, factor float64) uint16 {
	if factor <= 0 {
		return 0
	}
	red := int32(float64((color>>16)&0xff) * factor)
	green := int32(float64((color>>8)&0xff) * factor)
	blue := int32(float64(color&0xff) * factor)
	return uint16(red>>3)<<11 | uint16(green>>2)<<5 | uint16(blue>>3)
}

func addAtomPixel(sprite *atomSprite, x, y int32, color uint16) {
	if x < 0 || y < 0 || x >= sprite.width || y >= sprite.height {
		return
	}
	index := y*sprite.width + x
	current := sprite.pixels[index]
	red := minInt32(int32((current>>11)&0x1f)+int32((color>>11)&0x1f), 0x1f)
	green := minInt32(int32((current>>5)&0x3f)+int32((color>>5)&0x3f), 0x3f)
	blue := minInt32(int32(current&0x1f)+int32(color&0x1f), 0x1f)
	sprite.pixels[index] = uint16(red)<<11 | uint16(green)<<5 | uint16(blue)
}

func abs32(value int32) int32 {
	if value < 0 {
		return -value
	}
	return value
}

func minInt32(left, right int32) int32 {
	if left < right {
		return left
	}
	return right
}

package objsys

import (
	"fmt"
	"math"

	"QY/internal/script"
)

// AtomSystem 保存 atomsys 的粒子及发射状态；缓存和绘制另行处理。
type AtomSystem struct {
	*Wnd
	colors                 [3]uint32
	accelerationX          float32
	accelerationY          float32
	previousX, previousY   int32
	angleStart, angleRange int32
	particles              []*atomParticle
	random                 func() int32
	sprites                [32]atomSprite
	pixelColors            [8]uint16
}

// NewAtomSystem 对应 0x1001feb0；构造时立即生成真实粒子缓存。
func NewAtomSystem(desktop *Desktop) (*AtomSystem, error) {
	if desktop == nil {
		return nil, fmt.Errorf("atomsys 缺少桌面宿主")
	}
	a := &AtomSystem{
		Wnd: NewWnd(desktop), colors: [3]uint32{0x00ffd250, 0x00ffd2b4, 0},
		accelerationY: 0.9, angleRange: 360, random: desktop.nextAtomRandom,
	}
	if err := a.rebuildCache(); err != nil {
		return nil, err
	}
	write := a.Object.WriteMember
	a.Object.WriteMember = func(key uint32, value script.Value) (bool, error) {
		switch key {
		case 0x7d69d3c0, 0x5f716529, 0x957a81b6:
			if value.Kind != "int" {
				return true, fmt.Errorf("atomsys 颜色的非整数转换尚未恢复")
			}
			index := 0
			if key == 0x5f716529 {
				index = 1
			} else if key == 0x957a81b6 {
				index = 2
			}
			a.colors[index] = uint32(value.Integer)
			return true, a.rebuildCache()
		case 0x0e9b968e, 0x4e4ebe3a, 0x13d8ce80:
			if value.Kind != "tuple" || len(value.Items) < 2 ||
				value.Items[0].Kind != "int" || value.Items[1].Kind != "int" {
				return true, fmt.Errorf("atomsys 属性 0x%08x 需要两个整数", key)
			}
			x, y := value.Items[0].Integer, value.Items[1].Integer
			switch key {
			case 0x0e9b968e:
				a.accelerationX = float32(float64(x) * float64(float32(0.01)))
				a.accelerationY = float32(float64(y) * float64(float32(0.01)))
			case 0x4e4ebe3a:
				a.previousX, a.previousY = x, y
			case 0x13d8ce80:
				a.angleStart, a.angleRange = x, y
				if a.angleRange < 1 {
					a.angleRange = 1
				}
			}
			return true, nil
		case 0x6d166ec0:
			return true, a.emit(value)
		case 0x646b5c41:
			return true, a.emitTrail(value)
		}
		return write(key, value)
	}
	return a, nil
}

func (a *AtomSystem) rebuildCache() error {
	sprites, colors, err := buildAtomCache(a.colors)
	if err == nil {
		a.sprites, a.pixelColors = sprites, colors
	}
	return err
}

func (d *Desktop) nextAtomRandom() int32 {
	d.atomRandomState = d.atomRandomState*0x343fd + 0x269ec3
	return int32((d.atomRandomState >> 16) & 0x7fff)
}

// RegisterAtomFactory 登记 atomsys；显示阶段仍需消费其粒子与缓存。
func RegisterAtomFactory(runtime *script.Runtime, desktop *Desktop) {
	runtime.RegisterObjectFactory(0x3b653334, func(*script.Object) (*script.Object, error) {
		a, err := NewAtomSystem(desktop)
		if err != nil {
			return nil, err
		}
		desktop.AtomSystems = append(desktop.AtomSystems, a)
		desktop.Windows = append(desktop.Windows, a.Wnd)
		return a.Object, nil
	})
}

func (a *AtomSystem) emit(value script.Value) error {
	args := value.Items
	if value.Kind != "tuple" || len(args) < 7 || len(args) > 8 {
		return fmt.Errorf("atomsys 发射需要七个整数及可选分裂阈值")
	}
	v := [8]int32{0, 0, 0, 0, 0, 0, 0, -1}
	for i, arg := range args {
		if arg.Kind != "int" {
			return fmt.Errorf("atomsys 发射第%d项需要整数", i+1)
		}
		v[i] = arg.Integer
	}
	if v[4] < 5 {
		v[4] = 5
	}
	// 原生自动阈值使用 life/3+3 作随机余数的除数。
	if v[2] > 0 && v[7] < 0 && v[5]/3+3 == 0 {
		return fmt.Errorf("atomsys 自动分裂阈值的随机除数为零")
	}
	for i := int32(0); i < v[2]; i++ {
		speed := a.random()%v[4] + v[3]
		angle := a.random()%a.angleRange + a.angleStart
		split := v[7]
		if split < 0 {
			split = v[5] - a.random()%(v[5]/3+3) - 5
		}
		life := a.random()%900 + v[5]
		a.particles = append(a.particles,
			newAtomParticle(v[0], v[1], speed, angle, life, v[6], split))
	}
	return nil
}

func (a *AtomSystem) emitTrail(value script.Value) error {
	if value.Kind != "tuple" || len(value.Items) != 7 {
		return fmt.Errorf("atomsys 轨迹发射需要七个整数")
	}
	var v [7]int32
	for i, arg := range value.Items {
		if arg.Kind != "int" {
			return fmt.Errorf("atomsys 轨迹发射第%d项需要整数", i+1)
		}
		v[i] = arg.Integer
	}
	if v[0] == a.previousX && v[1] == a.previousY {
		return nil
	}
	dx, dy := v[0]-a.previousX, v[1]-a.previousY
	squared := dx*dx + dy*dy
	if squared < 0 {
		return fmt.Errorf("atomsys 轨迹距离的平方发生有符号溢出")
	}
	distance := int32(math.Sqrt(float64(squared)))
	if distance < 4 || distance > 1000 {
		return nil
	}
	if v[2] < 1 {
		v[2] = 1
	}
	if v[4] < 10 {
		v[4] = 10
	}
	for step := int32(0); step < distance; step += 13 {
		x := a.previousX + dx*step/distance
		y := a.previousY + dy*step/distance
		for i := int32(0); i < v[2]; i++ {
			speed := a.random()%v[4] + v[3]
			angle := a.random()%a.angleRange + a.angleStart
			divisor := speed/2 + 3
			if divisor == 0 {
				return fmt.Errorf("atomsys 轨迹分裂阈值的随机除数为零")
			}
			split := speed - a.random()%divisor - 5
			life := a.random() % 900
			offsetY := a.random()%10 - 5
			offsetX := a.random()%10 - 5
			// 原生抽取七项，但第六项未用于此分支，阻尼来自第七项。
			a.particles = append(a.particles,
				newAtomParticle(x+offsetX, y+offsetY, speed, angle, life, v[6], split))
		}
	}
	a.previousX, a.previousY = v[0], v[1]
	return nil
}

func (a *AtomSystem) update() {
	// 原生尾插的新粒子会在同次链表遍历中继续更新。
	for i := 0; i < len(a.particles); {
		p := a.particles[i]
		if p.life < 50 {
			copy(a.particles[i:], a.particles[i+1:])
			a.particles[len(a.particles)-1] = nil
			a.particles = a.particles[:len(a.particles)-1]
			continue
		}
		a.particles = append(a.particles, p.advance(a.accelerationX, a.accelerationY, a.random)...)
		i++
	}
	if len(a.particles) > 0 {
		a.Dirty = true
	}
}

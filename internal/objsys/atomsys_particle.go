package objsys

import "math"

// atomParticle 对应原生 0x1001f940 初始化的七个粒子字段。
type atomParticle struct {
	x, y, vx, vy float32
	life, split  int32
	drag         float32
}

func newAtomParticle(x, y, speed, angle, life, drag, split int32) *atomParticle {
	radians := float64(angle) * (math.Pi / 180)
	p := &atomParticle{
		x: float32(x), y: float32(y), life: life, split: split,
		drag: float32(float64(drag) * float64(float32(0.01))),
		vx:   float32(math.Cos(radians) * float64(speed) * float64(float32(0.1))),
		vy:   float32(math.Sin(radians) * float64(speed) * float64(float32(-0.1))),
	}
	if p.life > 10000 {
		p.life = 10000
	}
	return p
}

// addVelocity 对应原生 0x1001fc50；方向角使用度，屏幕纵轴向下。
func (p *atomParticle) addVelocity(speed, angle int32) {
	radians := float64(angle) * (math.Pi / 180)
	p.vx = float32(float64(p.vx) + math.Cos(radians)*float64(speed)*float64(float32(0.1)))
	p.vy = float32(float64(p.vy) - math.Sin(radians)*float64(speed)*float64(float32(0.1)))
}

// advance 对应 0x10020661–0x100207dc；随机数函数由粒子系统提供。
func (p *atomParticle) advance(ax, ay float32, random func() int32) []*atomParticle {
	p.x += p.vx
	p.y += p.vy
	// 原生先保存乘积，但 x87 栈仍以未截断的乘积加上加速度。
	p.vx = float32(float64(p.vx)*float64(p.drag) + float64(ax))
	p.vy = float32(float64(p.vy)*float64(p.drag) + float64(ay))
	p.life = int32(float64(p.life-4-random()%5) * 0.96)
	if p.life >= p.split {
		return nil
	}
	count := (random()%(p.life/150+1))/2 + 1
	p.life = p.life * 3 / 4
	var children []*atomParticle
	for i := int32(0); i < count; i++ {
		child := &atomParticle{
			x: p.x, y: p.y, vx: p.vx, vy: p.vy, drag: p.drag,
			life:  random()%400 + p.life/2,
			split: random()%14 + 10,
		}
		angle := random() % 180
		speed := random()%30 + 10
		child.addVelocity(speed, angle)
		children = append(children, child)
	}
	p.split = -1
	angle := random() % 360
	speed := random()%30 + 10
	p.addVelocity(speed, angle)
	return children
}

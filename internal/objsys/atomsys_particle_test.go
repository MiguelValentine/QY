package objsys

import (
	"math"
	"testing"
)

func TestAtomParticleMatchesNativeOracle(t *testing.T) {
	p := newAtomParticle(12, -7, 30, 37, 100, 85, 10)
	assertParticleMatches(t, "初始化", p, particleOracle{
		x: 12, y: -7, vx: 2.395906448364258, vy: -1.8054450750350952,
		life: 100, split: 10, drag: 0.8499999642372131,
	})

	p.addVelocity(14, 123)
	assertParticleMatches(t, "加速", p, particleOracle{
		x: 12, y: -7, vx: 1.6334117650985718, vy: -2.979583978652954,
		life: 100, split: 10, drag: 0.8499999642372131,
	})

	randomCalls := 0
	children := p.advance(0, 0, func() int32 {
		randomCalls++
		return 0
	})
	if children != nil {
		t.Fatalf("未达到分裂阈值时不应产生子粒子，得到 %d 个", len(children))
	}
	if randomCalls != 1 {
		t.Fatalf("未分裂推进应只消费一次随机数，实际消费 %d 次", randomCalls)
	}
	assertParticleMatches(t, "推进", p, particleOracle{
		x: 13.633411407470703, y: -9.979583740234375,
		vx: 1.3883999586105347, vy: -2.5326461791992188,
		life: 92, split: 10, drag: 0.8499999642372131,
	})
}

func TestAtomParticleSplitMatchesNativeOracle(t *testing.T) {
	p := newAtomParticle(12, -7, 0, 0, 100, 85, 93)
	randomValues := []int32{0, 0, 200, 3, 45, 5, 90, 7}
	randomIndex := 0
	children := p.advance(0, 0, func() int32 {
		if randomIndex >= len(randomValues) {
			t.Fatalf("分裂推进请求了超出 fixture 的随机数")
		}
		value := randomValues[randomIndex]
		randomIndex++
		return value
	})
	if randomIndex != len(randomValues) {
		t.Fatalf("分裂推进随机调用数=%d，期望 %d", randomIndex, len(randomValues))
	}
	if len(children) != 1 {
		t.Fatalf("分裂子粒子数=%d，期望 1", len(children))
	}
	assertParticleMatches(t, "分裂后的父粒子", p, particleOracle{
		x: 12, y: -7, vx: 1.0409498246973927e-16, vy: -1.7000000476837158,
		life: 69, split: -1, drag: 0.8499999642372131,
	})
	assertParticleMatches(t, "分裂子粒子", children[0], particleOracle{
		x: 12, y: -7, vx: 1.0606602430343628, vy: -1.0606602430343628,
		life: 234, split: 13, drag: 0.8499999642372131,
	})
}

func TestAtomParticleNonzeroAccelerationMatchesNativeRounding(t *testing.T) {
	p := newAtomParticle(12, -7, 30, 37, 100, 85, 10)
	randomCalls := 0
	children := p.advance(float32(0.12345679), float32(-0.9876543), func() int32 {
		randomCalls++
		return 0
	})
	if children != nil || randomCalls != 1 {
		t.Fatalf("未分裂加速度推进结果异常：子粒子=%d，随机调用=%d", len(children), randomCalls)
	}
	assertParticleMatches(t, "非零加速度推进", p, particleOracle{
		x: 14.395906448364258, y: -8.805444717407227,
		vx: 2.1599771976470947, vy: -2.522282600402832,
		life: 92, split: 10, drag: 0.8499999642372131,
	})
	for name, gotWant := range map[string][2]float32{
		"vx": {p.vx, 2.1599771976470947},
		"vy": {p.vy, -2.522282600402832},
	} {
		if math.Float32bits(gotWant[0]) != math.Float32bits(gotWant[1]) {
			t.Errorf("%s 加速度舍入不匹配：Go=%0.9g (%08x)，原生=%0.9g (%08x)",
				name, gotWant[0], math.Float32bits(gotWant[0]),
				gotWant[1], math.Float32bits(gotWant[1]))
		}
	}
}

type particleOracle struct {
	x, y, vx, vy float32
	life, split  int32
	drag         float32
}

func assertParticleMatches(t *testing.T, stage string, got *atomParticle, want particleOracle) {
	t.Helper()
	for name, values := range map[string][2]float32{
		"x": {got.x, want.x}, "y": {got.y, want.y},
		"vx": {got.vx, want.vx}, "vy": {got.vy, want.vy},
		"drag": {got.drag, want.drag},
	} {
		if math.Abs(float64(values[0]-values[1])) > 0.00001 {
			t.Errorf("%s %s 不匹配：Go=%0.9g，原生=%0.9g", stage, name, values[0], values[1])
		}
	}
	if got.life != want.life || got.split != want.split {
		t.Errorf("%s 整数字段不匹配：Go life/split=%d/%d，原生=%d/%d",
			stage, got.life, got.split, want.life, want.split)
	}
}

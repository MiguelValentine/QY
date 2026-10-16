package objsys

import (
	"testing"

	"QY/internal/script"
)

func TestAtomSystemEmitMouseFireSevenArguments(t *testing.T) {
	a, calls := atomSystemWithRandom(func() int32 { return 0 })
	args := atomTuple(12, 34, 120, 102, 120, 10, 97)
	if err := a.emit(args); err != nil {
		t.Fatal(err)
	}
	if len(a.particles) != 120 {
		t.Fatalf("粒子数=%d，期望 120", len(a.particles))
	}
	if *calls != 480 {
		t.Fatalf("七参发射随机调用数=%d，期望每粒子 4 次", *calls)
	}
	for i, p := range a.particles {
		if p.x != 12 || p.y != 34 || p.life != 10 || p.split != 5 ||
			p.drag < 0.96999 || p.drag > 0.97001 || p.vx < 10.1999 || p.vx > 10.2001 {
			t.Fatalf("粒子[%d] 参数映射错误：%+v", i, p)
		}
	}
}

func TestAtomSystemEmitEightArgumentsUsesFixedSplit(t *testing.T) {
	a, calls := atomSystemWithRandom(func() int32 { return 0 })
	if err := a.emit(atomTuple(3, 4, 2, 20, 10, 70, 25, 33)); err != nil {
		t.Fatal(err)
	}
	if len(a.particles) != 2 {
		t.Fatalf("粒子数=%d，期望 2", len(a.particles))
	}
	if *calls != 6 {
		t.Fatalf("固定 split 发射随机调用数=%d，期望每粒子 3 次", *calls)
	}
	for i, p := range a.particles {
		if p.life != 70 || p.split != 33 || p.drag < 0.24999 || p.drag > 0.25001 {
			t.Fatalf("粒子[%d] 未采用固定 split 和第七参数 drag：%+v", i, p)
		}
	}
}

func TestAtomSystemTrailDistanceThresholdsKeepPreviousPosition(t *testing.T) {
	for _, endpoint := range [][2]int32{{3, 0}, {1001, 0}} {
		a, calls := atomSystemWithRandom(func() int32 {
			t.Fatal("超出轨迹距离门限时不应取随机数")
			return 0
		})
		err := a.emitTrail(atomTuple(endpoint[0], endpoint[1], 1, 20, 10, 10, 97))
		if err != nil {
			t.Fatalf("端点 %v 发射失败：%v", endpoint, err)
		}
		if len(a.particles) != 0 || *calls != 0 {
			t.Fatalf("端点 %v 超出距离门限却创建了粒子或消耗随机数：粒子=%d，随机数=%d",
				endpoint, len(a.particles), *calls)
		}
		if a.previousX != 0 || a.previousY != 0 {
			t.Errorf("门限分支不应更新上次坐标：实际=(%d,%d)，期望=(0,0)",
				a.previousX, a.previousY)
		}
	}
}

func TestAtomSystemTrailIgnoresSixthArgumentAndUsesSeventhAsDrag(t *testing.T) {
	makeSystem := func(unused int32) *AtomSystem {
		a, _ := atomSystemWithRandom(func() int32 { return 0 })
		err := a.emitTrail(atomTuple(4, 0, 1, 30, 10, unused, 97))
		if err != nil {
			t.Fatal(err)
		}
		return a
	}
	first := makeSystem(10)
	second := makeSystem(987)
	if len(first.particles) != 1 || len(second.particles) != 1 {
		t.Fatalf("距离 4 应各创建一个粒子：%d、%d", len(first.particles), len(second.particles))
	}
	if *first.particles[0] != *second.particles[0] {
		t.Fatalf("第六参数影响了轨迹粒子：%+v 与 %+v",
			*first.particles[0], *second.particles[0])
	}
	if first.particles[0].drag < 0.96999 || first.particles[0].drag > 0.97001 {
		t.Fatalf("第七参数没有作为 drag：%+v", first.particles[0])
	}
	if first.previousX != 4 || first.previousY != 0 {
		t.Fatalf("成功发射后没有保存端点：(%d,%d)", first.previousX, first.previousY)
	}
}

func TestAtomSystemUpdateRemovesShortLifeBeforeAdvance(t *testing.T) {
	a, calls := atomSystemWithRandom(func() int32 {
		t.Fatal("life 小于 50 的粒子应在推进前删除")
		return 0
	})
	a.particles = []*atomParticle{{life: 49, split: 100}}
	a.update()
	if len(a.particles) != 0 || *calls != 0 {
		t.Fatalf("短命粒子未在推进前删除：粒子=%d，随机数=%d", len(a.particles), *calls)
	}
}

func TestAtomSystemUpdateAdvancesSplitChildrenInSamePass(t *testing.T) {
	values := []int32{0, 0, 200, 0, 0, 0, 0, 0, 0}
	index := 0
	a := &AtomSystem{
		Wnd:       &Wnd{},
		random:    func() int32 { value := values[index]; index++; return value },
		particles: []*atomParticle{newAtomParticle(0, 0, 0, 0, 60, 100, 100)},
	}
	parent := a.particles[0]
	a.update()
	if len(a.particles) != 2 {
		t.Fatalf("拆分后粒子数=%d，期望父粒子和子粒子均保留", len(a.particles))
	}
	child := a.particles[1]
	if child.life != 206 || child.x < 0.9999 || child.x > 1.0001 {
		t.Fatalf("子粒子没有在同次 update 中推进：life=%d x=%0.6f", child.life, child.x)
	}
	if parent.life != 39 || parent.split != -1 {
		t.Fatalf("父粒子拆分状态异常：life=%d split=%d", parent.life, parent.split)
	}
	if index != len(values) {
		t.Fatalf("拆分及子粒子同轮推进随机调用数=%d，期望 %d", index, len(values))
	}
}

func atomSystemWithRandom(next func() int32) (*AtomSystem, *int) {
	calls := 0
	a := &AtomSystem{
		Wnd:        &Wnd{},
		angleRange: 360,
		random: func() int32 {
			calls++
			return next()
		},
	}
	return a, &calls
}

func atomTuple(values ...int32) script.Value {
	items := make([]script.Value, len(values))
	for i, value := range values {
		items[i] = script.Value{Kind: "int", Integer: value}
	}
	return script.Value{Kind: "tuple", Items: items}
}

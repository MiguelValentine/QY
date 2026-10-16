package objsys

import (
	"testing"

	"QY/internal/script"
)

func TestAutoPositionThreeArgumentsAndDefaultGap(t *testing.T) {
	for _, test := range []struct {
		name string
		args []script.Value
		gap  int32
	}{
		{
			name: "当前三参数调用",
			args: []script.Value{
				{Kind: "int", Integer: 3},
				{Kind: "int", Integer: 3},
				{Kind: "int", Integer: 3},
			},
			gap: 3,
		},
		{
			name: "省略间距使用原生默认值",
			args: []script.Value{
				{Kind: "int", Integer: 3},
				{Kind: "int", Integer: 3},
			},
			gap: 5,
		},
	} {
		t.Run(test.name, func(t *testing.T) {
			desktop := &Desktop{}
			owner := NewWnd(desktop)
			first := addAutoPositionChild(t, desktop, owner, 7, 10, true)
			second := addAutoPositionChild(t, desktop, owner, 9, 12, true)

			bindAutoPositionForTest(t, owner, test.args...)
			if first.X != 3 || first.Y != 3 || second.X != 3 || second.Y != 13+test.gap {
				t.Fatalf("纵向布局错误：first=(%d,%d) second=(%d,%d) gap=%d",
					first.X, first.Y, second.X, second.Y, test.gap)
			}
			if owner.AutoPosition == nil || owner.AutoPosition.gap != test.gap {
				t.Fatalf("间距参数未保留：%+v", owner.AutoPosition)
			}
		})
	}
}

func TestAutoPositionSkipsHiddenChildren(t *testing.T) {
	desktop := &Desktop{}
	owner := NewWnd(desktop)
	first := addAutoPositionChild(t, desktop, owner, 8, 10, true)
	hidden := addAutoPositionChild(t, desktop, owner, 40, 20, false)
	last := addAutoPositionChild(t, desktop, owner, 6, 9, true)

	bindAutoPositionForTest(t, owner,
		script.Value{Kind: "int", Integer: 4},
		script.Value{Kind: "int", Integer: 6},
		script.Value{Kind: "int", Integer: 2},
	)
	if first.X != 4 || first.Y != 6 || hidden.X != 0 || hidden.Y != 0 ||
		last.X != 4 || last.Y != 18 {
		t.Fatalf("隐藏子对象应跳过且不占用纵向间距：first=(%d,%d) hidden=(%d,%d) last=(%d,%d)",
			first.X, first.Y, hidden.X, hidden.Y, last.X, last.Y)
	}
}

func TestAutoPositionUsesImageFrameOffsets(t *testing.T) {
	desktop := &Desktop{}
	owner := NewWnd(desktop)
	img := NewImgEx(desktop)
	img.Width, img.Height = 20, 11
	img.FrameOffsetX, img.FrameOffsetY = -4, -3
	desktop.Windows = append(desktop.Windows, owner, img.Wnd)
	desktop.Images = append(desktop.Images, img)
	if err := img.Object.Reparent(owner.Object); err != nil {
		t.Fatal(err)
	}

	bindAutoPositionForTest(t, owner,
		script.Value{Kind: "int", Integer: 10},
		script.Value{Kind: "int", Integer: 15},
	)
	if img.X != 14 || img.Y != 18 {
		t.Fatalf("图片窗口位置未抵消帧偏移：(%d,%d)", img.X, img.Y)
	}
}

func TestAutoPositionAutoResizeUsesOccupiedBounds(t *testing.T) {
	desktop := &Desktop{}
	owner := NewWnd(desktop)
	child := addAutoPositionChild(t, desktop, owner, 20, 30, true)

	bindAutoPositionForTest(t, owner,
		script.Value{Kind: "int", Integer: 5},
		script.Value{Kind: "int", Integer: 7},
		script.Value{Kind: "int", Integer: 0},
		script.Value{Kind: "int", Integer: 1},
	)
	if child.X != 5 || child.Y != 7 || owner.Width != 30 || owner.Height != 44 {
		t.Fatalf("autoresize 尺寸不匹配：child=(%d,%d) owner=(%d,%d)",
			child.X, child.Y, owner.Width, owner.Height)
	}
}

func TestAutoPositionClearAndRebind(t *testing.T) {
	desktop := &Desktop{}
	owner := NewWnd(desktop)
	child := addAutoPositionChild(t, desktop, owner, 10, 8, true)
	bindAutoPositionForTest(t, owner,
		script.Value{Kind: "int", Integer: 1},
		script.Value{Kind: "int", Integer: 2},
	)
	old := owner.AutoPosition

	if _, handled, err := owner.Object.BindMember(autoposMemberHash, script.Binding{Clear: true}); err != nil || !handled {
		t.Fatalf("清除 autopos 失败：handled=%t err=%v", handled, err)
	}
	if err := desktop.Update(1, nil); err != nil {
		t.Fatal(err)
	}
	if !old.finished || child.X != 1 || child.Y != 2 {
		t.Fatalf("清除绑定后旧布局仍活动或改动位置：finished=%t child=(%d,%d)",
			old.finished, child.X, child.Y)
	}

	bindAutoPositionForTest(t, owner,
		script.Value{Kind: "int", Integer: 9},
		script.Value{Kind: "int", Integer: 12},
	)
	if owner.AutoPosition == old || !old.finished || child.X != 9 || child.Y != 12 {
		t.Fatalf("重新绑定未替换旧布局：new=%p old=%p finished=%t child=(%d,%d)",
			owner.AutoPosition, old, old.finished, child.X, child.Y)
	}
}

func TestAutoPositionReflowsWhenChildIsAddedBeforeDeadline(t *testing.T) {
	desktop := &Desktop{}
	owner := NewWnd(desktop)
	first := addAutoPositionChild(t, desktop, owner, 7, 10, true)
	bindAutoPositionForTest(t, owner,
		script.Value{Kind: "int", Integer: 2},
		script.Value{Kind: "int", Integer: 3},
	)
	second := addAutoPositionChild(t, desktop, owner, 5, 6, true)

	if err := desktop.Update(1, nil); err != nil {
		t.Fatal(err)
	}
	if first.Y != 3 || second.X != 2 || second.Y != 18 {
		t.Fatalf("新增子对象未触发期限前重排：firstY=%d second=(%d,%d)",
			first.Y, second.X, second.Y)
	}
}

func addAutoPositionChild(t *testing.T, desktop *Desktop, owner *Wnd, width, height int32, visible bool) *Wnd {
	t.Helper()
	ownerRegistered := false
	for _, wnd := range desktop.Windows {
		if wnd == owner {
			ownerRegistered = true
			break
		}
	}
	if !ownerRegistered {
		desktop.Windows = append(desktop.Windows, owner)
	}
	child := NewWnd(desktop)
	child.Width, child.Height, child.Visible = width, height, visible
	desktop.Windows = append(desktop.Windows, child)
	if err := child.Object.Reparent(owner.Object); err != nil {
		t.Fatal(err)
	}
	return child
}

func bindAutoPositionForTest(t *testing.T, owner *Wnd, args ...script.Value) {
	t.Helper()
	if _, handled, err := owner.Object.BindMember(autoposMemberHash, script.Binding{
		Name:      autoposVerticalSelector,
		Arguments: args,
	}); err != nil || !handled {
		t.Fatalf("绑定 autopos 失败：handled=%t err=%v", handled, err)
	}
	if owner.AutoPosition == nil {
		t.Fatal("绑定没有安装 autopos 状态")
	}
}

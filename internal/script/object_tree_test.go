package script

import "testing"

func TestObjectReparentMovesAndDeduplicatesChild(t *testing.T) {
	oldParent := &Object{}
	newParent := &Object{}
	sibling := &Object{Owner: newParent}
	child := &Object{Owner: oldParent}
	oldParent.Children = []*Object{child, sibling, child}
	newParent.Children = []*Object{sibling, child, child}

	if err := child.Reparent(newParent); err != nil {
		t.Fatal(err)
	}
	if child.Owner != newParent {
		t.Fatal("对象 Owner 没有更新到新父节点")
	}
	if containsObject(oldParent.Children, child) {
		t.Fatal("旧父节点仍包含已移动的对象")
	}
	if countObject(newParent.Children, child) != 1 {
		t.Fatalf("新父节点中的对象引用数 = %d，期望 1", countObject(newParent.Children, child))
	}
	if newParent.Children[0] != sibling || newParent.Children[1] != child {
		t.Fatalf("移动对象时改变了其他子节点顺序：%v", newParent.Children)
	}

	if err := child.Reparent(newParent); err != nil {
		t.Fatal(err)
	}
	if countObject(newParent.Children, child) != 1 {
		t.Fatal("重复 Reparent 产生了重复子节点")
	}
}

func TestObjectReparentRejectsCyclesWithoutChangingTree(t *testing.T) {
	root := &Object{}
	child := &Object{Owner: root}
	root.Children = []*Object{child}
	other := &Object{}

	tests := []struct {
		name   string
		object *Object
		parent *Object
	}{
		{name: "自身作为父节点", object: child, parent: child},
		{name: "子孙作为父节点", object: root, parent: child},
	}
	for _, test := range tests {
		t.Run(test.name, func(t *testing.T) {
			beforeRoot := append([]*Object(nil), root.Children...)
			beforeChild := append([]*Object(nil), child.Children...)
			beforeOwner := test.object.Owner
			if err := test.object.Reparent(test.parent); err == nil {
				t.Fatal("循环关系没有返回错误")
			}
			if test.object.Owner != beforeOwner || !sameObjects(root.Children, beforeRoot) ||
				!sameObjects(child.Children, beforeChild) || len(other.Children) != 0 {
				t.Fatal("拒绝循环时改动了对象树")
			}
		})
	}
}

func TestObjectReparentRejectsExistingOwnerCyclesWithoutChangingTree(t *testing.T) {
	a := &Object{}
	b := &Object{}
	a.Owner, b.Owner = b, a
	a.Children = []*Object{b}
	b.Children = []*Object{a}
	child := &Object{}
	target := &Object{}

	beforeA := append([]*Object(nil), a.Children...)
	beforeB := append([]*Object(nil), b.Children...)
	if err := child.Reparent(a); err == nil {
		t.Fatal("目标父链中已有循环却未报错")
	}
	if child.Owner != nil || !sameObjects(a.Children, beforeA) || !sameObjects(b.Children, beforeB) {
		t.Fatal("目标父链已有循环时改动了对象树")
	}

	child.Owner = a
	a.Children = append(a.Children, child)
	beforeA = append([]*Object(nil), a.Children...)
	beforeChildOwner := child.Owner
	if err := child.Reparent(target); err == nil {
		t.Fatal("当前对象所属链中已有循环却未报错")
	}
	if child.Owner != beforeChildOwner || !sameObjects(a.Children, beforeA) || target.Owner != nil || len(target.Children) != 0 {
		t.Fatal("当前所属链已有循环时改动了对象树")
	}
}

func TestObjectReparentNilDetachesChild(t *testing.T) {
	parent := &Object{}
	child := &Object{Owner: parent}
	parent.Children = []*Object{child, child}

	if err := child.Reparent(nil); err != nil {
		t.Fatal(err)
	}
	if child.Owner != nil || containsObject(parent.Children, child) {
		t.Fatal("解除所属关系后父子引用仍存在")
	}
	if err := child.Reparent(nil); err != nil {
		t.Fatal(err)
	}
	if child.Owner != nil || containsObject(parent.Children, child) {
		t.Fatal("重复解除所属关系改动不正确")
	}
}

func TestObjectReparentRejectsNilReceiver(t *testing.T) {
	var object *Object
	if err := object.Reparent(nil); err == nil {
		t.Fatal("空对象调用 Reparent 未返回错误")
	}
}

func containsObject(objects []*Object, target *Object) bool {
	return countObject(objects, target) != 0
}

func countObject(objects []*Object, target *Object) int {
	count := 0
	for _, object := range objects {
		if object == target {
			count++
		}
	}
	return count
}

func sameObjects(left, right []*Object) bool {
	if len(left) != len(right) {
		return false
	}
	for i := range left {
		if left[i] != right[i] {
			return false
		}
	}
	return true
}

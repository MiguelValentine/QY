package script

import "fmt"

// Reparent 将对象移动到新的所属对象；nil 表示解除所属关系。
func (o *Object) Reparent(parent *Object) error {
	if o == nil {
		return fmt.Errorf("script: 不能移动空对象")
	}

	if err := validateOwnerChain(o); err != nil {
		return err
	}
	if err := validateOwnerChain(parent); err != nil {
		return err
	}
	for current := parent; current != nil; current = current.Owner {
		if current == o {
			return fmt.Errorf("script: 移动对象会形成所属关系循环")
		}
	}

	oldParent := o.Owner
	if oldParent != nil {
		oldParent.Children = removeChild(oldParent.Children, o)
	}
	o.Owner = parent
	if parent != nil {
		parent.Children = removeChild(parent.Children, o)
		parent.Children = append(parent.Children, o)
	}
	return nil
}

func validateOwnerChain(start *Object) error {
	seen := make(map[*Object]struct{})
	for current := start; current != nil; current = current.Owner {
		if _, ok := seen[current]; ok {
			return fmt.Errorf("script: 所属对象链已包含循环")
		}
		seen[current] = struct{}{}
	}
	return nil
}

func removeChild(children []*Object, target *Object) []*Object {
	filtered := children[:0]
	for _, child := range children {
		if child != target {
			filtered = append(filtered, child)
		}
	}
	return filtered
}

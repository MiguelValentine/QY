package script

// eventFunction 对应原生事件表按名称、标志和参数类型签名的精确查找。
// 不匹配的声明不参与本次事件；已选中函数的执行错误仍由运行器返回。
func eventFunction(function *Function, arguments []Value) (*Function, error) {
	for candidate := function; candidate != nil; candidate = candidate.previous {
		var parameters []*Node
		for _, child := range candidate.Declaration.Children {
			if child.Form == "parameter" {
				parameters = append(parameters, child)
			}
		}
		if len(parameters) != len(arguments) {
			continue
		}
		match := true
		for index, parameter := range parameters {
			if len(parameter.Header) != 1 {
				return nil, locationError(parameter.Token, "事件可变参数签名尚未恢复")
			}
			var kind string
			switch parameter.Token.Kind {
			case 1530:
				kind = "int"
			case 1531:
				kind = "string"
			case 1533:
				kind = "object"
			case 1534:
				kind = "tuple"
			case 1535:
				kind = "date"
			default:
				return nil, locationError(parameter.Token, "事件参数类型签名尚未恢复")
			}
			if arguments[index].Kind != kind {
				match = false
				break
			}
		}
		if match {
			return candidate, nil
		}
	}
	return nil, nil
}

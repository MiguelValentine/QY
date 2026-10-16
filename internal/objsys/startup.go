package objsys

import (
	"fmt"
	"os"

	"QY/internal/script"
)

// systemSource 只读取 DLL 中的脚本数据，所有解析与执行仍由 Go 完成。
func (l *Loader) systemSource() (script.Source, error) {
	file, err := l.Resolve("objsys.dll")
	if err != nil {
		return script.Source{}, err
	}
	data, err := os.ReadFile(file)
	if err != nil {
		return script.Source{}, err
	}
	data, err = readPEResource(data, "FCC", "SYSTEM.COD", 2052)
	if err != nil {
		return script.Source{}, fmt.Errorf("objsys: 内置系统脚本：%w", err)
	}
	module, err := decodeModule("res$SYSTEM.COD", data)
	if err != nil {
		return script.Source{}, err
	}
	if len(module.Members) != 1 || module.Members[0].Document == nil {
		return script.Source{}, fmt.Errorf("objsys: 内置系统脚本需要一个 FC0A 成员")
	}
	return script.ReadSource(module.Path, module.Members[0].Document)
}

// compileStartup 对应桌面先执行 SYSTEM.COD、再运行入口的启动顺序。
func (l *Loader) compileStartup(entry string) ([]*script.Program, error) {
	source, err := l.scriptSource(entry, true)
	if err != nil {
		return nil, err
	}
	system, err := l.systemSource()
	if err != nil {
		return nil, err
	}
	inputs, err := script.PreprocessSequence([]script.Source{system, source}, l.resolveScriptInclude)
	if err != nil {
		return nil, err
	}
	programs := make([]*script.Program, 0, len(inputs))
	for _, input := range inputs {
		program, err := script.Parse(input)
		if err != nil {
			return nil, err
		}
		programs = append(programs, program)
	}
	return programs, nil
}

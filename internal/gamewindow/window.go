// Package gamewindow 提供实际桌面窗口；游戏场景由恢复后的脚本宿主绘制。
package gamewindow

import (
	"fmt"
	"image"
	"image/draw"
	"sync/atomic"

	"QY/internal/display"

	"github.com/hajimehoshi/ebiten/v2"
)

// Window 的绘图与字体操作在窗口更新回调内调用，Close 可从其他协程调用。
type Window struct {
	fonts   *display.Fonts
	surface *image.RGBA
	texture *ebiten.Image
	active  bool
	closed  atomic.Bool
	update  func() error
}

// SetUpdate 登记场景逐帧更新；回调与脚本启动都在窗口主线程执行。
func (w *Window) SetUpdate(update func() error) {
	w.update = update
}

// SetTitle 将客户端 GBK 文本转换后交给实际桌面窗口。
// 标题沿用宿主的显示字符集，不受脚本字体字符集的切换影响。
func (w *Window) SetTitle(raw []byte) error {
	if !w.active || w.closed.Load() {
		return fmt.Errorf("游戏窗口已关闭或尚未初始化")
	}
	title, err := display.DecodeText(raw, 134)
	if err != nil {
		return fmt.Errorf("游戏窗口标题：%w", err)
	}
	ebiten.SetWindowTitle(title)
	return nil
}

// SetFontCharset 重建实际字体，失败时保留已有字体。
func (w *Window) SetFontCharset(charset uint32) error {
	if !w.active || w.closed.Load() {
		return fmt.Errorf("游戏窗口已关闭或尚未初始化")
	}
	return w.fonts.SetCharset(charset)
}

// SetSize 同步更新逻辑客户区、绘图表面和实际桌面窗口的客户区尺寸。
func (w *Window) SetSize(width, height int32) error {
	if !w.active || w.closed.Load() {
		return fmt.Errorf("游戏窗口已关闭或尚未初始化")
	}
	if width <= 0 || height <= 0 || width > 8192 || height > 8192 || int64(width)*int64(height) > 1<<24 {
		return fmt.Errorf("不支持的游戏客户区尺寸 %dx%d", width, height)
	}
	next := image.NewRGBA(image.Rect(0, 0, int(width), int(height)))
	draw.Draw(next, next.Bounds(), w.surface, w.surface.Bounds().Min, draw.Src)
	texture := ebiten.NewImage(int(width), int(height))
	texture.WritePixels(next.Pix)
	w.texture.Dispose()
	w.surface, w.texture = next, texture
	ebiten.SetWindowSize(int(width), int(height))
	return nil
}

// Size 返回脚本绘图使用的逻辑客户区尺寸，不包含标题栏和边框。
func (w *Window) Size() (width, height int32, err error) {
	if !w.active || w.closed.Load() {
		return 0, 0, fmt.Errorf("游戏窗口已关闭或尚未初始化")
	}
	return int32(w.surface.Bounds().Dx()), int32(w.surface.Bounds().Dy()), nil
}

// Present 将已经绘制的客户区图像送入窗口；不替代脚本场景求值。
func (w *Window) Present(frame image.Image) error {
	if !w.active || w.closed.Load() {
		return fmt.Errorf("游戏窗口已关闭或尚未初始化")
	}
	if frame == nil || frame.Bounds().Size() != w.surface.Bounds().Size() {
		return fmt.Errorf("客户区图像尺寸必须为 %dx%d", w.surface.Bounds().Dx(), w.surface.Bounds().Dy())
	}
	draw.Draw(w.surface, w.surface.Bounds(), frame, frame.Bounds().Min, draw.Src)
	w.texture.WritePixels(w.surface.Pix)
	return nil
}

// Close 请求事件循环正常退出。
func (w *Window) Close() {
	w.closed.Store(true)
}

type game struct {
	window  *Window
	start   func(*Window) error
	started bool
}

func (g *game) Update() error {
	if g.window.closed.Load() {
		return ebiten.Termination
	}
	if !g.started {
		g.started = true
		g.window.active = true
		if err := g.start(g.window); err != nil {
			return err
		}
	}
	if g.window.update != nil {
		return g.window.update()
	}
	return nil
}

func (g *game) Draw(screen *ebiten.Image) {
	screen.DrawImage(g.window.texture, nil)
}

func (g *game) Layout(_, _ int) (int, int) {
	return g.window.surface.Bounds().Dx(), g.window.surface.Bounds().Dy()
}

// Run 在主线程创建窗口与事件循环，初始化成功后才执行入口回调。
// 入口失败立即关闭窗口并返回原错误，不能把空白窗口作为游戏启动成功。
func Run(start func(*Window) error) error {
	if start == nil {
		return fmt.Errorf("缺少游戏启动入口")
	}
	data, err := display.LoadSystemFont()
	if err != nil {
		return err
	}
	fonts, err := display.NewFonts(data, 134)
	if err != nil {
		return err
	}
	defer fonts.Close()
	window := &Window{
		fonts:   fonts,
		surface: image.NewRGBA(image.Rect(0, 0, 800, 600)),
		texture: ebiten.NewImage(800, 600),
	}
	defer func() {
		window.active = false
		window.closed.Store(true)
		window.texture.Dispose()
	}()
	ebiten.SetWindowTitle("FCRUNNER")
	ebiten.SetWindowSize(800, 600)
	ebiten.SetWindowResizingMode(ebiten.WindowResizingModeDisabled)
	ebiten.SetRunnableOnUnfocused(true)
	return ebiten.RunGame(&game{window: window, start: start})
}

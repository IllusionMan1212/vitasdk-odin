package audioenc

import "core:c"
import sce "../common"

foreign import audioenc "system:SceAudioenc_stub"

@(link_prefix = "sceAudioenc")
foreign audioenc {
	InitLibrary :: proc(codecType: c.int, pInitParam: ^SceAudioencInitParam) -> c.int ---
	TermLibrary :: proc(codecType: c.uint) -> c.int ---
	CreateEncoder :: proc(pCtrl: ^SceAudioencCtrl, codecType: c.int) -> c.int ---
	DeleteEncoder :: proc(pCtrl: ^SceAudioencCtrl) -> c.int ---
	Encode :: proc(pCtrl: ^SceAudioencCtrl) -> c.int ---
	ClearContext :: proc(pCtrl: ^SceAudioencCtrl) -> c.int ---
	GetOptInfo :: proc(pCtrl: ^SceAudioencCtrl) -> c.int ---
	GetInternalError :: proc(pCtrl: ^SceAudioencCtrl, pInternalError: ^c.int) -> c.int ---
}

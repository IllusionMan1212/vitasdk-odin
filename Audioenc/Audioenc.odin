package audioenc

import "core:c"
import sce "../common"

foreign import audioenc "system:SceAudioenc_stub"

foreign audioenc {
	sceAudioencInitLibrary :: proc(codecType: c.int, pInitParam: ^SceAudioencInitParam) -> c.int ---
	sceAudioencTermLibrary :: proc(codecType: c.uint) -> c.int ---
	sceAudioencCreateEncoder :: proc(pCtrl: ^SceAudioencCtrl, codecType: c.int) -> c.int ---
	sceAudioencDeleteEncoder :: proc(pCtrl: ^SceAudioencCtrl) -> c.int ---
	sceAudioencEncode :: proc(pCtrl: ^SceAudioencCtrl) -> c.int ---
	sceAudioencClearContext :: proc(pCtrl: ^SceAudioencCtrl) -> c.int ---
	sceAudioencGetOptInfo :: proc(pCtrl: ^SceAudioencCtrl) -> c.int ---
	sceAudioencGetInternalError :: proc(pCtrl: ^SceAudioencCtrl, pInternalError: ^c.int) -> c.int ---
}

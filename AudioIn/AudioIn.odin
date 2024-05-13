package audioin

import "core:c"

foreign import audioin "system:SceAudioIn_stub"

foreign audioin {
	//! Open port
	sceAudioInOpenPort :: proc(portType: SceAudioInPortType, grain: c.int, freq: c.int, param: SceAudioInParam) -> c.int ---

	//! Close port
	sceAudioInReleasePort :: proc(port: c.int) -> c.int ---

	sceAudioInInput :: proc(port: c.int, destPtr: rawptr) -> c.int ---

	/* get status */
	sceAudioInGetAdopt :: proc(portType: SceAudioInPortType) -> c.int ---
	sceAudioInGetStatus :: proc(select: c.int) -> c.int ---
}

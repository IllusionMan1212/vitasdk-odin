package audioin

import "core:c"

foreign import audioin "system:SceAudioIn_stub"

@(link_prefix = "sceAudioIn")
foreign audioin {
	//! Open port
	OpenPort :: proc(portType: SceAudioInPortType, grain: c.int, freq: c.int, param: SceAudioInParam) -> c.int ---

	//! Close port
	ReleasePort :: proc(port: c.int) -> c.int ---

	Input :: proc(port: c.int, destPtr: rawptr) -> c.int ---

	/* get status */
	GetAdopt :: proc(portType: SceAudioInPortType) -> c.int ---
	GetStatus :: proc(select: c.int) -> c.int ---
}

package screenshot

import "core:c"

foreign import screenshot "system:SceScreenShot_stub"

foreign screenshot {
	//! Set screenshot params
	sceScreenShotSetParam :: proc(#by_ptr param: SceScreenShotParam) -> c.int ---

	//! Set overlay image
	sceScreenShotSetOverlayImage :: proc(filepath: cstring, offsetX: c.int, offsetY: c.int) -> c.int ---

	//! Disable screenshot
	sceScreenShotDisable :: proc() -> c.int ---

	//! Enable screenshot
	sceScreenShotEnable :: proc() -> c.int ---
}

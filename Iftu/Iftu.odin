package iftu

import "core:c"

foreign import iftu "system:SceIftuForDriver_stub"

foreign iftu {
	ksceIftuCsc :: proc(dst: ^SceIftuFrameBuf, src: ^SceIftuPlaneState, params: ^SceIftuConvParams) -> c.int ---
}


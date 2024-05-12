package iftu

import "core:c"

foreign import iftu "system:SceIftuForDriver_stub"

@(link_prefix = "ksceIftu")
foreign iftu {
	Csc :: proc(dst: ^SceIftuFrameBuf, src: ^SceIftuPlaneState, params: ^SceIftuConvParams) -> c.int ---
}


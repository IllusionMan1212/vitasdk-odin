package bgapputil

import "core:c"

foreign import bgapputil "system:SceBgAppUtil_stub"

/**
 * Error Codes
 */
SceBgAppUtilErrorCode :: enum c.int {
	SCE_BGAPP_UTIL_ERROR_INVALID_ARG = −2146409214 //0x80106502
}

@(link_prefix = "sceBgAppUtil")
foreign bgapputil {
  /**
  * Start BG application (eboot2.bin)
  *
  * @param[in] mode - must be 1
  *
  * @return 0 on success, <0 otherwise.
  */
  StartBgApp :: proc(mode: c.int) -> c.int ---
}

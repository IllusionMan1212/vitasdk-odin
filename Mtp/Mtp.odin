package mtp

import "core:c"

foreign import mtp "system:SceMtpIfDriver_stub"

@(link_prefix = "sceMtpIf")
foreign mtp {
  /**
  * Start MTP driver
  *
  * @param[in] flags - Set to 1
  *
  * @return 0 on success, < 0 on error.
  */
  StartDriver :: proc(flags: c.int) -> c.int ---

  /**
  * Stop MTP driver
  *
  * @param[in] flags - Set to 1
  *
  * @return 0 on success, < 0 on error.
  */
  StopDriver :: proc(flags: c.int) -> c.int ---
}

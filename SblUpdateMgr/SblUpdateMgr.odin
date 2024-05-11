package sblupdatemgr

import "core:c"

foreign import sblupdatemgr "system:SceSblUpdateMgr_stub"

SCE_UPDATE_MODE_SWU_GUI :: 0x10
SCE_UPDATE_MODE_SWU_CUI :: 0x30

SceUpdateMode :: c.char

GetBootMode :: GetUpdateMode
SetBootMode :: SetUpdateMode

@(link_prefix = "sceSblUs")
foreign sblupdatemgr {
  /**
  * Getting system update mode on boot
  *
  * @param[out] mode - The pointer of SceUpdateMode variable
  *
  * @return 0 on success, < 0 on error.
  */
  GetUpdateMode :: proc(mode: ^SceUpdateMode) -> c.int ---


  /**
  * Setting system update mode on boot
  *
  * @param[in] mode - The update mode
  *
  * @return 0 on success, < 0 on error.
  */
  SetUpdateMode :: proc(mode: SceUpdateMode) -> c.int ---


  /**
  * Verify PUP
  *
  * @param[in] path - The PUP path
  *
  * @return 0 on success, < 0 on error.
  *
  * note - If verify CEX PUP on Devkit system, got error.
  */
  VerifyPup :: proc(path: cstring) -> c.int ---
}

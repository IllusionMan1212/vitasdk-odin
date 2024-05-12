package display

import "core:c"
import sce "../common"

foreign import _display "system:SceDisplay_stub"
foreign import displaykern "system:SceDisplayForDriver_stub"

@(link_prefix = "sceDisplay")
foreign _display {
  /**
  * Set/Update framebuffer parameters
  *
  * @param[in] pParam - Pointer to a ::SceDisplayFrameBuf structure.
  * @param[in] sync - One of ::SceDisplaySetBufSync
  *
  * @return 0 on success, < 0 on error.
  * @note - If NULL is provided as pParam pointer, output is blacked out.
  */
  SetFrameBuf :: proc(pParam: ^SceDisplayFrameBuf, sync: SceDisplaySetBufSync) -> c.int ---

  /**
  * Get current framebuffer parameters
  *
  * @param[out] pParam - Pointer to a ::SceDisplayFrameBuf structure
  * which will receive framebuffer parameters.
  *
  * @param[in] sync - One of ::SceDisplaySetBufSync
  *
  * @return 0 on success, < 0 on error.
  */
  GetFrameBuf :: proc(pParam: ^SceDisplayFrameBuf, sync: SceDisplaySetBufSync) -> c.int ---

  /**
  * Primary display index
  */
  GetPrimaryHead :: proc() -> c.int ---

  /**
  * Get current number of fps for the current screen mode.
  *
  * @param[out] pFps - Pointer to a float variable to store current number of fps.
  *
  * @return 0 on success, < 0 on error.
  * @note - This function returns a theoretical value, this might not be the exact frame rate.
  */
  GetRefreshRate :: proc(pFps: ^c.float) -> c.int ---

  /**
  * Get maximum framebuffer resolution
  *
  * @param[out] width - Maximum width
  * @param[out] height - Maximum height
  *
  * @return 0 on success, < 0 on error.
  */
  GetMaximumFrameBufResolution :: proc(width: ^c.int, height: ^c.int) -> c.int ---

  /**
  * Number of vertical blank pulses up to now
  */
  GetVcount :: proc() -> c.int ---

  /**
  * Number of vertical blank pulses up to now for a display
  *
  * @param[in] display - Display index
  */
  GetVcountInternal :: proc(display: c.int) -> c.int ---

  /**
  * Wait for vertical blank start
  */
  WaitVblankStart :: proc() -> c.int ---

  /**
  * Wait for vertical blank start with callback
  */
  WaitVblankStartCB :: proc() -> c.int ---

  /**
  * Wait for vertical blank start after specified number of vertical periods
  *
  * @param[in] vcount - Number of vertical periods before waiting for vertical blank start
  */
  WaitVblankStartMulti :: proc(vcount: c.uint) -> c.int ---

  /**
  * Wait for vertical blank start with callback after specified number of vertical periods
  *
  * @param[in] vcount - Number of vertical periods before waiting for vertical blank start
  */
  WaitVblankStartMultiCB :: proc(vcount: c.uint) -> c.int ---

  /**
  * Wait for vertical blank start since last update of framebuffer
  */
  WaitSetFrameBuf :: proc() -> c.int ---

  /**
  * Wait for vertical blank start with callback since last update of framebuffer
  */
  WaitSetFrameBufCB :: proc() -> c.int ---

  /**
  * Wait for vertical blank start after specified number of vertical periods
  * since last update of framebuffer.
  *
  * @param[in] vcount - Number of vertical periods before waiting for vertical blank start
  */
  WaitSetFrameBufMulti :: proc(vcount: c.uint) -> c.int ---

  /**
  * Wait for vertical blank start with callback after specified number of vertical periods
  * since last update of framebuffer.
  *
  * @param[in] vcount - Number of vertical periods before waiting for vertical blank start
  */
  WaitSetFrameBufMultiCB :: proc(vcount: c.uint) -> c.int ---

  /**
  * Register callback to be used at each vertical blank start
  *
  * @param[in] uid - Callback UID
  */
  RegisterVblankStartCallback :: proc(uid: sce.UID) -> c.int ---

  /**
  * Unregister callback used at each vertical blank start
  *
  * @param[in] uid - Callback UID
  */
  UnregisterVblankStartCallback :: proc(uid: sce.UID) -> c.int ---
}

foreign displaykern {
  /**
  * Set/Update framebuffer parameters
  *
  * @param[in] pParam - Pointer to a ::SceDisplayFrameBuf structure.
  * @param[in] sync - One of ::DisplaySetBufSync
  *
  * @return 0 on success, < 0 on error.
  * @note - If NULL is provided as pParam pointer, output is blacked out.
  */
  ksceDisplaySetFrameBuf :: proc(#by_ptr pParam: SceDisplayFrameBuf, sync: c.int) -> c.int ---

  /**
  * Set/Update framebuffer parameters for display
  *
  * @param[in] head - Use 0 for OLED/LCD and 1 for HDMI
  * @param[in] index - Can be 0 or 1
  * @param[in] pParam - Pointer to a ::SceDisplayFrameBuf structure.
  * @param[in] sync - One of ::DisplaySetBufSync
  *
  * @return 0 on success, < 0 on error.
  * @note - If NULL is provided as pParam pointer, output is blacked out.
  */
  ksceDisplaySetFrameBufInternal :: proc(head: c.int, index: c.int, #by_ptr pParam: SceDisplayFrameBuf, sync: c.int) -> c.int ---

  /**
  * Get current framebuffer parameters
  *
  * @param[out] pParam - Pointer to a ::SceDisplayFrameBuf structure
  * which will receive framebuffer parameters.
  *
  * @param[in] sync - One of ::DisplaySetBufSync
  *
  * @return 0 on success, < 0 on error.
  */
  ksceDisplayGetFrameBuf :: proc(pParam: ^SceDisplayFrameBuf, sync: c.int) -> c.int ---

  /**
  * Get the configured framebuffer information of a head and its framebuffer index for a PID
  *
  * @param[in] pid - PID of the process to get the framebuffer information from.
  *                  It can either be a vallid PID, -1 to use the current configured
  *                  framebuffer for the head and index, or 0 to use the PID of the caller.
  * @param[in] head - Use 0 for OLED/LCD and 1 for HDMI
  * @param[in] index - Can be 0 or 1
  * @param[out] info - Pointer to a ::SceDisplayFrameBufInfo structure
  * which will receive the framebuffer information.
  *
  * @return 0 on success, < 0 on error.
  */
  ksceDisplayGetProcFrameBufInternal :: proc(pid: sce.UID, head: c.int, index: c.int, info: ^SceDisplayFrameBufInfo) -> c.int ---

  /**
  * Get maximum framebuffer resolution
  *
  * @param[out] width - Maximum width
  * @param[out] height - Maximum height
  *
  * @return 0 on success, < 0 on error.
  */
  ksceDisplayGetMaximumFrameBufResolution :: proc(width: ^c.int, height: ^c.int) -> c.int ---

  /**
  * Primary display index
  */
  ksceDisplayGetPrimaryHead :: proc() -> c.int ---

  /**
  * Number of vertical blank pulses up to now for a display
  *
  * @param[in] display - Display index
  */
  ksceDisplayGetVcountInternal :: proc(display: c.int) -> c.int ---

  /**
  * Wait for vertical blank start
  */
  ksceDisplayWaitVblankStart :: proc() -> c.int ---

  /**
  * Wait for vertical blank start for display
  *
  * @param[in] display - Display index
  */
  ksceDisplayWaitVblankStartInternal :: proc(display: c.int) -> c.int ---

  /**
  * Wait for vertical blank start with callback
  */
  ksceDisplayWaitVblankStartCB :: proc() -> c.int ---

  /**
  * Wait for vertical blank start with callback for display
  *
  * @param[in] display - Display index
  */
  ksceDisplayWaitVblankStartCBInternal :: proc(display: c.int) -> c.int ---

  /**
  * Wait for vertical blank start after specified number of vertical periods
  *
  * @param[in] vcount - Number of vertical periods before waiting for vertical blank start
  */
  ksceDisplayWaitVblankStartMulti :: proc(vcount: c.uint) -> c.int ---

  /**
  * Wait for vertical blank start after specified number of vertical periods for display
  *
  * @param[in] display - Display index
  * @param[in] vcount - Number of vertical periods before waiting for vertical blank start
  */
  ksceDisplayWaitVblankStartMultiInternal :: proc(display: c.int, vcount: c.uint) -> c.int ---

  /**
  * Wait for vertical blank start with callback after specified number of vertical periods
  *
  * @param[in] vcount - Number of vertical periods before waiting for vertical blank start
  */
  ksceDisplayWaitVblankStartMultiCB :: proc(vcount: c.uint) -> c.int ---

  /**
  * Wait for vertical blank start with callback after specified number of vertical periods for display
  *
  * @param[in] display - Display index
  * @param[in] vcount - Number of vertical periods before waiting for vertical blank start
  */
  ksceDisplayWaitVblankStartMultiCBInternal :: proc(display: c.int, vcount: c.uint) -> c.int ---

  /**
  * Wait for vertical blank start since last update of framebuffer
  */
  ksceDisplayWaitSetFrameBuf :: proc() -> c.int ---

  /**
  * Wait for vertical blank start with callback since last update of framebuffer
  */
  ksceDisplayWaitSetFrameBufCB :: proc() -> c.int ---

  /**
  * Wait for vertical blank start after specified number of vertical periods
  * since last update of framebuffer.
  *
  * @param[in] vcount - Number of vertical periods before waiting for vertical blank start
  */
  ksceDisplayWaitSetFrameBufMulti :: proc(vcount: c.uint) -> c.int ---

  /**
  * Wait for vertical blank start with callback after specified number of vertical periods
  * since last update of framebuffer.
  *
  * @param[in] vcount - Number of vertical periods before waiting for vertical blank start
  */
  ksceDisplayWaitSetFrameBufMultiCB :: proc(vcount: c.uint) -> c.int ---

  /**
  * Register callback to be used at each vertical blank start
  *
  * @param[in] uid - Callback UID
  */
  ksceDisplayRegisterVblankStartCallback :: proc(uid: sce.UID) -> c.int ---

  /**
  * Register callback to be used at each vertical blank start for a display
  *
  * @param[in] display - Display index
  * @param[in] uid - Callback UID
  */
  ksceDisplayRegisterVblankStartCallbackInternal :: proc(display: c.int, uid: sce.UID) -> c.int ---

  /**
  * Unregister callback used at each vertical blank start
  *
  * @param[in] uid - Callback UID
  */
  ksceDisplayUnregisterVblankStartCallback :: proc(uid: sce.UID) -> c.int ---

  /**
  * Unregister callback used at each vertical blank start for a display
  *
  * @param[in] display - Display index
  * @param[in] uid - Callback UID
  */
  ksceDisplayUnregisterVblankStartCallbackInternal :: proc(display: c.int, uid: sce.UID) -> c.int ---

  /**
  * Register callback to be used when the framebuffer changes
  *
  * @param[in] uid - Callback UID
  */
  ksceDisplayRegisterFrameBufCallback :: proc(uid: sce.UID) -> c.int ---

  /**
  * Register callback to be used when the framebuffer changes for a display
  *
  * @param[in] display - Display index
  * @param[in] uid - Callback UID
  */
  ksceDisplayRegisterFrameBufCallbackInternal :: proc(display: c.int, uid: sce.UID) -> c.int ---

  /**
  * Enable/disable color inversion for a display.
  *
  * @param[in] display - Display index
  * @param[in] enable - Enable/disable color inversion
  */
  ksceDisplaySetInvertColors :: proc(display: c.int, enable: c.int) -> c.int ---

  /**
  * Set display plane owner
  *
  * @param[in] head - Use 0 for OLED/LCD and 1 for HDMI
  * @param[in] index - Can be 0 or 1
  * @param[in] pid - PID of the new owner
  *
  * @return 0 on success, < 0 on error.
  */
}

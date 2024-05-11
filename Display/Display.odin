package display

import "core:c"
import sce "../common"

foreign import _display "system:SceDisplay_stub"

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

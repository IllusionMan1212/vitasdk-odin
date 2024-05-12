package touch

import "core:c"
import sce "../common"

foreign import touch "system:SceTouch_stub"
foreign import touchkern "system:SceTouchForDriver_stub"

@(link_prefix = "sceTouch")
foreign touch {
  /**
  * Get Touch Panel information
  *
  * @param[in]	port		Port number.
  * @param[out]	pPanelInfo	The buffer to get the Touch Panel information.
  */
  GetPanelInfo :: proc(port: sce.UInt32, pPanelInfo: ^SceTouchPanelInfo) -> c.int ---

  /**
  * Get touch data (Blocking)
  *
  * @param[in]	port	Port Number.
  * @param[out]	pData	Buffer to receive touch data.
  * @param[in]	nBufs	Number of buffers to receive touch data.
  *
  * @return Buffers count, between 1 and 'nBufs'. <0 on error.
  */
  Read :: proc(port: sce.UInt32, pData: ^SceTouchData, nBufs: sce.UInt32) -> c.int ---

  /**
  * Get touch data (Polling)
  *
  * @param[in]	port	port number.
  * @param[out]	pData	Buffer to receive touch data.
  * @param[in]	nBufs	Number of buffers to receive touch data.
  *
  * @return Buffers count, between 1 and 'nBufs'. <0 on error.
  */
  Peek :: proc(port: sce.UInt32, pData: ^SceTouchData, nBufs: sce.UInt32) -> c.int ---

  /**
  * Set sampling state of touch panel.
  *
  * @param[in]	port	Port number.
  * @param[in]	state	Sampling state.
  */
  SetSamplingState :: proc(port: sce.UInt32, state: SceTouchSamplingState) -> c.int ---

  /**
  * Get sampling state of touch panel.
  *
  * @param[in]	port	Port number.
  * @param[out]	pState	The buffer to receive sampling state.
  */
  GetSamplingState :: proc(port: sce.UInt32, pState: ^SceTouchSamplingState) -> c.int ---

  /**
  * Enable touch force output.
  *
  * @param[in]	port	Port number.
  */
  EnableTouchForce :: proc(port: sce.UInt32) -> c.int ---

  /**
  * Disable touch force output.
  *
  * @param[in]	port	Port number.
  */
  DisableTouchForce :: proc(port: sce.UInt32) -> c.int ---
}

foreign touchkern {
  /**
  * Set touch enable flag
  *
  * @param[in] port   - The port number.
  * @param[in] enable - The enable flag.
  *
  * @return 0 on success. < 0 on error.
  */
  ksceTouchSetEnableFlag :: proc(port: sce.UInt32, enable: sce.Bool) -> c.int ---
}

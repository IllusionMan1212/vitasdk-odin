package ctrl

import "core:c"
import sce "../common"

foreign import ctrl "system:SceCtrl_stub"

@(link_prefix = "sceCtrl")
foreign ctrl {
	/**
	* Set the controller mode.
	*
	* @param[in] mode - One of ::SceCtrlPadInputMode.
	*
	* @return The previous mode, <0 on error.
	*/
	sceCtrlSetSamplingMode :: proc(mode: SceCtrlPadInputMode) -> c.int ---

	/**
	* Set the controller extend mode.
	*
	* @param[in] mode - One of ::SceCtrlPadInputMode.
	*
	* @return The previous mode, <0 on error.
	*/
	sceCtrlSetSamplingModeExt :: proc(mode: SceCtrlPadInputMode) -> c.int ---

	/**
	* Get the current controller mode.
	*
	* @param[out] pMode - Return value, see ::SceCtrlPadInputMode.
	*
	* @return The current mode, <0 on error.
	*/
	sceCtrlGetSamplingMode :: proc(pMode: ^SceCtrlPadInputMode) -> c.int ---

	/**
	* Get the controller state information (polling, positive logic).
	*
	* @param[in] port - use 0.
	* @param[out] *pad_data - see ::SceCtrlData.
	* @param[in] count - Buffers count. Up to 64 buffers can be requested.
	*
	* @return Buffers count, between 1 and 'count'. <0 on error.
	*/
	sceCtrlPeekBufferPositive :: proc(port: c.int, pad_data: ^SceCtrlData, count: c.int) -> c.int ---

	/**
	* Get the wireless controller state information (polling, positive logic).
	*
	* This function will bind L/R trigger value to L1/R1 instead of LTRIGGER/RTRIGGER
	*
	* @param[in] port - use 0 - 5.
	* @param[out] *pad_data - see ::SceCtrlData.
	* @param[in] count - Buffers count. Up to 64 buffers can be requested.
	*
	* @return Buffers count, between 1 and 'count'. <0 on error.
	*/
	sceCtrlPeekBufferPositive2 :: proc(port: c.int, pad_data: ^SceCtrlData, count: c.int) -> c.int ---

	/**
	* Get the controller state information (polling, positive logic).
	*
	* This function will return button presses, even if they're intercepted by common dialog/IME.
	*
	* @param[in] port - use 0.
	* @param[out] *pad_data - see ::SceCtrlData.
	* @param[in] count - Buffers count. Up to 64 buffers can be requested.
	*
	* @return Buffers count, between 1 and 'count'. <0 on error.
	*/
	sceCtrlPeekBufferPositiveExt :: proc(port: c.int, pad_data: ^SceCtrlData, count: int) -> c.int ---

	/**
	* Get the wireless controller state information (polling, positive logic).
	*
	* This function will bind L/R trigger value to L1/R1 instead of LTRIGGER/RTRIGGER
	* This function will return button presses, even if they're intercepted by common dialog/IME.
	*
	* @param[in] port - use 0 - 5.
	* @param[out] *pad_data - see ::SceCtrlData.
	* @param[in] count - Buffers count. Up to 64 buffers can be requested.
	*
	* @return Buffers count, between 1 and 'count'. <0 on error.
	*/
	sceCtrlPeekBufferPositiveExt2 :: proc(port: c.int, pad_data: ^SceCtrlData, count: c.int) -> c.int ---

	/**
	* Get the controller state information (polling, negative logic).
	*
	* @param[in] port - use 0.
	* @param[out] *pad_data - see ::SceCtrlData.
	* @param[in] count - Buffers count. Up to 64 buffers can be requested.
	*
	* @return Buffers count, between 1 and 'count'. <0 on error.
	*/
	sceCtrlPeekBufferNegative :: proc(port: c.int, pad_data: ^SceCtrlData, count: c.int) -> c.int ---

	/**
	* Get the wireless controller state information (polling, negative logic).
	*
	* This function will bind L/R trigger value to L1/R1 instead of LTRIGGER/RTRIGGER
	*
	* @param[in] port - use 0-5.
	* @param[out] *pad_data - see ::SceCtrlData.
	* @param[in] count - Buffers count. Up to 64 buffers can be requested.
	*
	* @return Buffers count, between 1 and 'count'. <0 on error.
	*/
	sceCtrlPeekBufferNegative2 :: proc(port: c.int, pad_data: ^SceCtrlData, count: c.int) -> c.int ---

	/**
	* Get the controller state information (blocking, positive logic).
	*
	* @param[in] port - use 0.
	* @param[out] *pad_data - see ::SceCtrlData.
	* @param[in] count - Buffers count. Up to 64 buffers can be requested.
	*
	* @return Buffers count, between 1 and 'count'. <0 on error.
	*/
	sceCtrlReadBufferPositive :: proc(port: c.int, pad_data: ^SceCtrlData, count: c.int) -> c.int ---

	/**
	* Get the wireless controller state information (blocking, positive logic).
	*
	* This function will bind L/R trigger value to L1/R1 instead of LTRIGGER/RTRIGGER
	*
	* @param[in] port - use 0-5.
	* @param[out] *pad_data - see ::SceCtrlData.
	* @param[in] count - Buffers count. Up to 64 buffers can be requested.
	*
	* @return Buffers count, between 1 and 'count'. <0 on error.
	*/
	sceCtrlReadBufferPositive2 :: proc(port: c.int, pad_data: ^SceCtrlData, count: c.int) -> c.int ---

	/**
	* Get the controller extended state information (blocking, positive logic).
	*
	* This function will return button presses, even if they're intercepted by common dialog/IME.
	*
	* @param[in] port - use 0.
	* @param[out] *pad_data - see ::SceCtrlData.
	* @param[in] count - Buffers count. Up to 64 buffers can be requested.
	*
	* @return Buffers count, between 1 and 'count'. <0 on error.
	*/
	sceCtrlReadBufferPositiveExt :: proc(port: c.int, pad_data: ^SceCtrlData, count: c.int) -> c.int ---

	/**
	* Get the wireless controller extended state information (blocking, positive logic).
	*
	* This function will bind L/R trigger value to L1/R1 instead of LTRIGGER/RTRIGGER
	* This function will return button presses, even if they're intercepted by common dialog/IME.
	*
	* @param[in] port - use 0-5.
	* @param[out] *pad_data - see ::SceCtrlData.
	* @param[in] count - Buffers count. Up to 64 buffers can be requested.
	*
	* @return Buffers count, between 1 and 'count'. <0 on error.
	*/
	sceCtrlReadBufferPositiveExt2 :: proc(port: c.int, pad_data: ^SceCtrlData, count: c.int) -> c.int ---

	/**
	* Get the controller state information (blocking, negative logic).
	*
	* @param[in] port - use 0.
	* @param[out] *pad_data - see ::SceCtrlData.
	* @param[in] count - Buffers count. Up to 64 buffers can be requested.
	*
	* @return Buffers count, between 1 and 'count'. <0 on error.
	*/
	sceCtrlReadBufferNegative :: proc(port: c.int, pad_data: ^SceCtrlData, count: c.int) -> c.int ---

	/**
	* Get the wireless controller state information (blocking, negative logic).
	*
	* This function will bind L/R trigger value to L1/R1 instead of LTRIGGER/RTRIGGER
	*
	* @param[in] port - use 0-5.
	* @param[out] *pad_data - see ::SceCtrlData.
	* @param[in] count - Buffers count. Up to 64 buffers can be requested.
	*
	* @return Buffers count, between 1 and 'count'. <0 on error.
	*/
	sceCtrlReadBufferNegative2 :: proc(port: c.int, pad_data: ^SceCtrlData , count: c.int) -> c.int ---

	/**
	* Set rules for button rapid fire
	*
	* @param[in] port - use 0.
	* @param[in] idx - rule index between 0-15
	* @param[in] pRule - structure ::SceCtrlRapidFireRule.
	*
	* @return 0, <0 on error.
	*/
	sceCtrlSetRapidFire :: proc(port: c.int, idx: c.int, pRule: ^SceCtrlRapidFireRule) -> c.int ---

	/**
	* Clear rules for button rapid fire
	*
	* @param[in] port - use 0.
	* @param[in] idx - rule index between 0-15
	*
	* @return 0, <0 on error.
	*/
	sceCtrlClearRapidFire :: proc(port: c.int, idx: c.int) -> c.int ---

	/**
	* Control the actuator (vibrate) on paired controllers.
	*
	* @param[in] port - use 1 for the first paired controller, etc.
	* @param[in] state - see ::SceCtrlActuator
	*
	* @return 0, <0 on error.
	*/
	sceCtrlSetActuator :: proc(port: c.int, pState: ^SceCtrlActuator) -> c.int ---

	/**
	* Control the light bar on paired controllers.
	*
	* @param[in] port - use 1 for the first paired controller, etc.
	* @param[in] r - red intensity
	* @param[in] g - green intensity
	* @param[in] b - blue intensity
	*
	* @return 0, <0 on error.
	*/
	sceCtrlSetLightBar :: proc(port: c.int, r: sce.UInt8, g: sce.UInt8, b: sce.UInt8) -> c.int ---

	/**
	* Get controller port information.
	*
	* @param[out] info - see ::SceCtrlPortInfo
	* @return 0, <0 on error
	*/
	sceCtrlGetControllerPortInfo :: proc(info: ^SceCtrlPortInfo) -> c.int ---

	/**
	* Get controller battery information.
	*
	* @param[in] port - use 1 for the first paired controller, etc.
	* @param[out] batt - battery level, between 0-5, 0xEE charging, 0xEF charged
	*
	* @return 0, <0 on error.
	*/
	sceCtrlGetBatteryInfo :: proc(port: c.int, batt: ^sce.UInt8) -> c.int ---

	/**
	* Sets intercept
	*
	* If true, allows the current thread to intercept controls. The use case
	* might be, for example, a game plugin that wishes to capture input without
	* having the input sent to the game thread.
	* @param[in]  intercept  Boolean value
	*
	* @return 0, < 0 on error
	*/
	sceCtrlSetButtonIntercept :: proc(intercept: c.int) -> c.int ---

	/**
	* Gets intercept
	*
	* @param[out]  intercept  Boolean value
	*
	* @return 0, < 0 on error
	*/
	sceCtrlGetButtonIntercept :: proc(intercept: ^int) -> c.int ---

	/**
	* Check if multi controller is supported
	*
	* @return 1 if yes, 0 if no
	*/
	sceCtrlIsMultiControllerSupported :: proc() -> c.int ---
}

package power

import "core:c"
import sce "../common"

foreign import power "system:ScePower_stub"
foreign import powerkern "system:ScePowerForDriver_stub"

foreign power {
	/**
	* Registers a ScePower Callback
	*
	* @param cbid - The UID of the specified callback
	*
	* @return 0 on success, < 0 on error
	*/
	scePowerRegisterCallback :: proc(cbid: sce.UID) -> c.int ---

	/**
	* Unregister a callback
	*
	* @param cbid - The UID of the specified callback
	*
	* @return 0 on success, < 0 on error
	*/
	scePowerUnregisterCallback :: proc(cbid: sce.UID) -> c.int ---

	/**
	* Returns battery charging status
	*
	* @return SCE_TRUE if under charge, SCE_FALSE otherwise
	*/
	scePowerIsBatteryCharging :: proc() -> sce.Bool ---

	/**
	* Returns battery life percentage
	*
	* @return Battery life percentage
	*/
	scePowerGetBatteryLifePercent :: proc() -> c.int ---

	/**
	* Set power configuration mode between:
	*
	* Mode A - This is the normal mode at process start-up. The clock frequency of the GPU core is the "normal" clock frequency. The WLAN/COM can be used.
	* Mode B - This mode accelerates the GPU clock frequency. The clock frequency of the GPU core is the "high" clock frequency. The WLAN/COM cannot be used.
	* Mode C - This mode accelerates the GPU clock frequency, and also uses the WLAN/COM. The clock frequency of the GPU core is the "high" clock frequency, and use of the WLAN/COM is possible. The screen (touchscreen) brightness, however, is limited. Also, camera cannot be used.
	*
	* @param conf One of ::ScePowerConfigurationMode
	*
	* @return 0 on success
	*/
	scePowerSetConfigurationMode :: proc(conf: c.int) -> c.int ---

	/**
	* Check if a suspend is required
	*
	* @return SCE_TRUE if suspend is required, SCE_FALSE otherwise
	*/
	scePowerIsSuspendRequired :: proc() -> sce.Bool ---

	/**
	* Check if AC is plugged in
	*
	* @return SCE_TRUE if plugged in, SCE_FALSE otherwise
	*/
	scePowerIsPowerOnline :: proc() -> sce.Bool ---

	/**
	* Returns battery life time
	*
	* @return Battery life time in minutes
	*/
	scePowerGetBatteryLifeTime :: proc() -> c.int ---

	/**
	* Returns battery remaining capacity
	*
	* @return battery remaining capacity in mAh (milliampere hour)
	*/
	scePowerGetBatteryRemainCapacity :: proc() -> c.int ---

	/**
	* Returns battery state
	*
	* @return SCE_TRUE if battery is low, SCE_FALSE otherwise
	*/
	scePowerIsLowBattery :: proc() -> sce.Bool ---

	/**
	* Returns battery full capacity
	*
	* @return battery full capacity in mAh (milliampere hour)
	*/
	scePowerGetBatteryFullCapacity :: proc() -> c.int ---

	/**
	* Returns battery temperature
	*
	* @return temperature in degrees celcius * 100
	*/
	scePowerGetBatteryTemp :: proc() -> c.int ---

	/**
	* Returns battery voltage
	*
	* @return battery voltage in mV (millivolts)
	*/
	scePowerGetBatteryVolt :: proc() -> c.int ---

	/**
	* Returns battery state of health
	*
	* @return battery state of health percent
	*/
	scePowerGetBatterySOH :: proc() -> c.int ---

	/**
	* Returns battery cycle count
	*
	* @return battery cycle count
	*/
	scePowerGetBatteryCycleCount :: proc() -> c.int ---

	/**
	* Returns CPU clock frequency
	*
	* @return CPU clock frequency in Mhz
	*/
	scePowerGetArmClockFrequency :: proc() -> c.int ---

	/**
	* Returns BUS clock frequency
	*
	* @return BUS clock frequency in Mhz
	*/
	scePowerGetBusClockFrequency :: proc() -> c.int ---

	/**
	* Returns GPU clock frequency
	*
	* @return GPU clock frequency in Mhz
	*/
	scePowerGetGpuClockFrequency :: proc() -> c.int ---

	/**
	* Returns GPU crossbar clock frequency
	*
	* @return GPU crossbar clock frequency in Mhz
	*/
	scePowerGetGpuXbarClockFrequency :: proc() -> c.int ---

	/**
	* Requests PS Vita to do a cold reset
	*
	* @return always 0
	*/
	scePowerRequestColdReset :: proc() -> c.int ---

	/**
	* Requests PS Vita to go into standby
	*
	* @return always 0
	*/
	scePowerRequestStandby :: proc() -> c.int ---

	/**
	* Requests PS Vita to suspend
	*
	* @return always 0
	*/
	scePowerRequestSuspend :: proc() -> c.int ---

	/**
	* Request display on
	*
	* @return always 0
	*/
	scePowerRequestDisplayOn :: proc() -> c.int ---

	/**
	* Request display off
	*
	* @return always 0
	*/
	scePowerRequestDisplayOff :: proc() -> c.int ---

	/**
	* Sets CPU clock frequency
	*
	* @param freq - Frequency to set in Mhz
	*
	* @return 0 on success, < 0 on error
	*/
	scePowerSetArmClockFrequency :: proc(freq: c.int) -> c.int ---

	/**
	* Sets BUS clock frequency
	*
	* @param freq - Frequency to set in Mhz
	*
	* @return 0 on success, < 0 on error
	*/
	scePowerSetBusClockFrequency :: proc(freq: c.int) -> c.int ---

	/**
	* Sets GPU clock frequency
	*
	* @param freq - Frequency to set in Mhz
	*
	* @return 0 on success, < 0 on error
	*/
	scePowerSetGpuClockFrequency :: proc(freq: c.int) -> c.int ---

	/**
	* Sets GPU crossbar clock frequency
	*
	* @param freq - Frequency to set in Mhz
	*
	* @return 0 on success, < 0 on error
	*/
	scePowerSetGpuXbarClockFrequency :: proc(freq: c.int) -> c.int ---

	/**
	* Sets wireless features usage
	*
	* @param enabled - SCE_TRUE to enable, SCE_FALSE to disable
	*
	* @return 0 on success, < 0 on error
	*/
	scePowerSetUsingWireless :: proc(enabled: sce.Bool) -> c.int ---

	/**
	* Gets wireless features usage
	*
	* @return SCE_TRUE if enabled, SCE_FALSE otherwise
	*/
	scePowerGetUsingWireless :: proc() -> c.int ---
}

foreign powerkern {
	/**
	* Registers a ScePower Callback
	*
	* @param cbid - The UID of the specified callback
	*
	* @return 0 on success, < 0 on error
	*/
	kscePowerRegisterCallback :: proc(cbid: sce.UID) -> c.int ---

	/**
	* Unregister a callback
	*
	* @param cbid - The UID of the specified callback
	*
	* @return 0 on success, < 0 on error
	*/
	kscePowerUnregisterCallback :: proc(cbid: sce.UID) -> c.int ---

	/**
	* Returns battery charging status
	*
	* @return SCE_TRUE if under charge, SCE_FALSE otherwise
	*/
	kscePowerIsBatteryCharging :: proc() -> sce.Bool ---

	/**
	* Returns battery life percentage
	*
	* @return Battery life percentage
	*/
	kscePowerGetBatteryLifePercent :: proc() -> c.int ---

	/**
	* Check if a suspend is required
	*
	* @return SCE_TRUE if suspend is required, SCE_FALSE otherwise
	*/
	kscePowerIsSuspendRequired :: proc() -> sce.Bool ---

	/**
	* Check if AC is plugged in
	*
	* @return SCE_TRUE if plugged in, SCE_FALSE otherwise
	*/
	kscePowerIsPowerOnline :: proc() -> sce.Bool ---

	/**
	* Returns battery life time
	*
	* @return Battery life time in minutes
	*/
	kscePowerGetBatteryLifeTime :: proc() -> c.int ---

	/**
	* Returns battery remaining capacity
	*
	* @return battery remaining capacity in mAh (milliampere hour)
	*/
	kscePowerGetBatteryRemainCapacity :: proc() -> c.int ---

	/**
	* Returns battery state
	*
	* @return SCE_TRUE if battery is low, SCE_FALSE otherwise
	*/
	kscePowerIsLowBattery :: proc() -> sce.Bool ---

	/**
	* Returns battery full capacity
	*
	* @return battery full capacity in mAh (milliampere hour)
	*/
	kscePowerGetBatteryFullCapacity :: proc() -> c.int ---

	/**
	* Returns battery temperature
	*
	* @return temperature in degrees celcius * 100
	*/
	kscePowerGetBatteryTemp :: proc() -> c.int ---

	/**
	* Returns battery voltage
	*
	* @return battery voltage in mV (millivolts)
	*/
	kscePowerGetBatteryVolt :: proc() -> c.int ---

	/**
	* Returns battery state of health
	*
	* @return battery state of health percent
	*/
	kscePowerGetBatterySOH :: proc() -> c.int ---

	/**
	* Returns battery cycle count
	*
	* @return battery cycle count
	*/
	kscePowerGetBatteryCycleCount :: proc() -> c.int ---

	/**
	* Returns CPU clock frequency
	*
	* @return CPU clock frequency in Mhz
	*/
	kscePowerGetArmClockFrequency :: proc() -> c.int ---

	/**
	* Returns BUS clock frequency
	*
	* @return BUS clock frequency in Mhz
	*/
	kscePowerGetBusClockFrequency :: proc() -> c.int ---

	/**
	* Returns Sys clock frequency
	*
	* @return Sys clock frequency in Mhz
	*/
	kscePowerGetSysClockFrequency :: proc() -> c.int ---

	/**
	* Returns GPU crossbar clock frequency
	*
	* @return GPU crossbar clock frequency in Mhz
	*/
	kscePowerGetGpuXbarClockFrequency :: proc() -> c.int ---

	/**
	* Requests PS Vita to do a soft reset
	*
	* @return always 0
	*/
	kscePowerRequestSoftReset :: proc() -> c.int ---

	/**
	* Requests PS Vita to do a cold reset
	*
	* @return always 0
	*/
	kscePowerRequestColdReset :: proc() -> c.int ---

	/**
	* Requests PS Vita to go into standby
	*
	* @return always 0
	*/
	kscePowerRequestStandby :: proc() -> c.int ---

	/**
	* Requests PS Vita to suspend
	*
	* @return always 0
	*/
	kscePowerRequestSuspend :: proc() -> c.int ---

	/**
	* Request display off
	*
	* @return always 0
	*/
	kscePowerRequestDisplayOff :: proc() -> c.int ---

	/**
	* Set the screen brightness.
	* @see ::sceAVConfigSetDisplayBrightness for userland counterpart.
	*
	* @param brightness Brightness that the screen will be set to (range 21-65536, 0 turns off the screen).
	*
	* @return ?
	*/
	kscePowerSetDisplayBrightness :: proc(brightness: c.int) -> c.int ---

	/**
	* Sets CPU clock frequency
	*
	* @param freq - Frequency to set in Mhz
	*
	* @return 0 on success, < 0 on error
	*/
	kscePowerSetArmClockFrequency :: proc(freq: c.int) -> c.int ---

	/**
	* Sets BUS clock frequency
	*
	* @param freq - Frequency to set in Mhz
	*
	* @return 0 on success, < 0 on error
	*/
	kscePowerSetBusClockFrequency :: proc(freq: c.int) -> c.int ---

	/**
	* Sets GPU clock frequency
	*
	* @param freq - Frequency to set in Mhz
	*
	* @return 0 on success, < 0 on error
	*/
	kscePowerSetGpuClockFrequency :: proc(freq: c.int) -> c.int ---

	/**
	* Sets GPU crossbar clock frequency
	*
	* @param freq - Frequency to set in Mhz
	*
	* @return 0 on success, < 0 on error
	*/
	kscePowerSetGpuXbarClockFrequency :: proc(freq: c.int) -> c.int ---
}

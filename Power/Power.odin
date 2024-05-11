package power

import "core:c"
import sce "../common"

foreign import power "system:ScePower_stub"

@(link_prefix = "scePower")
foreign power {
	/**
	* Registers a ScePower Callback
	*
	* @param cbid - The UID of the specified callback
	*
	* @return 0 on success, < 0 on error
	*/
	RegisterCallback :: proc(cbid: sce.UID) -> c.int ---

	/**
	* Unregister a callback
	*
	* @param cbid - The UID of the specified callback
	*
	* @return 0 on success, < 0 on error
	*/
	UnregisterCallback :: proc(cbid: sce.UID) -> c.int ---

	/**
	* Returns battery charging status
	*
	* @return SCE_TRUE if under charge, SCE_FALSE otherwise
	*/
	IsBatteryCharging :: proc() -> sce.Bool ---

	/**
	* Returns battery life percentage
	*
	* @return Battery life percentage
	*/
	GetBatteryLifePercent :: proc() -> c.int ---

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
	SetConfigurationMode :: proc(conf: c.int) -> c.int ---

	/**
	* Check if a suspend is required
	*
	* @return SCE_TRUE if suspend is required, SCE_FALSE otherwise
	*/
	IsSuspendRequired :: proc() -> sce.Bool ---

	/**
	* Check if AC is plugged in
	*
	* @return SCE_TRUE if plugged in, SCE_FALSE otherwise
	*/
	IsPowerOnline :: proc() -> sce.Bool ---

	/**
	* Returns battery life time
	*
	* @return Battery life time in minutes
	*/
	GetBatteryLifeTime :: proc() -> c.int ---

	/**
	* Returns battery remaining capacity
	*
	* @return battery remaining capacity in mAh (milliampere hour)
	*/
	GetBatteryRemainCapacity :: proc() -> c.int ---

	/**
	* Returns battery state
	*
	* @return SCE_TRUE if battery is low, SCE_FALSE otherwise
	*/
	IsLowBattery :: proc() -> sce.Bool ---

	/**
	* Returns battery full capacity
	*
	* @return battery full capacity in mAh (milliampere hour)
	*/
	GetBatteryFullCapacity :: proc() -> c.int ---

	/**
	* Returns battery temperature
	*
	* @return temperature in degrees celcius * 100
	*/
	GetBatteryTemp :: proc() -> c.int ---

	/**
	* Returns battery voltage
	*
	* @return battery voltage in mV (millivolts)
	*/
	GetBatteryVolt :: proc() -> c.int ---

	/**
	* Returns battery state of health
	*
	* @return battery state of health percent
	*/
	GetBatterySOH :: proc() -> c.int ---

	/**
	* Returns battery cycle count
	*
	* @return battery cycle count
	*/
	GetBatteryCycleCount :: proc() -> c.int ---

	/**
	* Returns CPU clock frequency
	*
	* @return CPU clock frequency in Mhz
	*/
	GetArmClockFrequency :: proc() -> c.int ---

	/**
	* Returns BUS clock frequency
	*
	* @return BUS clock frequency in Mhz
	*/
	GetBusClockFrequency :: proc() -> c.int ---

	/**
	* Returns GPU clock frequency
	*
	* @return GPU clock frequency in Mhz
	*/
	GetGpuClockFrequency :: proc() -> c.int ---

	/**
	* Returns GPU crossbar clock frequency
	*
	* @return GPU crossbar clock frequency in Mhz
	*/
	GetGpuXbarClockFrequency :: proc() -> c.int ---

	/**
	* Requests PS Vita to do a cold reset
	*
	* @return always 0
	*/
	RequestColdReset :: proc() -> c.int ---

	/**
	* Requests PS Vita to go into standby
	*
	* @return always 0
	*/
	RequestStandby :: proc() -> c.int ---

	/**
	* Requests PS Vita to suspend
	*
	* @return always 0
	*/
	RequestSuspend :: proc() -> c.int ---

	/**
	* Request display on
	*
	* @return always 0
	*/
	RequestDisplayOn :: proc() -> c.int ---

	/**
	* Request display off
	*
	* @return always 0
	*/
	RequestDisplayOff :: proc() -> c.int ---

	/**
	* Sets CPU clock frequency
	*
	* @param freq - Frequency to set in Mhz
	*
	* @return 0 on success, < 0 on error
	*/
	SetArmClockFrequency :: proc(freq: c.int) -> c.int ---

	/**
	* Sets BUS clock frequency
	*
	* @param freq - Frequency to set in Mhz
	*
	* @return 0 on success, < 0 on error
	*/
	SetBusClockFrequency :: proc(freq: c.int) -> c.int ---

	/**
	* Sets GPU clock frequency
	*
	* @param freq - Frequency to set in Mhz
	*
	* @return 0 on success, < 0 on error
	*/
	SetGpuClockFrequency :: proc(freq: c.int) -> c.int ---

	/**
	* Sets GPU crossbar clock frequency
	*
	* @param freq - Frequency to set in Mhz
	*
	* @return 0 on success, < 0 on error
	*/
	SetGpuXbarClockFrequency :: proc(freq: c.int) -> c.int ---

	/**
	* Sets wireless features usage
	*
	* @param enabled - SCE_TRUE to enable, SCE_FALSE to disable
	*
	* @return 0 on success, < 0 on error
	*/
	SetUsingWireless :: proc(enabled: sce.Bool) -> c.int ---

	/**
	* Gets wireless features usage
	*
	* @return SCE_TRUE if enabled, SCE_FALSE otherwise
	*/
	GetUsingWireless :: proc() -> c.int ---
}

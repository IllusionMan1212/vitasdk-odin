package udcd

import "core:c"
import sce "../common"

foreign import udcd "system:SceUdcd_stub"

@(link_prefix = "sceUdcd")
foreign udcd {
	/**
	* Get device state
	*
	* @param[out] state - Device state
	*
	* @return 0 on success, < 0 on error.
	*/
	GetDeviceState :: proc(state: ^SceUdcdDeviceState) -> c.int ---

	/**
	* Get device information
	*
	* @param[out] devInfo - Device information
	*
	* @return 0 on success, < 0 on error.
	*/
	GetDeviceInfo :: proc(devInfo: ^SceUdcdDeviceInfo) -> c.int ---

	/**
	* Get state of a specific USB driver
	*
	* @param driverName - name of USB driver to get status from
	*
	* @return SCE_UDCD_STATUS_DRIVER_STARTED if the driver has been started, SCE_UDCD_STATUS_DRIVER_REGISTERED if it is stopped
	*/
	GetDrvState :: proc(driverName: cstring) -> c.int ---

	/**
	* Register callback
	*
	* @param[in] cbid - Callback UID
	* @param[in] state - State
	*
	* @return 0 on success, < 0 on error.
	*/
	RegisterCallback :: proc(cbid: sce.UID, state: c.int) -> c.int ---

	/**
	* Unregister callback
	*
	* @param[in] cbid - Callback UID
	*
	* @return 0 on success, < 0 on error.
	*/
	UnregisterCallback :: proc(cbid: sce.UID) -> c.int ---

	/**
	* Wait for state
	*
	* @param[in] waitParam - Wait parameter
	* @param[in] timeout - Timeout
	*
	* @return 0 on success, < 0 on error.
	*/
	WaitState :: proc(waitParam: ^SceUdcdWaitParam, timeout: c.uint) -> c.int ---
}

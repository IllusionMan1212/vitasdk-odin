package udcd

import "core:c"
import sce "../common"

foreign import udcd "system:SceUdcd_stub"
foreign import udcdkern "system:SceUdcdForDriver_stub"

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

foreign udcdkern {
	/**
	* Waits until an UDCD bus is initialized
	*
	* @param[in] timeout - Timeout
	* @param[in] bus - UDCD bus (default is 2)
	*
	* @return 0 on success, < 0 on error.
	*/
	ksceUdcdWaitBusInitialized :: proc(timeout: c.uint, bus: c.int) -> c.int ---

	/**
	* Start a USB driver.
	*
	* @param driverName - Name of the USB driver to start
	* @param size - Size of arguments to pass to USB driver start
	* @param args - Arguments to pass to USB driver start
	*
	* @return 0 on success, < 0 on error.
	*/
	ksceUdcdStart :: proc(driverName: cstring, size: c.int, args: rawptr) -> c.int ---

	/**
	* Start a USB driver for an UDCD bus.
	*
	* @param driverName - Name of the USB driver to start
	* @param size - Size of arguments to pass to USB driver start
	* @param args - Arguments to pass to USB driver start
	* @param[in] bus - UDCD bus (default is 2)
	*
	* @return 0 on success, < 0 on error.
	*/
	ksceUdcdStartInternal :: proc(driverName: cstring, size: c.int, args: rawptr, bus: c.int) -> c.int ---

	/**
	* Starts the current USB driver for an UDCD bus.
	*
	* @param[in] unused - Unused
	* @param[in] bus - UDCD bus (default is 2)
	*
	* @return 0 on success, < 0 on error.
	*/
	ksceUdcdStartCurrentInternal :: proc(unused: c.int, bus: c.int) -> c.int ---

	/**
	* Stop a USB driver.
	*
	* @param driverName - Name of the USB driver to stop
	* @param size - Size of arguments to pass to USB driver start
	* @param args - Arguments to pass to USB driver start
	*
	* @return 0 on success, < 0 on error.
	*/
	ksceUdcdStop :: proc(driverName: cstring, size: c.int, args: rawptr) -> c.int ---

	/**
	* Stop a USB driver for an UDCD bus.
	*
	* @param driverName - Name of the USB driver to stop
	* @param size - Size of arguments to pass to USB driver start
	* @param args - Arguments to pass to USB driver start
	* @param[in] bus - UDCD bus (default is 2)
	*
	* @return 0 on success, < 0 on error.
	*/
	ksceUdcdStopInternal :: proc(driverName: cstring, size: c.int, args: rawptr, bus: c.int) -> c.int ---

	/**
	* Stops the current USB driver for an UDCD bus.
	*
	* @param[in] bus - UDCD bus (default is 2)
	*
	* @return 0 on success, < 0 on error.
	*/
	ksceUdcdStopCurrentInternal :: proc(bus: c.int) -> c.int ---

	/**
	* Activate a USB driver.
	*
	* @param pid - Product ID for the default USB Driver
	*
	* @return 0 on success, < 0 on error.
	*/
	ksceUdcdActivate :: proc(productId: c.uint) -> c.int ---

	/**
	* Activate a USB driver for an UDCD bus.
	*
	* @param pid - Product ID for the default USB Driver
	* @param[in] bus_powered - Enable USB bus power
	* @param[in] bus - UDCD bus (default is 2)
	*
	* @return 0 on success, < 0 on error.
	*/
	ksceUdcdActivateInternal :: proc(productId: c.uint, bus_powered: c.uint, bus: c.int) -> c.int ---

	/**
	* Deactivate USB driver.
	*
	* @return 0 on success, < 0 on error.
	*/
	ksceUdcdDeactivate :: proc() -> c.int ---

	/**
	* Deactivate USB driver for an UDCD bus.
	*
	* @param[in] bus - UDCD bus (default is 2)
	*
	* @return 0 on success, < 0 on error.
	*/
	ksceUdcdDeactivateInternal :: proc(bus: c.int) -> c.int ---

	/**
	* Get USB state
	*
	* @return One or more ::SceUdcdStatus.
	*/
	ksceUdcdGetDeviceState :: proc() -> c.int ---

	/**
	* Get USB state for an UDCD bus
	*
	* @param[in] bus - UDCD bus (default is 2)
	*
	* @return One or more ::SceUdcdStatus.
	*/
	ksceUdcdGetDeviceStateInternal :: proc(bus: c.int) -> c.int ---

	/**
	* Get device information
	*
	* @param[out] devInfo - Device information
	*
	* @return 0 on success, < 0 on error.
	*/
	ksceUdcdGetDeviceInfo :: proc(devInfo: ^SceUdcdDeviceInfo) -> c.int ---

	/**
	* Get device information for an UDCD bus
	*
	* @param[out] devInfo - Device information
	* @param[in] bus - UDCD bus (default is 2)
	*
	* @return 0 on success, < 0 on error.
	*/
	ksceUdcdGetDeviceInfoInternal :: proc(devInfo: ^SceUdcdDeviceInfo, bus: c.int) -> c.int ---

	/**
	* Get state of a specific USB driver
	*
	* @param driverName - name of USB driver to get status from
	*
	* @return SCE_UDCD_STATUS_DRIVER_STARTED if the driver has been started, SCE_UDCD_STATUS_DRIVER_REGISTERED if it is stopped
	*/
	ksceUdcdGetDrvState :: proc(driverName: cstring) -> c.int ---

	/**
	* Get state of a specific USB driver for an UDCD bus
	*
	* @param driverName - name of USB driver to get status from
	* @param[in] bus - UDCD bus (default is 2)
	*
	* @return SCE_UDCD_STATUS_DRIVER_STARTED if the driver has been started, SCE_UDCD_STATUS_DRIVER_REGISTERED if it is stopped
	*/
	ksceUdcdGetDrvStateInternal :: proc(driverName: cstring, bus: c.int) -> c.int ---

	/**
	* Wait for state
	*
	* @param[in] waitParam - Wait parameter
	* @param[in] timeout - Timeout
	*
	* @return 0 on success, < 0 on error.
	*/
	ksceUdcdWaitState :: proc(waitParam: ^SceUdcdWaitParam, timeout: c.uint) -> c.int ---

	/**
	* Wait for state for an UDCD bus
	*
	* @param[in] waitParam - Wait parameter
	* @param[in] timeout - Timeout
	* @param[in] bus - UDCD bus (default is 2)
	*
	* @return 0 on success, < 0 on error.
	*/
	ksceUdcdWaitStateInternal :: proc(waitParam: ^SceUdcdWaitParam, timeout: c.uint, bus: c.int) -> c.int ---

	/**
	* Register a USB driver.
	*
	* @param drv - Pointer to a filled out USB driver
	*
	* @return 0 on success, < 0 on error
	*/
	ksceUdcdRegister :: proc(drv: ^SceUdcdDriver) -> c.int ---

	/**
	* Register a USB driver to a specific USB bus.
	*
	* @param drv - Pointer to a filled out USB driver
	* @param bus - The USB bus index (usually 2)
	*
	* @return 0 on success, < 0 on error
	*/
	ksceUdcdRegisterInternal :: proc(drv: ^SceUdcdDriver, bus: c.int) -> c.int ---

	/**
	* Unregister a USB driver
	*
	* @param drv - Pointer to a filled out USB driver
	*
	* @return 0 on success, < 0 on error
	*/
	ksceUdcdUnregister :: proc(drv: ^SceUdcdDriver) -> c.int ---

	/**
	* Unregister a USB driver for an UDCD bus
	*
	* @param drv - Pointer to a filled out USB driver
	* @param[in] bus - UDCD bus (default is 2)
	*
	* @return 0 on success, < 0 on error
	*/
	ksceUdcdUnregisterInternal :: proc(drv: ^SceUdcdDriver, bus: c.int) -> c.int ---

	/**
	* Clear the FIFO on an endpoint
	*
	* @param endp - The endpoint to clear
	*
	* @return 0 on success, < 0 on error
	*/
	ksceUdcdClearFIFO :: proc(endp: ^SceUdcdEndpoint) -> c.int ---

	/**
	* Clear the FIFO on an endpoint for an UDCD bus
	*
	* @param endp - The endpoint to clear
	* @param[in] bus - UDCD bus (default is 2)
	*
	* @return 0 on success, < 0 on error
	*/
	ksceUdcdClearFIFOInternal :: proc(endp: ^SceUdcdEndpoint, bus: c.int) -> c.int ---

	/**
	* Cancel any pending requests on an endpoint.
	*
	* @param endp - The endpoint to cancel
	*
	* @return 0 on success, < 0 on error
	*/
	ksceUdcdReqCancelAll :: proc(endp: ^SceUdcdEndpoint) -> c.int ---

	/**
	* Stall an endpoint
	*
	* @param endp - The endpoint to stall
	*
	* @return 0 on success, < 0 on error
	*/
	ksceUdcdStall :: proc(endp: ^SceUdcdEndpoint) -> c.int ---

	/**
	* Stall an endpoint for an UDCD bus
	*
	* @param endp - The endpoint to stall
	* @param[in] bus - UDCD bus (default is 2)
	*
	* @return 0 on success, < 0 on error
	*/
	ksceUdcdStallInternal :: proc(endp: ^SceUdcdEndpoint, bus: c.int) -> c.int ---

	/**
	* Queue a send request (IN from host pov)
	*
	* @param req - Pointer to a filled out ::SceUdcdDeviceRequest structure.
	*
	* @return 0 on success, < 0 on error
	*/
	ksceUdcdReqSend :: proc(req: ^SceUdcdDeviceRequest) -> c.int ---

	/**
	* Queue a send request (IN from host pov) for an UDCD bus
	*
	* @param req - Pointer to a filled out ::SceUdcdDeviceRequest structure.
	* @param[in] bus - UDCD bus (default is 2)
	*
	* @return 0 on success, < 0 on error
	*/
	ksceUdcdReqSendInternal :: proc(req: ^SceUdcdDeviceRequest, bus: c.int) -> c.int ---

	/**
	* Queue a receive request (OUT from host pov)
	*
	* @param req - Pointer to a filled out ::SceUdcdDeviceRequest structure
	*
	* @return 0 on success, < 0 on error
	*/
	ksceUdcdReqRecv :: proc(req: ^SceUdcdDeviceRequest) -> c.int ---

	/**
	* Queue a receive request (OUT from host pov) for an UDCD bus
	*
	* @param req - Pointer to a filled out ::SceUdcdDeviceRequest structure
	* @param[in] bus - UDCD bus (default is 2)
	*
	* @return 0 on success, < 0 on error
	*/
	ksceUdcdReqRecvInternal :: proc(req: ^SceUdcdDeviceRequest, bus: c.int) -> c.int ---
}

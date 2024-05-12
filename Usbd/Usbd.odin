package usbd

import "core:c"
import sce "../common"

foreign import usbd "system:SceUsbd_stub"
foreign import usbdkern "system:SceUsbdForDriver_stub"

@(link_prefix = "sceUsbd")
foreign usbd {
	/**
	* Init usb subsystem
	*
	* @return 0 on success, < 0 on error
	*
	* @param[out] uid Pointer to uid
	*
	*/
	Init :: proc(uid: ^sce.UID) -> c.int ---

	/**
	* Stop usb subsystem
	*
	* @return 0 on success, < 0 on error
	*
	* @param uid uid
	*
	*/
	End :: proc(uid: sce.UID) -> c.int ---

	/**
	* Get usb devices list
	*
	* @return 0 on success, < 0 on error
	*
	* @param[in] uid uid
	* @param[in] num max number of devices to return (8 max)
	* @param[out] info pointer to receive device info
	*
	*/
	GetDeviceList :: proc(uid: sce.UID, num: sce.Size, info: ^SceUsbdDeviceInfo) -> c.int --- // 8 devices max


	/**
	* Get usb device descriptors data size
	*
	* @return size on success, < 0 on error
	*
	* @param uid uid
	* @param device_id device id
	*
	*/
	GetDescriptorSize :: proc(uid: sce.UID, device_id: c.uint) -> c.int ---

	/**
	* Get usb device descriptors (all)
	*
	* @return 0 on success, < 0 on error
	*
	* @param[in] uid uid
	* @param[in] device_id device id
	* @param[out] descriptor buffer for descriptor data
	* @param[in] size buffer size
	*
	*/
	GetDescriptor :: proc(uid: sce.UID, device_id: sce.UID, descriptor: ^c.uint, size: sce.Size) -> c.int ---


	/**
	* Get usb device speed
	*
	* @return 0 on success, < 0 on error
	*
	* @param[in] uid uid
	* @param[in] device_id device id
	* @param[out] speed device speed
	*
	*/
	GetDeviceSpeed :: proc(uid: sce.UID, device_id: sce.UID, speed: ^c.uint) -> c.int ---

	/**
	* Register callback to usb event
	*
	* @return 0 on success, < 0 on error
	*
	* @param[in] cbid callback uid
	* @param[in] flag if 1 - trigger events immediately
	*
	* @note there may be only one callback registered through whole system.
	*       And it's currently taken up by shell.
	*
	*/
	RegisterCallback :: proc(cbid: sce.UID, flag: c.int) -> c.int ---

	/**
	* Remove callback to usb event
	*
	* @return 0 on success, < 0 on error
	*
	* @param[in] cbid callback uid
	*
	* @note this checks process id
	*
	*/
	UnregisterCallback :: proc(cbid: sce.UID) -> c.int ---

	/**
	* Reset usb device
	*
	* @return 0 on success, < 0 on error
	*
	* @param[in] uid uid
	* @param[in] device_id device id
	*
	*/
	ResetDevice :: proc(uid: sce.UID, device_id: sce.UID) -> c.int ---

	/**
	* Attach specified driver to device
	*
	* @return 0 on success, < 0 on error
	*
	* @param[in] uid uid
	* @param[in] driver_id driver id (result of Register(Composite)Ldd)
	* @param[in] bus usb port number
	* @param[in] device usb device number
	*
	* @note device_id = (bus << 16) + device
	*/
	Attach :: proc(uid: sce.UID, driver_id: sce.UID, bus: sce.UInt, device: sce.UInt) -> c.int ---

	/**
	* Get device address
	*
	* @return 0 on success, < 0 on error
	*
	* @param[in] uid uid
	* @param[in] device_id device id
	* @param[out] addr buffer for return value
	*
	* @note it is unknown what that function actually returns in addr, observed only 0
	*/
	GetDeviceAddress :: proc(uid: sce.UID, device_id: sce.UID, addr: ^SceUsbdDeviceAddress) -> c.int ---

	/**
	* Get transfer status
	*
	* @return 0 on success, < 0 on error
	*
	* @param[in] transfer_id transfer uid
	* @param[out] status buffer for return value
	*
	* @note it is unknown what that function actually returns in addr, observed only 0
	*/
	GetTransferStatus :: proc(transfer_id: sce.UID, status: ^SceUsbdTransferStatus) -> c.int ---

	/**
	* Get isochronous transfer status
	*
	* @return 0 on success, < 0 on error
	*
	* @param[in] transfer_id transfer uid
	* @param[out] status buffer for return value
	*
	* @note it is unknown what that function actually returns in addr, observed only 0
	*/
	GetIsochTransferStatus :: proc(transfer_id: sce.UID, status: ^SceUsbdIsochTransferStatus) -> c.int ---


	/**
	* Open endpoint communication pipe
	*
	* @return pipe_id on success, < 0 on error
	*
	* @param[in] uid uid
	* @param[in] pipe endpoint to open
	*
	*/
	OpenPipe :: proc(uid: sce.UID, pipe: ^SceUsbdDevicePipe) -> sce.UID ---

	/**
	* Open endpoint communication pipe for default config endpoint
	*
	* @return pipe_id on success, < 0 on error
	*
	* @param[in] uid uid
	* @param[in] device_id device id
	*
	*/
	OpenDefaultPipe :: proc(uid: sce.UID, device_id: sce.UID) -> sce.UID ---

	/**
	* Close endpoint communication pipe
	*
	* @return 0 on success, < 0 on error
	*
	* @param[in] uid uid
	* @param[in] pipe_id pipe uid
	*
	*/
	ClosePipe :: proc(uid: sce.UID, pipe_id: sce.UID) -> c.int ---

	/**
	* Transfer data to/from endpoint
	*
	* @return transfer_id on success, < 0 on error
	*
	* @param[in] uid uid
	* @param[in] data data to transfer
	*
	*/
	TransferData :: proc(uid: sce.UID, data: ^SceUsbdTransferData) -> sce.UID ---

	/**
	* Transfer data to/from endpoint isochronously
	*
	* @return transfer_id on success, < 0 on error
	*
	* @param[in] uid uid
	* @param[in] pipe_id pipe uid
	* @param[in] transfer data to transfer
	*
	*/
	IsochTransferData :: proc(uid: sce.UID, pipe_id: sce.UID, transfer: ^SceUsbdIsochTransfer) -> c.int ---

	/**
	* Receive usb event
	*
	* @return transfer_id on success, < 0 on error
	*
	* @param[in] uid uid
	* @param[out] event
	*
	*/
	ReceiveEvent :: proc(uid: sce.UID, event: ^SceUsbdReceiveEvent) -> c.int ---

	/**
	* Register logical device driver
	*
	* @return driver_id on success, < 0 on error
	*
	* @param[in] uid uid
	* @param[in] name driver name, 255 max
	*
	*/
	RegisterLdd :: proc(uid: sce.UID, name: cstring) -> sce.UID ---

	/**
	* Register logical device driver for composite devices
	*
	* @return driver_id on success, < 0 on error
	*
	* @param[in] uid uid
	* @param[in] name driver name, 255 max
	*
	*/
	RegisterCompositeLdd :: proc(uid: sce.UID, name: cstring) -> sce.UID ---

	/**
	* De-register logical device driver
	*
	* @return 0 on success, < 0 on error
	*
	* @param[in] uid uid
	* @param[in] name driver name, 255 max
	*
	*/
	UnregisterLdd :: proc(uid: sce.UID, name: cstring) -> c.int ---

	/**
	* Attach composite driver to device
	*
	* @return 0 on success, < 0 on error
	*
	* @param[in] uid uid
	* @param[in] param parameters
	*
	*/
	AttachCompositeLdd :: proc(uid: sce.UID, param: ^SceUsbdAttachCompositeParam) -> c.int ---
}

foreign usbdkern {
	/**
	* Register USB driver
	*
	* @return 0 on success, < 0 on error
	*
	* @param driver driver struct
	*
	*/
	ksceUsbdRegisterDriver :: proc(#by_ptr driver: SceUsbdDriver) -> c.int ---

	/**
	* Register USB driver for composite devices
	*
	* @return 0 on success, < 0 on error
	*
	* @param driver driver struct
	*
	*/
	ksceUsbdRegisterCompositeLdd :: proc(#by_ptr driver: SceUsbdCompositeDriver) -> c.int ---

	/**
	* De-register USB driver
	*
	* @return 0 on success, < 0 on error
	*
	* @param driver driver struct
	*
	*/
	ksceUsbdUnregisterDriver :: proc(#by_ptr driver: SceUsbdDriver) -> c.int ---

	/**
	* De-register USB driver for composite devices
	*
	* @return 0 on success, < 0 on error
	*
	* @param driver driver struct
	*
	*/
	ksceUsbdUnregisterCompositeLdd :: proc(#by_ptr driver: SceUsbdCompositeDriver) -> c.int ---


	/**
	* Return usb descriptor
	*
	* @return descriptor data on success, NULL on error
	*
	* @param device_id device id
	* @param start pointer to descriptor to start scanning from (may be NULL)
	* @param type descriptor type
	*
	*/
	ksceUsbdScanStaticDescriptor :: proc(device_id: sce.UID, start: rawptr, type: SceUsbdDescriptorType) -> rawptr ---

	/**
	* Open communication pipe to endpoint
	*
	* @return pipe uid on success, < 0 on error
	*
	* @param device_id device id
	* @param endpoint endpoint (may be null for default configuration endpoint)
	*
	*/
	ksceUsbdOpenPipe :: proc(device_id: c.int, endpoint: ^SceUsbdEndpointDescriptor) -> sce.UID ---

	/**
	* Close communication pipe to endpoint
	*
	* @return 0 on success, < 0 on error
	*
	* @param pipe_id pipe id
	*
	*/
	ksceUsbdClosePipe :: proc(pipe_id: sce.UID) -> c.int ---

	/**
	* Transfer data to/from endpoint
	*
	* @return 0 on success, < 0 on error
	*
	* @param pipe_id pipe id
	* @param req transfer request
	* @param buffer data
	* @param cb transfer callback
	* @param user_data userdata to pass to callback
	*
	*/
	ksceUsbdControlTransfer :: proc(pipe_id: sce.UID, #by_ptr req: SceUsbdDeviceRequest, buffer: [^]c.uchar, cb: ksceUsbdDoneCallback, user_data: rawptr) -> c.int ---

	/**
	* Transfer data to/from interrupt endpoint
	*
	* @return 0 on success, < 0 on error
	*
	* @param pipe_id pipe id
	* @param buffer data
	* @param length data length
	* @param cb transfer callback
	* @param user_data userdata to pass to callback
	*
	*/
	ksceUsbdInterruptTransfer :: proc(pipe_id: sce.UID, buffer: [^]c.uchar, length: sce.Size, cb: ksceUsbdDoneCallback, user_data: rawptr) -> c.int ---

	/**
	* Transfer isochronous data to/from endpoint
	*
	* @return 0 on success, < 0 on error
	*
	* @param pipe_id pipe id
	* @param transfer transfer request
	* @param cb transfer callback
	* @param user_data userdata to pass to callback
	*
	*/
	ksceUsbdIsochronousTransfer :: proc(pipe_id: sce.UID, transfer: ^ksceUsbdIsochTransfer, cb: ksceUsbdIsochDoneCallback, user_data: rawptr) -> c.int ---

	/**
	* Transfer data to/from endpoint
	*
	* @return 0 on success, < 0 on error
	*
	* @param pipe_id pipe id
	* @param buffer data
	* @param length data length
	* @param cb transfer callback
	* @param user_data userdata to pass to callback
	*
	* @note buffer pointer must be 64b aligned
	*/
	ksceUsbdBulkTransfer :: proc(pipe_id: sce.UID, buffer: [^]c.uchar, length: c.uint, cb: ksceUsbdDoneCallback, user_data: rawptr) -> c.int ---

	/**
	* Transfer data to/from endpoint
	*
	* @return 0 on success, < 0 on error
	*
	* @param pipe_id pipe id
	* @param buffer data
	* @param length data length
	* @param cb transfer callback
	* @param user_data userdata to pass to callback
	*
	* @note buffer pointer must be 64b aligned
	*/
	ksceUsbdBulkTransfer2 :: proc(pipe_id: c.int, buffer: [^]c.uchar, length: c.uint, cb: ksceUsbdDoneCallback, user_data: rawptr) -> c.int ---


	/**
	* Get device location
	*
	* @return 0 on success, < 0 on error
	*
	* @param device_id device id
	* @param[out] location device location data (port)
	*
	*/
	ksceUsbdGetDeviceLocation :: proc(device_id: sce.UID, location: ^c.uint8_t) -> c.int ---

	ksceUsbdSuspend :: proc(port: c.int) -> c.int ---
	ksceUsbdSuspendPhase2 :: proc(port: c.int, flag: c.int) -> c.int ---
	ksceUsbdResume :: proc(port: c.int) -> c.int ---

	ksceUsbdHostStop :: proc(port: c.int) -> c.int ---
	ksceUsbdHostStart :: proc(port: c.int) -> c.int ---

	/**
	* Get device speed
	*
	* @return 0 on success, < 0 on error
	*
	* @param device_id device id
	* @param[out] speed device speed
	*
	*/
	ksceUsbdGetDeviceSpeed :: proc(device_id: c.int, speed: ^c.uint8_t) -> c.int ---

	ksceUsbd_05073925 :: proc(device_id: sce.UID, unk1: ^c.int, unk2: ^c.int) -> c.int ---
	ksceUsbd_7938DAC7 :: proc(pipe_id: sce.UID) -> c.int --- // clear halt?
}

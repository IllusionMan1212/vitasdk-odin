package usbstor

import "core:c"

foreign import usbstor "system:SceUsbstorVStorDriver_stub"

SceUsbstorVstorType :: enum c.int {
	FAT     = 0,
	CDROM   = 5
}

@(link_prefix = "sceUsbstorVStor")
foreign usbstor {
  /**
  * Set image file path
  *
  * @param[in] path - Image file path
  *
  * @return 0 on success, < 0 on error.
  */
  SetImgFilePath :: proc(path: cstring) -> c.int ---

  /**
  * Set USB descriptor device information
  *
  * @param[in] name - Name
  * @param[in] version - Version
  *
  * @return 0 on success, < 0 on error.
  */
  SetDeviceInfo :: proc(name: cstring, version: cstring) -> c.int ---

  /**
  * Start USB virtual storage
  *
  * @param[in] type - One of ::SceUsbstorVstorType
  *
  * @return 0 on success, < 0 on error.
  */
  Start :: proc(type: SceUsbstorVstorType) -> c.int ---

  /**
  * Stop USB virtual storage
  *
  * @return 0 on success, < 0 on error.
  */
  Stop :: proc() -> c.int ---
}

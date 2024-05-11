package usbserv

import "core:c"

foreign import usbserv "system:SceUsbServ_stub"

// TODO:
SceUsbservErrorCode :: enum c.uint {
	UNAVAILABLE    = 0x80248002,
	INVALID_PARAM  = 0x80248003,
	NOT_SUPPORTED  = 0x80248004,
	FATAL          = 0x802480FF
}

@(link_prefix = "sceUsbServ")
foreign usbserv {
  /**
  * Enable accessory port
  *
  * @return 0 on success, < 0 on error
  *
  */
  AccessoryActivate :: proc() -> c.int ---

  /**
  * Disable accessory port
  *
  * @return 0 on success, < 0 on error
  *
  */
  AccessoryDeactivate :: proc() -> c.int ---
}

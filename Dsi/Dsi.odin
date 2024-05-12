package dsi

import "core:c"

foreign import dsi "system:SceDsiForDriver_stub"

SceDsiErrorCode :: enum c.uint {
	INVALID_HEAD	= 0x803F0600,
	INVALID_STATE	= 0x803F0601,
	INVALID_PARAM	= 0x803F0602,
	HEAD_NOT_ENABLED	= 0x803F0603,
}

SceDsiHead :: enum c.int {
	OLED_LCD	= 0,
	HDMI	= 1,
}

@(link_prefix = "ksceDsi")
foreign dsi {
  EnableHead :: proc(head: c.int) -> c.int ---
  DisableHead :: proc(head: c.int) -> c.int ---
  SendBlankingPacket :: proc(head: c.int) -> c.int ---
  SetLanesAndPixelSize :: proc(head: c.int, lanes: c.int, pixelsize: c.int) -> c.int ---
  SetVic :: proc(head: c.int, vic: c.int) -> c.int ---
  GetVicResolution :: proc(vic: c.int, width: ^c.int, height: ^c.int) -> c.int ---
  GetPixelClock :: proc(head: c.int) -> c.int ---
  GenericShortWrite :: proc(head: c.int, param0: c.int, param1: c.int, param2: c.int) -> c.int ---
  GenericReadRequest :: proc(head: c.int, param: c.int, buff: rawptr, size: c.uint) -> c.int ---
  DcsShortWrite :: proc(head: c.int, param0: c.ushort, param1: c.int) -> c.int ---
  DcsRead :: proc(head: c.int, param: c.ushort, buff: rawptr, size: c.uint) -> c.int ---
}

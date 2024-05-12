package gpio

import "core:c"

foreign import gpio "system:SceGpioForDriver_stub"

SceGpioErrorCode :: enum c.uint {
	INVALID_BUS	= 0x803F0100,
	INVALID_PORT	= 0x803F0101,
	INVALID_MODE	= 0x803F0102,
}

SceGpioPortMasks :: enum c.int {
	LED_GAMECARD = 1 << 6,
	LED_PS_BUTTON	= 1 << 7,
}

SceGpioPortMode :: enum c.int {
	OUTPUT	= 0,
	INPUT	= 1,
}

@(link_prefix = "ksceGpio")
foreign gpio {
  PortRead :: proc(bus: c.int, port: c.int) -> c.int ---
  PortSet :: proc(bus: c.int, port: c.int) -> c.int ---
  PortClear :: proc(bus: c.int, port: c.int) -> c.int ---
  PortReset :: proc(bus: c.int, port: c.int) -> c.int ---
  SetPortMode :: proc(bus: c.int, port: c.int, mode: c.int) -> c.int ---
  GetPortMode :: proc(bus: c.int, port: c.int) -> c.int ---
  SetIntrMode :: proc(bus: c.int, port: c.int, intr_mode: c.int) -> c.int ---
  GetIntrMode :: proc(bus: c.int, port: c.int) -> c.int ---
  AcquireIntr :: proc(bus: c.int, port: c.int) -> c.int ---
  QueryIntr :: proc(bus: c.int, port: c.int) -> c.int ---
}

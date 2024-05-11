package udcd

import "core:c"
import sce "../common"

SceUdcdStatus :: enum c.int {
	CONNECTION_NEW          = 0x0001,
	CONNECTION_ESTABLISHED  = 0x0002,
	CONNECTION_SUSPENDED    = 0x0004,
	CABLE_DISCONNECTED      = 0x0010,
	CABLE_CONNECTED         = 0x0020,
	DEACTIVATED             = 0x0100,
	ACTIVATED               = 0x0200,
	IS_CHARGING             = 0x0400,
	USE_USB_CHARGING        = 0x0800,
	UNKNOWN_1000            = 0x1000,
	UNKNOWN_2000            = 0x2000
}

SceUdcdStatusDriver :: enum c.int {
	STARTED         = 0x01,
	REGISTERED      = 0x02,
}

SceUdcdDeviceInfo :: struct {
  info: [64]c.uchar,
}
#assert(size_of(SceUdcdDeviceInfo) == 0x40)

SceUdcdWaitParam :: struct {
  unk_00: c.int,
	status: c.int,
	unk_08: c.int,
	unk_0C: c.int,
	unk_10: c.int,
	driverName: cstring,
}

SceUdcdDeviceState :: struct {
	unk_00: c.int,
	state: c.int,
	cable: c.int,
	connection: c.int,
	use_usb_charging: c.int,
	unk_14: c.int,
}
#assert(size_of(SceUdcdDeviceState) == 0x18)


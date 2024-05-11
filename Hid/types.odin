package hid

import "core:c"
import sce "../common"

SCE_HID_MAX_REPORT :: 16
SCE_HID_MAX_DEVICE_COUNT ::  8

SceHidKeyboardReport :: struct {
  reserved: sce.UInt8,
	modifiers: [2]sce.UInt8, //modifiers[0] Standard modifiers Ctrl Shift Alt, modifiers[1] Caps Lock, ..?
	keycodes: [6]sce.UInt8,
	reserved2: [7]sce.UInt8,
	timestamp: sce.UInt64, // microseconds
}
#assert(size_of(SceHidKeyboardReport) == 0x18)

SceHidMouseReport :: struct {
  buttons: sce.UInt8,
	reserved: sce.UInt8,
	rel_x: sce.Int16,
	rel_y: sce.Int16,
	wheel: sce.Int8,
	tilt: sce.Int8,
	timestamp: sce.UInt64, // microseconds
}
#assert(size_of(SceHidMouseReport) == 0x10)



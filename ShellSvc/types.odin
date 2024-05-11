package shellsvc

import "core:c"

SceShellUtilLockType :: enum c.int {
	PS_BTN             = 0x1,
	QUICK_MENU         = 0x2,
	POWEROFF_MENU      = 0x4,
	UNK8               = 0x8,
	USB_CONNECTION     = 0x10,
	MC_INSERTED        = 0x20,
	MC_REMOVED         = 0x40,
	UNK80              = 0x80,
	UNK100             = 0x100,
	UNK200             = 0x200,
	MUSIC_PLAYER       = 0x400,
	PS_BTN_2           = 0x800, //! without the stop symbol
}

SceShellUtilLockMode :: enum c.int {
	LOCK       = 1,
	UNLOCK     = 2
}

SceShellUtilEventHandler :: #type proc "c" (result: c.int, mode: SceShellUtilLockMode, type: SceShellUtilLockType, userData: rawptr)

SceShellUtilLaunchAppParam :: struct {
	cmd: cstring,
}

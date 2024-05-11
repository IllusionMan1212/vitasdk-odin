package power

import "core:c"
import sce "../common"

// TODO: 
ScePowerErrorCode :: enum c.uint {
	INVALID_VALUE           = 0x802B0000,
	ALREADY_REGISTERED      = 0x802B0001,
	CALLBACK_NOT_REGISTERED = 0x802B0002,
	CANT_SUSPEND            = 0x802B0003,
	NO_BATTERY              = 0x802B0100,
	DETECTING               = 0x802B0101
}
#assert(size_of(ScePowerErrorCode) == 4)

ScePowerCallbackType :: enum c.uint {
	AFTER_SYSTEM_RESUME   = 0x00000080, /* TODO: confirm */
	BATTERY_ONLINE        = 0x00000100,
	THERMAL_SUSPEND       = 0x00000200, /* TODO: confirm */
	LOW_BATTERY_SUSPEND   = 0x00000400, /* TODO: confirm */
	LOW_BATTERY           = 0x00000800,
	POWER_ONLINE          = 0x00001000,
	SYSTEM_SUSPEND        = 0x00010000,
	SYSTEM_RESUMING       = 0x00020000,
	SYSTEM_RESUME         = 0x00040000,
	UNK_0x100000          = 0x00100000, /* Related to proc_event::display_switch */
	APP_RESUME            = 0x00200000,
	APP_SUSPEND           = 0x00400000,
	APP_RESUMING          = 0x00800000, /* TODO: confirm */
	BUTTON_PS_START_PRESS = 0x04000000,
	BUTTON_PS_POWER_PRESS = 0x08000000,
	BUTTON_PS_HOLD        = 0x10000000,
	BUTTON_PS_PRESS       = 0x20000000,
	BUTTON_POWER_HOLD     = 0x40000000,
	BUTTON_POWER_PRESS    = 0x80000000,
	VALID_MASK_KERNEL     = 0xFCF71F80,
	VALID_MASK_SYSTEM     = 0xFCF71F80,
	VALID_MASK_NON_SYSTEM = 0x00361180
}
#assert(size_of(ScePowerCallbackType) == 4)

/* GPU, WLAN/COM configuration setting */
ScePowerConfigurationMode :: enum c.uint {
	SCE_POWER_CONFIGURATION_MODE_A = 0x00000080, /* GPU clock normal, WLAN/COM enabled */
	SCE_POWER_CONFIGURATION_MODE_B = 0x00000800, /* GPU clock high, WLAN/COM disabled */
	SCE_POWER_CONFIGURATION_MODE_C = 0x00010880, /* GPU clock high, WLAN/COM enabled (drains battery faster) */
	__SCE_POWER_CONFIGURATION_MODE = 0xFFFFFFFF
}
#assert(size_of(ScePowerConfigurationMode) == 4)

/* Callbacks */

/** Callback function prototype */
ScePowerCallback :: #type ^proc "c" (notifyId: c.int, notifyCount: c.int, powerInfo: c.int, userData: rawptr)


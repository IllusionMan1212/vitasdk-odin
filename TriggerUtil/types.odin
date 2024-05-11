package triggerutil

import "core:c"
import sce "../common"

SCE_TRIGGER_UTIL_VERSION :: 0x3200000

/**
 * Days of the week for use in repeatDays member of ::SceTriggerUtilEventParamDaily
 */
SceTriggerUtilDays :: enum c.int {
	SUNDAY     = 0x1,
	MONDAY     = 0x2,
	TUESDAY    = 0x4,
	WEDNESDAY  = 0x8,
	THURSDAY   = 0x10,
	FRIDAY     = 0x20,
	SATURDAY   = 0x40,
}

/**
 * Error Codes
 */
SceTriggerUtilErrorCode :: enum c.uint {
	BUSY                     = 0x80103600,
	NOT_FOUND_USER           = 0x80103611,
	NOT_FOUND_SYSTEM         = 0x80103614,
	NOT_REGISTERED           = 0x80103621,
	EVENT_TYPE_MISMATCH      = 0x80103624,
	INVALID_ARG              = 0x80103660
}

SceTriggerUtilEventParamDaily :: struct { // size is 0x50
	ver: sce.UInt32,
	extraParam1: sce.Int16,                      // set to 1
	extraParam2: sce.Int16,                      // set to 0
	triggerTime: sce.Int32,                      // POSIX time
	repeatDays: sce.UInt16,                      // bitwise
	reserved: [0x40]sce.Char8,
}
#assert(size_of(SceTriggerUtilEventParamDaily) == 0x50)

SceTriggerUtilEventParamOneTime :: struct { // size is 0x54
	ver: sce.UInt32,
	triggerTime: sce.RtcTick,                      // SceRtcTick, UTC
	extraParam1: sce.UInt8,                        // set to 1
	extraParam2: sce.UInt8,                        // set to 0
	reserved: [0x44]sce.Char8,
}
#assert(size_of(SceTriggerUtilEventParamOneTime) == 0x58)

SceTriggerUtilUserAppInfo :: struct { // size is 0x46A
	name: [0x34]sce.WChar16,
	iconPath: [0x400]sce.Char8,
	unk: c.short,
}
#assert(size_of(SceTriggerUtilUserAppInfo) == 0x46A)

SceTriggerUtilSystemAppInfo :: struct { // size is 0x602
	name: [0x100]sce.WChar16,
	iconPath: [0x400]sce.Char8,
	reserved: [2]c.char,
}
#assert(size_of(SceTriggerUtilSystemAppInfo) == 0x602)


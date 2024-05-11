package notificationutil

import "core:c"
import sce "../common"

/**
 * Constants
 */
SCE_NOTIFICATIONUTIL_TEXT_MAX :: 0x3F

/**
 * Error Codes
 */
// TODO:
SceNotificationUitlErrorCode :: enum c.uint {
	INTERNAL = 0x80106300
}

/**
 * BGDL-type notification event handler function
 */
SceNotificationUtilProgressEventHandler :: #type ^proc "c" (eventId: c.int)

SceNotificationUtilProgressInitParam :: struct {
  notificationText: [SCE_NOTIFICATIONUTIL_TEXT_MAX]sce.WChar16,
	separator0: sce.Int16,						//must be 0
	notificationSubText: [SCE_NOTIFICATIONUTIL_TEXT_MAX]sce.WChar16,
	separator1: sce.Int16,						//must be 0
	unk: [0x3E6]sce.Char8,
	unk_4EC: sce.Int32,						//can be set to 0
	eventHandler: SceNotificationUtilProgressEventHandler,
}
when size_of(rawptr) == 4 {
  #assert(size_of(SceNotificationUtilProgressInitParam) == 0x4F0)
}

SceNotificationUtilProgressUpdateParam :: struct {
  notificationText: [SCE_NOTIFICATIONUTIL_TEXT_MAX]sce.WChar16,
	separator0: sce.Int16,						//must be 0
	notificationSubText: [SCE_NOTIFICATIONUTIL_TEXT_MAX]sce.WChar16,
	separator1: sce.Int16,						//must be 0
	targetProgress: sce.Float,
	reserved: [0x38]sce.Char8,
}
#assert(size_of(SceNotificationUtilProgressUpdateParam) == 0x13C)

SceNotificationUtilProgressFinishParam :: struct {
  notificationText: [SCE_NOTIFICATIONUTIL_TEXT_MAX]sce.WChar16,
	separator0: sce.Int16,						//must be 0
	notificationSubText: [SCE_NOTIFICATIONUTIL_TEXT_MAX]sce.WChar16,
	separator1: sce.Int16,						//must be 0
	path: [0x3E8]sce.Char8,
}
#assert(size_of(SceNotificationUtilProgressFinishParam) == 0x4E8)


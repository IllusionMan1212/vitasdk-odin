package apputil

import "core:c"
import sce "../common"

SceAppUtilSaveDataRemoveMode :: enum c.int {
	DEFAULT = 0,
	NO_SLOT = 1,
}

SceAppUtilSaveDataSaveMode :: enum c.int {
	FILE = 0,
	DIRECTORY = 2,
}

// TODO: should be c.int
SceAppUtilErrorCode :: enum i64 {
	PARAMETER                   = 0x80100600,
	NOT_INITIALIZED             = 0x80100601,
	NO_MEMORY                   = 0x80100602,
	BUSY                        = 0x80100603,
	NOT_MOUNTED                 = 0x80100604,
	NO_PERMISSION               = 0x80100605,
	PASSCODE_MISMATCH           = 0x80100606,
	APPEVENT_PARSE_INVALID_DATA = 0x80100620,
	SAVEDATA_SLOT_EXISTS        = 0x80100640,
	SAVEDATA_SLOT_NOT_FOUND     = 0x80100641,
	SAVEDATA_NO_SPACE_QUOTA     = 0x80100642,
	SAVEDATA_NO_SPACE_FS        = 0x80100643,
	DRM_NO_ENTITLEMENT          = 0x80100660,
	PHOTO_DEVICE_NOT_FOUND      = 0x80100680,
	MUSIC_DEVICE_NOT_FOUND      = 0x80100685,
	MOUNT_LIMIT_OVER            = 0x80100686,
	STACKSIZE_TOO_SHORT         = 0x801006A0,
}

SceAppUtilBootAttribute :: distinct c.uint
SceAppUtilAppEventType :: distinct c.uint
SceAppUtilSaveDataSlotId :: distinct c.uint
SceAppUtilSaveDataSlotStatus :: distinct c.uint
SceAppUtilAppParamId :: distinct c.uint
SceAppUtilBgdlStatusType :: distinct c.uint

SceAppUtilBgdlStatus :: struct {
  type: SceAppUtilBgdlStatusType,
	addcontNumReady: sce.UInt32,
	addcontNumNotReady: sce.UInt32,
	licenseReady: sce.UInt32,
	reserved: [28]sce.Char8,
}
#assert(size_of(SceAppUtilBgdlStatus) == 0x2C)

SceAppUtilInitParam :: struct {
  workBufSize: sce.Size,  //!< Buffer size
	reserved: [60]c.uint8_t, //!< Reserved range
}
#assert(size_of(SceAppUtilInitParam) == 0x40)

SceAppUtilBootParam :: struct {
  attr: SceAppUtilBootAttribute,   //!< Boot attribute
	appVersion: c.uint,        //!< App version
	reserved: [32]c.uint8_t,           //!< Reserved range
}
#assert(size_of(SceAppUtilBootParam) == 0x28)

SceAppUtilSaveDataMountPoint :: struct {
  data: [16]c.uint8_t,
}
#assert(size_of(SceAppUtilSaveDataMountPoint) == 0x10)

SceAppUtilAppEventParam :: struct {
  type: SceAppUtilAppEventType, //!< Event type
	dat: [1024]c.uint8_t,           //!< Event parameter
}
#assert(size_of(SceAppUtilAppEventParam) == 0x404)

SceAppUtilMountPoint :: struct {
  data: [16]c.int8_t, //!< Mount point
}
#assert(size_of(SceAppUtilMountPoint) == 0x10)

SceAppUtilSaveDataSlotEmptyParam :: struct {
	title: [^]sce.WChar16,     //!< Title string
	iconPath: cstring,        //!< Path to icon
	iconBuf: rawptr,         //!< Icon buffer
	iconBufSize: sce.Size,   //!< Icon buffer size
	reserved: [32]c.uint8_t,  //!< Reserved range
}
when size_of(rawptr) == 4 {
	#assert(size_of(SceAppUtilSaveDataSlotEmptyParam) == 0x30)
}

SceAppUtilSaveDataSlot :: struct {
	id: SceAppUtilSaveDataSlotId,                  //!< Slot id
	status: SceAppUtilSaveDataSlotStatus,          //!< Slot status
	userParam: c.int,                                //!< Param for free usage
	emptyParam: ^SceAppUtilSaveDataSlotEmptyParam, //!< Settings for empty slot
}
when size_of(rawptr) == 4 {
	#assert(size_of(SceAppUtilSaveDataSlot) == 0x10)
}

SceAppUtilSaveDataSlotParam :: struct {
	status: SceAppUtilSaveDataSlotStatus, //!< Status
	title: [32]sce.WChar16,                //!< Title name
	subTitle: [64]sce.WChar16,             //!< Subtitle
	detail: [256]sce.WChar16,              //!< Detail info
	iconPath: [64]c.char,                   //!< Icon path
	userParam: c.int,                       //!< User param
	sizeKB: sce.Size,                      //!< Data size (In KB)
	modifiedTime: sce.DateTime,            //!< Last modified time
	reserved: [48]c.uint8_t,                //!< Reserved range
}
#assert(size_of(SceAppUtilSaveDataSlotParam) == 0x34C)

SceAppUtilSaveDataSaveItem :: struct {
	dataPath: cstring,             //!< Path to savedata
	buf: rawptr,                  //!< Buffer of savedata file
	pad: c.uint32_t,                     //!< Padding
	offset: sce.Off,                    //!< Offset of savedata file
	mode: c.int,                         //!< Savedata save mode (One of ::SceAppUtilSaveDataSaveMode)
	reserved: [36]c.uint8_t,             //!< Reserved range
}
when size_of(rawptr) == 4 {
	#assert(size_of(SceAppUtilSaveDataSaveItem) == 0x40)
}

SceAppUtilSaveDataFile :: struct {
	filePath: cstring,
	buf: rawptr,
	bufSize: sce.Size,
	offset: sce.Off,
	mode: c.uint,
	progDelta: c.uint,
	reserved: [32]c.uint8_t,
}
when size_of(rawptr) == 4 {
	#assert(size_of(SceAppUtilSaveDataFile) == 0x40)
}

SceAppUtilSaveDataFileSlot :: struct {
	id: c.uint,
	slotParam: ^SceAppUtilSaveDataSlotParam,
	reserved: [32]c.uint8_t,
}
when size_of(rawptr) == 4 {
	#assert(size_of(SceAppUtilSaveDataFileSlot) == 0x28)
}

SceAppUtilSaveDataRemoveItem :: struct {
	dataPath: cstring,               //!< Path to savedata data
	mode: c.int,                           //!< Savedata remove mode (One of ::SceAppUtilSaveDataRemoveMode)
	reserved: [36]c.uint8_t,               //!< Reserved range
}
when size_of(rawptr) == 4 {
	#assert(size_of(SceAppUtilSaveDataRemoveItem) == 0x2C)
}

SceAppUtilStoreBrowseParam :: struct {
	type: c.uint,          //!< Store browse type
	id: cstring,             //!< Target id
}
when size_of(rawptr) == 4 {
	#assert(size_of(SceAppUtilStoreBrowseParam) == 8)
}

SceAppUtilWebBrowserParam :: struct {
	str: cstring,            //!< String that's passed to command specified by launchMode
	strlen: sce.Size,	            //!< Length of str
	launchMode: c.uint,    //!< Browser mode
	reserved: c.uint,      //!< Reserved area
}
when size_of(rawptr) == 4 {
	#assert(size_of(SceAppUtilWebBrowserParam) == 0x10)
}


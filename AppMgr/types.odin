package appmgr

import "core:c"
import sce "../common"
import apputil "../AppUtil"

SCE_APPMGR_MAX_APP_NAME_LENGTH:: (31)

SceAppMgrErrorCode :: enum c.uint {
	BUSY               = 0x80802000, //!< Busy
	STATE              = 0x80802013, //!< Invalid state
	NULL_POINTER       = 0x80802016, //!< NULL pointer
	INVALID            = 0x8080201A, //!< Invalid param
	TOO_LONG_ARGV      = 0x8080201D, //!< argv is too long
	INVALID_SELF_PATH  = 0x8080201E, //!< Invalid SELF path
	NOEXEC             = 0x8080201F, //!< The process is not authorized to run this function
	BGM_PORT_BUSY      = 0x80803000,  //!< BGM port was occupied and could not be secured
}

SceAppMgrSystemEventType :: enum c.int {
	ON_RESUME             = 0x10000003,
	ON_STORE_PURCHASE     = 0x10000004,
	ON_NP_MESSAGE_ARRIVED = 0x10000005,
	ON_STORE_REDEMPTION   = 0x10000006
}

SceAppMgrInfoBarVisibility :: enum c.int {
	INVISIBLE = 0,
	VISIBLE   = 1
}

SceAppMgrInfoBarColor :: enum c.int {
	BLACK  = 0,
	WHITE  = 1
}

SceAppMgrInfoBarTransparency :: enum c.int {
	OPAQUE      = 0,
	TRANSLUCENT = 1
}

SceAppMgrApplicationMode :: enum c.int {
	A = 2, //!< Application without physically contiguous memory access
	B = 3, //!< Application with physically contiguous memory access
	C = 4  //!< Application with physically contiguous memory and extra memory access
}

SceAppMgrSystemEvent :: struct {
  systemEvent: c.int,   //!< One of ::SceAppMgrSystemEventType
	reserved: [60]c.uint8_t,  //!< Reserved data
}
#assert(size_of(SceAppMgrSystemEvent) == 0x40)

SceAppMgrSaveDataData :: struct {
  size: c.int,                                //!< Must be 0x4C
	slotId: c.uint,                     //!< Save slot to use
	slotParam: ^apputil.SceAppUtilSaveDataSlotParam,  //!< Save slot params
	reserved: [32]c.uint8_t,                    //!< Reserved data
	files: ^apputil.SceAppUtilSaveDataFile,           //!< Pointer to an array of files
	fileNum: c.int,                             //!< Number of files to save
	mountPoint: apputil.SceAppUtilSaveDataMountPoint, //!< Savedata mountpoint
	requiredSizeKB: ^c.int,            //!< Required size in KBs
	unk_0x48: int,
}
when size_of(rawptr) == 4 {
	#assert(size_of(SceAppMgrSaveDataData) == 0x4C)
}

SceAppMgrSaveDataDataDelete :: struct {
  size: c.int,                                //!< Must be 0x44
	slotId: c.uint,                     //!< Save slot to use
	slotParam: ^apputil.SceAppUtilSaveDataSlotParam,  //!< Save slot params
	reserved: [32]c.uint8_t,                    //!< Reserved data
	files: ^apputil.SceAppUtilSaveDataFile,           //!< Pointer to an array of files
	fileNum: c.int,                             //!< Number of files to delete
	mountPoint: apputil.SceAppUtilSaveDataMountPoint, //!< Savedata mountpoint
}
when size_of(rawptr) == 4 {
	#assert(size_of(SceAppMgrSaveDataDataDelete) == 0x44)
}

SceAppMgrSaveDataSlot :: struct {
  size: c.int,                                //!< Must be 0x418
	slotId: c.uint,                     //!< Save slot to use
	slotParam: apputil.SceAppUtilSaveDataSlotParam,   //!< Save slot params
	reserved: [116]c.uint8_t,                   //!< Reserved data
	mountPoint: apputil.SceAppUtilSaveDataMountPoint, //!< Savedata mountpoint
	reserved2: [0x40]c.uint8_t,
}
#assert(size_of(SceAppMgrSaveDataSlot) == 0x418)

SceAppMgrSaveDataSlotDelete :: struct {
  size: c.int,                                 //!< Must be 0x18
	slotId: c.uint,                      //!< Save slot to use
	mountPoint: apputil.SceAppUtilSaveDataMountPoint,  //!< Savedata mountpoint
}
#assert(size_of(SceAppMgrSaveDataSlotDelete) == 0x18)

SceAppMgrAppState :: struct {
  systemEventNum: sce.UInt32,
	appEventNum: sce.UInt32,
	isSystemUiOverlaid: sce.Bool,
	reserved: [116]sce.UInt8,
}
#assert(size_of(SceAppMgrAppState) == 0x80)

SceAppMgrBudgetInfo :: struct {
  size: c.int,                           //!< Must be 0x88
	app_mode: c.int,                       //!< One of ::SceAppMgrApplicationMode
	unk0: c.int,                           //!< Unknown Data
	total_user_rw_mem: c.uint,     //!< Total amount of accessible USER_RW memory
	free_user_rw: c.uint,          //!< Free amount of accessible USER_RW memory
	extra_mem_allowed: sce.Bool,          //!< Flag for extra memory accessibility
	unk1: c.int,                           //!< Unknown Data
	total_extra_mem: c.uint,       //!< Total amount of accessible extra memory
	free_extra_mem: c.uint,        //!< Free amount of accessible extra memory
	unk2: [2]c.int,                        //!< Unknown Data
	total_phycont_mem: c.uint,     //!< Total amount of accessible physically contiguous memory
	free_phycont_mem: c.uint,      //!< Free amount of accessible physically contiguous memory
	unk3: [10]c.int,                       //!< Unknown Data
	total_cdram_mem: c.uint,       //!< Total amount of accessible CDRAM memory
	free_cdram_mem: c.uint,        //!< Free amount of accessible CDRAM memory
	reserved: [9]c.int,                    //!< Reserved data
}
#assert(size_of(SceAppMgrBudgetInfo) == 0x88)

SceAppMgrExecOptParam :: struct{} // Missing struct
SceAppMgrLaunchAppOptParam :: struct{} // Missing struct

SceAppMgrLoadExecOptParam :: struct {
  reserved: [64]c.int,    //!< Reserved data
}
#assert(size_of(SceAppMgrLoadExecOptParam) == 0x100)

SceAppMgrCoredumpState :: struct {
	pid: sce.UID,
	process_state: c.int,
	progress: c.int, // 0-100
	is_coredump_completed: c.int,
	data_0x10: c.int,
	path_len: sce.Size,
	path: [0x400]c.char,
	data_0x418: c.int,
	data_0x41C: c.int,
	data_0x420: c.int,
	data_0x424: c.int,
}
#assert(size_of(SceAppMgrCoredumpState) == 0x428)


// missing structs
SceAppMgrDrmOpenParam :: struct{}
SceAppMgrAppInfo :: struct{}

SceSharedFbInfo :: struct {
	fb_base: rawptr,
	fb_size: c.int,
	fb_base2: rawptr,
	unk0: [6]c.int,
	stride: c.int,
	width: c.int,
	height: c.int,
	unk1: c.int,
	index: c.int,
	unk2: [4]c.int,
	vsync: c.int,
	unk3: [3]c.int,
}

SceAppMgrLaunchParam :: struct {
	size: sce.Size,
	unk_4: c.uint, //<! set to 0x80000000 to break on launch
	unk_8: c.uint,
	unk_C: c.uint,
	unk_10: c.uint,
	unk_14: c.uint,
	unk_18: c.uint,
	unk_1C: c.uint,
	unk_20: c.uint,
	unk_24: c.uint,
	unk_28: c.uint,
	unk_2C: c.uint,
	unk_30: c.uint,
}
#assert(size_of(SceAppMgrLaunchParam) == 0x34)


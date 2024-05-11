package sce

import "core:c"

PSP2_SDK_VERSION :: 0x03570011

SCE_KERNEL_THREAD_ID_SELF  :: 0  //!< Current thread's UID - pass to APIs expecting a thread ID to operate on calling thread
SCE_KERNEL_PROCESS_ID_SELF :: 0  //!< Current process's UID - pass to APIs expecting a process ID to operate on calling process
SCE_UID_NAMELEN            :: 31 //!< Maximum length for kernel object names

UID :: distinct c.int
PID :: distinct c.int
NID :: distinct c.uint

Size :: distinct c.uint
SSize :: distinct c.int

Bool :: c.int
Char8 :: c.int8_t
UChar8 :: c.int8_t
Int :: c.int
UInt :: c.uint
Int8 :: c.int8_t
UInt8 :: c.uint8_t
Int16 :: c.int16_t
UInt16 :: c.uint16_t
Int32 :: c.int32_t
UInt32 :: c.uint32_t
Int64 :: c.int64_t
UInt64 :: c.uint64_t

UShort16 :: c.uint16_t
Long64 :: c.int64_t
ULong64 :: c.uint64_t

Float :: c.float
Float32 :: c.float
Double :: c.double
Double64 :: c.double

WChar16 :: c.uint16_t
WChar32 :: c.uint32_t

IntPtr :: distinct c.int
UIntPtr :: distinct c.uint
UIntVAddr :: UIntPtr

PVoid :: rawptr

Mode :: distinct c.int
Off :: Int64
KernelSysClock :: UInt64

DateTime :: struct {
  year: c.ushort,
  month: c.ushort,
  day: c.ushort,
  hour: c.ushort,
  minute: c.ushort,
  second: c.ushort,
  microsecond: c.uint,
}
#assert(size_of(DateTime) == 0x10)

FVector3 :: struct {
  x: Float,
  y: Float,
  z: Float,
}
#assert(size_of(FVector3) == 0xC)

FVector4 :: struct {
	x: Float,
	y: Float,
	z: Float,
	w: Float,
}
#assert(size_of(FVector4) == 0x10)

FMatrix4 :: struct {
	x: FVector4,
	y: FVector4,
	z: FVector4,
	w: FVector4,
}
#assert(size_of(FMatrix4) == 0x40)

FQuaternion :: struct {
	x: Float,
	y: Float,
	z: Float,
	w: Float,
}
#assert(size_of(FQuaternion) == 0x10)


//
// system_param.h start
//

/** System param id */
SceSystemParamId :: enum c.int {
	//!< Language settings
	LANG = 1,
	//!< Enter button assignment
	ENTER_BUTTON,
	//!< Username string
	USERNAME,
	//!< Date format
	DATE_FORMAT,
	//!< Time format
	TIME_FORMAT,
	//!< Time zone
	TIME_ZONE,
	//!< Daylight savings time (0 = Disabled, 1 = Enabled)
	DAYLIGHT_SAVINGS,
	//!< Max allowed value
	MAX_VALUE = -1 // 0xFFFFFFFF
}

/** Language settings */
SceSystemParamLang :: enum c.int {
	//! Japanese
	JAPANESE,
	//! American English
	ENGLISH_US,
	//! French
	FRENCH,
	//! Spanish
	SPANISH,
	//! German
	G_GERMAN,
	//! Italian
	ITALIAN,
	//! Dutch
	DUTCH,
	//! Portugal Portuguese
	PORTUGUESE_PT,
	//! Russian
	RUSSIAN,
	//! Korean
	KOREAN,
	//! Traditional Chinese
	CHINESE_T,
	//! Simplified Chinese
	CHINESE_S,
	//! Finnish
	FINNISH,
	//! Swedish
	SWEDISH,
	//! Danish
	DANISH,
	//! Norwegian
	NORWEGIAN,
	//! Polish
	POLISH,
	//! Brazil Portuguese
	PORTUGUESE_BR,
	//! British English
	ENGLISH_GB,
	//! Turkish
	TURKISH,
	//! Max allowed value
	MAX_VALUE = -1 // 0xFFFFFFFF
}

/** Assignment of enter button */
SceSystemParamEnterButtonAssign :: enum c.int {
	CIRCLE,
	CROSS,
	MAX_VALUE = -1 // 0xFFFFFFFF
}

/* Username */
SCE_SYSTEM_PARAM_USERNAME_MAXSIZE ::	17 //!< Max size of username

/** Date display format */
SceSystemParamDateFormat :: enum c.int {
	YYYYMMDD, //!< Year/Month/Day
	DDMMYYYY, //!< Day/Month/Year
	MMDDYYYY //!< Month/Day/Year
}

/** Time display format */
SceSystemParamTimeFormat :: enum c.int {
	FORMAT_12HR, //!< 12-hour clock
	FORMAT_24HR //!< 24-hour clock
}

//
// system_param.h end
//


//
// rtc.h start
//

// TODO: should be c.int
RtcErrorCode :: enum c.uint {
	INVALID_VALUE        = 0x80251000,
	INVALID_POINTER      = 0x80251001,
	NOT_INITIALIZED      = 0x80251002,
	ALREADY_REGISTERD    = 0x80251003,
	NOT_FOUND            = 0x80251004,
	BAD_PARSE            = 0x80251080,
	INVALID_YEAR         = 0x80251081,
	INVALID_MONTH        = 0x80251082,
	INVALID_DAY          = 0x80251083,
	INVALID_HOUR         = 0x80251084,
	INVALID_MINUTE       = 0x80251085,
	INVALID_SECOND       = 0x80251086,
	INVALID_MICROSECOND  = 0x80251087
}
#assert(size_of(RtcErrorCode) == 4)

/* As returned by sceRtcGetDayOfWeek */
RtcDayOfWeek :: enum c.int {
	SCE_RTC_DAYOFWEEK_SUNDAY    = 0,
	SCE_RTC_DAYOFWEEK_MONDAY    = 1,
	SCE_RTC_DAYOFWEEK_TUESDAY   = 2,
	SCE_RTC_DAYOFWEEK_WEDNESDAY = 3,
	SCE_RTC_DAYOFWEEK_THURSDAY  = 4,
	SCE_RTC_DAYOFWEEK_FRIDAY    = 5,
	SCE_RTC_DAYOFWEEK_SATURDAY  = 6,
	__SCE_RTC_DAYOFWEEK = -1 // 0xFFFFFFFF
}
#assert(size_of(RtcDayOfWeek) == 4)

RtcTick :: struct {
	tick: UInt64,
}
#assert(size_of(RtcTick) == 8)

//
// rtc.h end
//


MsInfo :: struct {
	unk_0x00: c.int,
	unk_0x04: c.int,
	nbytes: UInt64,
	nbytes2: UInt64,
	sector_size: UInt32,
	unk_0x1C: c.int,
	fs_offset: UInt32,
	unk_0x24: UInt32,
	unk_0x28: UInt32,
	unk_0x2C: UInt32,
	id: [0x10]UInt8,
}
#assert(size_of(MsInfo) == 0x40)


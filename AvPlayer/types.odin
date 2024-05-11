package avplayer

import "core:c"
import sce "../common"

SceAvPlayerHandle :: distinct c.int
#assert(size_of(SceAvPlayerHandle) == 4)

// TODO: should be c.int
SceAvPlayerErrorCode :: enum i64 {
	INVALID_PARAM = 0x806A0001,
	OUT_OF_MEMORY = 0x806A0003
}

SceAvPlayerTrickSpeeds :: enum c.int {
	REWIND_32X       = -3200, //!< Rewind 32x
	REWIND_16X       = -1600, //!< Rewind 16x
	REWIND_8X        = -800,  //!< Rewind 8x
	NORMAL           =  100,  //!< Normal Speed
	FAST_FORWARD_2X  =  200,  //!< Fast Forward 2x
	FAST_FORWARD_4X  =  400,  //!< Fast Forward 4x
	FAST_FORWARD_8X  =  800,  //!< Fast Forward 8x
	FAST_FORWARD_16X = 1600,  //!< Fast Forward 16x
	FAST_FORWARD_32X = 3200   //!< Fast Forward 32x
}

SceAvPlayerStreamType :: enum c.int {
	VIDEO,     //!< Video stream type
	AUDIO,     //!< Audio stream type
	TIMEDTEXT  //!< Timed text (subtitles) stream type
}

SceAvPlayerAlloc :: #type ^proc(arg: rawptr, alignment: c.uint32_t, size: c.uint32_t) -> rawptr
SceAvPlayerFree :: #type ^proc(arg: rawptr, ptr: rawptr)
SceAvPlayerAllocFrame :: #type ^proc(arg: rawptr, alignment: c.uint32_t, size: c.uint32_t) -> rawptr
SceAvPlayerFreeFrame :: #type ^proc(arg: rawptr, ptr: rawptr)

SceAvPlayerOpenFile :: #type ^proc(p: rawptr, filename: cstring) -> c.int
SceAvPlayerCloseFile :: #type ^proc(p: rawptr) -> c.int
SceAvPlayerReadOffsetFile :: #type ^proc(p: rawptr, buffer: [^]c.uint8_t, position: c.uint64_t, length: c.uint32_t) -> c.int
SceAvPlayerSizeFile :: #type ^proc(p: rawptr) -> c.uint64_t

SceAvPlayerEventCallback :: #type ^proc(p: rawptr, argEventId: c.int32_t, argSourceId: c.int32_t, argEventData: rawptr)

SceAvPlayerMemReplacement :: struct {
  objectPointer: rawptr,
	allocate: SceAvPlayerAlloc,               //!< Memory allocator for generic data
	deallocate: SceAvPlayerFree,              //!< Memory deallocator for generic data
	allocateTexture: SceAvPlayerAllocFrame,   //!< Memory allocator for video frames
	deallocateTexture: SceAvPlayerFreeFrame,  //!< Memory deallocator for video frames
}
when size_of(rawptr) == 4 {
  #assert(size_of(SceAvPlayerMemReplacement) == 0x14)
}

SceAvPlayerFileReplacement :: struct {
  objectPointer: rawptr,
	open: SceAvPlayerOpenFile,                //!< File open
	close: SceAvPlayerCloseFile,              //!< File close
	readOffset: SceAvPlayerReadOffsetFile,    //!< File read from offset
	size: SceAvPlayerSizeFile,                //!< File size
}
when size_of(rawptr) == 4 {
  #assert(size_of(SceAvPlayerFileReplacement) == 0x14)
}

SceAvPlayerEventReplacement:: struct {
  objectPointer: rawptr,
	eventCallback: SceAvPlayerEventCallback,
}
when size_of(rawptr) == 4 {
  #assert(size_of(SceAvPlayerEventReplacement) == 8)
}

SceAvPlayerInitData :: struct {
  memoryReplacement: SceAvPlayerMemReplacement,  //!< Memory allocator replacement
	fileReplacement: SceAvPlayerFileReplacement,   //!< File I/O replacement
	eventReplacement: SceAvPlayerEventReplacement, //!< Event callback replacement
	debugLevel: c.int32_t,
	basePriority: c.uint32_t,                        //!< Base priority of the thread running the video player
	numOutputVideoFrameBuffers: c.int32_t,
	autoStart: sce.Bool,                            //!< Flag indicating whether the video player should start playback automatically
	reserved: [3]c.uint8_t,                          //!< Reserved data
	defaultLanguage: cstring,
}
when size_of(rawptr) == 4 {
  #assert(size_of(SceAvPlayerInitData) == 0x48)
}

SceAvPlayerAudio :: struct {
  channelCount: c.uint16_t, //!< The number of audio channels of the audio frame.
	reserved: [2]c.uint8_t,   //!< Reserved data.
	sampleRate: c.uint32_t,   //!< The samplerate of the audio frame in Hz.
	size: c.uint32_t,         //!< The size of the audio frame in bytes.
	languageCode: c.uint32_t, //!< The language code of the audio frame.
}
#assert(size_of(SceAvPlayerAudio) == 0x10)

SceAvPlayerVideo :: struct {
  width: c.uint32_t,        //!< The width of the video frame in pixels.
	height: c.uint32_t,       //!< The height of the video frame in pixels.
	aspectRatio: c.float,     //!< The aspect ratio of the video frame.
	languageCode: c.uint32_t, //!< The language code of the video frame.
}
#assert(size_of(SceAvPlayerVideo) == 0x10)

SceAvPlayerTextPosition :: struct {
  top: c.uint16_t,
	left: c.uint16_t,
	bottom: c.uint16_t,
	right: c.uint16_t,
}
#assert(size_of(SceAvPlayerTextPosition) == 8)

SceAvPlayerTimedText :: struct {
  languageCode: c.uint32_t,            //!< The language code of the subtitles.
	textSize: c.uint16_t,                //!< The size of the subtitles.
	fontSize: c.uint16_t,                //!< The size of the subtitles.
	position: SceAvPlayerTextPosition, //!< The position of the subtitles.
}
#assert(size_of(SceAvPlayerTimedText) == 0x10)

SceAvPlayerStreamDetails :: struct #raw_union {
  reserved: [4]c.uint32_t,      //!< Reserved data.
	audio: SceAvPlayerAudio,    //!< Audio details.
	video: SceAvPlayerVideo,    //!< Video details.
	subs: SceAvPlayerTimedText, //!< Subtitles details.
}
#assert(size_of(SceAvPlayerStreamDetails) == 0x10)

SceAvPlayerFrameInfo :: struct {
	pData: [^]c.uint8_t,                   //!< Pointer to the frame data.
	reserved: c.uint32_t,                //!< Reserved data
	timeStamp: c.uint64_t,               //!< Timestamp of the frame in milliseconds
	details: SceAvPlayerStreamDetails, //!< The frame details.
}
when size_of(rawptr) == 4 {
  #assert(size_of(SceAvPlayerFrameInfo) == 0x20)
}

SceAvPlayerStreamInfo :: struct {
  type: c.uint32_t,                    //!< Type of the stream (One of ::SceAvPlayerStreamType)
	reserved: c.uint32_t,                //!< Reserved data             
	details: SceAvPlayerStreamDetails, //!< The stream details.
	duration: c.uint64_t,                //!< Total duration of the stream in milliseconds.
	startTime: c.uint64_t,               //!< Starting time of the stream in milliseconds.
}
#assert(size_of(SceAvPlayerStreamInfo) == 0x28)


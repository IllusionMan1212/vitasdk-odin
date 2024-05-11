package audiodec

import "core:c"
import sce "../common"

// TODO: this should be c.int
SceAudiodecErrorCode :: enum i64 {
	ERROR_API_FAIL                  = 0x807F0000,
	ERROR_INVALID_TYPE              = 0x807F0001,
	ERROR_INVALID_INIT_PARAM        = 0x807F0002,
	ERROR_ALREADY_INITIALIZED       = 0x807F0003,
	ERROR_OUT_OF_MEMORY             = 0x807F0004,
	ERROR_NOT_INITIALIZED           = 0x807F0005,
	ERROR_A_HANDLE_IN_USE           = 0x807F0006,
	ERROR_ALL_HANDLES_IN_USE        = 0x807F0007,
	ERROR_INVALID_PTR               = 0x807F0008,
	ERROR_INVALID_HANDLE            = 0x807F0009,
	ERROR_NOT_HANDLE_IN_USE         = 0x807F000A,
	ERROR_CH_SHORTAGE               = 0x807F000B,
	ERROR_INVALID_WORD_LENGTH       = 0x807F000C,
	ERROR_INVALID_SIZE              = 0x807F000D,
	ERROR_UNSUPPORTED               = 0x807F000E,
	ERROR_INVALID_NFRAMES           = 0x807F000F,
	ERROR_INVALID_NSTREAMS          = 0x807F0010,
	ERROR_DIFFERENT_TYPES           = 0x807F0011,
	ERROR_SAME_HANDLES              = 0x807F0012,
	ERROR_BUSY                      = 0x807F0013,
	AT9_ERROR_INVALID_CONFIG        = 0x807F2000,
	MP3_ERROR_INVALID_CH            = 0x807F2800,
	MP3_ERROR_INVALID_MPEG_VERSION  = 0x807F2801,
	AAC_ERROR_INVALID_CH            = 0x807F3000,
	CELP_ERROR_INVALID_CONFIG       = 0x807F3800
}

SCE_AUDIODEC_ALIGNMENT_SIZE : c.uint : 0x100
// TODO:
//#define SCE_AUDIODEC_ROUND_UP(size) ((size + SCE_AUDIODEC_ALIGNMENT_SIZE - 1) & ~(SCE_AUDIODEC_ALIGNMENT_SIZE - 1))

SCE_AUDIODEC_WORD_LENGTH_16BITS :: 16

SceAudiodecType :: enum c.uint {
	AT9  = 0x1003,
	MP3  = 0x1004,
	AAC  = 0x1005,
	CELP = 0x1006,
}

SCE_AUDIODEC_AT9_MAX_CH_IN_LIBRARY :: 16
SCE_AUDIODEC_MP3_MAX_STREAMS       :: 8
SCE_AUDIODEC_AAC_MAX_STREAMS       :: 8
SCE_AUDIODEC_CELP_MAX_STREAMS      :: 8

SCE_AUDIODEC_AT9_MAX_CH_IN_DECODER  :: 2
SCE_AUDIODEC_MP3_MAX_CH_IN_DECODER  :: 2
SCE_AUDIODEC_AAC_MAX_CH_IN_DECODER  :: 2
SCE_AUDIODEC_CELP_MAX_CH_IN_DECODER :: 1

SCE_AUDIODEC_AT9_MAX_SAMPLES  :: 256
SCE_AUDIODEC_MP3_MAX_SAMPLES  :: 1152
SCE_AUDIODEC_AAC_MAX_SAMPLES  :: 2048
SCE_AUDIODEC_CELP_MAX_SAMPLES :: 320

SCE_AUDIODEC_AT9_MAX_ES_SIZE  :: 1024
SCE_AUDIODEC_MP3_MAX_ES_SIZE  :: 1441
SCE_AUDIODEC_AAC_MAX_ES_SIZE  :: 1536
SCE_AUDIODEC_CELP_MAX_ES_SIZE :: 24

SCE_AUDIODEC_AT9_EXTRA_ACCESS_SIZE  :: 0
SCE_AUDIODEC_MP3_EXTRA_ACCESS_SIZE  :: 0
SCE_AUDIODEC_AAC_EXTRA_ACCESS_SIZE  :: 0
SCE_AUDIODEC_CELP_EXTRA_ACCESS_SIZE :: 0

SCE_AUDIODEC_AT9_MAX_NFRAMES  :: 8
SCE_AUDIODEC_MP3_MAX_NFRAMES  :: 1
SCE_AUDIODEC_AAC_MAX_NFRAMES  :: 1
SCE_AUDIODEC_CELP_MAX_NFRAMES :: 1

SCE_AUDIODEC_AT9_MAX_NSTREAMS  :: 6
SCE_AUDIODEC_MP3_MAX_NSTREAMS  :: 6
SCE_AUDIODEC_AAC_MAX_NSTREAMS  :: 6
SCE_AUDIODEC_CELP_MAX_NSTREAMS :: 7

SceAudiodecMpegVersion :: enum c.int {
	VERSION_2_5      = 0,
	VERSION_RESERVED = 1,
	VERSION_2        = 2,
	VERSION_1        = 3
}

SCE_AUDIODEC_CELP_MPE :: 0

SCE_AUDIODEC_CELP_SAMPLING_RATE_8KHZ :: 8000

SceAudiodecCelpBitrate :: enum c.int {
	BIT_RATE_3850BPS  = 3850,
	BIT_RATE_4650BPS  = 4650,
	BIT_RATE_5700BPS  = 5700,
	BIT_RATE_6600BPS  = 6600,
	BIT_RATE_7300BPS  = 7300,
	BIT_RATE_8700BPS  = 8700,
	BIT_RATE_9900BPS  = 9900,
	BIT_RATE_10700BPS = 10700,
	BIT_RATE_11800BPS = 11800,
	BIT_RATE_12200BPS = 12200,
}

SceAudiodecInitStreamParam :: struct {
	size: sce.UInt32,
	totalStreams: sce.UInt32,
}
#assert(size_of(SceAudiodecInitStreamParam) == 8)

SceAudiodecInitChParam :: struct {
	size: sce.UInt32,
	totalCh: sce.UInt32,
}
#assert(size_of(SceAudiodecInitChParam) == 8)

SceAudiodecInitParam :: struct #raw_union {
	size: sce.UInt32,
	at9: SceAudiodecInitChParam,
	mp3: SceAudiodecInitStreamParam,
	aac: SceAudiodecInitStreamParam,
	celp: SceAudiodecInitStreamParam,
}
#assert(size_of(SceAudiodecInitParam) == 8)

SceAudiodecInfoAt9 :: struct {
	size: sce.UInt32,
	configData: [4]sce.UInt8,
	ch: sce.UInt32,
	bitRate: sce.UInt32,
	samplingRate: sce.UInt32,
	superFrameSize: sce.UInt32,
	framesInSuperFrame: sce.UInt32,
}
#assert(size_of(SceAudiodecInfoAt9) == 0x1C)

SceAudiodecInfoMp3 :: struct {
	size: sce.UInt32,      //!< sizeof(SceAudiodecInfoMp3)
	ch: sce.UInt32,        //!< number of channels (mono: 1, stereo/joint stereo/two mono: 2)
	version: sce.UInt32,   //!< MPEG version (MPEG1: 3, MPEG2: 2, MPEG2.5: 0)
}
#assert(size_of(SceAudiodecInfoMp3) == 0xC)

SceAudiodecInfoAac :: struct {
	size: sce.UInt32,
	isAdts: sce.UInt32,
	ch: sce.UInt32,
	samplingRate: sce.UInt32,
	isSbr: sce.UInt32,
}
#assert(size_of(SceAudiodecInfoAac) == 0x14)

/** Information structure for CELP */
SceAudiodecInfoCelp :: struct {
	size: sce.UInt32,                  //!< sizeof(SceAudiodecInfoCelp)
	excitationMode: sce.UInt32,        //!< Excitation mode
	samplingRate: sce.UInt32,          //!< Sampling rate
	bitRate: sce.UInt32,               //!< Bit rate (one of ::SceAudiodecCelpBitrate)
	lostCount: sce.UInt32,
}
#assert(size_of(SceAudiodecInfoCelp) == 0x14)

SceAudiodecInfo :: struct #raw_union {
	size: sce.UInt32,
	at9: SceAudiodecInfoAt9,
	mp3: SceAudiodecInfoMp3,
	aac: SceAudiodecInfoAac,
	celp: SceAudiodecInfoCelp,
}
#assert(size_of(SceAudiodecInfo) == 0x1C)

SceAudiodecCtrl :: struct {
	size: sce.UInt32,
	handle: sce.Int32,
	pEs: ^sce.UInt8,			//!< pointer to elementary stream
	inputEsSize: sce.UInt32,	//!< size of elementary stream used actually (in byte)
	maxEsSize: sce.UInt32,		//!< maximum size of elementary stream used (in byte)
	pPcm: rawptr,			//!< pointer to PCM
	outputPcmSize: sce.UInt32,	//!< size of PCM output actually (in byte)
	maxPcmSize: sce.UInt32,		//!< maximum size of PCM output (in byte)
	wordLength: sce.UInt32,		//!< PCM bit depth
	pInfo: ^SceAudiodecInfo,			//!< pointer to SceAudiodecInfo
}
when size_of(rawptr) == 4 {
	#assert(size_of(SceAudiodecCtrl) == 0x28)
}


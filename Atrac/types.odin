package atrac

import "core:c"
import sce "../common"
import audiodec "../Audiodec"

SceAtracErrorCode :: enum c.uint {
	INVALID_POINTER               = 0x80630000,
	INVALID_SIZE                  = 0x80630001,
	INVALID_WORD_LENGTH           = 0x80630002,
	INVALID_TYPE                  = 0x80630003,
	INVALID_TOTAL_CH              = 0x80630004,
	INVALID_ALIGNMENT             = 0x80630005,
	ALREADY_CREATED               = 0x80630006,
	NOT_CREATED                   = 0x80630007,
	SHORTAGE_OF_CH                = 0x80630008,
	UNSUPPORTED_DATA              = 0x80630009,
	INVALID_DATA                  = 0x8063000A,
	READ_SIZE_IS_TOO_SMALL        = 0x8063000B,
	INVALID_HANDLE                = 0x8063000C,
	READ_SIZE_OVER_BUFFER         = 0x8063000D,
	MAIN_BUFFER_SIZE_IS_TOO_SMALL = 0x8063000E,
	SUB_BUFFER_SIZE_IS_TOO_SMALL  = 0x8063000F,
	DATA_SHORTAGE_IN_BUFFER       = 0x80630010,
	ALL_DATA_WAS_DECODED          = 0x80630011,
	INVALID_MAX_OUTPUT_SAMPLES    = 0x80630012,
	ADDED_DATA_IS_TOO_BIG         = 0x80630013,
	NEED_SUB_BUFFER               = 0x80630014,
	INVALID_SAMPLE                = 0x80630015,
	NO_NEED_SUB_BUFFER            = 0x80630016,
	INVALID_LOOP_STATUS           = 0x80630017,
	REMAIN_VALID_HANDLE           = 0x80630018,
	INVALID_LOOP_NUM              = 0x80630030
}

/* Memory alignment size */
SCE_ATRAC_ALIGNMENT_SIZE :: (audiodec.SCE_AUDIODEC_ALIGNMENT_SIZE)

/* The macro of rounding up the memory size */
//SCE_ATRAC_ROUND_UP(size) ((size + SCE_ATRAC_ALIGNMENT_SIZE - 1) & ~(SCE_ATRAC_ALIGNMENT_SIZE - 1))

/* The definition of ATRAC(TM) type */
SCE_ATRAC_TYPE_AT9  : c.uint :         (0x2003)

/* Maximum number of total total channels */
SCE_ATRAC_AT9_MAX_TOTAL_CH :: (audiodec.SCE_AUDIODEC_AT9_MAX_CH_IN_LIBRARY)

/* The definition of wordLength */
SCE_ATRAC_WORD_LENGTH_16BITS :: (audiodec.SCE_AUDIODEC_WORD_LENGTH_16BITS)

/* Maximum number of channels per stream */
SCE_ATRAC_AT9_MAX_CH_IN_DECODER :: (audiodec.SCE_AUDIODEC_AT9_MAX_CH_IN_DECODER)

/* Maximum number of samples */
SCE_ATRAC_AT9_MAX_FRAME_SAMPLES :: (audiodec.SCE_AUDIODEC_AT9_MAX_SAMPLES)

/* Maximum number of output samples */
SCE_ATRAC_MAX_OUTPUT_SAMPLES :: (2048)

/* Maximum number of output frames */
SCE_ATRAC_AT9_MAX_OUTPUT_FRAMES ::  (8)

/* Minimum number of loop samples */
SCE_ATRAC_AT9_MIN_LOOP_SAMPLES :: (3072)

/* The definition of ATRAC infinite loop */
SCE_ATRAC_INFINITE_LOOP_NUM  : c.int :  (-1)

/* The definition of ATRAC infinite samples */
SCE_ATRAC_INFINITE_SAMPLES  : c.int : (-1)

/* The definition of ATRAC decoder status */
SceAtracDecoderStatus :: enum c.int {
	ALL_DATA_WAS_DECODED       = 0x00000001,
	ALL_DATA_IS_ON_MEMORY      = 0x00000002,
	NONLOOP_PART_IS_ON_MEMORY  = 0x00000004,
	LOOP_PART_IS_ON_MEMORY     = 0x00000008
}

/* The definition of loop status */
SceAtracLoopStatus :: enum c.int {
	NON_RESETABLE_PART          = 0x00000000,
	RESETABLE_PART              = 0x00000001
}

/* The structure for decoder group */
SceAtracDecoderGroup :: struct {
  size: sce.UInt32,
	wordLength: sce.UInt32,
	totalCh: sce.UInt32,
}
#assert(size_of(SceAtracDecoderGroup) == 0xC)

/* Content information structure */
SceAtracContentInfo :: struct {
  size: sce.UInt32,
	atracType: sce.UInt32,
	channel: sce.UInt32,
	samplingRate: sce.UInt32,
	endSample: sce.Int32,
	loopStartSample: sce.Int32,
	loopEndSample: sce.Int32,
	bitRate: sce.UInt32,
	fixedEncBlockSize: sce.UInt32,
	fixedEncBlockSample: sce.UInt32,
	frameSample: sce.UInt32,
	loopBlockOffset: sce.UInt32,
	loopBlockSize: sce.UInt32,
}
#assert(size_of(SceAtracContentInfo) == 0x34)

/* Stream information structure */
SceAtracStreamInfo :: struct {
  size: sce.UInt32,
	pWritePosition: ^sce.UChar8,
	readPosition: sce.UInt32,
	writableSize: sce.UInt32,
}
when size_of(rawptr) == 4 {
  #assert(size_of(SceAtracStreamInfo) == 0x10)
}


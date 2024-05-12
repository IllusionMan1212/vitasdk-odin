package jpeg

import "core:c"
import sce "../common"

SceJpegMJpegInitParam :: struct {
    size: sce.Size,
    decoderCount: sce.Int32,
    options: sce.Int32,
}
#assert(size_of(SceJpegMJpegInitParam) == 0xC)

SceJpegPitch :: struct {
  x: sce.UInt32,
    y: sce.UInt32,
}
#assert(size_of(SceJpegPitch) == 8)

SceJpegOutputInfo :: struct {
  colorSpace: sce.Int32,
    width: sce.UInt16,
    height: sce.UInt16,
    outputSize: sce.UInt32,
    unk_0xc: sce.UInt32,
    unk_0x10: sce.UInt32,
    pitch: [4]SceJpegPitch,
}
#assert(size_of(SceJpegOutputInfo) == 0x34)


SceJpegArmErrorCode :: enum c.int {
    OK = 0
}


SceJpegEncoderInitParamOption :: enum c.int {
	NONE          = 0,  //!< Default option
	LPDDR2_MEMORY = 1   //!< LPDDR2 memory will be used instead of CDRAM
}

SceJpegEncoderInitParam :: struct {
  size: sce.Size,        //!< Size of this structure
	inWidth: c.int,     //!< Input width in pixels
	inHeight: c.int,    //!< Input height in pixels
	pixelFormat: c.int, //!< A valid ::SceJpegEncoderPixelFormat set of values
	outBuffer: rawptr,  //!< A physically continuous memory block 256 bytes aligned
	outSize: sce.Size,     //!< Output size in bytes
	option: c.int,      //!< Additional options, OR of ::SceJpegEncoderInitParamOption
}
when size_of(rawptr) == 4 {
	#assert(size_of(SceJpegEncoderInitParam) == 0x1C)
}


SCE_JPEGENCARM_MIN_COMP_RATIO     :: 1   //!< Lowest compression ratio, best quality.
SCE_JPEGENCARM_DEFAULT_COMP_RATIO :: 64  //!< Default compression ratio.
SCE_JPEGENCARM_MAX_COMP_RATIO     :: 255 //!< Highest compression ratio, lowest quality.

/**
 * Dynamically allocated encoder context.
 *
 * See @ref sceJpegArmEncoderGetContextSize() for required allocation size.
 * The address must be 4 byte aligned.
 */
SceJpegArmEncoderContext :: rawptr
when size_of(rawptr) == 4 {
	#assert(size_of(SceJpegArmEncoderContext) == 4)
}

/**
 * Error Codes
 */
SceJpegEncArmErrorCode :: enum c.uint {
	/**
	 * The image dimensions given are not supported, or are larger
	 * than those set at initialization.
	 */
	IMAGE_SIZE                = 0x80650300,
	/**
	 * The output buffer provided is not of sufficient size.
	 */
	INSUFFICIENT_BUFFER       = 0x80650301,
	/**
	 * The compression ratio given is not within the valid range.
	 */
	INVALID_COMP_RATIO        = 0x80650302,
	/**
	 * The pixelformat given is not one of ::SceJpegArmEncoderPixelFormat.
	 */
	INVALID_PIXELFORMAT       = 0x80650303,
	/**
	 * The headerMode given is not one of ::SceJpegArmEncoderHeaderMode.
	 */
	INVALID_HEADER_MODE       = 0x80650304,
	/**
	 * A null or badly aligned pointer was given.
	 */
	INVALID_POINTER           = 0x80650305
}

/**
 * Pixel Formats
 */
SceJpegArmEncoderPixelFormat :: enum c.int {
	YCBCR420       = 8,  //!< YCbCr420 format
	YCBCR422       = 9   //!< YCbCr422 format
}

/**
 * JPEG Header Modes
 */
SceJpegArmEncoderHeaderMode :: enum c.int {
	JPEG  = 0,  //!< JPEG header mode
	MJPEG = 1   //!< MJPEG header mode
}

SceJpegEncoderContext :: rawptr
when size_of(rawptr) == 4 {
	#assert(size_of(SceJpegEncoderContext) == 4)
}

SceJpegEncErrorCode :: enum c.uint {
	IMAGE_SIZE                = 0x80650200,
	INSUFFICIENT_BUFFER       = 0x80650201,
	INVALID_COMPRATIO         = 0x80650202,
	INVALID_PIXELFORMAT       = 0x80650203,
	INVALID_HEADER_MODE       = 0x80650204,
	INVALID_POINTER           = 0x80650205,
	NOT_PHY_CONTINUOUS_MEMORY = 0x80650206
}

SceJpegEncoderPixelFormat :: enum c.int {
	ARGB8888 = 0,       //!< ARGB8888 format
	YCBCR420 = 8,       //!< YCbCr420 format
	YCBCR422 = 9,       //!< YCbCr422 format
	CSC_ARGB_YCBCR = 16 //!< ARGB to YCbCr color conversion flag
}

SceJpegEncoderHeaderMode :: enum c.int {
	JPEG = 0,   //!< JPEG header mode
	MJPEG = 1   //!< MJPEG header mode
}



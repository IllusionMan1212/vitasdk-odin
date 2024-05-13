package jpeg

import "core:c"
import sce "../common"

foreign import jpeg "system:SceJpeg_stub"
foreign import jpegarm "system:SceJpegArm_stub"
foreign import jpegenc "system:SceJpegEnc_stub"
foreign import jpegencarm "system:SceJpegEncArm_stub"
foreign import jpegkern "system:SceAvcodecForDriver_stub"

foreign jpeg {
  sceJpegInitMJpeg :: proc(decoderCount: sce.Int32) -> c.int ---

  sceJpegInitMJpegWithParam :: proc(params: ^SceJpegMJpegInitParam) -> c.int ---

  sceJpegFinishMJpeg :: proc() -> c.int ---

  sceJpegGetOutputInfo :: proc(jpegData: [^]sce.UInt8,
  jpegSize: sce.Size,
  format: sce.Int32,
  mode: sce.Int32,
  output: ^SceJpegOutputInfo) -> c.int ---

  sceJpegDecodeMJpegYCbCr :: proc(jpegData: [^]sce.UInt8,
  jpegSize: sce.Size,
  mode: sce.Int32,
  output: [^]sce.UInt8,
  outputSize: sce.Size,
  buffer: rawptr,
  bufferSize: sce.Size) -> c.int ---

  sceJpegMJpegCsc :: proc(rgba: [^]sce.UInt8,
  yuv: [^]sce.UInt8,
  yuvSize: sce.Size,
  imageWidth: sce.Int32,
  format: sce.Int32,
  sampling: sce.Int32) -> c.int ---
}
 
foreign jpegarm {
  sceJpegArmDecodeMJpeg :: proc(pJpeg: [^]sce.UInt8,
  isize: sce.Size,
  decodeMode: sce.Int,
  pRGBA: rawptr,
  osize: sce.Size,
  pCoefBuffer: rawptr,
  coefBufferSize: sce.Size) -> c.int ---

  sceJpegArmDecodeMJpegYCbCr :: proc(pJpeg: [^]sce.UInt8,
  isize: sce.Size,
  decodeMode: sce.Int,
  pYCbCr: [^]sce.UInt8,
  osize: sce.Size,
  pCoefBuffer: rawptr,
  coefBufferSize: sce.Size) -> c.int ---

  sceJpegArmGetOutputInfo :: proc(pJpeg: [^]sce.UInt8,
  isize: sce.Size,
  decodeMode: sce.Int,
  outputFormat: sce.Int,
  pOutputInfo: ^SceJpegOutputInfo) -> c.int ---
}

foreign jpegenc {
  /**
  * Initialize a jpeg encoder
  *
  * @param[in] _context - A pointer to a big enough allocated memory block
  * @param[in] inWidth - Input width in pixels
  * @param[in] inHeight - Input height in pixels
  * @param[in] pixelformat - A valid ::SceJpegEncoderPixelFormat set of values
  * @param[in] outBuffer - A physically continuous memory block 256 bytes aligned
  * @param[in] outSize - Output size in bytes
  *
  * @return 0 on success, < 0 on error.
  */
  sceJpegEncoderInit :: proc(_context: SceJpegEncoderContext, inWidth: c.int, inHeight: c.int, pixelformat: SceJpegEncoderPixelFormat, outBuffer: rawptr, outSize: sce.Size) -> c.int ---

  /**
  * Initialize a jpeg encoder with param
  *
  * @param[in] initParam - A pointer to the initialization parameters
  *
  * @return 0 on success, < 0 on error.
  */
  sceJpegEncoderInitWithParam :: proc(_context: SceJpegEncoderContext, initParam: ^SceJpegEncoderInitParam) -> c.int ---

  /**
  * Terminate a jpeg encoder
  *
  * @param[in] _context - A pointer to an already initialized ::SceJpegEncoderContext
  *
  * @return 0 on success, < 0 on error.
  */
  sceJpegEncoderEnd :: proc(_context: SceJpegEncoderContext) -> c.int ---

  /**
  * Execute a jpeg encode
  *
  * @param[in] _context - A pointer to an already initialized ::SceJpegEncoderContext
  * @param[in] inBuffer - A physically continuous memory block 256 bytes aligned
  *
  * @return encoded jpeg size on success, < 0 on error.
  */
  sceJpegEncoderEncode :: proc(_context: SceJpegEncoderContext, inBuffer: rawptr) -> c.int ---

  /**
  * Set encoder compression ratio
  *
  * @param[in] _context - A pointer to an already initialized ::SceJpegEncoderContext
  * @param[in] ratio - A value between 0 and 255 (higher = better compression, lower = better speed)
  *
  * @return 0 on success, < 0 on error.
  */
  sceJpegEncoderSetCompressionRatio :: proc(_context: SceJpegEncoderContext, ratio: c.int) -> c.int ---


  /**
  * Set encoder output address
  *
  * @param[in] _context - A pointer to an already initialized ::SceJpegEncoderContext
  * @param[in] outBuffer - A physically continuous memory block 256 bytes aligned
  * @param[in] outSize - Output buffer size in bytes
  *
  * @return 0 on success, < 0 on error.
  */
  sceJpegEncoderSetOutputAddr :: proc(_context: SceJpegEncoderContext, outBuffer: rawptr, outSize: sce.Size) -> c.int ---

  /**
  * Execute a color conversion from ARGB to YCbCr
  *
  * @param[in] _context - A pointer to an already initialized ::SceJpegEncoderContext
  * @param[in] outBuffer - A physical continuous memory block 256 bytes aligned
  * @param[in] inBuffer - A pointer to a valid ARGB buffer
  * @param[in] inPitch - Input pitch value in pixels
  * @param[in] inPixelFormat - A valid ::SceJpegEncoderPixelFormat set of values
  *
  * @return 0 on success, < 0 on error.
  */
  sceJpegEncoderCsc :: proc(_context: SceJpegEncoderContext, outBuffer: rawptr, inBuffer: rawptr, inPitch: c.int, inPixelFormat: SceJpegEncoderPixelFormat) -> c.int ---

  /**
  * Return required free size to allocate a jpeg encoder
  *
  * @return Required free memory size in bytes, < 0 on error.
  */
  sceJpegEncoderGetContextSize :: proc() -> c.int ---

  /**
  * Set encoder valid region (?)
  *
  * @param[in] _context - A pointer to an already initialized ::SceJpegEncoderContext
  * @param[in] inWidth - Input width in pixels
  * @param[in] inHeight - Input height in pixels
  *
  * @return 0 on success, < 0 on error.
  */
  sceJpegEncoderSetValidRegion :: proc(_context: SceJpegEncoderContext, inWidth: c.int, inHeight: c.int) -> c.int ---

  /**
  * Set header used for output file
  *
  * @param[in] _context - A pointer to an already initialized ::SceJpegEncoderContext
  * @param[in] mode - One of ::SceJpegEncoderHeaderMode
  *
  * @return 0 on success, < 0 on error.
  */
  sceJpegEncoderSetHeaderMode :: proc(_context: SceJpegEncoderContext, mode: c.int) -> c.int ---
}

foreign jpegencarm {
  /**
  * Get required size of _context memory.
  *
  * @return Required size of allocated memory.
  */
  sceJpegArmEncoderGetContextSize :: proc() -> sce.Size ---

  /**
  * Initialize a JPEG encoder.
  *
  * @param[in] _context     - An allocated encoder _context of appropriate size.
  * @param[in] inWidth     - Input width in pixels.
  * @param[in] inHeight    - Input height in pixels.
  * @param[in] pixelformat - One of ::SceJpegArmEncoderPixelFormat.
  * @param[in] outBuffer   - A sufficiently sized 8 byte aligned output buffer.
  * @param[in] outSize     - Output buffer size in bytes.
  *
  * @return 0 on success, < 0 on error.
  */
  sceJpegArmEncoderInit :: proc(_context: SceJpegArmEncoderContext, inWidth: sce.UInt16, inHeight: sce.UInt16, pixelformat: SceJpegArmEncoderPixelFormat, outBuffer: rawptr, outSize: sce.Size) -> c.int ---

  /**
  * Terminate a JPEG encoder.
  *
  * @param[in] _context - An already initialized ::SceJpegArmEncoderContext.
  *
  * @return 0 on success, < 0 on error.
  */
  sceJpegArmEncoderEnd :: proc(_context: SceJpegArmEncoderContext) -> c.int ---

  /**
  * Execute a JPEG encode.
  *
  * @param[in] _context  - An already initialized ::SceJpegArmEncoderContext.
  * @param[in] inBuffer - An 8 byte aligned memory block of color data.
  *
  * @return Encoded JPEG size on success, < 0 on error.
  */
  sceJpegArmEncoderEncode :: proc(_context: SceJpegArmEncoderContext, inBuffer: rawptr) -> c.int ---

  /**
  * Set the encoder compression ratio.
  *
  * @param[in] _context - An already initialized ::SceJpegArmEncoderContext.
  * @param[in] ratio   - A value between 1 and 255 (higher = better compression, lower = better speed).
  *
  * See @ref SCE_JPEGENCARM_DEFAULT_COMP_RATIO for the default compression ratio.
  *
  * @return 0 on success, < 0 on error.
  */
  sceJpegArmEncoderSetCompressionRatio :: proc(_context: SceJpegArmEncoderContext, ratio: sce.UInt8) -> c.int ---

  /**
  * Set encoder output address.
  *
  * @param[in] _context   - An already initialized ::SceJpegArmEncoderContext.
  * @param[in] outBuffer - A sufficiently sized 8 byte aligned output buffer.
  * @param[in] outSize   - Output buffer size in bytes.
  *
  * @return 0 on success, < 0 on error.
  */
  sceJpegArmEncoderSetOutputAddr :: proc(_context: SceJpegArmEncoderContext, outBuffer: rawptr, outSize: sce.Size) -> c.int ---

  /**
  * Set the region of the image to be encoded as JPEG. The encoded region starts
  * from (0,0), which is the top left of the image, and expands outward by regionWidth and regionHeight.
  *
  * @param[in] _context      - An already initialized ::SceJpegArmEncoderContext.
  * @param[in] regionWidth  - Width of the region in pixels.
  * @param[in] regionHeight - Height of the region in pixels.
  *
  * @return 0 on success, < 0 on error.
  */
  sceJpegArmEncoderSetValidRegion :: proc(_context: SceJpegArmEncoderContext, regionWidth: sce.UInt16, regionHeight: sce.UInt16) -> c.int ---

  /**
  * Set header used for output file.
  *
  * @param[in] _context - An already initialized ::SceJpegArmEncoderContext.
  * @param[in] mode    - One of ::SceJpegArmEncoderHeaderMode.
  *
  * @return 0 on success, < 0 on error.
  */
  sceJpegArmEncoderSetHeaderMode :: proc(_context: SceJpegArmEncoderContext, mode: SceJpegArmEncoderHeaderMode) -> c.int ---
}

foreign jpegkern {
  /**
  * Initialize a jpeg encoder
  *
  * @param[in] _context - A pointer to a big enough allocated memory block
  * @param[in] inWidth - Input width in pixels
  * @param[in] inHeight - Input height in pixels
  * @param[in] pixelformat - A valid ::SceJpegEncoderPixelFormat set of values
  * @param[in] outBuffer - A physically continuous memory block 256 bytes aligned
  * @param[in] outSize - Output size in bytes
  *
  * @return 0 on success, < 0 on error.
  */
  ksceJpegEncoderInit :: proc(_context: SceJpegEncoderContext, inWidth: c.int, inHeight: c.int, pixelformat: SceJpegEncoderPixelFormat, outBuffer: rawptr, outSize: sce.Size) -> c.int ---

  /**
  * Terminate a jpeg encoder
  *
  * @param[in] _context - A pointer to an already initialized ::SceJpegEncoderContext
  *
  * @return 0 on success, < 0 on error.
  */
  ksceJpegEncoderEnd :: proc(_context: SceJpegEncoderContext) -> c.int ---

  /**
  * Execute a jpeg encode
  *
  * @param[in] _context - A pointer to an already initialized ::SceJpegEncoderContext
  * @param[in] inBuffer - A physically continuous memory block 256 bytes aligned
  *
  * @return 0 on success, < 0 on error.
  */
  ksceJpegEncoderEncode :: proc(_context: SceJpegEncoderContext, inBuffer: rawptr) -> c.int ---

  /**
  * Set encoder compression ratio
  *
  * @param[in] _context - A pointer to an already initialized ::SceJpegEncoderContext
  * @param[in] ratio - A value between 0 and 255 (higher = better compression, lower = better speed)
  *
  * @return 0 on success, < 0 on error.
  */
  ksceJpegEncoderSetCompressionRatio :: proc(_context: SceJpegEncoderContext, ratio: c.int) -> c.int ---


  /**
  * Set encoder output address
  *
  * @param[in] _context - A pointer to an already initialized ::SceJpegEncoderContext
  * @param[in] outBuffer - A physically continuous memory block 256 bytes aligned
  * @param[in] outSize - Output buffer size in bytes
  *
  * @return 0 on success, < 0 on error.
  */
  ksceJpegEncoderSetOutputAddr :: proc(_context: SceJpegEncoderContext, outBuffer: rawptr, outSize: sce.Size) -> c.int ---

  /**
  * Execute a color conversion from ARGB to YCbCr
  *
  * @param[in] _context - A pointer to an already initialized ::SceJpegEncoderContext
  * @param[in] outBuffer - A physical continuous memory block 256 bytes aligned
  * @param[in] inBuffer - A pointer to a valid ARGB buffer
  * @param[in] inPitch - Input pitch value in pixels
  * @param[in] inPixelFormat - A valid ::SceJpegEncoderPixelFormat set of values
  *
  * @return 0 on success, < 0 on error.
  */
  ksceJpegEncoderCsc :: proc(_context: SceJpegEncoderContext, outBuffer: rawptr, inBuffer: rawptr, inPitch: c.int, inPixelFormat: SceJpegEncoderPixelFormat) -> c.int ---

  /**
  * Return required free size to allocate a jpeg encoder
  *
  * @return Required free memory size in bytes, < 0 on error.
  */
  ksceJpegEncoderGetContextSize :: proc() -> c.int ---

  /**
  * Set encoder valid region (?)
  *
  * @param[in] _context - A pointer to an already initialized ::SceJpegEncoderContext
  * @param[in] inWidth - Input width in pixels
  * @param[in] inHeight - Input height in pixels
  *
  * @return 0 on success, < 0 on error.
  */
  ksceJpegEncoderSetValidRegion :: proc(_context: SceJpegEncoderContext, inWidth: c.int, inHeight: c.int) -> c.int ---

  /**
  * Set header used for output file
  *
  * @param[in] _context - A pointer to an already initialized ::SceJpegEncoderContext
  * @param[in] mode - One of ::SceJpegEncoderHeaderMode
  *
  * @return 0 on success, < 0 on error.
  */
  ksceJpegEncoderSetHeaderMode :: proc(_context: SceJpegEncoderContext, mode: c.int) -> c.int ---
}

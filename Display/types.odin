package display

import "core:c"
import sce "../common"

SceDisplayErrorCode :: enum c.uint {
	OK                    = 0,
	INVALID_HEAD          = 0x80290000,
	INVALID_VALUE         = 0x80290001,
	INVALID_ADDR          = 0x80290002,
	INVALID_PIXELFORMAT   = 0x80290003,
	INVALID_PITCH         = 0x80290004,
	INVALID_RESOLUTION    = 0x80290005,
	INVALID_UPDATETIMING  = 0x80290006,
	NO_FRAME_BUFFER       = 0x80290007,
	NO_PIXEL_DATA         = 0x80290008,
	NO_OUTPUT_SIGNAL      = 0x80290009
}
#assert(size_of(SceDisplayErrorCode) == 4)

SceDisplayPixelFormat :: enum c.uint {
	A8B8G8R8    = 0x00000000,
	A2B10G10R10 = 0x60800000,
}
#assert(size_of(SceDisplayPixelFormat) == 4)

SceDisplaySetBufSync :: enum c.int {
	/** Buffer change effective immediately */
	SCE_DISPLAY_SETBUF_IMMEDIATE = 0,
	/** Buffer change effective next frame */
	SCE_DISPLAY_SETBUF_NEXTFRAME = 1,
	__SCE_DISPLAY_SETBUF = -1 // 0xFFFFFFFF
}
#assert(size_of(SceDisplaySetBufSync) == 4)

/**
 * Structure used with ::ksceDisplaySetFrameBuf to set/update framebuffer.
 * Original screen resolution is 960x544, but the following resolutions
 * can also be supplied as width and height :
 * 480x272, 640x368, 720x408
 *
 * @note - This structure is returned by ::ksceDisplayGetFrameBuf
*/
SceDisplayFrameBuf :: struct {
	size: sce.Size,               //!< sizeof(SceDisplayFrameBuf)
	base: rawptr,                 //!< Pointer to framebuffer
	pitch: c.uint,         //!< pitch pixels
	pixelformat: c.uint,   //!< pixel format (one of ::SceDisplayPixelFormat)
	width: c.uint,         //!< framebuffer width
	height: c.uint,        //!< framebuffer height
}
when size_of(rawptr) == 4 {
	#assert(size_of(SceDisplayFrameBuf) == 0x18)
}

/**
 * Extended framebuffer information
*/
SceDisplayFrameBufInfo :: struct {
	size: sce.Size,                //!< sizeof(SceDisplayFrameBufInfo)
	pid: sce.UID,                  //!< PID of the process owning this framebuffer
	vblankcount: c.uint,    //!< Amount of VBlanks this framebuffer has been displayed
	paddr: c.uintptr_t,             //!< Physical address
	framebuf: SceDisplayFrameBuf, //!< SceDisplayFrameBuf information
	resolution: c.uint,     //!< Resolution
}


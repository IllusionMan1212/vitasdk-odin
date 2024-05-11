package camera

import "core:c"
import sce "../common"

// TODO: should be c.int
/** Camera error codes. */
SceCameraErrorCode :: enum i64 {
	PARAM               = 0x802E0000,
	ALREADY_INIT        = 0x802E0001,
	NOT_INIT            = 0x802E0002,
	ALREADY_OPEN        = 0x802E0003,
	NOT_OPEN            = 0x802E0004,
	ALREADY_START       = 0x802E0005,
	NOT_START           = 0x802E0006,
	FORMAT_UNKNOWN      = 0x802E0007,
	RESOLUTION_UNKNOWN  = 0x802E0008,
	BAD_FRAMERATE       = 0x802E0009,
	TIMEOUT             = 0x802E000A,
	EXCLUSIVE           = 0x802E000B,
	ATTRIBUTE_UNKNOWN   = 0x802E000C,
	MAX_PROCESS         = 0x802E000D,
	NOT_ACTIVE          = 0x802E000E,
	ALREADY_READ        = 0x802E000F,
	NOT_MOUNTED         = 0x802E0010,
	DATA_RANGE_UNKNOWN  = 0x802E0011,
	OTHER_ALREADY_START = 0x802E0012,
	FATAL               = 0x802E00FF,
}

/** Enumeration for the camera device types. */
SceCameraDevice :: enum c.int {
	FRONT = 0, //!< Front camera
	BACK  = 1  //!< Retro camera
}

/** Enumeration for the camera process priorities. */
SceCameraPriority :: enum c.int {
	SHARE      = 0, //!< Share mode
	EXCLUSIVE  = 1  //!< Exclusive mode
}

/** Enumeration for the camera output formats. */
SceCameraFormat :: enum c.int {
	INVALID        = 0, //!< Invalid format
	YUV422_PLANE   = 1, //!< YUV422 planes
	YUV422_PACKED  = 2, //!< YUV422 pixels packed
	YUV420_PLANE   = 3, //!< YUV420 planes
	ARGB           = 4, //!< ARGB pixels
	ABGR           = 5, //!< ABGR pixels
	RAW8           = 6  //!< 8 bit raw data
}

/** Enumeration for the camera resolutions. */
SceCameraResolution :: enum c.int {
	RESOLUTION_0_0        = 0, //!< Invalid resolution
	RESOLUTION_640_480    = 1, //!< VGA resolution
	RESOLUTION_320_240    = 2, //!< QVGA resolution
	RESOLUTION_160_120    = 3, //!< QQVGA resolution
	RESOLUTION_352_288    = 4, //!< CIF resolution
	RESOLUTION_176_144    = 5, //!< QCIF resolution
	RESOLUTION_480_272    = 6, //!< PSP resolution
	RESOLUTION_640_360    = 8  //!< NGP resolution
}

/** Enumeration for the camera framerates. */
SceCameraFrameRate :: enum c.int {
	FRAMERATE_3_FPS  = 3,   //!< 3.75 fps
	FRAMERATE_5_FPS  = 5,   //!< 5 fps
	FRAMERATE_7_FPS  = 7,   //!< 7.5 fps
	FRAMERATE_10_FPS = 10,  //!< 10 fps
	FRAMERATE_15_FPS = 15,  //!< 15 fps
	FRAMERATE_20_FPS = 20,  //!< 20 fps
	FRAMERATE_30_FPS = 30,  //!< 30 fps
	FRAMERATE_60_FPS = 60,  //!< 60 fps
	FRAMERATE_120_FPS = 120 //!< 120 fps (@note Resolution must be QVGA or lower)
}

/** Enumeration for the camera exposure compensations. */
SceCameraExposureCompensation :: enum c.int {
	EV_NEGATIVE_20 = -20, //!< -2.0
	EV_NEGATIVE_17 = -17, //!< -1.7
	EV_NEGATIVE_15 = -15, //!< -1.5
	EV_NEGATIVE_13 = -13, //!< -1.3
	EV_NEGATIVE_10 = -10, //!< -1.0
	EV_NEGATIVE_7  = -7,  //!< -0.7
	EV_NEGATIVE_5  = -5,  //!< -0.5
	EV_NEGATIVE_3  = -3,  //!< -0.3
	EV_POSITIVE_0  = 0,   //!< +0.0
	EV_POSITIVE_3  = 3,   //!< +0.3
	EV_POSITIVE_5  = 5,   //!< +0.5
	EV_POSITIVE_7  = 7,   //!< +0.7
	EV_POSITIVE_10 = 10,  //!< +1.0
	EV_POSITIVE_13 = 13,  //!< +1.3
	EV_POSITIVE_15 = 15,  //!< +1.5
	EV_POSITIVE_17 = 17,  //!< +1.7
	EV_POSITIVE_20 = 20   //!< +2.0
}

/** Enumeration for the camera effects. */
SceCameraEffect :: enum c.int {
	NORMAL     = 0,
	NEGATIVE   = 1,
	BLACKWHITE = 2,
	SEPIA      = 3,
	BLUE       = 4,
	RED        = 5,
	GREEN      = 6
}

/** Enumeration for the camera reverse modes. */
SceCameraReverse :: enum c.int {
	OFF          = 0,                                                    //!< Reverse mode off
	MIRROR       = 1,                                                    //!< Mirror mode
	FLIP         = 2,                                                    //!< Flip mode
	MIRROR_FLIP  = (MIRROR | FLIP) //!< Mirror + Flip mode
}

/** Enumeration for the camera saturations. */
SceCameraSaturation :: enum c.int {
	SATURATION_0  = 0,  //!< 0.0
	SATURATION_5  = 5,  //!< 0.5
	SATURATION_10 = 10, //!< 1.0
	SATURATION_20 = 20, //!< 2.0
	SATURATION_30 = 30, //!< 3.0
	SATURATION_40 = 40  //!< 4.0
}

/** Enumeration for the camera sharpnesses. */
SceCameraSharpness :: enum c.int {
	SHARPNESS_100 = 1, //!< 100%
	SHARPNESS_200 = 2, //!< 200%
	SHARPNESS_300 = 3, //!< 300%
	SHARPNESS_400 = 4  //!< 400%
}

/** Enumeration for the camera anti-flickering modes. */
SceCameraAntiFlicker :: enum c.int {
	ANTIFLICKER_AUTO = 1, //!< Automatic mode
	ANTIFLICKER_50HZ = 2, //!< 50 Hz mode
	ANTIFLICKER_60HZ = 3  //!< 50 Hz mode
}

/** Enumeration for the camera ISO speed modes. */
SceCameraISO :: enum c.int {
	ISO_AUTO = 1,  //!< Automatic mode
	ISO_100 = 100, //!< ISO100/21�
	ISO_200 = 200, //!< ISO200/24�
	ISO_400 = 400  //!< ISO400/27�
}

/** Enumeration for the camera gain modes. */
SceCameraGain :: enum c.int {
	GAIN_AUTO = 0,
	GAIN_1    = 1,
	GAIN_2    = 2,
	GAIN_3    = 3,
	GAIN_4    = 4,
	GAIN_5    = 5,
	GAIN_6    = 6,
	GAIN_7    = 7,
	GAIN_8    = 8,
	GAIN_9    = 9,
	GAIN_10   = 10,
	GAIN_11   = 11,
	GAIN_12   = 12,
	GAIN_13   = 13,
	GAIN_14   = 14,
	GAIN_15   = 15,
	GAIN_16   = 16
}

/** Enumeration for the camera white balance modes. */
SceCameraWhiteBalance :: enum c.int {
	AUTO = 0,  //!< Automatic mode
	DAY  = 1,  //!< Daylight mode
	CWF  = 2,  //!< Cool White Fluorescent mode
	SLSA = 4   //!< Standard Light Source A mode
}

/** Enumeration for the camera backlight modes. */
SceCameraBacklight :: enum c.int {
	OFF = 0,  //!< Disabled
	ON  = 1   //!< Enabled
}

/** Enumeration for the camera nightmode modes. */
SceCameraNightmode :: enum c.int {
	OFF     = 0,  //!< Disabled
	LESS10  = 1,  //!< 10 lux or below
	LESS100 = 2,  //!< 100 lux or below
	OVER100 = 3   //!< 100 lux or over
}

SceCameraInfo :: struct {
  size: sce.Size,        //!< sizeof(SceCameraInfo)
	priority: c.uint16_t,   //!< Process priority (one of ::SceCameraPriority)
	format: c.uint16_t,     //!< Output format (One or more ::SceCameraFormat)
	resolution: c.uint16_t, //!< Resolution (one of ::SceCameraResolution)
	framerate: c.uint16_t,  //!< Framerate (one of ::SceCameraFrameRate)
	width: c.uint16_t,
	height: c.uint16_t,
	range: c.uint16_t,
	pad: c.uint16_t,        //!< Structure padding
	sizeIBase: sce.Size,
	sizeUBase: sce.Size,
	sizeVBase: sce.Size,
	pIBase: rawptr,
	pUBase: rawptr,
	pVBase: rawptr,
	pitch: c.uint16_t,
	buffer: c.uint16_t,
}
when size_of(rawptr) == 4 {
  #assert(size_of(SceCameraInfo) == 0x30)
}

SceCameraRead :: struct {
  size: sce.Size,         //!< sizeof(SceCameraRead)
	mode: c.int,
	pad: c.int,
	status: c.int,
	frame: c.uint64_t,
	timestamp: c.uint64_t,
	sizeIBase: sce.Size,
	sizeUBase: sce.Size,
	sizeVBase: sce.Size,
	pIBase: rawptr,
	pUBase: rawptr,
	pVBase: rawptr,
}
when size_of(rawptr) == 4 {
  #assert(size_of(SceCameraRead) == 0x38)
}


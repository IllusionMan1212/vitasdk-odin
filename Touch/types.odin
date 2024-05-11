package touch

import "core:c"
import sce "../common"

SCE_TOUCH_MAX_REPORT :: 8	//!< FIXME 6 on front | 4 on back

/** Touch error codes */
SceTouchErrorCode :: enum c.uint {
	INVALID_ARG   = 0x80350001,
	PRIV_REQUIRED = 0x80350002,
	FATAL         = 0x803500FF
}


/**
 * Port numbers of touch panels
 *
 * @see ::sceTouchRead
 * @see ::sceTouchPeek
 */
SceTouchPortType :: enum c.int {
	FRONT   = 0, //!< Front touch panel id
	BACK    = 1, //!< Back touch panel id
	MAX_NUM = 2  //!< Number of touch panels
}

/**
 * Sampling port setting of the touch panel
 *
 * @see ::sceTouchSetSamplingState
 */
SceTouchSamplingState :: enum c.int {
	STOP   = 0,
	START  = 1
}

/**
 * Info field of ::SceTouchReport structure
 *
 * @see ::SceTouchReport
 */
SceTouchReportInfo :: enum c.int {
	HIDE_UPPER_LAYER = 0x0001
}

SceTouchPanelInfo :: struct {
  minAaX: sce.Int16,        //!< Min active area X position
	minAaY: sce.Int16,        //!< Min active area Y position
	maxAaX: sce.Int16,        //!< Max active area X position
	maxAaY: sce.Int16,        //!< Max active area Y position
	minDispX: sce.Int16,      //!< Min display X origin (top left)
	minDispY: sce.Int16,      //!< Min display Y origin (top left)
	maxDispX: sce.Int16,      //!< Max display X origin (bottom right)
	maxDispY: sce.Int16,      //!< Max display Y origin (bottom right)
	minForce: sce.UInt8,      //!< Min touch force value
	maxForce: sce.UInt8,      //!< Max touch force value
	reserved: [30]sce.UInt8,  //!< Reserved
}
#assert(size_of(SceTouchPanelInfo) == 0x30)

SceTouchReport :: struct {
  id: sce.UInt8,          //!< Touch ID
	force: sce.UInt8,       //!< Touch force
	x: sce.Int16,           //!< X position
	y: sce.Int16,           //!< Y position
	reserved: [8]sce.UInt8, //!< Reserved
	info: sce.UInt16,        //!< Information of this touch
}
#assert(size_of(SceTouchReport) == 0x10)

SceTouchData :: struct {
  timeStamp: sce.UInt64,                    //!< Data timestamp
	status: sce.UInt32,                       //!< Unused
	reportNum: sce.UInt32,                    //!< Number of touch reports
	report: [SCE_TOUCH_MAX_REPORT]SceTouchReport, //!< Touch reports
}
#assert(size_of(SceTouchData) == 0x90)


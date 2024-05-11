package ctrl

import "core:c"

// TODO: this should be a c.int
SceCtrlErrorCode :: enum i64 {
	INVALID_ARG   = 0x80340001,
	PRIV_REQUIRED = 0x80340002,
	NO_DEVICE     = 0x80340020,
	NOT_SUPPORTED = 0x80340021,
	INVALID_MODE  = 0x80340022,
	FATAL         = 0x803400FF,
}

/** Enumeration for the digital controller buttons.
 * @note - L1/R1/L3/R3 only can bind using ::sceCtrlPeekBufferPositiveExt2 and ::sceCtrlReadBufferPositiveExt2
 * @note - Values bigger than 0x00010000 can be intercepted only with shell privileges
 * @note - Vita's L Trigger and R Trigger are mapped to L1 and R1 when using ::sceCtrlPeekBufferPositiveExt2 and ::sceCtrlReadBufferPositiveExt2
 */
SceCtrlButtons :: enum c.int {
	SELECT      = 0x00000001,            //!< Select button.
	L3          = 0x00000002,            //!< L3 button.
	R3          = 0x00000004,            //!< R3 button.
	START       = 0x00000008,            //!< Start button.
	UP          = 0x00000010,            //!< Up D-Pad button.
	RIGHT       = 0x00000020,            //!< Right D-Pad button.
	DOWN        = 0x00000040,            //!< Down D-Pad button.
	LEFT        = 0x00000080,            //!< Left D-Pad button.
	LTRIGGER    = 0x00000100,            //!< Left trigger.
	L2          = LTRIGGER,     //!< L2 button.
	RTRIGGER    = 0x00000200,            //!< Right trigger.
	R2          = RTRIGGER,     //!< R2 button.
	L1          = 0x00000400,            //!< L1 button.
	R1          = 0x00000800,            //!< R1 button.
	TRIANGLE    = 0x00001000,            //!< Triangle button.
	CIRCLE      = 0x00002000,            //!< Circle button.
	CROSS       = 0x00004000,            //!< Cross button.
	SQUARE      = 0x00008000,            //!< Square button.
	INTERCEPTED = 0x00010000,            //!< Input not available because intercepted by another application
	PSBUTTON    = INTERCEPTED,  //!< Playstation (Home) button.
	HEADPHONE   = 0x00080000,            //!< Headphone plugged in.
	VOLUP       = 0x00100000,            //!< Volume up button.
	VOLDOWN     = 0x00200000,            //!< Volume down button.
	POWER       = 0x40000000,            //!< Power button.
}

/** Enumeration for the controller types. */
SceCtrlExternalInputMode :: enum c.int {
	UNPAIRED  = 0, //!< Unpaired controller
	PHY       = 1, //!< Physical controller for VITA
	VIRT      = 2, //!< Virtual controller for PSTV
	DS3       = 4, //!< DualShock 3
	DS4       = 8  //!< DualShock 4
}

/** Controller mode. */
SceCtrlPadInputMode :: enum c.int {
	/** Digital buttons only. */
	DIGITAL     = 0,
	/** Digital buttons + Analog support. */
	ANALOG      = 1,
	/** Same as ::SCE_CTRL_MODE_ANALOG, but with larger range for analog sticks. */
	ANALOG_WIDE = 2
}

/** Returned controller data */
SceCtrlData :: struct {
	/** The current read frame. */
	timeStamp: c.uint64_t,
	/** Bit mask containing zero or more of ::SceCtrlButtons. */
	buttons: c.uint,
	/** Left analogue stick, X axis. */
	lx: c.uchar,
	/** Left analogue stick, Y axis. */
	ly: c.uchar,
	/** Right analogue stick, X axis. */
	rx: c.uchar,
	/** Right analogue stick, Y axis. */
	ry: c.uchar,
	/** Up button */
	up: c.uint8_t,
	/** Right button */
	right: c.uint8_t,
	/** Down button */
	down: c.uint8_t,
	/** Left button */
	left: c.uint8_t,
	/** Left trigger (L2) */
	lt: c.uint8_t,
	/** Right trigger (R2) */
	rt: c.uint8_t,
	/** Left button (L1) */
	l1: c.uint8_t,
	/** Right button (R1) */
	r1: c.uint8_t,
	/** Triangle button */
	triangle: c.uint8_t,
	/** Circle button */
	circle: c.uint8_t,
	/** Cross button */
	cross: c.uint8_t,
	/** Square button */
	square: c.uint8_t,
	/** Reserved. */
	reserved: [4]c.uint8_t,
}
#assert(size_of(SceCtrlData) == 0x20)

/** Structure to pass as argument to ::sceCtrlSetRapidFire */
SceCtrlRapidFireRule :: struct {
	Mask: c.uint,
	Trigger: c.uint,
	Target: c.uint,
	Delay: c.uint,
	Make: c.uint,
	Break: c.uint,
}
#assert(size_of(SceCtrlRapidFireRule) == 0x18)

/** Structure to pass as argument to ::sceCtrlSetActuator */
SceCtrlActuator :: struct {
	small: c.uchar, //!< Vibration strength of the small motor
	large: c.uchar, //!< Vibration strength of the large motor
	unk: [6]c.uint8_t ,      //!< Unknown
}
#assert(size_of(SceCtrlActuator) == 8)

/** Structure to pass as argument to ::sceCtrlGetControllerPortInfo */
SceCtrlPortInfo :: struct {
	port: [5]c.uint8_t,  //!< Controller type of each port (See ::SceCtrlExternalInputMode)
	unk: [11]c.uint8_t,  //!< Unknown
}
#assert(size_of(SceCtrlPortInfo) == 0x10)


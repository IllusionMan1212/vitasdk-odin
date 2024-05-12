package motion

import "core:c"
import sce "../common"

SceMotionMagFieldStability :: enum c.int {
	UNSTABLE    = 0,
	UNUSED      = 1,
	STABLE      = 2
}

SceMotionErrorCode :: enum c.uint {
	DATA_INVALID       = 0x80360200,
	READING            = 0x80360201,
	NON_INIT_ERR       = 0x80360202,
	STATE_INVALID      = 0x80360203,
	CALIB_READ_FAIL    = 0x80360204,
	OUT_OF_BOUNDS      = 0x80360205,
	NOT_SAMPLING       = 0x80360206,
	ALREADY_SAMPLING   = 0x80360207,
	MEM_IN_USE         = 0x80360208
}


/* struct */

/** Returned motion state */
SceMotionState :: struct {
  timestamp: c.uint,         //!< Local timestamp of the device
	acceleration: sce.FVector3,       //!< Accelerometer data
	angularVelocity: sce.FVector3,    //!< Angular velocity data
	reserved1: [12]c.uint8_t,          //!< Reserved data
	deviceQuat: sce.FQuaternion,      //!< Orientation data as a Quaternion
	rotationMatrix: sce.FMatrix4,     //!< Orientation data as a rotation matrix
	nedMatrix: sce.FMatrix4,          //!< Magnetometer orientation matrix
	reserved2: [4]c.uint8_t,           //!< Reserved data
	basicOrientation: sce.FVector3,   //!< Orientation of the device in reference to gravity
	hostTimestamp: sce.ULong64,       //!< Timestamp of the data in microseconds
	reserved3: [36]c.uint8_t,          //!< Reserved data
	magFieldStability: c.uint8_t,      //!< One of ::SceMotionMagFieldStability
	unknown: c.uint8_t,                //!< Unknown
	reserved4: [2]c.uint8_t,           //!< Reserved data
}
#assert(size_of(SceMotionState) == 0xF8)

/** Returned motion sensor state 
* @note - ::SceMotionSensorState holds actual sensor data as opposed to ::SceMotionState which uses a calculated state
*/
SceMotionSensorState :: struct {
  accelerometer: sce.FVector3,      //!< Accelerometer data
	gyro: sce.FVector3,               //!< Angular velocity data
	reserved1: [12]c.uint8_t,          //!< Reserved data
	timestamp: c.uint,         //!< Timestamp of the data in microseconds
	counter: c.uint,           //!< Number of requested state
	reserved2: [4]c.uint8_t,           //!< Reserved data
	hostTimestamp: sce.ULong64,       //!< Timestamp of the data in microseconds
	unknown: c.uint8_t,                //!< Unknown
	reserved3: [7]c.uint8_t,           //!< Reserved data
}
#assert(size_of(SceMotionSensorState) == 0x40)

/** Returned location of both the accelerometer and gyroscope in mm
* @note - Axies are fixed with z axis being straight perpendicular through the screen and x axis being parallel to the screen's bottom and top edge
* @note - Direction of the z axis is as if the device were laying on a flat surface, oled/lcd side facing upwards
* @note - OLED models should return the following values:
* @note - Accelerometer: x == -32; y == 12; z == -8
* @note - Gyroscope: x == -33; y == 6; z == -8
* @note - LCD models should return the following values:
* @note - Accelerometer: x == 13; y == 19; z == -8
* @note - Gyroscope: x == 13; y == 19; z == -8
*/
SceMotionDeviceLocation :: struct {
  accelerometer: sce.FVector3,      //!< Location of te accelerometer in relation to the center of the device (in mm)
	gyro: sce.FVector3,               //!< Location of te gyroscope in relation to the center of the device (in mm)
	reserved: [24]c.uint8_t,           //!< Reserved data
}
#assert(size_of(SceMotionDeviceLocation) == 0x30)


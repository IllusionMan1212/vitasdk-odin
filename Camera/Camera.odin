package camera

import "core:c"
import sce "../common"

foreign import camera "SceCamera_stub"

@(link_prefix = "sceCamera")
foreign camera {
	/**
	* Open a camera device.
	*
	* @param[in] devnum - One of ::SceCameraDevice.
	* @param[in] pInfo - Pointer to an already set ::SceCameraInfo struct.
	*
	* @return SCE_OK, <0 on error.
	*/
	Open :: proc(devnum: c.int, pInfo: ^SceCameraInfo) -> c.int ---

	/**
	* Close a camera device.
	*
	* @param[in] devnum - One of ::SceCameraDevice.
	*
	* @return SCE_OK, <0 on error.
	*/
	CameraClose :: proc(devnum: c.int) -> c.int ---

	/**
	* Start camera streaming.
	*
	* @param[in] devnum - One of ::SceCameraDevice.
	*
	* @return SCE_OK, <0 on error.
	*/
	Start :: proc(devnum: c.int) -> c.int ---

	/**
	* Stop camera streaming.
	*
	* @param[in] devnum - One of ::SceCameraDevice.
	*
	* @return SCE_OK, <0 on error.
	*/
	Stop :: proc(devnum: c.int) -> c.int ---

	/**
	* Read image data from current streaming.
	*
	* @param[in] devnum - One of ::SceCameraDevice.
	* @param[in] pRead - Pointer to an already set ::SceCameraRead.
	*
	* @return SCE_OK, <0 on error.
	*/
	Read :: proc(devnum: c.int, pRead: ^SceCameraRead) -> c.int ---

	/**
	* Check if camera device is active.
	*
	* @param[in] devnum - One of ::SceCameraDevice.
	*
	* @return 1 if camera is active, 0 if inactive , <0 on error.
	*/
	IsActive :: proc(devnum: c.int) -> c.int ---

	/**
	* Get camera saturation value.
	*
	* @param[in] devnum - One of ::SceCameraDevice.
	* @param[out] pLevel - Pointer to a variable where to save the result. (See ::SceCameraSaturation)
	*
	* @return SCE_OK , <0 on error.
	*/
	GetSaturation :: proc(devnum: c.int, pLevel: ^c.int) -> c.int ---

	/**
	* Set camera saturation value.
	*
	* @param[in] devnum - One of ::SceCameraDevice.
	* @param[in] level - One of ::SceCameraSaturation.
	*
	* @return SCE_OK , <0 on error.
	*/
	SetSaturation :: proc(devnum: c.int, level: c.int) -> c.int ---

	/**
	* Get camera brightness value.
	*
	* @param[in] devnum - One of ::SceCameraDevice.
	* @param[out] pLevel - Pointer to a variable where to save the result.
	*
	* @return SCE_OK , <0 on error.
	*/
	GetBrightness :: proc(devnum: c.int, pLevel: ^c.int) -> c.int ---

	/**
	* Set camera brightness value.
	*
	* @param[in] devnum - One of ::SceCameraDevice.
	* @param[in] level - Brightness value.
	*
	* @return SCE_OK , <0 on error.
	*
	* @note Brightness value must be between 0 and 255.
	*/
	SetBrightness :: proc(devnum: c.int, level: c.int) -> c.int ---

	/**
	* Get camera contrast value.
	*
	* @param[in] devnum - One of ::SceCameraDevice.
	* @param[out] pLevel - Pointer to a variable where to save the result.
	*
	* @return SCE_OK , <0 on error.
	*/
	GetContrast :: proc(devnum: c.int, pLevel: ^c.int) -> c.int ---

	/**
	* Set camera contrast value.
	*
	* @param[in] devnum - One of ::SceCameraDevice.
	* @param[in] level - Contrast value.
	*
	* @return SCE_OK , <0 on error.
	*
	* @note Contrast value must be between 0 and 255.
	*/
	SetContrast :: proc(devnum: c.int, level: c.int) -> c.int ---

	/**
	* Get camera sharpness value.
	*
	* @param[in] devnum - One of ::SceCameraDevice.
	* @param[out] pLevel - Pointer to a variable where to save the result. (See ::SceCameraSharpness)
	*
	* @return SCE_OK , <0 on error.
	*/
	GetSharpness :: proc(devnum: c.int, pLevel: ^c.int) -> c.int ---

	/**
	* Set camera sharpness value.
	*
	* @param[in] devnum - One of ::SceCameraDevice.
	* @param[in] level - One of ::SceCameraSharpness.
	*
	* @return SCE_OK , <0 on error.
	*/
	SetSharpness :: proc(devnum: c.int, level: c.int) -> c.int ---

	/**
	* Get camera reverse mode.
	*
	* @param[in] devnum - One of ::SceCameraDevice.
	* @param[out] pMode - Pointer to a variable where to save the result. (See ::SceCameraReverse)
	*
	* @return SCE_OK , <0 on error.
	*/
	GetReverse :: proc(devnum: c.int, pMode: ^c.int) -> c.int ---

	/**
	* Set camera reverse mode.
	*
	* @param[in] devnum - One of ::SceCameraDevice.
	* @param[in] mode - One of ::SceCameraReverse.
	*
	* @return SCE_OK , <0 on error.
	*/
	SetReverse :: proc(devnum: c.int, mode: c.int) -> c.int ---

	/**
	* Get active camera effects.
	*
	* @param[in] devnum - One of ::SceCameraDevice.
	* @param[out] pMode - Pointer to a variable where to save the result.
	*
	* @return SCE_OK , <0 on error.
	*/
	GetEffect :: proc(devnum: c.int, pMode: ^c.int) -> c.int ---

	/**
	* Active a camera effect.
	*
	* @param[in] devnum - One of ::SceCameraDevice.
	* @param[in] mode - One of ::SceCameraEffect.
	*
	* @return SCE_OK , <0 on error.
	*/
	SetEffect :: proc(devnum: c.int, mode: c.int) -> c.int ---

	/**
	* Get camera exposure compensation value.
	*
	* @param[in] devnum - One of ::SceCameraDevice.
	* @param[out] pLevel - Pointer to a variable where to save the result (See ::SceCameraExposureCompensation).
	*
	* @return SCE_OK , <0 on error.
	*/
	GetEV :: proc(devnum: c.int, pLevel: ^c.int) -> c.int ---

	/**
	* Set camera exposure compensation value.
	*
	* @param[in] devnum - One of ::SceCameraDevice.
	* @param[in] level - One of ::SceCameraExposureCompensation.
	*
	* @return SCE_OK , <0 on error.
	*/
	SetEV :: proc(devnum: c.int, level: c.int) -> c.int ---

	/**
	* Get camera zoom value.
	*
	* @param[in] devnum - One of ::SceCameraDevice.
	* @param[out] pLevel - Pointer to a variable where to save the result.
	*
	* @return SCE_OK , <0 on error.
	*/
	GetZoom :: proc(devnum: c.int, pLevel: ^c.int) -> c.int ---

	/**
	* Set camera zoom value.
	*
	* @param[in] devnum - One of ::SceCameraDevice.
	* @param[in] level - Camera zoom value.
	*
	* @return SCE_OK , <0 on error.
	*/
	SetZoom :: proc(devnum: c.int, level: c.int) -> c.int ---

	/**
	* Get camera anti-flickering mode.
	*
	* @param[in] devnum - One of ::SceCameraDevice.
	* @param[out] pMode - Pointer to a variable where to save the result. (See ::SceCameraAntiFlicker)
	*
	* @return SCE_OK , <0 on error.
	*/
	GetAntiFlicker :: proc(devnum: c.int, pMode: ^c.int) -> c.int ---

	/**
	* Set camera exposure anti-flickering mode.
	*
	* @param[in] devnum - One of ::SceCameraDevice.
	* @param[in] mode - One of ::SceCameraAntiFlicker.
	*
	* @return SCE_OK , <0 on error.
	*/
	SetAntiFlicker :: proc(devnum: c.int, mode: c.int) -> c.int ---

	/**
	* Get camera ISO speed mode.
	*
	* @param[in] devnum - One of ::SceCameraDevice.
	* @param[out] pMode - Pointer to a variable where to save the result. (See ::SceCameraISO)
	*
	* @return SCE_OK , <0 on error.
	*/
	GetISO :: proc(devnum: c.int, pMode: ^c.int) -> c.int ---

	/**
	* Set camera ISO speed mode.
	*
	* @param[in] devnum - One of ::SceCameraDevice.
	* @param[in] mode - One of ::SceCameraISO.
	*
	* @return SCE_OK , <0 on error.
	*/
	SetISO :: proc(devnum: c.int, mode: c.int) -> c.int ---

	/**
	* Get camera gain mode.
	*
	* @param[in] devnum - One of ::SceCameraDevice.
	* @param[out] pMode - Pointer to a variable where to save the result. (See ::SceCameraGain)
	*
	* @return SCE_OK , <0 on error.
	*/
	GetGain :: proc(devnum: c.int, pMode: ^c.int) -> c.int ---

	/**
	* Set camera gain mode.
	*
	* @param[in] devnum - One of ::SceCameraDevice.
	* @param[in] mode - One of ::SceCameraGain.
	*
	* @return SCE_OK , <0 on error.
	*/
	SetGain :: proc(devnum: c.int, mode: c.int) -> c.int ---

	/**
	* Get camera white balance mode.
	*
	* @param[in] devnum - One of ::SceCameraDevice.
	* @param[out] pMode - Pointer to a variable where to save the result. (See ::SceCameraWhiteBalance)
	*
	* @return SCE_OK , <0 on error.
	*/
	GetWhiteBalance :: proc(devnum: c.int, pMode: ^c.int) -> c.int ---

	/**
	* Set camera white balance mode.
	*
	* @param[in] devnum - One of ::SceCameraDevice.
	* @param[in] mode - One of ::SceCameraWhiteBalance.
	*
	* @return SCE_OK , <0 on error.
	*/
	SetWhiteBalance :: proc(devnum: c.int, mode: c.int) -> c.int ---

	/**
	* Get camera backlight compensation mode.
	*
	* @param[in] devnum - One of ::SceCameraDevice.
	* @param[out] pMode - Pointer to a variable where to save the result. (See ::SceCameraBacklight)
	*
	* @return SCE_OK , <0 on error.
	*/
	GetBacklight :: proc(devnum: c.int, pMode: ^c.int) -> c.int ---

	/**
	* Set camera backlight mode.
	*
	* @param[in] devnum - One of ::SceCameraDevice.
	* @param[in] mode - One of ::SceCameraBacklight.
	*
	* @return SCE_OK , <0 on error.
	*/
	SetBacklight :: proc(devnum: c.int, mode: c.int) -> c.int ---

	/**
	* Get nightmode mode.
	*
	* @param[in] devnum - One of ::SceCameraDevice.
	* @param[out] pMode - Pointer to a variable where to save the result. (See ::SceCameraNightmode)
	*
	* @return SCE_OK , <0 on error.
	*/
	GetNightmode :: proc(devnum: c.int, pMode: ^c.int) -> c.int ---

	/**
	* Set camera nightmoge mode.
	*
	* @param[in] devnum - One of ::SceCameraDevice.
	* @param[in] mode - One of ::SceCameraNightmode.
	*
	* @return SCE_OK , <0 on error.
	*/
	SetNightmode :: proc(devnum: c.int, mode: c.int) -> c.int ---

	/**
	* Get exposure ceiling mode. (?)
	*
	* @param[in] devnum - One of ::SceCameraDevice.
	* @param[out] pMode - Pointer to a variable where to save the result.
	*
	* @return SCE_OK , <0 on error.
	*/
	GetExposureCeiling :: proc(devnum: c.int, pMode: ^c.int) -> c.int ---

	/**
	* Set exposure ceiling mode. (?)
	*
	* @param[in] devnum - One of ::SceCameraDevice.
	* @param[in] mode - Exposure ceiling mode value. (?)
	*
	* @return SCE_OK , <0 on error.
	*/
	SetExposureCeiling :: proc(devnum: c.int, mode: c.int) -> c.int ---

	/**
	* Get auto control hold mode. (?)
	*
	* @param[in] devnum - One of ::SceCameraDevice.
	* @param[out] pMode - Pointer to a variable where to save the result.
	*
	* @return SCE_OK , <0 on error.
	*/
	GetAutoControlHold :: proc(devnum: c.int, pMode: ^c.int) -> c.int ---

	/**
	* Set auto control hold mode. (?)
	*
	* @param[in] devnum - One of ::SceCameraDevice.
	* @param[in] mode - Auto control hold mode value. (?)
	*
	* @return SCE_OK , <0 on error.
	*/
	SetAutoControlHold :: proc(devnum: c.int, mode: c.int) -> c.int ---

	/**
	* Get camera device location. (?)
	*
	* @param[in] devnum - One of ::SceCameraDevice.
	* @param[out] pLocation - Pointer to a variable where to save the result.
	*
	* @return SCE_OK , <0 on error.
	*/

	GetDeviceLocation :: proc(devnum: c.int, pLocation: ^sce.FVector3) -> c.int ---

	GetImageQuality :: proc(devnum: c.int, pLevel: ^c.int) -> c.int ---
	SetImageQuality :: proc(devnum: c.int, level: c.int) -> c.int ---
	GetNoiseReduction :: proc(devnum: c.int, pLevel: ^c.int) -> c.int ---
	SetNoiseReduction :: proc(devnum: c.int, level: c.int) -> c.int ---
	GetSharpnessOff :: proc(devnum: c.int, pLevel: ^c.int) -> c.int ---
	SetSharpnessOff :: proc(devnum: c.int, level: c.int) -> c.int ---
}

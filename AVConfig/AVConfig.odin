package avconfig

import "core:c"

foreign import avconfig "system:SceAVConfig_stub"

/** Color Space Mode values to specify to ::sceAVConfigSetDisplayColorSpaceMode */
SceAVConfigColorSpaceMode :: enum c.int {
	DEFAULT           = 0, //!< Default
	HIGH_CONTRAST     = 1  //!< High Contrast Mode
}

@(link_prefix = "sceAVConfig")
foreign avconfig {
  /**
  * Get the maximum brightness.
  *
  * @param[out] maxBrightness - Maximum brightness.
  *
  * @return 0 on success, < 0 on error.
  */
  GetDisplayMaxBrightness :: proc(maxBrightness: ^c.int) -> c.int ---

  /**
  * Set the screen brightness.
  *
  * @param brightness - Brightness that the screen will be set to (range 21-65536, 0 turns off the screen).
  *
  * @return 0 on success, < 0 on error.
  */
  SetDisplayBrightness :: proc(brightness: c.int) -> c.int ---

  /**
  * Get the shutter volume.
  *
  * @param[out] volume - shutter volume.
  *
  * @return 0 on success, < 0 on error.
  */
  GetShutterVol :: proc(volume: ^c.int) -> c.int ---

  /**
  * Get the system volume.
  *
  * @param[out] volume - System volume.
  *
  * @return 0 on success, < 0 on error.
  */
  GetSystemVol :: proc(volume: ^c.int) -> c.int ---

  /**
  * Set the system volume.
  *
  * @param volume - volume that the device will be set to (range 0-30).
  *
  * @return 0 on success, < 0 on error.
  */
  SetSystemVol :: proc(volume: c.int) -> c.int ---

  /**
  * Turns on mute.
  *
  * @return 0 on success, < 0 on error.
  *
  */
  MuteOn :: proc() -> c.int ---

  /**
  * Sets the color space mode on runtime.
  *
  * @param[in] csm - see ::SceAVConfigColorSpaceMode()
  *
  * @return 0 on success, < 0 on error.
  * @note - This does not change color_space_mode in the registry.
  */
  SetDisplayColorSpaceMode :: proc(csm: c.int) -> c.int ---
}

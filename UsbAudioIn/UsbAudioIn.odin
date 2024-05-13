package usbaudioin

import "core:c"
import sce "../common"

foreign import usbaudioin "system:SceUsbAudioIn_stub"

foreign usbaudioin {
    /**
    * Open usb audio device
    *
    * @return 0 on success, < 0 on error
    *
    * @param[in] device_id - Device id
    * @param[in] bits - Bits per sample. Only 16 allowed
    * @param[in] rate - Bitrate in Hz. Only 48000 allowed
    */
    sceUsbAudioInOpenDevice :: proc(device_id: sce.UInt32, bits: c.int, rate: c.int) -> sce.Int32 ---

    /**
    * Close usb audio device
    *
    * @return 0 on success, < 0 on error
    *
    * @param[in] device_id - Device id
    */
    sceUsbAudioInCloseDevice :: proc(device_id: sce.UInt32) -> sce.Int32 ---

    /**
    * Get available audio usb devices
    *
    * @return 0 on success, < 0 on error
    *
    * @param[out] list - pointer to array of SceUsbAudioInDeviceListItem
    * @param[out] device_count - connected device count
    * @param[in] list_size - number of items in SceUsbAudioInDeviceListItem array
    *
    * @note While function accepts up to 127 as list_size it can only return maximum 7 devices
    */
    sceUsbAudioInGetDeviceIdList :: proc(list: ^SceUsbAudioInDeviceListItem, device_count: ^sce.UInt32, list_size: sce.UInt32) -> sce.Int32 ---

    /**
    * Get usb audio device info
    *
    * @return 0 on success, < 0 on error
    *
    * @param[in] device_id - Device id
    * @param[out] info - pointer to SceUsbAudioInDeviceInfo
    */
    sceUsbAudioInGetDeviceInformation :: proc(device_id: sce.UInt32, info: ^SceUsbAudioInDeviceInfo) -> sce.Int32 ---

    /**
    * Get usb audio device max volume
    *
    * @return 0 on success, < 0 on error
    *
    * @param[in] device_id - Device id
    * @param[out] volume - maximum device volume
    *
    * @note You should OpenDevice first to use this function
    */
    sceUsbAudioInGetMaxValueOfVolume :: proc(device_id: sce.UInt32, volume: ^sce.UInt32) -> sce.Int32 ---

    /**
    * Get usb audio device min volume
    *
    * @return 0 on success, < 0 on error
    *
    * @param[in] device_id - Device id
    * @param[out] volume - minimum device volume
    *
    * @note You should OpenDevice first to use this function
    */
    sceUsbAudioInGetMinValueOfVolume :: proc(device_id: sce.UInt32, volume: ^sce.UInt32) -> sce.Int32 ---

    /**
    * Set usb audio device volume
    *
    * @return 0 on success, < 0 on error
    *
    * @param[in] device_id - Device id
    * @param[in] volume - new device volume
    *
    * @note You should OpenDevice first to use this function
    */
    sceUsbAudioInSetCurrentValueOfVolume :: proc(device_id: sce.UInt32, volume: sce.UInt32) -> sce.Int32 ---

    /**
    * Receive sound data from usb device
    *
    * @return 0 on success, < 0 on error
    *
    * @param[in] device_id - Device id
    * @param[out] buffer - buffer for received data. Should be 0x600 bytes in size.
    *
    * @note You should call OpenDevice first to use this function
    * @note Data is in S16_MONO format. Granularity is 768 (thus buffer is 768*2)
    */
    sceUsbAudioInInput :: proc(device_id: sce.UInt32, buffer: rawptr) -> sce.Int32 ---
}

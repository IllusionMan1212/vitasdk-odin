package audioout

import "core:c"
import sce "../common"

foreign import audioout "system:SceAudio_stub"

foreign audioout {
	/**
	* Initialize audio port
	*
	* @param[in] type - One of ::SceAudioOutPortType
	* @param[in] len - Number of samples, between ::SCE_AUDIO_MIN_LEN and ::SCE_AUDIO_MAX_LEN (multiple of 64)
	* @param[in] freq - Sampling frequency (in Hz), one of the followings :
	* 8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100, 48000
	* @param[in] mode - One of ::SceAudioOutMode
	*
	* @return port number, < 0 on error.
	* @note - The volume is initially set to its max value (::SCE_AUDIO_OUT_MAX_VOL)
	*/
	sceAudioOutOpenPort :: proc(type: SceAudioOutPortType, len: c.int, freq: c.int, mode: SceAudioOutMode) -> c.int ---

	/**
	* Release an audio port
	*
	* @param[in] type - Port number returned by ::sceAudioOutOpenPort
	*
	* @return 0 on success, < 0 on error.
	*/
	sceAudioOutReleasePort :: proc(port: c.int) -> c.int ---

	/**
	* Output audio (blocking function)
	*
	* @param[in] port - Port number returned by ::sceAudioOutOpenPort
	* @param[in] *buf : Pointer to audio data buffer
	*
	* @return 0 on success, < 0 on error.
	* @note - if NULL is specified for *buf, the function will not return until the last
	* output audio data has been output.
	*/
	sceAudioOutOutput :: proc(port: c.int, buf: rawptr) -> c.int ---

	/**
	* Set volume of specified output audio port
	*
	* @param[in] port - Port number returned by ::sceAudioOutOpenPort
	* @param[in] ch - Channel numbers as flags (see ::SceAudioOutChannelFlag)
	* @param[in] *vol - Array to int specifying volume for each channel (Left channel first for stereo)
	*
	* @return 0 on success, < 0 on error.
	*/
	sceAudioOutSetVolume :: proc(port: c.int, ch: SceAudioOutChannelFlag, vol: ^c.int) -> c.int ---

	/**
	* Change configuration of specified output port
	*
	* @param[in] port - Port number returned by ::sceAudioOutOpenPort
	* @param[in] len - see ::sceAudioOutOpenPort()
	* @param[in] freq - see ::sceAudioOutOpenPort()
	* @param[in] mode - see ::sceAudioOutOpenPort()
	*
	* @return 0 on success, < 0 on error.
	* @note - If (-1) is specified for any argument (excepted for port), current configuration is used instead.
	*/
	sceAudioOutSetConfig :: proc(port: c.int, len: sce.Size, freq: c.int, mode: SceAudioOutMode) -> c.int ---

	/**
	* Get a parameter value of specified output port
	*
	* @param[in] port - Port number returned by ::sceAudioOutOpenPort
	* @param[in] type - One of ::SceAudioOutConfigType
	*
	* @return 0 on success, < 0 on error.
	*/
	sceAudioOutGetConfig :: proc(port: c.int, type: SceAudioOutConfigType) -> c.int ---

	/**
	* Set 'Automatic Level Control' mode on the BGM port
	* ALC is also known as 'Dynamic Normalizer'
	*
	* @param[in] mode - One of ::SceAudioOutAlcMode
	*
	* @return 0 on success, < 0 on error.
	*/
	sceAudioOutSetAlcMode :: proc(mode: SceAudioOutAlcMode) -> c.int ---

	/**
	* Get the number of remaining samples to be output on the specified port
	*
	* @param[in] port - Port number returned by ::sceAudioOutOpenPort
	*
	* @return Number of samples on success, < 0 on error.
	*/
	sceAudioOutGetRestSample :: proc(port: c.int) -> c.int ---

	/**
	* Get status of port type
	* Return different value on whether the port type is used for sound generation or not.
	*
	* @param[in] type - One of ::SceAudioOutPortType
	*
	* @return (1) if port is in use, (0) otherwise. < 0 on error.
	*/
	sceAudioOutGetAdopt :: proc(type: SceAudioOutPortType) -> c.int ---
}

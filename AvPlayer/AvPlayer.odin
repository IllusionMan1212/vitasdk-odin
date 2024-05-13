package avplayer

import "core:c"
import sce "../common"

foreign import avplayer "system:SceAvPlayer_stub"

foreign avplayer {
	/**
	* @param[in] data - Init data for the video player
	*
	* @return The video player handle on success, < 0 on error.
	*/
	sceAvPlayerInit :: proc(data: ^SceAvPlayerInitData) -> SceAvPlayerHandle ---

	/**
	* @param[in] handle - A player handle created with ::sceAvPlayerInit
	*
	* @return 0 on success, < 0 on error.
	*/
	sceAvPlayerPause :: proc(handle: SceAvPlayerHandle) -> c.int ---

	/**
	* @param[in] handle - A player handle created with ::sceAvPlayerInit
	*
	* @return 0 on success, < 0 on error.
	*/
	sceAvPlayerResume :: proc(handle: SceAvPlayerHandle) -> c.int ---

	/**
	* @param[in] handle - A player handle created with ::sceAvPlayerInit
	*
	* @return 0 on success, < 0 on error.
	*/
	sceAvPlayerStart :: proc(handle: SceAvPlayerHandle) -> c.int ---

	/**
	* @param[in] handle - A player handle created with ::sceAvPlayerInit
	*
	* @return 0 on success, < 0 on error.
	*/
	sceAvPlayerStop :: proc(handle: SceAvPlayerHandle) -> c.int ---

	/**
	* @param[in] handle - A player handle created with ::sceAvPlayerInit
	* @param[in] looping - A flag indicating whether the video playback should loop
	*
	* @return 0 on success, < 0 on error.
	*/
	sceAvPlayerSetLooping :: proc(handle: SceAvPlayerHandle, looping: sce.Bool) -> c.int ---

	/**
	* @param[in] handle - A player handle created with ::sceAvPlayerInit
	*
	* @return SCE_TRUE if the video playback is active, SCE_FALSE otherwise.
	*/
	sceAvPlayerIsActive :: proc(handle: SceAvPlayerHandle) -> sce.Bool ---

	/**
	* @param[in] handle - A player handle created with ::sceAvPlayerInit
	* @param[in] filename - Full path to the file to play
	*
	* @return 0 on success, < 0 on error.
	*/
	sceAvPlayerAddSource :: proc(handle: SceAvPlayerHandle, filename: cstring) -> c.int ---

	/**
	* @param[in] handle - A player handle created with ::sceAvPlayerInit
	*
	* @return 0 on success, < 0 on error.
	*/
	sceAvPlayerClose :: proc(handle: SceAvPlayerHandle) -> c.int ---

	/**
	* @param[in] handle - A player handle created with ::sceAvPlayerInit
	* @param[out] info - Descriptor for the received data
	*
	* @return SCE_TRUE if new data is available, SCE_FALSE otherwise.
	*/
	sceAvPlayerGetAudioData :: proc(handle: SceAvPlayerHandle, info: ^SceAvPlayerFrameInfo) -> sce.Bool ---

	/**
	* @param[in] handle - A player handle created with ::sceAvPlayerInit
	* @param[out] info - Descriptor for the received data
	*
	* @return SCE_TRUE if new data is available, SCE_FALSE otherwise.
	*/
	sceAvPlayerGetVideoData :: proc(handle: SceAvPlayerHandle, info: ^SceAvPlayerFrameInfo) -> sce.Bool ---

	/**
	* @param[in] handle - A player handle created with ::sceAvPlayerInit
	*
	* @return Current time on the video playback in milliseconds.
	*/
	sceAvPlayerCurrentTime :: proc(handle: SceAvPlayerHandle) -> c.uint64_t ---

	/**
	* @param[in] handle - A player handle created with ::sceAvPlayerInit
	* @param[in] offset - Offset to jump to on the video playback in milliseconds.
	*
	* @return 0 on success, < 0 on error.
	*/
	sceAvPlayerJumpToTime :: proc(handle: SceAvPlayerHandle, offset: c.uint64_t) -> c.int ---

	/**
	* @param[in] handle - A player handle created with ::sceAvPlayerInit
	* @param[in] offset - One of ::SceAvPlayerTrickSpeeds.
	*
	* @return 0 on success, < 0 on error.
	*/
	sceAvPlayerSetTrickSpeed :: proc(handle: SceAvPlayerHandle, speed: c.int) -> c.int ---

	/**
	* @param[in] handle - A player handle created with ::sceAvPlayerInit
	* @param[in] id - Stream ID to get info for.
	* @param[out] info - Info retrieved for the requested stream.
	*
	* @return 0 on success, < 0 on error.
	*/
	sceAvPlayerGetStreamInfo :: proc(handle: SceAvPlayerHandle, id: c.uint32_t, info: ^SceAvPlayerStreamInfo) -> c.int ---
}

package avplayer

import "core:c"
import sce "../common"

foreign import avplayer "system:SceAvPlayer_stub"

@(link_prefix = "sceAvPlayer")
foreign avplayer {
	/**
	* @param[in] data - Init data for the video player
	*
	* @return The video player handle on success, < 0 on error.
	*/
	Init :: proc(data: ^SceAvPlayerInitData) -> SceAvPlayerHandle ---

	/**
	* @param[in] handle - A player handle created with ::sceAvPlayerInit
	*
	* @return 0 on success, < 0 on error.
	*/
	Pause :: proc(handle: SceAvPlayerHandle) -> c.int ---

	/**
	* @param[in] handle - A player handle created with ::sceAvPlayerInit
	*
	* @return 0 on success, < 0 on error.
	*/
	Resume :: proc(handle: SceAvPlayerHandle) -> c.int ---

	/**
	* @param[in] handle - A player handle created with ::sceAvPlayerInit
	*
	* @return 0 on success, < 0 on error.
	*/
	Start :: proc(handle: SceAvPlayerHandle) -> c.int ---

	/**
	* @param[in] handle - A player handle created with ::sceAvPlayerInit
	*
	* @return 0 on success, < 0 on error.
	*/
	Stop :: proc(handle: SceAvPlayerHandle) -> c.int ---

	/**
	* @param[in] handle - A player handle created with ::sceAvPlayerInit
	* @param[in] looping - A flag indicating whether the video playback should loop
	*
	* @return 0 on success, < 0 on error.
	*/
	SetLooping :: proc(handle: SceAvPlayerHandle, looping: sce.Bool) -> c.int ---

	/**
	* @param[in] handle - A player handle created with ::sceAvPlayerInit
	*
	* @return SCE_TRUE if the video playback is active, SCE_FALSE otherwise.
	*/
	IsActive :: proc(handle: SceAvPlayerHandle) -> sce.Bool ---

	/**
	* @param[in] handle - A player handle created with ::sceAvPlayerInit
	* @param[in] filename - Full path to the file to play
	*
	* @return 0 on success, < 0 on error.
	*/
	AddSource :: proc(handle: SceAvPlayerHandle, filename: cstring) -> c.int ---

	/**
	* @param[in] handle - A player handle created with ::sceAvPlayerInit
	*
	* @return 0 on success, < 0 on error.
	*/
	Close :: proc(handle: SceAvPlayerHandle) -> c.int ---

	/**
	* @param[in] handle - A player handle created with ::sceAvPlayerInit
	* @param[out] info - Descriptor for the received data
	*
	* @return SCE_TRUE if new data is available, SCE_FALSE otherwise.
	*/
	GetAudioData :: proc(handle: SceAvPlayerHandle, info: ^SceAvPlayerFrameInfo) -> sce.Bool ---

	/**
	* @param[in] handle - A player handle created with ::sceAvPlayerInit
	* @param[out] info - Descriptor for the received data
	*
	* @return SCE_TRUE if new data is available, SCE_FALSE otherwise.
	*/
	GetVideoData :: proc(handle: SceAvPlayerHandle, info: ^SceAvPlayerFrameInfo) -> sce.Bool ---

	/**
	* @param[in] handle - A player handle created with ::sceAvPlayerInit
	*
	* @return Current time on the video playback in milliseconds.
	*/
	CurrentTime :: proc(handle: SceAvPlayerHandle) -> c.uint64_t ---

	/**
	* @param[in] handle - A player handle created with ::sceAvPlayerInit
	* @param[in] offset - Offset to jump to on the video playback in milliseconds.
	*
	* @return 0 on success, < 0 on error.
	*/
	JumpToTime :: proc(handle: SceAvPlayerHandle, offset: c.uint64_t) -> c.int ---

	/**
	* @param[in] handle - A player handle created with ::sceAvPlayerInit
	* @param[in] offset - One of ::SceAvPlayerTrickSpeeds.
	*
	* @return 0 on success, < 0 on error.
	*/
	SetTrickSpeed :: proc(handle: SceAvPlayerHandle, speed: c.int) -> c.int ---

	/**
	* @param[in] handle - A player handle created with ::sceAvPlayerInit
	* @param[in] id - Stream ID to get info for.
	* @param[out] info - Info retrieved for the requested stream.
	*
	* @return 0 on success, < 0 on error.
	*/
	GetStreamInfo :: proc(handle: SceAvPlayerHandle, id: c.uint32_t, info: ^SceAvPlayerStreamInfo) -> c.int ---
}

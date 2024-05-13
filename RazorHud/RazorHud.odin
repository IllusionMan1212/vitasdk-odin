package razorhud

import "core:c"
import sce "../common"

foreign import razorhud "system:SceRazorHud_stub"

foreign razorhud {
	/**
	* Sets a metrics group to use for gpu live debugging
	*
	* @param[in] metrics - The metrics group to use (One of ::SceRazorGpuLiveMetricsGroup)
	*
	* @return 0, <0 on error.
	*/
	sceRazorGpuLiveSetMetricsGroup :: proc(metrics: c.uint32_t) -> c.int ---

	/**
	* Sets the buffer in which to store gpu live debugging results for the current frame
	*
	* @param[in] buffer - The buffer to use
	* @param[in] buf_size - The buffer size in bytes
	* @param[out] results - The debugging results of the previous frame
	*
	* @return 0, <0 on error.
	*/
	sceRazorGpuLiveSetBuffer :: proc(buffer: rawptr, buf_size: sce.Size, results: ^SceRazorGpuLiveResultInfo) -> c.int ---

	/**
	* Starts gpu live debugging
	*
	* @return 0, <0 on error.
	*/
	sceRazorGpuLiveStart :: proc() -> c.int ---

	/**
	* Stops gpu live debugging
	*
	* @return 0, <0 on error.
	*/
	sceRazorGpuLiveStop :: proc() -> c.int ---
}

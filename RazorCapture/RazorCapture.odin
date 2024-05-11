package razorcapture

import "core:c"

foreign import razorcapture "system:SceRazorCapture_stub"

@(link_prefix = "sceRazorGpuCapture")
foreign razorcapture {
  /**
  * Sets a trigger for a gpu capture in next frame from Razor debugger
  *
  * @param[in] filename - Filename of the file where to save capture results
  */
  SetTriggerNextFrame :: proc(filename: cstring) ---

  /**
  * Enables collecting of GPU captures when a gpucrash happens
  *
  * @param[in] filename - Filename of the file where to save capture results
  */
  EnableSalvage :: proc(filename: cstring) ---
}

package shellsvc

import "core:c"

foreign import shellsvc "system:SceShellSvc_stub"

@(link_prefix = "sceShellUtil")
foreign shellsvc {
  /**
  * Init events
  *
  * @param[in] unk - Unknown, use 0
  *
  * @return 0 on success, < 0 on error.
  */
  InitEvents :: proc(unk: c.int) -> c.int ---

  /**
  * Register event handler
  *
  * @param[in] handler - Event handler
  *
  * @param[in] userData - The user data passed to the handler
  *
  * @return 0 on success, < 0 on error.
  */
  RegisterEventHandler :: proc(handler: ^SceShellUtilEventHandler, userData: rawptr) -> c.int ---

  /**
  * Lock event
  *
  * @param[in] type - One of ::SceShellUtilLockType
  *
  * @return 0 on success, < 0 on error.
  */
  Lock :: proc(type: SceShellUtilLockType) -> c.int ---

  /**
  * Unlock event
  *
  * @param[in] type - One of ::SceShellUtilLockType
  *
  * @return 0 on success, < 0 on error.
  */
  Unlock :: proc(type: SceShellUtilLockType) -> c.int ---


  RequestLaunchApp :: proc(param: ^SceShellUtilLaunchAppParam) -> c.int ---
  LaunchAppRequestLaunchApp :: proc(param: ^SceShellUtilLaunchAppParam) -> c.int ---
}

package netctl

import "core:c"

foreign import netctl "system:SceNetCtl_stub"

foreign netctl {
	sceNetCtlInit :: proc() -> c.int ---
	sceNetCtlTerm :: proc() ---

	sceNetCtlCheckCallback :: proc() -> c.int ---

	sceNetCtlInetGetResult :: proc(eventType: c.int, errorCode: ^c.int) -> c.int ---
	sceNetCtlAdhocGetResult :: proc(eventType: c.int, errorCode: ^c.int) -> c.int ---

	sceNetCtlInetGetInfo :: proc(code: c.int, info: ^SceNetCtlInfo) -> c.int ---
	sceNetCtlInetGetState :: proc(state: ^c.int) -> c.int ---
	sceNetCtlGetNatInfo :: proc(natinfo: ^SceNetCtlNatInfo) -> c.int ---

	sceNetCtlInetRegisterCallback :: proc(func: SceNetCtlCallback, arg: rawptr, cid: ^c.int) -> c.int ---
	sceNetCtlInetUnregisterCallback :: proc(cid: c.int) -> c.int ---

	sceNetCtlAdhocRegisterCallback :: proc(func: SceNetCtlCallback, arg: rawptr, cid: ^c.int) -> c.int ---
	sceNetCtlAdhocUnregisterCallback :: proc(cid: c.int) -> c.int ---
	sceNetCtlAdhocGetState :: proc(state: ^c.int) -> c.int ---
	sceNetCtlAdhocDisconnect :: proc() -> c.int ---
	sceNetCtlAdhocGetPeerList :: proc(buflen: ^c.uint, buf: rawptr) -> c.int ---
	sceNetCtlAdhocGetInAddr :: proc(inaddr: ^SceNetInAddr) -> c.int ---
}

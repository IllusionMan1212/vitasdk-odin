package netctl

import "core:c"

foreign import netctl "system:SceNetCtl_stub"

@(link_prefix = "SceNetCtl")
foreign netctl {
	Init :: proc() -> c.int ---
	Term :: proc() ---

	CheckCallback :: proc() -> c.int ---

	InetGetResult :: proc(eventType: c.int, errorCode: ^c.int) -> c.int ---
	AdhocGetResult :: proc(eventType: c.int, errorCode: ^c.int) -> c.int ---

	InetGetInfo :: proc(code: c.int, info: ^SceNetCtlInfo) -> c.int ---
	InetGetState :: proc(state: ^c.int) -> c.int ---
	GetNatInfo :: proc(natinfo: ^SceNetCtlNatInfo) -> c.int ---

	InetRegisterCallback :: proc(func: SceNetCtlCallback, arg: rawptr, cid: ^c.int) -> c.int ---
	InetUnregisterCallback :: proc(cid: c.int) -> c.int ---

	AdhocRegisterCallback :: proc(func: SceNetCtlCallback, arg: rawptr, cid: ^c.int) -> c.int ---
	AdhocUnregisterCallback :: proc(cid: c.int) -> c.int ---
	AdhocGetState :: proc(state: ^c.int) -> c.int ---
	AdhocDisconnect :: proc() -> c.int ---
	AdhocGetPeerList :: proc(buflen: ^c.uint, buf: rawptr) -> c.int ---
	AdhocGetInAddr :: proc(inaddr: ^SceNetInAddr) -> c.int ---
}

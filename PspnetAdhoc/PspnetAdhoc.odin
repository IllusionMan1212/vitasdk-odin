package pspnetadhoc

import "core:c"
import sce "../common"
import sceNet "../Net"

foreign import pspnetadhoc "system:ScePspnetAdhoc_stub"

@(link_prefix = "sceNetAdhoc")
foreign pspnetadhoc {
	Init :: proc() -> c.int ---
	Term :: proc() -> c.int ---

	PollSocket :: proc(sds: ^SceNetAdhocPollSd, nsds: c.int, timeout: c.uint, flag: c.int) -> c.int ---
	SetSocketAlert :: proc(id: c.int, flag: c.int) -> c.int ---
	GetSocketAlert :: proc(id: c.int, flag: ^c.int) -> c.int ---

	PdpCreate :: proc(#by_ptr saddr: sceNet.SceNetEtherAddr, sport: sce.UShort16, bufsize: c.uint, flag: c.int) -> c.int ---
	PdpSend :: proc(id: c.int, #by_ptr daddr: sceNet.SceNetEtherAddr, dport: sce.UShort16, data: rawptr, len: c.int, timeout: c.uint, flag: c.int) -> c.int ---
	PdpRecv :: proc(id: c.int, saddr: ^sceNet.SceNetEtherAddr, sport: ^sce.UShort16, buf: rawptr, len: ^c.int, timeout: c.uint, flag: c.int) -> c.int ---
	PdpDelete :: proc(id: c.int, flag: c.int) -> c.int ---
	GetPdpStat :: proc(buflen: ^c.int, buf: rawptr) -> c.int ---

	PtpOpen :: proc(#by_ptr saddr: sceNet.SceNetEtherAddr, sport: sce.UShort16, #by_ptr daddr: sceNet.SceNetEtherAddr, dport: sce.UShort16, bufsize: c.uint, rexmt_int: c.uint, rexmt_cnt: c.int, flag: c.int) -> c.int ---
	PtpConnect :: proc(id: c.int, timeout: c.uint, flag: c.int) -> c.int ---
	PtpListen :: proc(#by_ptr saddr: sceNet.SceNetEtherAddr, sport: sce.UShort16, bufsize: c.uint, rexmt_int: c.uint, rexmt_cnt: c.int, backlog: c.int, flag: c.int) -> c.int ---
	PtpAccept :: proc(id: c.int, addr: ^sceNet.SceNetEtherAddr, port: ^sce.UShort16, timeout: c.uint, flag: c.int) -> c.int ---
	PtpSend :: proc(id: c.int, data: rawptr, len: ^c.int, timeout: c.uint, flag: c.int) -> c.int ---
	PtpRecv :: proc(id: c.int, buf: rawptr, len: ^c.int, timeout: c.uint, flag: c.int) -> c.int ---
	PtpFlush :: proc(id: c.int, timeout: c.uint, flag: c.int) -> c.int ---
	PtpClose :: proc(id: c.int, flag: c.int)  -> c.int ---
	GetPtpStat :: proc(buflen: ^c.int, buf: rawptr) -> c.int ---

	ctlInit :: proc(#by_ptr adhocId: SceNetAdhocctlAdhocId) -> c.int ---
	ctlTerm :: proc() -> c.int ---
	ctlGetAdhocId :: proc(adhocId: ^SceNetAdhocctlAdhocId) -> c.int ---
	ctlGetPeerList :: proc(buflen: ^c.int, buf: rawptr) -> c.int ---
	ctlGetPeerInfo :: proc(#by_ptr addr: sceNet.SceNetEtherAddr, size: c.int, peerInfo: ^SceNetAdhocctlPeerInfo) -> c.int ---
	ctlGetAddrByName :: proc(#by_ptr nickname: SceNetAdhocctlNickname, buflen: ^c.int, buf: rawptr) -> c.int ---
	ctlGetNameByAddr :: proc(#by_ptr addr: sceNet.SceNetEtherAddr, nickname: ^SceNetAdhocctlNickname) -> c.int ---
	ctlGetParameter :: proc(parameter: ^SceNetAdhocctlParameter) -> c.int ---
	ctlGetEtherAddr :: proc(addr: ^sceNet.SceNetEtherAddr) -> c.int ---
}

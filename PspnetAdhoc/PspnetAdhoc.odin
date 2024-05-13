package pspnetadhoc

import "core:c"
import sce "../common"
import sceNet "../Net"

foreign import pspnetadhoc "system:ScePspnetAdhoc_stub"

foreign pspnetadhoc {
	sceNetAdhocInit :: proc() -> c.int ---
	sceNetAdhocTerm :: proc() -> c.int ---

	sceNetAdhocPollSocket :: proc(sds: ^SceNetAdhocPollSd, nsds: c.int, timeout: c.uint, flag: c.int) -> c.int ---
	sceNetAdhocSetSocketAlert :: proc(id: c.int, flag: c.int) -> c.int ---
	sceNetAdhocGetSocketAlert :: proc(id: c.int, flag: ^c.int) -> c.int ---

	sceNetAdhocPdpCreate :: proc(#by_ptr saddr: sceNet.SceNetEtherAddr, sport: sce.UShort16, bufsize: c.uint, flag: c.int) -> c.int ---
	sceNetAdhocPdpSend :: proc(id: c.int, #by_ptr daddr: sceNet.SceNetEtherAddr, dport: sce.UShort16, data: rawptr, len: c.int, timeout: c.uint, flag: c.int) -> c.int ---
	sceNetAdhocPdpRecv :: proc(id: c.int, saddr: ^sceNet.SceNetEtherAddr, sport: ^sce.UShort16, buf: rawptr, len: ^c.int, timeout: c.uint, flag: c.int) -> c.int ---
	sceNetAdhocPdpDelete :: proc(id: c.int, flag: c.int) -> c.int ---
	sceNetAdhocGetPdpStat :: proc(buflen: ^c.int, buf: rawptr) -> c.int ---

	sceNetAdhocPtpOpen :: proc(#by_ptr saddr: sceNet.SceNetEtherAddr, sport: sce.UShort16, #by_ptr daddr: sceNet.SceNetEtherAddr, dport: sce.UShort16, bufsize: c.uint, rexmt_int: c.uint, rexmt_cnt: c.int, flag: c.int) -> c.int ---
	sceNetAdhocPtpConnect :: proc(id: c.int, timeout: c.uint, flag: c.int) -> c.int ---
	sceNetAdhocPtpListen :: proc(#by_ptr saddr: sceNet.SceNetEtherAddr, sport: sce.UShort16, bufsize: c.uint, rexmt_int: c.uint, rexmt_cnt: c.int, backlog: c.int, flag: c.int) -> c.int ---
	sceNetAdhocPtpAccept :: proc(id: c.int, addr: ^sceNet.SceNetEtherAddr, port: ^sce.UShort16, timeout: c.uint, flag: c.int) -> c.int ---
	sceNetAdhocPtpSend :: proc(id: c.int, data: rawptr, len: ^c.int, timeout: c.uint, flag: c.int) -> c.int ---
	sceNetAdhocPtpRecv :: proc(id: c.int, buf: rawptr, len: ^c.int, timeout: c.uint, flag: c.int) -> c.int ---
	sceNetAdhocPtpFlush :: proc(id: c.int, timeout: c.uint, flag: c.int) -> c.int ---
	sceNetAdhocPtpClose :: proc(id: c.int, flag: c.int)  -> c.int ---
	sceNetAdhocGetPtpStat :: proc(buflen: ^c.int, buf: rawptr) -> c.int ---

	sceNetAdhocctlInit :: proc(#by_ptr adhocId: SceNetAdhocctlAdhocId) -> c.int ---
	sceNetAdhocctlTerm :: proc() -> c.int ---
	sceNetAdhocctlGetAdhocId :: proc(adhocId: ^SceNetAdhocctlAdhocId) -> c.int ---
	sceNetAdhocctlGetPeerList :: proc(buflen: ^c.int, buf: rawptr) -> c.int ---
	sceNetAdhocctlGetPeerInfo :: proc(#by_ptr addr: sceNet.SceNetEtherAddr, size: c.int, peerInfo: ^SceNetAdhocctlPeerInfo) -> c.int ---
	sceNetAdhocctlGetAddrByName :: proc(#by_ptr nickname: SceNetAdhocctlNickname, buflen: ^c.int, buf: rawptr) -> c.int ---
	sceNetAdhocctlGetNameByAddr :: proc(#by_ptr addr: sceNet.SceNetEtherAddr, nickname: ^SceNetAdhocctlNickname) -> c.int ---
	sceNetAdhocctlGetParameter :: proc(parameter: ^SceNetAdhocctlParameter) -> c.int ---
	sceNetAdhocctlGetEtherAddr :: proc(addr: ^sceNet.SceNetEtherAddr) -> c.int ---
}

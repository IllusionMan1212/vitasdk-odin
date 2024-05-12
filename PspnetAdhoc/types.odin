package pspnetadhoc

import "core:c"
import sce "../common"
import sceNet "../Net"

SCE_NET_ADHOC_PDP_MFS  :: 1444
SCE_NET_ADHOC_PDP_MTU  :: 65523
SCE_NET_ADHOC_PTP_MSS  :: 1444
SCE_NET_ADHOCCTL_ADHOCID_LEN :: 9
SCE_NET_ADHOCCTL_GROUPNAME_LEN :: 8
SCE_NET_ADHOCCTL_NICKNAME_LEN :: 128
SCE_NET_ADHOCCTL_BSSID_LEN  :: 6

ScePspnetAdhocErrorCode :: enum c.uint {
	INVALID_SOCKET_ID      = 0x80410701,
	INVALID_ADDR           = 0x80410702,
	INVALID_PORT           = 0x80410703,
	INVALID_BUFLEN         = 0x80410704,
	INVALID_DATALEN        = 0x80410705,
	NOT_ENOUGH_SPACE       = 0x80410706,
	SOCKET_DELETED         = 0x80410707,
	SOCKET_ALERTED         = 0x80410708,
	WOULD_BLOCK            = 0x80410709,
	PORT_IN_USE            = 0x8041070A,
	NOT_CONNECTED          = 0x8041070B,
	DISCONNECTED           = 0x8041070C,
	NOT_OPENED             = 0x8041070D,
	NOT_LISTENED           = 0x8041070E,
	SOCKET_ID_NOT_AVAIL    = 0x8041070F,
	PORT_NOT_AVAIL         = 0x80410710,
	INVALID_ARG            = 0x80410711,
	NOT_INITIALIZED        = 0x80410712,
	ALREADY_INITIALIZED    = 0x80410713,
	BUSY                   = 0x80410714,
	TIMEOUT                = 0x80410715,
	NO_ENTRY               = 0x80410716,
	EXCEPTION_EVENT        = 0x80410717,
	CONNECTION_REFUSED     = 0x80410718,
	THREAD_ABORTED         = 0x80410719,
	ALREADY_CREATED        = 0x8041071A,
	NOT_IN_GAMEMODE        = 0x8041071B,
	NOT_CREATED            = 0x8041071C,
	INVALID_ALIGNMENT      = 0x8041071D,
}

SceNetAdhocPollSd :: struct {
  id: c.int,
	events: c.int,
	revents: c.int,
}
#assert(size_of(SceNetAdhocPollSd) == 0xC)

ScePspnetAdhocEvent :: enum c.int {
	SEND        = 0x0001,
	RECV        = 0x0002,
	CONNECT     = 0x0004,
	ACCEPT      = 0x0008,
	FLUSH       = 0x0010,
	INVALID     = 0x0100,
	DELETE      = 0x0200,
	ALERT       = 0x0400,
	DISCONNECT  = 0x0800,
}

SceNetAdhocPdpStat :: struct {
	next: ^SceNetAdhocPdpStat,
	id: c.int,
	laddr: sceNet.SceNetEtherAddr,
	lport: sce.UShort16,
	rcv_sb_cc: c.uint,
}
when size_of(rawptr) == 4 {
	#assert(size_of(SceNetAdhocPdpStat) == 0x14)
}

ScePspnetAdhocPtpState :: enum c.int {
	CLOSED       = 0,
	LISTEN       = 1,
	SYN_SENT     = 2,
	SYN_RCVD     = 3,
	ESTABLISHED  = 4,
}

SceNetAdhocPtpStat :: struct {
	next: ^SceNetAdhocPtpStat,
	id: c.int,
	laddr: sceNet.SceNetEtherAddr,
	paddr: sceNet.SceNetEtherAddr,
	lport: sce.UShort16,
	pport: sce.UShort16,
	snd_sb_cc: c.uint,
	rcv_sb_cc: c.uint,
	state: c.int,
}

ScePspnetAdhocFlags :: enum c.int {
	NONBLOCK      = 0x0001,
	ALERTSEND     = 0x0010,
	ALERTRECV     = 0x0020,
	ALERTPOLL     = 0x0040,
	ALERTCONNECT  = 0x0080,
	ALERTACCEPT   = 0x0100,
	ALERTFLUSH    = 0x0200,
  ALERTALL = ALERTSEND | ALERTRECV | ALERTPOLL | ALERTCONNECT | ALERTACCEPT | ALERTFLUSH,
}

ScePspnetAdhocctlErrorCode :: enum c.uint {
	INVALID_ARG             = 0x80410B04,
	ALREADY_INITIALIZED     = 0x80410B07,
	NOT_INITIALIZED         = 0x80410B08,
}

ScePspnetAdhocctlAdhocType :: enum c.int {
	PRODUCT_ID  = 0,
	RESERVED    = 1,
	SYSTEM      = 2
}

SceNetAdhocctlAdhocId :: struct {
  type: c.int,
	data: [SCE_NET_ADHOCCTL_ADHOCID_LEN]sce.Char8,
	padding: [3]sce.UChar8,
}
#assert(size_of(SceNetAdhocctlAdhocId) == 0x10)

SceNetAdhocctlGroupName :: struct {
  data: [SCE_NET_ADHOCCTL_GROUPNAME_LEN]sce.Char8,
}
#assert(size_of(SceNetAdhocctlGroupName) == 8)

SceNetAdhocctlNickname :: struct {
  data: [SCE_NET_ADHOCCTL_NICKNAME_LEN]sce.Char8,
}
#assert(size_of(SceNetAdhocctlNickname) == 0x80)

SceNetAdhocctlPeerInfo :: struct {
	next: ^SceNetAdhocctlPeerInfo,
	nickname: SceNetAdhocctlNickname,
	macAddr: sceNet.SceNetEtherAddr,
	padding: [6]sce.UChar8,
	lastRecv: sce.UInt64,
}
when size_of(rawptr) == 4 {
	#assert(size_of(SceNetAdhocctlPeerInfo) == 0x98)
}

SceNetAdhocctlBSSId :: struct {
  data: [SCE_NET_ADHOCCTL_BSSID_LEN]sce.UChar8,
	padding: [2]sce.UChar8,
}
#assert(size_of(SceNetAdhocctlBSSId) == 8)

SceNetAdhocctlParameter :: struct {
  channel: c.int,
	groupName: SceNetAdhocctlGroupName,
	nickname: SceNetAdhocctlNickname,
	bssid: SceNetAdhocctlBSSId,
}
#assert(size_of(SceNetAdhocctlParameter) == 0x94)


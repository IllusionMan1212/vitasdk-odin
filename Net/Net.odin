package net

import "core:c"
foreign import net "system:SceNet_stub"
foreign import netps "system:SceNetPsForDriver_stub"

foreign net {
    sceNetInit :: proc(param: ^SceNetInitParam) -> c.int ---
    sceNetTerm :: proc() -> c.int ---

    sceNetShowIfconfig :: proc(p: rawptr, b: c.int) -> c.int ---
    sceNetShowRoute :: proc() -> c.int ---
    sceNetShowNetstat :: proc() -> c.int ---

    sceNetEmulationSet :: proc(param: ^SceNetEmulationParam, flags: SceNetEmulationFlag) -> c.int ---
    sceNetEmulationGet :: proc(param: ^SceNetEmulationParam, flags: SceNetEmulationFlag) -> c.int ---

    // flags is always 0
    sceNetResolverCreate :: proc(name: cstring, param: ^SceNetResolverParam, flags: c.int) -> c.int ---
    sceNetResolverStartNtoa :: proc(rid: c.int, hostname: cstring, addr: ^SceNetInAddr, timeout: c.int, retry: c.int, flags: SceNetResolverFlag) -> c.int ---
    sceNetResolverStartAton :: proc(rid: c.int, addr: ^SceNetInAddr, hostname: cstring, len: c.int, timeout: c.int, retry: c.int, flags: SceNetResolverFlag) -> c.int ---
    sceNetResolverGetError :: proc(rid: c.int, result: ^c.int) -> SceNetResolverErrorCode ---
    sceNetResolverDestroy :: proc(rid: c.int) -> c.int ---
    sceNetResolverAbort :: proc(rid: c.int, flags: SceNetResolverAbortFlag) -> c.int ---

    // flags is always 0
    sceNetDumpCreate :: proc(name: cstring, len: c.int, flags: c.int) -> c.int ---
    sceNetDumpRead :: proc(id: c.int, buf: rawptr, len: c.int, pflags: ^SceNetDumpReadFlag) -> c.int ---
    sceNetDumpDestroy :: proc(id: c.int) -> c.int ---
    sceNetDumpAbort :: proc(id: c.int, flags: SceNetDumpAbortFlag) -> c.int ---
    // flags is always 0
    sceNetEpollCreate :: proc(name: cstring, flags: c.int) -> c.int ---
    sceNetEpollControl :: proc(eid: c.int, op: SceNetEpollControlFlag, id: c.int, event: ^SceNetEpollEvent) -> c.int ---
    sceNetEpollWait :: proc(eid: c.int, events: ^SceNetEpollEvent, maxevents: c.int, timeout: c.int) -> c.int ---
    sceNetEpollWaitCB :: proc(eid: c.int, events: ^SceNetEpollEvent, maxevents: c.int, timeout: c.int) -> c.int ---
    sceNetEpollDestroy :: proc(eid: c.int) -> c.int ---
    sceNetEpollAbort :: proc(eid: c.int, flags: SceNetEpollAbortFlag) -> c.int ---

    sceNetEtherStrton :: proc(str: cstring, n: ^SceNetEtherAddr) -> c.int ---
    sceNetEtherNtostr :: proc(n: ^SceNetEtherAddr, str: cstring, len: c.uint) -> c.int ---
    // flags is always 0
    sceNetGetMacAddress :: proc(addr: ^SceNetEtherAddr, flags: ^c.int) -> c.int ---

    sceNetSocket :: proc(name: cstring, domain: c.int, type: SceNetSocketType, protocol: c.int) -> c.int ---
    sceNetAccept :: proc(s: c.int, addr: ^SceNetSockaddr, addrlen: ^c.uint) -> c.int ---
    sceNetBind :: proc(s: c.int, addr: ^SceNetSockaddr, addrlen: c.uint) -> c.int ---
    sceNetConnect :: proc(s: c.int, name: ^SceNetSockaddr, namelen: c.uint) -> c.int ---
    sceNetGetpeername :: proc(s: c.int, name: ^SceNetSockaddr, namelen: ^c.uint) -> c.int ---
    sceNetGetsockname :: proc(s: c.int, name: ^SceNetSockaddr, namelen: ^c.uint) -> c.int ---
    sceNetGetsockopt :: proc(s: c.int, level: c.int, optname: c.int, optval: rawptr, optlen: ^c.uint) -> c.int ---
    sceNetListen :: proc(s: c.int, backlog: c.int) -> c.int ---
    sceNetRecv :: proc(s: c.int, buf: rawptr, len: c.uint, flags: SceNetMsgFlag) -> c.int ---
    sceNetRecvfrom :: proc(s: c.int, buf: rawptr, len: c.uint, flags: SceNetMsgFlag, from: ^SceNetSockaddr, fromlen: ^c.uint) -> c.int ---
    sceNetRecvmsg :: proc(s: c.int, msg: ^SceNetMsghdr, flags: SceNetMsgFlag) -> c.int ---
    sceNetSend :: proc(s: c.int, msg: rawptr, len: c.uint, flags: SceNetMsgFlag) -> c.int ---
    sceNetSendto :: proc(s: c.int, msg: rawptr, len: c.uint, flags: SceNetMsgFlag, to: ^SceNetSockaddr, tolen: c.uint) -> c.int ---
    sceNetSendmsg :: proc(s: c.int, msg: ^SceNetMsghdr, flags: SceNetMsgFlag) -> c.int ---
    sceNetSetsockopt :: proc(s: c.int, level: c.int, optname: c.int, optval: rawptr, optlen: c.uint) -> c.int ---
    sceNetShutdown :: proc(s: c.int, how: SceNetShutdownFlag) -> c.int ---
    sceNetSocketClose :: proc(s: c.int) -> c.int ---
    sceNetSocketAbort :: proc(s: c.int, flags: SceNetSocketAbortFlag) -> c.int ---
    // flags is always 0
    sceNetGetSockInfo :: proc(s: c.int, info: ^SceNetSockInfo, n: c.int, flags: c.int) -> c.int ---
    // flags is always 0
    sceNetGetSockIdInfo :: proc(fds: ^SceNetFdSet, sockinfoflags: c.int, flags: c.int) -> c.int ---
    // flags is always 0
    sceNetGetStatisticsInfo :: proc(info: ^SceNetStatisticsInfo, flags: c.int) -> c.int ---

    // flags is always 0
    sceNetSetDnsInfo :: proc(info: ^SceNetDnsInfo, flags: c.int) -> c.int ---
    // flags is always 0
    sceNetClearDnsCache :: proc(flags: c.int) -> c.int ---

    sceNetInetNtop :: proc(af: c.int, src: rawptr, dst: cstring, size: c.uint) -> cstring ---
    sceNetInetPton :: proc(af: c.int, src: cstring, dst: rawptr) -> c.int ---

    sceNetHtonll :: proc(host64: c.ulonglong) -> c.ulonglong ---
    sceNetHtonl :: proc(host32: c.uint) -> c.uint ---
    sceNetHtons :: proc(host16: c.ushort) -> c.ushort ---
    sceNetNtohll :: proc(net64: c.ulonglong) -> c.ulonglong ---
    sceNetNtohl :: proc(net32: c.uint) -> c.uint ---
    sceNetNtohs :: proc(net16: c.ushort) -> c.ushort ---

    /**
    * Get pointer to last network errno.
    *
    * @return pointer to int.
    */
    sceNetErrnoLoc :: proc() -> ^c.int ---
}

foreign netps {
  ksceNetSocket :: proc(name: cstring, domain: c.int, type: c.int, protocol: c.int) -> c.int ---
  ksceNetAccept :: proc(s: c.int, addr: ^SceNetSockaddr, addrlen: ^c.uint) -> c.int ---
  ksceNetBind :: proc(s: c.int, #by_ptr addr: SceNetSockaddr, addrlen: c.uint) -> c.int ---
  ksceNetConnect :: proc(s: c.int, #by_ptr name: SceNetSockaddr, namelen: c.uint) -> c.int ---
  ksceNetListen :: proc(s: c.int, backlog: c.int) -> c.int ---
  ksceNetRecvfrom :: proc(s: c.int, buf: rawptr, len: c.uint, flags: c.int, from: ^SceNetSockaddr, fromlen: ^c.uint) -> c.int ---
  ksceNetSendto :: proc(s: c.int, msg: rawptr, len: c.uint, flags: c.int, #by_ptr to: SceNetSockaddr, tolen: c.uint) -> c.int ---
  ksceNetSetsockopt :: proc(s: c.int, level: c.int, optname: c.int, optval: rawptr, optlen: c.uint) -> c.int ---
  ksceNetClose :: proc(s: c.int) -> c.int ---
}

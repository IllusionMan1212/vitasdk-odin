package net

import "core:c"
foreign import net "system:SceNet_stub"
foreign import netps "system:SceNetPsForDriver_stub"

@(link_prefix = "sceNet")
foreign net {
    Init :: proc(param: ^SceNetInitParam) -> c.int ---
    Term :: proc() -> c.int ---

    ShowIfconfig :: proc(p: rawptr, b: c.int) -> c.int ---
    ShowRoute :: proc() -> c.int ---
    ShowNetstat :: proc() -> c.int ---

    EmulationSet :: proc(param: ^SceNetEmulationParam, flags: SceNetEmulationFlag) -> c.int ---
    EmulationGet :: proc(param: ^SceNetEmulationParam, flags: SceNetEmulationFlag) -> c.int ---

    // flags is always 0
    ResolverCreate :: proc(name: cstring, param: ^SceNetResolverParam, flags: c.int) -> c.int ---
    ResolverStartNtoa :: proc(rid: c.int, hostname: cstring, addr: ^SceNetInAddr, timeout: c.int, retry: c.int, flags: SceNetResolverFlag) -> c.int ---
    ResolverStartAton :: proc(rid: c.int, addr: ^SceNetInAddr, hostname: cstring, len: c.int, timeout: c.int, retry: c.int, flags: SceNetResolverFlag) -> c.int ---
    ResolverGetError :: proc(rid: c.int, result: ^c.int) -> SceNetResolverErrorCode ---
    ResolverDestroy :: proc(rid: c.int) -> c.int ---
    ResolverAbort :: proc(rid: c.int, flags: SceNetResolverAbortFlag) -> c.int ---

    // flags is always 0
    DumpCreate :: proc(name: cstring, len: c.int, flags: c.int) -> c.int ---
    DumpRead :: proc(id: c.int, buf: rawptr, len: c.int, pflags: ^SceNetDumpReadFlag) -> c.int ---
    DumpDestroy :: proc(id: c.int) -> c.int ---
    DumpAbort :: proc(id: c.int, flags: SceNetDumpAbortFlag) -> c.int ---
    // flags is always 0
    EpollCreate :: proc(name: cstring, flags: c.int) -> c.int ---
    EpollControl :: proc(eid: c.int, op: SceNetEpollControlFlag, id: c.int, event: ^SceNetEpollEvent) -> c.int ---
    EpollWait :: proc(eid: c.int, events: ^SceNetEpollEvent, maxevents: c.int, timeout: c.int) -> c.int ---
    EpollWaitCB :: proc(eid: c.int, events: ^SceNetEpollEvent, maxevents: c.int, timeout: c.int) -> c.int ---
    EpollDestroy :: proc(eid: c.int) -> c.int ---
    EpollAbort :: proc(eid: c.int, flags: SceNetEpollAbortFlag) -> c.int ---

    EtherStrton :: proc(str: cstring, n: ^SceNetEtherAddr) -> c.int ---
    EtherNtostr :: proc(n: ^SceNetEtherAddr, str: cstring, len: c.uint) -> c.int ---
    // flags is always 0
    GetMacAddress :: proc(addr: ^SceNetEtherAddr, flags: ^c.int) -> c.int ---

    Socket :: proc(name: cstring, domain: c.int, type: SceNetSocketType, protocol: c.int) -> c.int ---
    Accept :: proc(s: c.int, addr: ^SceNetSockaddr, addrlen: ^c.uint) -> c.int ---
    Bind :: proc(s: c.int, addr: ^SceNetSockaddr, addrlen: c.uint) -> c.int ---
    Connect :: proc(s: c.int, name: ^SceNetSockaddr, namelen: c.uint) -> c.int ---
    Getpeername :: proc(s: c.int, name: ^SceNetSockaddr, namelen: ^c.uint) -> c.int ---
    Getsockname :: proc(s: c.int, name: ^SceNetSockaddr, namelen: ^c.uint) -> c.int ---
    Getsockopt :: proc(s: c.int, level: c.int, optname: c.int, optval: rawptr, optlen: ^c.uint) -> c.int ---
    Listen :: proc(s: c.int, backlog: c.int) -> c.int ---
    Recv :: proc(s: c.int, buf: rawptr, len: c.uint, flags: SceNetMsgFlag) -> c.int ---
    Recvfrom :: proc(s: c.int, buf: rawptr, len: c.uint, flags: SceNetMsgFlag, from: ^SceNetSockaddr, fromlen: ^c.uint) -> c.int ---
    Recvmsg :: proc(s: c.int, msg: ^SceNetMsghdr, flags: SceNetMsgFlag) -> c.int ---
    Send :: proc(s: c.int, msg: rawptr, len: c.uint, flags: SceNetMsgFlag) -> c.int ---
    Sendto :: proc(s: c.int, msg: rawptr, len: c.uint, flags: SceNetMsgFlag, to: ^SceNetSockaddr, tolen: c.uint) -> c.int ---
    Sendmsg :: proc(s: c.int, msg: ^SceNetMsghdr, flags: SceNetMsgFlag) -> c.int ---
    Setsockopt :: proc(s: c.int, level: c.int, optname: c.int, optval: rawptr, optlen: c.uint) -> c.int ---
    Shutdown :: proc(s: c.int, how: SceNetShutdownFlag) -> c.int ---
    SocketClose :: proc(s: c.int) -> c.int ---
    SocketAbort :: proc(s: c.int, flags: SceNetSocketAbortFlag) -> c.int ---
    // flags is always 0
    GetSockInfo :: proc(s: c.int, info: ^SceNetSockInfo, n: c.int, flags: c.int) -> c.int ---
    // flags is always 0
    GetSockIdInfo :: proc(fds: ^SceNetFdSet, sockinfoflags: c.int, flags: c.int) -> c.int ---
    // flags is always 0
    GetStatisticsInfo :: proc(info: ^SceNetStatisticsInfo, flags: c.int) -> c.int ---

    // flags is always 0
    SetDnsInfo :: proc(info: ^SceNetDnsInfo, flags: c.int) -> c.int ---
    // flags is always 0
    ClearDnsCache :: proc(flags: c.int) -> c.int ---

    InetNtop :: proc(af: c.int, src: rawptr, dst: cstring, size: c.uint) -> cstring ---
    InetPton :: proc(af: c.int, src: cstring, dst: rawptr) -> c.int ---

    Htonll :: proc(host64: c.ulonglong) -> c.ulonglong ---
    Htonl :: proc(host32: c.uint) -> c.uint ---
    Htons :: proc(host16: c.ushort) -> c.ushort ---
    Ntohll :: proc(net64: c.ulonglong) -> c.ulonglong ---
    Ntohl :: proc(net32: c.uint) -> c.uint ---
    Ntohs :: proc(net16: c.ushort) -> c.ushort ---

    /**
    * Get pointer to last network errno.
    *
    * @return pointer to int.
    */
    ErrnoLoc :: proc() -> ^c.int ---
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

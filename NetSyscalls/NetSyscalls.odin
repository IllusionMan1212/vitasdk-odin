package net_syscalls

import "core:c"

foreign import net_syscalls "system:SceNetPsForSyscalls_stub"

SceNetSyscallParameter :: struct{} // missing struct

@(link_prefix = "sceNetSyscall")
foreign net_syscalls {
  Accept :: proc(s: c.int, addr: rawptr, addrlen: rawptr) -> c.int ---
  Bind :: proc(s: c.int, addr: rawptr, addrlen: c.int) -> c.int ---
  Close :: proc(s: c.int) -> c.int ---
  Connect :: proc(s: c.int, name: rawptr, namelen: c.int) -> c.int ---
  Control :: proc(if_index: c.int, code: c.int, ptr: rawptr, len: c.int) -> c.int ---
  DescriptorClose :: proc(id: c.int) -> c.int ---
  DescriptorCreate :: proc(name: cstring, flags: c.int) -> c.int ---
  DescriptorCtl :: proc(id: c.int, op: c.int, s: c.int, info: rawptr) -> c.int ---
  DumpAbort :: proc(id: c.int, flags: c.int) -> c.int ---
  DumpClose :: proc(id: c.int) -> c.int ---
  DumpCreate :: proc(name: cstring, len: c.int, flags: c.int) -> c.int ---
  DumpRead :: proc(id: c.int, buf: rawptr, len: c.int, pflags: rawptr) -> c.int ---
  EpollAbort :: proc(eid: c.int, flags: c.int) -> c.int ---
  EpollClose :: proc(eid: c.int) -> c.int ---
  EpollCreate :: proc(name: cstring, flags: c.int) -> c.int ---
  EpollCtl :: proc(eid: c.int, op: c.int, id: c.int, event: rawptr) -> c.int ---
  EpollWait :: proc(param: ^SceNetSyscallParameter) -> c.int ---

  /**
  * @brief Get net if list
  *
  * @param[out] list - The output buffer list. size is (0x140 * n)
  * @param[in]  n    - The output size number.
  *
  * @return 0 on success, < 0 on error.
  */
  GetIfList :: proc(list: rawptr, n: c.int) -> c.int ---

  GetSockinfo :: proc(s: c.int, ptr: rawptr, n: c.int, flags: c.int) -> c.int ---
  Getpeername :: proc(s: c.int, name: rawptr, namelen: rawptr) -> c.int ---
  Getsockname :: proc(s: c.int, name: rawptr, namelen: rawptr) -> c.int ---
  Getsockopt :: proc(param: ^SceNetSyscallParameter) -> c.int ---
  IcmConnect :: proc(s: c.int, flags: c.int) -> c.int ---
  Ioctl :: proc(s: c.int, com: c.uint, data: rawptr) -> c.int ---
  Listen :: proc(s: c.int, backlog: c.int) -> c.int ---
  Recvfrom :: proc(param: ^SceNetSyscallParameter) -> c.int ---
  Recvmsg :: proc(s: c.int, msg: rawptr, flags: c.int) -> c.int ---
  Sendmsg :: proc(s: c.int, msg: rawptr, flags: c.int) -> c.int ---
  Sendto :: proc(param: ^SceNetSyscallParameter) -> c.int ---
  Setsockopt :: proc(param: ^SceNetSyscallParameter) -> c.int ---
  Shutdown :: proc(s: c.int, how: c.int) -> c.int ---
  Socket :: proc(name: cstring, domain: c.int, type: c.int, protocol: c.int) -> c.int ---
  SocketAbort :: proc(s: c.int, flags: c.int) -> c.int ---
  Sysctl :: proc(param: ^SceNetSyscallParameter) -> c.int ---
}

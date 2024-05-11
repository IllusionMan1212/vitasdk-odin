package monobridge

import "core:c"
import sce "../common"

foreign import monobridge "system:SceLibMonoBridge_stub"

ScePssCryptoHandle :: struct {
  fd: sce.UID,
  unk1: c.uint32_t,
  size: sce.Size,
  unk3: c.uint32_t,
}
#assert(size_of(ScePssCryptoHandle) == 0x10)

@(link_prefix = "pss_")
foreign monobridge {
  crypto_open :: proc(handle: ^ScePssCryptoHandle, path: cstring) -> c.int ---
  crypto_read :: proc(handle: ^ScePssCryptoHandle, mode: ^c.int) -> [^]c.char ---
  crypto_close :: proc(handle: ^ScePssCryptoHandle) -> c.int ---
  code_mem_alloc :: proc(_: ^sce.Size) -> rawptr ---
  code_mem_flush_icache :: proc(_: rawptr, __: sce.Size) ---
  code_mem_lock :: proc() ---
  code_mem_unlock :: proc() ---
}

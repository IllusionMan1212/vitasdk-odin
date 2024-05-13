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

foreign monobridge {
  pss_crypto_open :: proc(handle: ^ScePssCryptoHandle, path: cstring) -> c.int ---
  pss_crypto_read :: proc(handle: ^ScePssCryptoHandle, mode: ^c.int) -> [^]c.char ---
  pss_crypto_close :: proc(handle: ^ScePssCryptoHandle) -> c.int ---
  pss_code_mem_alloc :: proc(_: ^sce.Size) -> rawptr ---
  pss_code_mem_flush_icache :: proc(_: rawptr, __: sce.Size) ---
  pss_code_mem_lock :: proc() ---
  pss_code_mem_unlock :: proc() ---
}

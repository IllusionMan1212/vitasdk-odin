package libkernel

import "core:c"
import sce "../common"

foreign import libkernel "system:SceLibKernel_stub"

SceClibMspace :: distinct rawptr

SceClibMspaceStats :: struct {
    capacity:       sce.Size, //!< Capacity of the Mspace
    unk:            sce.Size, //!< Unknown, value is equal to capacity
    peak_in_use:    sce.Size, //!< Peak memory allocated
    current_in_use: sce.Size, //!< Current memory allocated
}
#assert(size_of(SceClibMspaceStats) == 0x10)

foreign libkernel {
    sceClibAbort :: proc() ---

    sceClibLookCtypeTable :: proc(ch: c.char) -> c.char ---

    sceClibTolower :: proc(ch: c.char) -> c.int ---
    sceClibToupper :: proc(ch: c.char) -> c.int ---

    sceClibPrintf :: proc(fmt: cstring, #c_vararg args: ..any) -> c.int ---
    sceClibDprintf :: proc(fd: sce.UID, fmt: cstring, #c_vararg args: ..any) -> c.int ---

    sceClibSnprintf :: proc(dst: cstring, dst_max_size: sce.Size, fmt: cstring, #c_vararg args: ..any) -> c.int ---
    sceClibVsnprintf :: proc(dst: cstring, dst_max_size: sce.Size, fmt: cstring, args: c.va_list) -> c.int ---

    sceClibStrncpy :: proc(dst: cstring, src: cstring, len: sce.Size) -> cstring ---
    sceClibStrncat :: proc(dst: cstring, src: cstring, len: sce.Size) -> cstring ---

    sceClibStrchr :: proc(s: cstring, ch: c.int) -> cstring ---
    sceClibStrrchr :: proc(src: cstring, ch: c.int) -> cstring ---
    sceClibStrstr :: proc(s1, s2: cstring) -> cstring ---

    sceClibStrcmp :: proc(s1, s2: cstring) -> c.int ---
    sceClibStrncmp :: proc(s1, s2: cstring, len: sce.Size) -> c.int ---
    sceClibStrncasecmp :: proc(s1, s2: cstring, len: sce.Size) -> c.int ---

    sceClibStrnlen :: proc(s1: cstring, max_len: sce.Size) -> sce.Size ---

    sceClibMemset :: proc(dst: rawptr, ch: c.int, len: sce.Size) -> rawptr ---
    sceClibMemcpy :: proc(dst: rawptr, src: rawptr, len: sce.Size) -> rawptr ---
    sceClibMemcpy_safe :: proc(dst: rawptr, src: rawptr, len: sce.Size) -> rawptr ---
    sceClibMemmove :: proc(dst: rawptr, src: rawptr, len: sce.Size) -> rawptr ---

    sceClibMemcmp :: proc(s1: rawptr, s2: rawptr, len: sce.Size) -> c.int ---

    sceClibMemchr :: proc(src: rawptr, ch: c.int, len: sce.Size) -> rawptr ---

    sceClibMspaceCreate :: proc(memblock: rawptr, size: sce.Size) -> SceClibMspace ---
    sceClibMspaceDestroy :: proc(mspace: SceClibMspace) ---

    sceClibMspaceMallocUsableSize :: proc(ptr: rawptr) -> sce.Size ---
    sceClibMspaceIsHeapEmpty :: proc(mspace: SceClibMspace) -> sce.Bool ---

    sceClibMspaceMallocStats :: proc(mspace: SceClibMspace, stats: ^SceClibMspaceStats) ---
    sceClibMspaceMallocStatsFast :: proc(mspace: SceClibMspace, stats: ^SceClibMspaceStats) ---

    sceClibMspaceMalloc :: proc(mspace: SceClibMspace, size: sce.Size) -> rawptr ---
    sceClibMspaceCalloc :: proc(mspace: SceClibMspace, num: sce.Size , size: sce.Size) -> rawptr ---
    sceClibMspaceRealloc :: proc(mspace: SceClibMspace, ptr: rawptr, size: sce.Size) -> rawptr ---
    sceClibMspaceReallocalign :: proc(mspace: SceClibMspace, ptr: rawptr, size: sce.Size, alignment: sce.Size) -> rawptr ---
    sceClibMspaceMemalign :: proc(mspace: SceClibMspace, alignment: sce.Size, size: sce.Size) -> rawptr ---
    sceClibMspaceFree :: proc(mspace: SceClibMspace, ptr: rawptr) ---
}

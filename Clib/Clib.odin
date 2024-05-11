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

@(link_prefix = "sceClib")
foreign libkernel {
    Abort :: proc() ---

    LookCtypeTable :: proc(ch: c.char) -> c.char ---

    Tolower :: proc(ch: c.char) -> c.int ---
    Toupper :: proc(ch: c.char) -> c.int ---

    Printf :: proc(fmt: cstring, #c_vararg args: ..any) -> c.int ---
    Dprintf :: proc(fd: sce.UID, fmt: cstring, #c_vararg args: ..any) -> c.int ---

    Snprintf :: proc(dst: cstring, dst_max_size: sce.Size, fmt: cstring, #c_vararg args: ..any) -> c.int ---
    Vsnprintf :: proc(dst: cstring, dst_max_size: sce.Size, fmt: cstring, args: c.va_list) -> c.int ---

    Strncpy :: proc(dst: cstring, src: cstring, len: sce.Size) -> cstring ---
    Strncat :: proc(dst: cstring, src: cstring, len: sce.Size) -> cstring ---

    Strchr :: proc(s: cstring, ch: c.int) -> cstring ---
    Strrchr :: proc(src: cstring, ch: c.int) -> cstring ---
    Strstr :: proc(s1, s2: cstring) -> cstring ---

    Strcmp :: proc(s1, s2: cstring) -> c.int ---
    Strncmp :: proc(s1, s2: cstring, len: sce.Size) -> c.int ---
    Strncasecmp :: proc(s1, s2: cstring, len: sce.Size) -> c.int ---

    Strnlen :: proc(s1: cstring, max_len: sce.Size) -> sce.Size ---

    Memset :: proc(dst: rawptr, ch: c.int, len: sce.Size) -> rawptr ---
    Memcpy :: proc(dst: rawptr, src: rawptr, len: sce.Size) -> rawptr ---
    Memcpy_safe :: proc(dst: rawptr, src: rawptr, len: sce.Size) -> rawptr ---
    Memmove :: proc(dst: rawptr, src: rawptr, len: sce.Size) -> rawptr ---

    Memcmp :: proc(s1: rawptr, s2: rawptr, len: sce.Size) -> c.int ---

    Memchr :: proc(src: rawptr, ch: c.int, len: sce.Size) -> rawptr ---

    MspaceCreate :: proc(memblock: rawptr, size: sce.Size) -> SceClibMspace ---
    MspaceDestroy :: proc(mspace: SceClibMspace) ---

    MspaceMallocUsableSize :: proc(ptr: rawptr) -> sce.Size ---
    MspaceIsHeapEmpty :: proc(mspace: SceClibMspace) -> sce.Bool ---

    MspaceMallocStats :: proc(mspace: SceClibMspace, stats: ^SceClibMspaceStats) ---
    MspaceMallocStatsFast :: proc(mspace: SceClibMspace, stats: ^SceClibMspaceStats) ---

    MspaceMalloc :: proc(mspace: SceClibMspace, size: sce.Size) -> rawptr ---
    MspaceCalloc :: proc(mspace: SceClibMspace, num: sce.Size , size: sce.Size) -> rawptr ---
    MspaceRealloc :: proc(mspace: SceClibMspace, ptr: rawptr, size: sce.Size) -> rawptr ---
    MspaceReallocalign :: proc(mspace: SceClibMspace, ptr: rawptr, size: sce.Size, alignment: sce.Size) -> rawptr ---
    MspaceMemalign :: proc(mspace: SceClibMspace, alignment: sce.Size, size: sce.Size) -> rawptr ---
    MspaceFree :: proc(mspace: SceClibMspace, ptr: rawptr) ---
}

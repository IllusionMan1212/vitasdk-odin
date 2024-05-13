package paf

import sce "../common"
import "core:c"

foreign import paf "system:ScePaf_stub"

foreign paf {

    /**
    * Update the current wave
    *
    * @param[in] index           - The index from 0 to 0x1F within range.
    * @param[in] update_interval - The update interval. 0.0f to it will change soon. 1.0f will slowly turn into an updated wave after 1 second, just like when you change it the normal way.
    *
    * @return 0 on success, <0 otherwise.
    */
    scePafGraphicsUpdateCurrentWave :: proc(index: sce.UInt32, update_interval: sce.Float32) -> c.int ---

    scePafGetCurrentClockLocalTime :: proc(data: ^ScePafDateTime) -> c.int ---

    scePafSha1Init :: proc(_context: ^ScePafSha1Context) -> c.int ---
    scePafSha1Update :: proc(_context: ^ScePafSha1Context, data: rawptr, length: sce.Size) -> c.int ---
    scePafSha1Result :: proc(_context: ^ScePafSha1Context, dst: rawptr) -> c.int ---

    scePafCreateHeap :: proc(_context: ^ScePafHeapContext, membase: rawptr, size: sce.Size, name: cstring, opt: ^ScePafHeapOpt) ---
    scePafDeleteHeap :: proc(_context: ^ScePafHeapContext) ---

    scePafMallocWithContext :: proc(_context: ^ScePafHeapContext, len: sce.Size) -> rawptr ---
    scePafFreeWithContext :: proc(_context: ^ScePafHeapContext, ptr: rawptr) ---

    scePafMallocAlignWithContext :: proc(_context: ^ScePafHeapContext, align: sce.UInt32, len: sce.Size) -> rawptr ---
    scePafReallocWithContext :: proc(_context: ^ScePafHeapContext, ptr: rawptr, len: sce.Size) -> rawptr ---

    sce_paf_malloc :: proc(size: sce.Size) -> rawptr ---
    sce_paf_free :: proc(ptr: rawptr) ---

    /**
    * @brief Alloc memory with align
    *
    * @param[in] align  The align size
    * @param[in] length The alloc length
    *
    * @return memory pointer or NULL
    */
    sce_paf_memalign :: proc(align: sce.Size, length: sce.Size) -> rawptr ---

    sce_paf_memchr :: proc(src: rawptr, ch: c.int, length: sce.Size) -> rawptr ---
    sce_paf_memcmp :: proc(s1: rawptr, s2: rawptr, n: sce.Size) -> c.int ---

    sce_paf_memcpy :: proc(dst: rawptr, src: rawptr, len: sce.Size) -> rawptr ---
    sce_paf_memset :: proc(dst: rawptr, ch: c.int, len: sce.Size) -> rawptr ---
    sce_paf_memmove :: proc(dst: rawptr, src: rawptr, len: sce.Size) -> rawptr ---

    sce_paf_snprintf :: proc(dst: cstring, max: c.uint, fmt: cstring, #c_vararg args: ..any) -> c.int ---
    sce_paf_vsnprintf :: proc(dst: cstring, max: c.uint, fmt: cstring, arg: c.va_list) -> c.int ---

    sce_paf_bcmp :: proc(ptr1: rawptr, ptr2: rawptr, num: sce.Size) -> c.int ---
    sce_paf_bcopy :: proc(dst: rawptr, src: rawptr, n: sce.Size) -> rawptr ---
    sce_paf_bzero :: proc(dst: rawptr, n: sce.Size) -> rawptr ---

    sce_paf_strchr :: proc(s: cstring, ch: c.int) -> ^c.char ---
    sce_paf_strcmp :: proc(s1: cstring, s2: cstring) -> c.int ---
    sce_paf_strlen :: proc(s: cstring) -> c.size_t ---
    sce_paf_strcasecmp :: proc(s1: cstring, s2: cstring) -> c.int ---
    sce_paf_strncasecmp :: proc(s1: cstring, s2: cstring, len: sce.Size) -> c.int ---
    sce_paf_strncmp :: proc(s1: cstring, s2: cstring, len: sce.Size) -> c.int ---
    sce_paf_strncpy :: proc(dst: cstring, src: cstring, len: sce.Size) -> cstring ---
    sce_paf_strrchr :: proc(s: cstring, ch: c.int) -> ^c.char ---

    /**
    * @brief string to double
    *
    * @param[in]  nptr   The input float string
    * @param[out] endptr The float string endpoint
    *
    * @return parsed value
    */
    sce_paf_strtod :: proc(nptr: cstring, endptr: ^^c.char) -> c.double ---
}

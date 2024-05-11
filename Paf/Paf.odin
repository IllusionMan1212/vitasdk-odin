package paf

import sce "../common"
import "core:c"

foreign import paf "system:ScePaf_stub"

@(link_prefix = "scePaf")
foreign paf {

    /**
    * Update the current wave
    *
    * @param[in] index           - The index from 0 to 0x1F within range.
    * @param[in] update_interval - The update interval. 0.0f to it will change soon. 1.0f will slowly turn into an updated wave after 1 second, just like when you change it the normal way.
    *
    * @return 0 on success, <0 otherwise.
    */
    GraphicsUpdateCurrentWave :: proc(index: sce.UInt32, update_interval: sce.Float32) -> c.int ---

    GetCurrentClockLocalTime :: proc(data: ^ScePafDateTime) -> c.int ---

    Sha1Init :: proc(_context: ^ScePafSha1Context) -> c.int ---
    Sha1Update :: proc(_context: ^ScePafSha1Context, data: rawptr, length: sce.Size) -> c.int ---
    Sha1Result :: proc(_context: ^ScePafSha1Context, dst: rawptr) -> c.int ---

    CreateHeap :: proc(_context: ^ScePafHeapContext, membase: rawptr, size: sce.Size, name: cstring, opt: ^ScePafHeapOpt) ---
    DeleteHeap :: proc(_context: ^ScePafHeapContext) ---

    MallocWithContext :: proc(_context: ^ScePafHeapContext, len: sce.Size) -> rawptr ---
    FreeWithContext :: proc(_context: ^ScePafHeapContext, ptr: rawptr) ---

    MallocAlignWithContext :: proc(_context: ^ScePafHeapContext, align: sce.UInt32, len: sce.Size) -> rawptr ---
    ReallocWithContext :: proc(_context: ^ScePafHeapContext, ptr: rawptr, len: sce.Size) -> rawptr ---

    @(link_name = "sce_paf_malloc")
    malloc :: proc(size: sce.Size) -> rawptr ---
    @(link_name = "sce_paf_free")
    free :: proc(ptr: rawptr) ---

    /**
    * @brief Alloc memory with align
    *
    * @param[in] align  The align size
    * @param[in] length The alloc length
    *
    * @return memory pointer or NULL
    */
    @(link_name = "sce_paf_memalign")
    memalign :: proc(align: sce.Size, length: sce.Size) -> rawptr ---

    @(link_name = "sce_paf_memchr")
    memchr :: proc(src: rawptr, ch: c.int, length: sce.Size) -> rawptr ---
    @(link_name = "sce_paf_memcmp")
    memcmp :: proc(s1: rawptr, s2: rawptr, n: sce.Size) -> c.int ---

    @(link_name = "sce_paf_memcpy")
    memcpy :: proc(dst: rawptr, src: rawptr, len: sce.Size) -> rawptr ---
    @(link_name = "sce_paf_memset")
    memset :: proc(dst: rawptr, ch: c.int, len: sce.Size) -> rawptr ---
    @(link_name = "sce_paf_memmove")
    memmove :: proc(dst: rawptr, src: rawptr, len: sce.Size) -> rawptr ---

    @(link_name = "sce_paf_snprintf")
    snprintf :: proc(dst: cstring, max: c.uint, fmt: cstring, #c_vararg args: ..any) -> c.int ---
    @(link_name = "sce_paf_vsnprintf")
    vsnprintf :: proc(dst: cstring, max: c.uint, fmt: cstring, arg: c.va_list) -> c.int ---

    @(link_name = "sce_paf_bcmp")
    bcmp :: proc(ptr1: rawptr, ptr2: rawptr, num: sce.Size) -> c.int ---
    @(link_name = "sce_paf_bcopy")
    bcopy :: proc(dst: rawptr, src: rawptr, n: sce.Size) -> rawptr ---
    @(link_name = "sce_paf_bzero")
    bzero :: proc(dst: rawptr, n: sce.Size) -> rawptr ---

    @(link_name = "sce_paf_strchr")
    strchr :: proc(s: cstring, ch: c.int) -> ^c.char ---
    @(link_name = "sce_paf_strcmp")
    strcmp :: proc(s1: cstring, s2: cstring) -> c.int ---
    @(link_name = "sce_paf_strlen")
    strlen :: proc(s: cstring) -> c.size_t ---
    @(link_name = "sce_paf_strcasecmp")
    strcasecmp :: proc(s1: cstring, s2: cstring) -> c.int ---
    @(link_name = "sce_paf_strncasecmp")
    strncasecmp :: proc(s1: cstring, s2: cstring, len: sce.Size) -> c.int ---
    @(link_name = "sce_paf_strncmp")
    strncmp :: proc(s1: cstring, s2: cstring, len: sce.Size) -> c.int ---
    @(link_name = "sce_paf_strncpy")
    strncpy :: proc(dst: cstring, src: cstring, len: sce.Size) -> cstring ---
    @(link_name = "sce_paf_strrchr")
    strrchr :: proc(s: cstring, ch: c.int) -> ^c.char ---

    /**
    * @brief string to double
    *
    * @param[in]  nptr   The input float string
    * @param[out] endptr The float string endpoint
    *
    * @return parsed value
    */
    @(link_name = "sce_paf_strtod")
    strtod :: proc(nptr: cstring, endptr: ^^c.char) -> c.double ---
}

package paf

import sce "../common"
import "core:c"

scePafGraphicsCurrentWave :: sce.UInt32

ScePafDateTime :: struct {
    data:      sce.DateTime,
    data_0x10: c.int,
    data_0x14: c.int,
}
#assert(size_of(ScePafDateTime) == 0x18)

ScePafSha1Context :: struct {
    // size is 0x68
    h:   [5]c.uint32_t,
    unk: [0x54]c.char,
}
#assert(size_of(ScePafSha1Context) == 0x68)

// TODO: copy-pasted from Kernel/types.odin. should be in common or something
SceKernelLwMutexWork :: struct {
	data: [4]sce.Int64,
}
#assert(size_of(SceKernelLwMutexWork) == 0x20)


ScePafHeapContext :: struct {
    // size is 0x60-bytes
    vtable:            rawptr,
    heap:              rawptr,
    membase:           rawptr,
    size:              sce.Size,
    name:              [0x20]c.char,
    is_import_membase: sce.Char8,
    is_skip_debug_msg: sce.Char8,
    data_0x32:         c.char,
    data_0x33:         c.char, // maybe unused. just for align.
    data_0x34:         c.int, // maybe unused. just for align.
    lw_mtx:            SceKernelLwMutexWork,
    memblk_id:         sce.UID,

    /*
	 * !1 : Game
	 *  1 : CDialog
	 */
    mode:              sce.Int32,
}
when size_of(rawptr) == 4 {
    #assert(size_of(ScePafHeapContext) == 0x60)
}

ScePafHeapOpt :: struct {
    // size is 0x14-bytes
    a1:                c.int,
    a2:                c.int,
    is_skip_debug_msg: sce.Char8,
    a3:                [3]c.char,
    mode:              sce.Int32,
    a5:                c.int,
}
#assert(size_of(ScePafHeapOpt) == 0x14)

package musicexport

import "core:c"
import sce "../common"

foreign import musicexport "system:SceMusicExport_stub"

MusicExportParam :: struct {
  reserved: [128]c.char,  //!< Reserved data
}
#assert(size_of(MusicExportParam) == 0x80)

@(link_prefix = "sceMusicExport")
foreign musicexport {
  FromFile :: proc(
    path: cstring,
    #by_ptr param: MusicExportParam,
    workingMemory: rawptr,
    cancelCb: rawptr,
    progress: #type ^proc "c" (_: rawptr, __: c.int),
    user: rawptr,
    outPath: cstring,
    outPathSize: sce.Size) -> c.int ---
}

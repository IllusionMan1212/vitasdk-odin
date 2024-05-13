package photoexport

import "core:c"
import sce "../common"

PhotoExportParam :: struct {
  version: c.int,                    //!< Version
	photoTitle: [^]sce.WChar32,   //!< Photo title
	gameTitle: [^]sce.WChar32,    //!< Game title
	gameComment: [^]sce.WChar32,  //!< Game description
	reserved: [8]c.int,                //!< Reserved data
}

foreign import photoexport "system:ScePhotoExport_stub"

foreign photoexport {
  scePhotoExportFromData :: proc(data: rawptr, size: sce.Size, #by_ptr param: PhotoExportParam, workingMemory: rawptr, cancelCb: rawptr, user: rawptr, outPath: cstring, outPathSize: sce.Size) -> c.int ---
  scePhotoExportFromFile :: proc(path: cstring, #by_ptr param: PhotoExportParam, workingMemory: rawptr, cancelCb: rawptr, user: rawptr, outPath: cstring, outPathSize: sce.Size) -> c.int ---
}

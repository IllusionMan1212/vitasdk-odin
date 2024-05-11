package sblacmgr

import sce "../common"

foreign import sblacmgr "system:SceSblACMgr_stub"

@(link_prefix = "sceSblACMgr")
foreign sblacmgr {
  IsGameProgram :: proc(result: ^sce.Bool) -> sce.Int32 ---
}

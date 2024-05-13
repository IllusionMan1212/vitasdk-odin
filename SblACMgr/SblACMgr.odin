package sblacmgr

import sce "../common"

foreign import sblacmgr "system:SceSblACMgr_stub"

foreign sblacmgr {
  sceSblACMgrIsGameProgram :: proc(result: ^sce.Bool) -> sce.Int32 ---
}

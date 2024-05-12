package pfsmgr

import "core:c"
import sce "../common"

foreign import pfsmgr "system:ScePfsMgeForKernel_stub"

ScePfsRndDriveId :: struct {
  drive_id: [0x10]c.char,
}
#assert(size_of(ScePfsRndDriveId) == 0x10)

@(link_prefix = "kscePfs")
foreign pfsmgr {
  /**
  * Mount pfs directory
  *
  * @param[in] path         - The pfs encrypted directory path
  * @param[in] rnd_drive_id - The pfs mount target Pseudo Drive strings
  * @param[in] authid       - The authid
  * @param[in] klicensee    - The klicensee
  * @param[in] mode_index   - The mode_index
  *
  * @return 0 on success, < 0 on error.
  */
  Mount :: proc(path: cstring, #by_ptr rnd_drive_id: ScePfsRndDriveId, program_authority_id: sce.UInt64, klicensee: rawptr, mode_index: c.uint16_t) -> c.int ---

  /**
  * Mount pfs directory without authid
  *
  * @param[in] path         - The pfs encrypted directory path
  * @param[in] rnd_drive_id - The pfs mount target Pseudo Drive strings
  * @param[in] klicensee    - The klicensee
  * @param[in] mode_index   - The mode_index
  *
  * @return 0 on success, < 0 on error.
  */
  Mount2 :: proc(path: cstring, #by_ptr rnd_drive_id: ScePfsRndDriveId, klicensee: rawptr, mode_index: c.uint16_t) -> c.int ---

  /**
  * Unmount pfs directory
  *
  * @param[in] rnd_drive_id - The pfs mount drive strings
  *
  * @return 0 on success, < 0 on error.
  */
  Unmount :: proc(#by_ptr rnd_drive_id: ScePfsRndDriveId) -> c.int ---

  Approve :: proc(#by_ptr rnd_drive_id: ScePfsRndDriveId, program_authority_id: sce.UInt64) -> c.int ---
  Disapprove :: proc(#by_ptr rnd_drive_id: ScePfsRndDriveId, program_authority_id: sce.UInt64) -> c.int ---
}

package fios2

import "core:c"
import sce "../common"

foreign import fios2 "system:SceFios2Kernel_stub"
foreign import fios2kern "system:SceFios2KernelForDriver_stub"

@(link_prefix = "_sceFiosKernelOverlay")
foreign fios2 {
  Add :: proc(overlay: ^SceFiosKernelOverlay, out_id: ^SceFiosKernelOverlayID) -> c.int ---
  AddForProcess :: proc(target_process: sce.UID, overlay: ^SceFiosKernelOverlay, out_id: ^SceFiosKernelOverlayID) -> c.int ---
  DHChstatSync :: proc(dh: SceFiosKernelOverlayDH, new_stat: ^SceFiosNativeStat, cbit: c.uint) -> c.int ---
  DHCloseSync :: proc(dh: SceFiosKernelOverlayDH) -> c.int ---

  DHOpenSync :: proc(out_dh: ^SceFiosKernelOverlayDH, path: cstring, from_order: sce.UInt8, args: ^SceFiosDHOpenSyncSyscallArgs) -> c.int ---
  DHReadSync :: proc(dh: SceFiosKernelOverlayDH, out_entry: ^SceFiosNativeDirEntry) -> c.int ---
  DHStatSync :: proc(dh: SceFiosKernelOverlayDH, out_stat: ^SceFiosNativeStat) -> c.int ---
  DHSyncSync :: proc(dh: SceFiosKernelOverlayDH, flag: c.int) -> c.int ---
  GetInfo :: proc(id: SceFiosKernelOverlayID, out_overlay: ^SceFiosKernelOverlay) -> c.int ---
  GetInfoForProcess :: proc(target_process: sce.UID, id: SceFiosKernelOverlayID, out_overlay: ^SceFiosKernelOverlay) -> c.int ---

  GetList :: proc(pid: sce.UID, min_order: sce.UInt8, max_order: sce.UInt8, args: ^SceFiosGetListSyscallArgs) -> c.int ---
  GetRecommendedScheduler :: proc(avail: c.int, partially_resolved_path: cstring, a3: ^sce.UInt64) -> c.int ---
  Modify :: proc(id: SceFiosKernelOverlayID, new_value: ^SceFiosKernelOverlay) -> c.int ---
  ModifyForProcess :: proc(target_process: sce.UID, id: SceFiosKernelOverlayID, new_value: ^SceFiosKernelOverlay) -> c.int ---
  Remove :: proc(id: SceFiosKernelOverlayID) -> c.int ---
  RemoveForProcess :: proc(target_process: sce.UID, id: SceFiosKernelOverlayID) -> c.int ---

  ResolveSync :: proc(pid: sce.UID, resolve_flag: c.int, in_path: cstring, args: ^SceFiosResolveSyncSyscallArgs) -> c.int ---

  ResolveWithRangeSync :: proc(pid: sce.UID, resolve_flag: c.int, in_path: cstring, args: ^SceFiosResolveWithRangeSyncSyscallArgs) -> c.int ---
  ThreadIsDisabled :: proc() -> c.int ---
  ThreadSetDisabled :: proc(disabled: sce.Int32) -> c.int ---

  @(link_name = "sceFiosKernelOverlayAddForProcess02")
  AddForProcess02 :: proc(pid: sce.UID, overlay: ^SceFiosOverlay, outID: ^SceFiosOverlayID) -> c.int ---
}

foreign fios2kern {
  /**
  * Overlay process file system overlay
  *
  * @param[in]  overlay - Overlay config pointer
  * @param[out] outID   - outID pointer
  *
  * @return     Error code or zero on success
  */
  ksceFiosKernelOverlayAdd :: proc(overlay: ^SceFiosOverlay, outID: ^SceFiosOverlayID) -> c.int ---

  /**
  * Overlay process file system overlay
  *
  * @param[in]  pid     - Process id
  * @param[in]  overlay - Overlay config pointer
  * @param[out] outID   - outID pointer
  *
  * @return     Error code or zero on success
  */
  ksceFiosKernelOverlayAddForProcess :: proc(pid: sce.UID, overlay: ^SceFiosOverlay, outID: ^SceFiosOverlayID) -> c.int ---

  /**
  * Remove process file system overlay
  *
  * @param[in] pid - Process id
  * @param[in] id  - Overlay id
  *
  * @return     Error code or zero on success
  */
  ksceFiosKernelOverlayRemoveForProcess :: proc(pid: sce.UID, id: SceFiosOverlayID) -> c.int ---

  /**
  * Resolve process file system overlay with sync
  *
  * @param[in]  pid         - Process id
  * @param[in]  resolveFlag - Some flags
  * @param[in]  inPath      - Path input
  * @param[out] outPath     - Path output
  * @param[in]  maxPath     - Path output max length
  *
  * @return     Error code or zero on success
  */
  ksceFiosKernelOverlayResolveSync :: proc(pid: sce.UID, resolveFlag: c.int, inPath: cstring, outPath: [^]c.char, maxPath: sce.Size) -> c.int ---
}

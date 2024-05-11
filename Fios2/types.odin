package fios2

import "core:c"
import sce "../common"

SCE_FIOS2_OVERLAY_PATH_SIZE       :: (292)
SCE_FIOS2_OVERLAY_PATH_MAX_LENGTH :: (SCE_FIOS2_OVERLAY_PATH_SIZE - 1)

SceFiosKernelOverlayDH :: c.int32_t
SceFiosKernelOverlayID :: c.int32_t
SceFiosOverlayID :: c.int32_t

// missing structs
SceFiosKernelOverlay :: struct{}
SceFiosNativeStat :: struct{}
SceFiosNativeDirEntry :: struct{}

SceFiosDHOpenSyncSyscallArgs :: struct {
	to_order: sce.UInt8,
	padding: [2]c.int,
}
#assert(size_of(SceFiosDHOpenSyncSyscallArgs) == 0xC)

SceFiosGetListSyscallArgs :: struct {
	out_ids: ^SceFiosKernelOverlayID,
	data_0x04: c.int,
	data_0x08: c.int,
	data_0x0C: sce.Size,
	data_0x10: c.int,
	data_0x14: c.int,
}
when size_of(rawptr) == 4 {
	#assert(size_of(SceFiosGetListSyscallArgs) == 0x18)
}

SceFiosResolveSyncSyscallArgs :: struct {
	out_path: cstring,
	data_0x04: c.int,
	data_0x08: c.int,
	data_0x0C: c.int,
	data_0x10: c.int,
	data_0x14: c.int,
}
when size_of(rawptr) == 4 {
	#assert(size_of(SceFiosResolveSyncSyscallArgs) == 0x18)
}

SceFiosResolveWithRangeSyncSyscallArgs :: struct {
	out_path: cstring,
	data_0x04: c.int,
	data_0x08: sce.UInt8,
	data_0x09: sce.UInt8,
	data_0x0C: c.int,
	data_0x10: c.int,
	data_0x14: c.int,
}
when size_of(rawptr) == 4 {
	#assert(size_of(SceFiosResolveWithRangeSyncSyscallArgs) == 0x18)
}

SceFiosOverlayType :: enum c.int {
  // src replaces dst. All accesses to dst are redirected to src.
  OPAQUE      = 0,

  // src merges with dst. Reads check src first, then dst. Writes go to dst.
  TRANSLUCENT = 1,

  // src merges with dst. Reads check both src and dst, and use whichever has the most recent modification time.
  // If both src and dst have the same modification time, dst is used.
  // If no file exists at src or dst, dst is used; if no file exists at dst, but a file exists at src, src is used. Writes go to dst.
  NEWER       = 2,

  // src merges with dst. Reads check src first, then dst. Writes go to src.
  WRITABLE    = 3
}

SceFiosOverlay :: struct {
	type: c.uint8_t, // see SceFiosOverlayType
  order: c.uint8_t,
  dst_len: c.uint16_t,
  src_len: c.uint16_t,
  unk2: c.uint16_t,
  pid: sce.UID,
  id: SceFiosOverlayID,
  dst: [SCE_FIOS2_OVERLAY_PATH_SIZE]c.char,
  src: [SCE_FIOS2_OVERLAY_PATH_SIZE]c.char, // src path replaces dst path based on type policy
}
#assert(size_of(SceFiosOverlay) == 0x258)

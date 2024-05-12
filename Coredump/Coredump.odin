package coredump

import "core:c"
import sce "../common"

SceCoredumpTriggerParam :: struct {
  size: sce.Size,
	data_0x04: c.int,
	data_0x08: c.int,
	data_0x0C: c.int,
	data_0x10: c.int,
	titleid_len: sce.Size,
	titleid: cstring,
	app_name_len: sce.Size,
	app_name: cstring,
	data_0x24: c.int, // ex: 100. maybe progress max number.
	data_0x28: c.int,
	crash_thid: sce.UID,
	data_0x30: c.int,
}

SceKernelCoredumpStateUpdateCallback :: #type ^proc "c" (task_id: c.int, pid: sce.UID, progress: c.int) -> c.int
SceKernelCoredumpStateFinishCallback :: #type ^proc "c" (task_id: c.int, pid: sce.UID, result: c.int, path: cstring, path_len: sce.Size, unk: c.int) -> c.int


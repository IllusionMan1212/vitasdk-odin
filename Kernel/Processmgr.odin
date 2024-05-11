package kernel

import "core:c"
import sce "../common"

foreign import processmgr "system:SceProcessmgr_stub"

@(link_prefix = "sceKernel")
foreign processmgr {
    /**
    * Cancel specified idle timers to prevent entering in power save processing.
    *
    * @param[in] type - One of ::SceKernelPowerTickType
    *
    * @return 0
    */
    PowerTick :: proc(type: SceKernelPowerTickType) -> c.int ---

    /**
    * Locks certain timers from triggering.
    *
    * @param[in] type - One of ::SceKernelPowerTickType
    *
    * @return 0
    */
    PowerLock :: proc(type: SceKernelPowerTickType) -> c.int ---

    /**
    * Unlocks certain timers.
    *
    * @param[in] type - One of ::SceKernelPowerTickType
    *
    * @return 0
    */
    PowerUnlock :: proc(type: SceKernelPowerTickType) -> c.int ---

    GetCurrentProcess :: proc() -> sce.UID ---
    GetRemoteProcessTime :: proc(processId: sce.UID, pClock: ^sce.KernelSysClock) -> sce.Int32 ---

    GetStderr :: proc() -> sce.UID ---
    GetStdin :: proc() -> sce.UID ---
    GetStdout :: proc() -> sce.UID ---

    GetProcessParam :: proc() -> rawptr ---

    LibcClock :: proc() -> SceKernelClock ---
    LibcTime :: proc(tloc: ^SceKernelTime) -> SceKernelTime ---

    LibcGettimeofday :: proc(tv: ^SceKernelTimeval, tz: ^SceKernelTimezone) -> c.int ---
}

package kernel

import "core:c"
import sce "../common"

foreign import processmgr "system:SceProcessmgr_stub"

foreign processmgr {
    /**
    * Cancel specified idle timers to prevent entering in power save processing.
    *
    * @param[in] type - One of ::SceKernelPowerTickType
    *
    * @return 0
    */
    sceKernelPowerTick :: proc(type: SceKernelPowerTickType) -> c.int ---

    /**
    * Locks certain timers from triggering.
    *
    * @param[in] type - One of ::SceKernelPowerTickType
    *
    * @return 0
    */
    sceKernelPowerLock :: proc(type: SceKernelPowerTickType) -> c.int ---

    /**
    * Unlocks certain timers.
    *
    * @param[in] type - One of ::SceKernelPowerTickType
    *
    * @return 0
    */
    sceKernelPowerUnlock :: proc(type: SceKernelPowerTickType) -> c.int ---

    sceKernelGetCurrentProcess :: proc() -> sce.UID ---
    sceKernelGetRemoteProcessTime :: proc(processId: sce.UID, pClock: ^sce.KernelSysClock) -> sce.Int32 ---

    sceKernelGetStderr :: proc() -> sce.UID ---
    sceKernelGetStdin :: proc() -> sce.UID ---
    sceKernelGetStdout :: proc() -> sce.UID ---

    sceKernelGetProcessParam :: proc() -> rawptr ---

    sceKernelLibcClock :: proc() -> SceKernelClock ---
    sceKernelLibcTime :: proc(tloc: ^SceKernelTime) -> SceKernelTime ---

    sceKernelLibcGettimeofday :: proc(tv: ^SceKernelTimeval, tz: ^SceKernelTimezone) -> c.int ---
}

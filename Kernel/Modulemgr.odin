package kernel

import "core:c"
import sce "../common"

foreign import modulemgr "system:SceKernelModulemgr_stub"

// missing structs
SceKernelLoadModuleOption :: struct {}
SceKernelUnloadModuleOption :: struct {}
SceKernelLibraryInfo :: struct {}

foreign modulemgr {
    sceKernelGetModuleInfo :: proc(uid: sce.UID, info: ^SceKernelModuleInfo) -> c.int ---
    sceKernelGetModuleList :: proc(type: sce.UInt8, uids: [^]sce.UID, num: ^sce.Size) -> c.int ---

    /**
    * Gets system firmware information.
    *
    * @param[out] version - System sw version.
    *
    * @note - If you spoofed the firmware version it will return the spoofed firmware.
    */
    sceKernelGetSystemSwVersion :: proc(version: ^SceKernelSystemSwVersion) -> c.int ---

    _sceKernelLoadModule :: proc(module_filename: cstring, flags: sce.UInt32, option: ^SceKernelLoadModuleOption) -> sce.UID ---
    _sceKernelLoadStartModule :: proc(module_filename: cstring, args: sce.Size, argp: rawptr, flags: sce.UInt32) -> sce.UID ---
    _sceKernelUnloadModule :: proc(uid: sce.UID, flags: sce.UInt32, option: ^SceKernelUnloadModuleOption) -> c.int ---
    _sceKernelStopModule :: proc(uid: sce.UID, args: sce.Size, argp: rawptr, flags: sce.UInt32) -> c.int ---
    _sceKernelStopUnloadModule :: proc(uid: sce.UID, args: sce.Size, argp: rawptr, flags: sce.UInt32) -> c.int ---

    _sceKernelOpenModule :: proc(module_filename: cstring, args: sce.Size, argp: rawptr, flags: sce.UInt32) -> sce.UID ---
    _sceKernelCloseModule :: proc(modid: sce.UID, args: sce.Size, argp: rawptr, flags: sce.UInt32) -> sce.UID ---

    sceKernelGetLibraryInfoByNID :: proc(modid: sce.UID, libnid: sce.NID, info: ^SceKernelLibraryInfo) -> c.int ---

    sceKernelIsCalledFromSysModule :: proc(lr: rawptr) -> c.int ---
    sceKernelGetModuleIdByAddr :: proc(addr: rawptr) -> sce.UID ---
    sceKernelGetAllowedSdkVersionOnSystem :: proc() -> sce.UInt32 ---
}

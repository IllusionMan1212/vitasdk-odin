package kernel

import "core:c"
import sce "../common"

foreign import modulemgr "system:SceKernelModulemgr_stub"

// missing structs
SceKernelLoadModuleOption :: struct {}
SceKernelUnloadModuleOption :: struct {}
SceKernelLibraryInfo :: struct {}

@(link_prefix = "sceKernel")
foreign modulemgr {
    GetModuleInfo :: proc(uid: sce.UID, info: ^SceKernelModuleInfo) -> c.int ---
    GetModuleList :: proc(type: sce.UInt8, uids: [^]sce.UID, num: ^sce.Size) -> c.int ---

    /**
    * Gets system firmware information.
    *
    * @param[out] version - System sw version.
    *
    * @note - If you spoofed the firmware version it will return the spoofed firmware.
    */
    GetSystemSwVersion :: proc(version: ^SceKernelSystemSwVersion) -> c.int ---

    @(link_name = "_sceKernelLoadModule")
    _LoadModule :: proc(module_filename: cstring, flags: sce.UInt32, option: ^SceKernelLoadModuleOption) -> sce.UID ---
    @(link_name = "_sceKernelLoadStartModule")
    _LoadStartModule :: proc(module_filename: cstring, args: sce.Size, argp: rawptr, flags: sce.UInt32) -> sce.UID ---
    @(link_name = "_sceKernelUnloadModule")
    _UnloadModule :: proc(uid: sce.UID, flags: sce.UInt32, option: ^SceKernelUnloadModuleOption) -> c.int ---
    @(link_name = "_sceKernelStopModule")
    _StopModule :: proc(uid: sce.UID, args: sce.Size, argp: rawptr, flags: sce.UInt32) -> c.int ---
    @(link_name = "_sceKernelStopUnloadModule")
    _StopUnloadModule :: proc(uid: sce.UID, args: sce.Size, argp: rawptr, flags: sce.UInt32) -> c.int ---

    @(link_name = "_sceKernelOpenModule")
    _OpenModule :: proc(module_filename: cstring, args: sce.Size, argp: rawptr, flags: sce.UInt32) -> sce.UID ---
    @(link_name = "_sceKernelCloseModule")
    _CloseModule :: proc(modid: sce.UID, args: sce.Size, argp: rawptr, flags: sce.UInt32) -> sce.UID ---

    GetLibraryInfoByNID :: proc(modid: sce.UID, libnid: sce.NID, info: ^SceKernelLibraryInfo) -> c.int ---

    IsCalledFromSysModule :: proc(lr: rawptr) -> c.int ---
    GetModuleIdByAddr :: proc(addr: rawptr) -> sce.UID ---
    GetAllowedSdkVersionOnSystem :: proc() -> sce.UInt32 ---
}

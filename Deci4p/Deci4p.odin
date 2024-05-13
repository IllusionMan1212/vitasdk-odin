package deci4p

import sce "../common"

foreign import deci4p "system:SceDeci4pUserp_stub"

foreign deci4p {
  sceKernelDeci4pOpen :: proc(protoname: cstring, protonum: sce.UInt32, bufsize: sce.Size) -> sce.UID ---
  sceKernelDeci4pClose :: proc(socketid: sce.UID) -> sce.Int32 ---
  sceKernelDeci4pDisableWatchpoint :: proc() -> sce.Int32 ---
  sceKernelDeci4pEnableWatchpoint :: proc() -> sce.Int32 ---
  sceKernelDeci4pIsProcessAttached :: proc() -> sce.Int32 ---
  sceKernelDeci4pRead :: proc(socketid: sce.UID, buffer: rawptr, size: sce.Size, reserved: sce.UInt32) -> sce.Int32 ---
  sceKernelDeci4pRegisterCallback :: proc(socketid: sce.UID, cbid: sce.UID) -> sce.Int32 ---
  sceKernelDeci4pWrite :: proc(socketid: sce.UID, buffer: rawptr, size: sce.Size, reserved: sce.UInt32) -> sce.Int32 ---
}

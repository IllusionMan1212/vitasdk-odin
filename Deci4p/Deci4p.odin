package deci4p

import sce "../common"

foreign import deci4p "system:SceDeci4pUserp_stub"

@(link_prefix="sceKernelDeci4p")
foreign deci4p {
  Open :: proc(protoname: cstring, protonum: sce.UInt32, bufsize: sce.Size) -> sce.UID ---
  Close :: proc(socketid: sce.UID) -> sce.Int32 ---
  DisableWatchpoint :: proc() -> sce.Int32 ---
  EnableWatchpoint :: proc() -> sce.Int32 ---
  IsProcessAttached :: proc() -> sce.Int32 ---
  Read :: proc(socketid: sce.UID, buffer: rawptr, size: sce.Size, reserved: sce.UInt32) -> sce.Int32 ---
  RegisterCallback :: proc(socketid: sce.UID, cbid: sce.UID) -> sce.Int32 ---
  Write :: proc(socketid: sce.UID, buffer: rawptr, size: sce.Size, reserved: sce.UInt32) -> sce.Int32 ---
}

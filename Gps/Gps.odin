package gps

import "core:c"
import sce "../common"

foreign import gps "system:SceGps_stub"

// missing structs
SceGpsDeviceInfo :: struct{}
SceGpsSatelliteData :: struct{}
SceGpsPositionData :: struct{}
SceGpsStatus :: struct{}

@(link_prefix = "_sceGps")
foreign gps {
  Close :: proc() -> c.int ---
  GetData :: proc(pos: ^SceGpsPositionData, sat: ^SceGpsSatelliteData) -> c.int ---
  GetDeviceInfo :: proc(dev_info: ^SceGpsDeviceInfo) -> c.int ---
  GetState :: proc(state: ^SceGpsStatus) -> c.int ---
  Ioctl :: proc(ioctl_command: sce.UInt32, arg: rawptr, arg_size: sce.Size, a4: ^sce.Size) -> c.int ---
  IsDevice :: proc() -> c.int ---
  Open :: proc(cbid: sce.UID) -> c.int ---
  ResumeCallback :: proc() -> c.int ---
  SelectDevice :: proc(device_type: sce.UInt32) -> c.int ---
  Start :: proc(mode: c.uint) -> c.int ---
  Stop :: proc() -> c.int ---
}

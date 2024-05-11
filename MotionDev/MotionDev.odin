package motiondev

import "core:c"
import sce "../common"

foreign import motiondev "system:SceMotionDev_stub"

// missing structs
SceMotionDevAccCalibData :: struct{}
SceMotionDevCalibrationData :: struct{}
SceMotionDevCalibrationHeader :: struct{}
SceMotionDevMagnCalibData :: struct{}
SceMotionDevDeviceInfo :: struct{}
SceMotionDevDeviceLocation :: struct{}
SceMotionDevGyroBiasData :: struct{}
SceMotionDevGyroCalibData :: struct{}
SceMotionDevModeInfo :: struct{}
SceMotionDevData :: struct{}

@(link_prefix = "sceMotionDev")
foreign motiondev {
  GetAccCalibData :: proc(data: ^SceMotionDevAccCalibData) -> c.int ---
  GetAccCalibData2 :: proc(port: c.int, data: ^SceMotionDevAccCalibData) -> c.int ---
  GetCalibrationData :: proc(block_id: sce.UInt32, data: ^SceMotionDevCalibrationData, data_num: sce.UInt32) -> c.int ---
  GetCalibrationHeader :: proc(block_id: sce.UInt32, calib_header: ^SceMotionDevCalibrationHeader) -> c.int ---
  GetCurrentMagnCalibData :: proc(data: ^SceMotionDevMagnCalibData) -> c.int ---
  GetCurrentMagnStabilityLevel :: proc(level: ^sce.UInt32) -> c.int ---
  GetDeviceInfo :: proc(device_info: ^SceMotionDevDeviceInfo) -> c.int ---
  GetDeviceLocation :: proc(location: ^SceMotionDevDeviceLocation) -> c.int ---
  GetFactoryMagnCalibData :: proc(data: ^SceMotionDevMagnCalibData) -> c.int ---
  GetGyroBias :: proc(bias: ^SceMotionDevGyroBiasData) -> c.int ---
  GetGyroBias2 :: proc(port: c.int, bias: ^SceMotionDevGyroBiasData) -> c.int ---
  GetGyroCalibData :: proc(data: ^SceMotionDevGyroCalibData) -> c.int ---
  GetGyroCalibData2 :: proc(port: c.int, data: ^SceMotionDevGyroCalibData) -> c.int ---
  GetMeasMode :: proc(mode_info: ^SceMotionDevModeInfo) -> c.int ---
  IsReady :: proc() -> c.int ---
  MagnSamplingStart :: proc() -> c.int ---
  MagnSamplingStop :: proc() -> c.int ---
  Read :: proc(data: ^SceMotionDevData, data_num: c.int, info: ^sce.UInt32) -> c.int ---
  Read2 :: proc(port: c.int, data: ^SceMotionDevData, data_num: c.int, info: ^sce.UInt32) -> c.int ---
  ReadForMagnCalib :: proc(data: ^SceMotionDevData, data_num: c.int) -> c.int ---
  SamplingStart :: proc() -> c.int ---
  SamplingStart2 :: proc(port: c.int) -> c.int ---
  SamplingStop :: proc() -> c.int ---
  SamplingStop2 :: proc(port: c.int) -> c.int ---
  SetSamplingMode :: proc(mode: sce.UInt32) -> c.int ---
  UpdateMagnCalibData :: proc(#by_ptr data: SceMotionDevMagnCalibData, tag: ^sce.UInt32) -> c.int ---
  UpdateMagnStabilityLevel :: proc(level: sce.UInt32) -> c.int ---
}

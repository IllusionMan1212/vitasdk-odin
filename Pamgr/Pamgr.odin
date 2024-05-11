package pamgr

import "core:c"
import sce "../common"

foreign import pamgr "system:ScePamgr_stub"

// missing structs
SceKernelPaTraceBufferParam :: struct{}
SceKernelPaGpuSampledData :: struct{}
SceKernelPaGpuTraceParam :: struct{}
SceKernelPaCounterTraceParam :: struct{}
SceKernelPaArmTraceParam :: struct{}

foreign pamgr {
  sceKernelPaGetTraceBufferSize :: proc(type: sce.UInt32) -> sce.Size ---
  sceKernelPaGetIoBaseAddress :: proc() -> sce.UInt32 ---
  sceKernelPaGetTimebaseFrequency :: proc() -> sce.UInt32 ---
  sceKernelPaGetTraceBufferStatus :: proc() -> sce.UInt32 ---
  sceKernelPaGetWritePointer :: proc() -> sce.UInt32 ---
  sceKernelPaGetTimebaseValue :: proc() -> sce.UInt64 ---
  _sceKernelPaAddArmTraceByKey :: proc(key: c.int, #by_ptr param: SceKernelPaArmTraceParam) -> c.int ---
  _sceKernelPaAddCounterTraceByKey :: proc(key: c.int, #by_ptr param: SceKernelPaCounterTraceParam) -> c.int ---
  _sceKernelPaAddGpuTraceByKey :: proc(key: c.int, #by_ptr param: SceKernelPaGpuTraceParam) -> c.int ---
  _sceKernelPaGetGpuSampledData :: proc(data: ^SceKernelPaGpuSampledData) -> c.int ---
  _sceKernelPaSetupTraceBufferByKey :: proc(key: c.int, #by_ptr param: SceKernelPaTraceBufferParam) -> c.int ---
  sceKernelPaInsertBookmark :: proc(fifo: sce.UInt32, channel: sce.UInt32, data: sce.UInt32) -> c.int ---
  sceKernelPaRegister :: proc() -> c.int ---
  sceKernelPaRemoveArmTraceByKey :: proc(key: c.int) -> c.int ---
  sceKernelPaRemoveCounterTraceByKey :: proc(key: c.int) -> c.int ---
  sceKernelPaRemoveGpuTraceByKey :: proc(key: c.int) -> c.int ---
  sceKernelPaSetBookmarkChannelEnableByKey :: proc(key: c.int, fifo: sce.UInt32, mask: sce.UInt32) -> c.int ---
  sceKernelPaStartByKey :: proc(key: c.int) -> c.int ---
  sceKernelPaStopByKey :: proc(key: c.int) -> c.int ---
  sceKernelPaUnregister :: proc(key: c.int) -> c.int ---
  sceKernelPerfArmPmonClose :: proc() -> c.int ---
  sceKernelPerfArmPmonOpen :: proc() -> c.int ---
  sceKernelPerfArmPmonReset :: proc(threadId: sce.UID) -> c.int ---
  sceKernelPerfArmPmonSelectEvent :: proc(threadId: sce.UID, counter: sce.UInt32, eventCode: sce.UInt8) -> c.int ---
  sceKernelPerfArmPmonSetCounterValue :: proc(threadId: sce.UID, counter: sce.UInt32, value: sce.UInt32) -> c.int ---
  sceKernelPerfArmPmonStart :: proc(threadId: sce.UID) -> c.int ---
  sceKernelPerfArmPmonStop :: proc(threadId: sce.UID) -> c.int ---
}

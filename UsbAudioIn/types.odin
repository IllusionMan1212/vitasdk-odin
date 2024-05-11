package usbaudioin

import "core:c"
import sce "../common"

// TODO: 
SceUsbAudioInErrorCode :: enum c.uint {
    INVALID_ARGUMENT = 0x803e0001,
    DUPLICATE_ID = 0x803e0002,
    NO_MEMORY = 0x803e0003,
    DEVICE_NOT_FOUND = 0x803e0004,
    NOT_SUPPORTED = 0x803e0005,
    CANNOT_GET_PORT_OWNERSHIP = 0x803e0006,
    PORT_IS_ALREADY_OPENED = 0x803e0007,
    PROCESS_HAS_NOT_A_DEVICE_OWNERSHIP = 0x803e0008,
    FAILED_TO_READ_STREAM = 0x803e0009,
    DEVICE_WAS_HALTED = 0x803e000a,
    NO_DATA_TO_READ = 0x803e000b,
    FAILED_TO_COPY_BUFFER = 0x803e000c,
    FAILED_TO_REQUEST_ISOCHRONOUS = 0x803e000d,
    TIMEOUT = 0x803e000e,
    PROCESS_CANNOT_OPEN_MORE_DEVICE = 0x803e000f,
}

SceUsbAudioInDeviceInfo :: struct {
  vendor: c.uint16_t,
  product: c.uint16_t,
  _reserved: [5]sce.UInt32,
}
#assert(size_of(SceUsbAudioInDeviceInfo) == 0x18)

SceUsbAudioInDeviceListItem :: struct {
  device_id: sce.UInt32,
}
#assert(size_of(SceUsbAudioInDeviceListItem) == 4)


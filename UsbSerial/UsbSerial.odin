package usbserial

import "core:c"

foreign import usbserial "system:SceUsbSerial_stub"

@(link_prefix = "sceUsbSerial")
foreign usbserial {
  /**
  * Activate USB serial device
  *
  * @return 0 on success, < 0 on error
  *
  * @note The user is responsible for making sure no other UDC driver is active. This activates UDC as a "PS Vita" Type D device.
  *
  * @note Wrapper for kernel function StartForDriver()
  */
  Start :: proc() -> c.int ---

  /**
  * Setup USB serial device
  *
  * @return 0 on success, < 0 on error
  *
  * @param unk Unknown
  *
  * @note Wrapper for kernel function SetupForDriver()
  */
  Setup :: proc(unk: c.int) -> c.int ---

  /**
  * Close USB serial device
  *
  * @note Wrapper for kernel function CloseForDriver()
  */
  Close :: proc() -> c.int ---

  /**
  * Close USB serial device
  *
  * @return Returns 1 when serial port is open
  *
  * @note Wrapper for kernel function StatusForDriver()
  */
  Status :: proc() -> c.int ---

  /**
  * Get receive buffer length
  *
  * @return Returns length of USB rx buffer
  *
  * @note Wrapper for kernel function GetLenForDriver()
  */
  GetRecvBufferSize :: proc() -> c.uint ---

  /**
  * Send data
  * @param[in] *buffer data to send over usb
  * @param len int len of serial buffer data
  * @param unk1 Unknown
  * @param unk2 Unknown
  * @note max send length is 0x10000
  * @note Wrapper for kernel function SendForDriver()
  */
  Send :: proc(buffer: rawptr, len: c.uint, unk1: c.int, unk2: c.int) -> c.uint ---

  /**
  * Receive Data
  *
  * @param[out] *buffer buffer for incoming data
  * @param max_len max data length to receive
  * @param unk1 Unknown
  * @param unk2 Unknown
  * @note max recv length is 0x10000
  * @note Wrapper for kernel function RecvForDriver()
  */
  Recv :: proc(buffer: rawptr, max_len: c.uint, unk1: c.int, unk2: c.int) -> c.uint ---
}

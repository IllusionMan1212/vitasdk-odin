package io

import "core:c"
import sce "../common"

foreign import libkernel "system:SceLibKernel_stub"
foreign import iofilemgr "system:SceIofilemgr_stub"
foreign import iofilemgrkern "system:SceIofilemgrForDriver_stub"

foreign libkernel {
  /**
  * Send a devctl command to a device.
  *
  * @par Example: Sending a simple command to a device
  * @code
  * SceIoDevInfo info
  * sceIoDevctl :: proc("ux00x3001: :",, NULL, 0, &info, sizeof(SceIoDevInfo))
  * @endcode
  *
  * @ :: procparam dev- String:  for the device to send the devctl to (e.g. "ux0:")
  * @param cmd - The command to send to the device
  * @param indata - A data block to send to the device, if NULL sends no data
  * @param inlen - Length of indata, if 0 sends no data
  * @param outdata - A data block to receive the result of a command, if NULL receives no  -> c.int ---
  * @param outlen - Length of outdata, if 0 receives no data
  * @return 0 on success, < 0 on error
  */
  sceIoDevctl :: proc(dev: cstring, cmd: c.uint, indata: rawptr, inlen: c.int, outdata: rawptr, outlen: c.int) -> c.int ---

  /**
  * Perform an ioctl on a device.
  *
  * @param fd - Opened file descriptor to ioctl to
  * @param cmd - The command to send to the device
  * @param indata - A data block to send to the device, if NULL :: procno: ^sends data
  * @param - Length of indata, if 0 sends no data -> c.int ---
  * @param outdata - A data block to receive the result of a command, if NULL receives no data
  * @param outlen - Length of outdata, if 0 receives no data
  * @return 0 on success, < 0 on error
  */
  sceIoIoctl :: proc(fd: sce.UID, cmd: c.uint, indata: rawptr, inlen: c.int, outdata: rawptr, outlen: c.int) -> c.int ---

  /**
  * Perform an ioctl :: proc a device: c.in. asynchronous: ^)
  -> c.int ---
  * @param fd - Opened file descriptor to ioctl to
  * @param cmd - The command to send to the device
  * @param indata - A data block to send to the device, if NULL sends no data
  * @param inlen - Length of indata, if 0 sends no data
  * @param outdata - A data block to receive the result of a command, if NULL receives no data
  * @param outlen - Length of outdata, if 0 receives no data
  * @return 0 on success, < 0 on error
  */
  sceIoIoctlAsync :: proc(fd: sce.UID, cmd: c.uint, indata: rawptr, inlen: c.int, outdata: rawptr, outlen: c.int) -> c.int ---

  /**
  * Open a directory
  *
  * @par Example:
  * @code
  * int dfd
  * dfd = sceIoDopen("device:/")
  * if(dfd >= 0)
  * { Do something with the file descriptor }
  * @endcode
  * @param dirname - The directory to open for reading.
  * @return If >= 0 then a valid file descriptor, otherwise a Sony error code.
  */
  sceIoDopen :: proc(dirname: cstring) -> sce.UID ---

  /**
  * Reads an entry from an opened file descriptor.
  *
  * @param fd - Already opened file descriptor (using ::sceIoDopen)
  * @param dir - Pointer to a ::SceIoDirent structure to hold the file information
  *
  * @return Read status
  * -   0 - No more directory entries left
  * - > 0 - More directory entries to go
  * - < 0 - Error
  */
  sceIoDread :: proc(fd: sce.UID, dir: ^SceIoDirent) -> c.int ---

  /**
  * Close an opened directory file descriptor
  *
  * @param fd - Already opened file descriptor (using ::sceIoDopen)
  * @return < 0 on error
  */
  sceIoDclose :: proc(fd: sce.UID) -> c.int ---

  /**
  * Make a directory file
  *
  * @param dir - The path to the directory
  * @param mode - Access mode (One or more ::SceIoAccessMode).
  * @return Returns the value 0 if it's successful, otherwise -1
  */
  sceIoMkdir :: proc(dir: cstring, mode: SceIoAccessMode) -> c.int ---

  /**
  * Remove a directory file
  *
  * @param path - Removes a directory file pointed by the string path
  * @return Returns the value 0 if it's successful, otherwise -1
  */
  sceIoRmdir :: proc(path: cstring) -> c.int ---

  /**
  * Get the status of a file.
  *
  * @param file - The path to the file.
  * @param stat - A pointer to a ::SceIoStat structure.
  *
  * @return < 0 on error.
  */
  sceIoGetstat :: proc(file: cstring, stat: ^SceIoStat) -> c.int ---

  /**
  * Get the status of a file descriptor.
  *
  * @param fd - The file descriptor.
  * @param stat - A pointer to a ::SceIoStat structure.
  *
  * @return < 0 on error.
  */
  sceIoGetstatByFd :: proc(fd: sce.UID, stat: ^SceIoStat) -> c.int ---

  /**
  * Change the status of a file.
  *
  * @param file - The path to the file.
  * @param stat - A pointer to a ::SceIoStat structure.
  * @param bits - Bitmask defining which bits to change.
  *
  * @return < 0 on error.
  */
  sceIoChstat :: proc(file: cstring, stat: ^SceIoStat, bits: c.int) -> c.int ---

  /**
  * Change the status of a file descriptor.
  *
  * @param fd - The file descriptor.
  * @param stat - A pointer to an io_stat_t structure.
  * @param bits - Bitmask defining which bits to change.
  *
  * @return < 0 on error.
  */
  sceIoChstatByFd :: proc(fd: sce.UID, buf: ^SceIoStat, cbit: c.uint) -> c.int ---
}

foreign iofilemgr {
  /**
   * Open or create a file for reading or writing
   *
   * @par Example1: Open a file for reading
   * @code
   * if((fd = sceIoOpen("device:/path/to/file", SCE_O_RDONLY, 0777) < 0) {
   * // error code in fd, for example no open filehandle left (0x80010018)
   * }
   * @endcode
   * @par Example2: Open a file for writing, creating it if it doesn't exist
   * @code
   * if((fd = sceIoOpen("device:/path/to/file", SCE_O_WRONLY|SCE_O_CREAT, 0777) < 0) {
   * // error code in fd, for example no open filehandle left (0x80010018)
   * }
   * @endcode
   *
   * @param file - Pointer to a string holding the name of the file to open.
   * @param flags - Libc styled flags that are or'ed together (One or more ::SceIoMode).
   * @param mode - One or more ::SceIoAccessMode flags or'ed together. Can also use Unix absolute permissions.
   * @return > 0 is a valid file handle, < 0 on error.
   */
   sceIoOpen :: proc(file: cstring, flags: SceIoMode, mode: sce.Mode) -> sce.UID ---

  /**
   * Delete a descriptor
   *
   * @code
   * sceIoClose(fd)
   * @endcode
   *
   * @param fd - File descriptor to close
   * @return < 0 on error
   */
  sceIoClose :: proc(fd: sce.UID) -> c.int ---

  /**
   * Read input
   *
   * @par Example:
   * @code
   * bytes_read = sceIoRead(fd, data, 100)
   * @endcode
   *
   * @param fd    - Opened file descriptor to read from
   * @param buf   - Pointer to the buffer where the read data will be placed
   * @param nbyte - Size of the read in bytes
   *
   * @return The number of bytes read
   */
  sceIoRead :: proc(fd: sce.UID, buf: rawptr, nbyte: sce.Size) -> sce.SSize ---

  /**
   * Read input at offset
   *
   * @par Example:
   * @code
   * bytes_read = sceIoPread(fd, data, 100, 0x1000)
   * @endcode
   *
   * @param fd - Opened file descriptor to read from
   * @param data - Pointer to the buffer where the read data will be placed
   * @param size - Size of the read in bytes
   * @param offset - Offset to read
   *
   * @return < 0 on error.
   */
  sceIoPread :: proc(fd: sce.UID, data: rawptr, size: sce.Size, offset: sce.Off) -> c.int ---

  /**
   * Write output
   *
   * @par Example:
   * @code
   * bytes_written = sceIoWrite(fd, data, 100)
   * @endcode
   *
   * @param fd    - Opened file descriptor to write to
   * @param buf   - Pointer to the data to write
   * @param nbyte - Size of data to write
   *
   * @return The number of bytes written
   */
  sceIoWrite :: proc(fd: sce.UID, buf: rawptr, nbyte: sce.Size) -> sce.SSize ---

  /**
   * Write output at offset
   *
   * @par Example:
   * @code
   * bytes_written = sceIoPwrite(fd, data, 100, 0x1000)
   * @endcode
   *
   * @param fd - Opened file descriptor to write to
   * @param data - Pointer to the data to write
   * @param size - Size of data to write
   * @param offset - Offset to write
   *
   * @return The number of bytes written
   */
  sceIoPwrite :: proc(fd: sce.UID, data: rawptr, size: sce.Size, offset: sce.Off) -> c.int ---

  /**
   * Reposition read/write file descriptor offset
   *
   * @par Example:
   * @code
   * pos = sceIoLseek(fd, -10, SCE_SEEK_END)
   * @endcode
   *
   * @param fd - Opened file descriptor with which to seek
   * @param offset - Relative offset from the start position given by whence
   * @param whence - One of ::SceIoSeekMode.
   *
   * @return The position in the file after the seek.
   */
  sceIoLseek :: proc(fd: sce.UID, offset: sce.Off, whence: SceIoSeekMode) -> sce.Off ---

  /**
   * Reposition read/write file descriptor offset (32bit mode)
   *
   * @par Example:
   * @code
   * pos = sceIoLseek32(fd, -10, SCE_SEEK_END)
   * @endcode
   *
   * @param fd - Opened file descriptor with which to seek
   * @param offset - Relative offset from the start position given by whence
   * @param whence - One of ::SceIoSeekMode.
   *
   * @return The position in the file after the seek.
   */
  sceIoLseek32 :: proc(fd: sce.UID, offset: c.long, whence: SceIoSeekMode) -> c.long ---

  /**
   * Remove directory entry
   *
   * @param file - Path to the file to remove
   * @return < 0 on error
   */
  sceIoRemove :: proc(file: cstring) -> c.int ---

  /**
   * Change the name of a file
   *
   * @param oldname - The old filename
   * @param newname - The new filename
   * @return < 0 on error.
   */
  sceIoRename :: proc(oldname: cstring, newname: cstring) -> c.int ---

  /**
    * Synchronize the file data on the device.
    *
    * @param device - The device to synchronize (e.g. msfat0:)
    * @param unk - Unknown
    */
  sceIoSync :: proc(device: cstring, flag: c.int) -> c.int ---

  /**
   * Synchronize the file data for one file
   *
   * @param fd   - Opened file descriptor to sync
   * @param flag - unknown
   *
   * @return < 0 on error.
   */
  sceIoSyncByFd :: proc(fd: sce.UID, flag: c.int) -> c.int ---

  /**
    * Cancel an asynchronous operation on a file descriptor.
    *
    * @param fd - The file descriptor to perform cancel on.
    *
    * @return < 0 on error.
    */
  sceIoCancel :: proc(fd: sce.UID) -> c.int ---

  sceIoGetPriority :: proc(fd: sce.UID) -> c.int ---
  sceIoGetProcessDefaultPriority :: proc() -> c.int ---
  sceIoGetThreadDefaultPriority :: proc() -> c.int ---
  sceIoSetPriority :: proc(fd: sce.UID, priority: c.int) -> c.int ---
  sceIoSetProcessDefaultPriority :: proc(priority: c.int) -> c.int ---
  sceIoSetThreadDefaultPriority :: proc(priority: c.int) -> c.int ---
}

foreign iofilemgrkern {
  /**
  * Send a devctl command to a device.
  *
  * @par Example: Sending a simple command to a device
  * @code
  * SceIoDevInfo info
  * ksceIoDevctl("ux0:", 0x3001, NULL, 0, &info, sizeof(SceIoDevInfo))
  * @endcode
  *
  * @param dev - String for the device to send the devctl to (e.g. "ux0:")
  * @param cmd - The command to send to the device
  * @param indata - A data block to send to the device, if NULL sends no data
  * @param inlen - Length of indata, if 0 sends no data
  * @param outdata - A data block to receive the result of a command, if NULL receives no data
  * @param outlen - Length of outdata, if 0 receives no data
  * @return 0 on success, < 0 on error
  */
  ksceIoDevctl :: proc(dev: cstring, cmd: c.uint, indata: rawptr, inlen: c.int, outdata: rawptr, outlen: c.int) -> c.int ---

  /**
  * Open a directory
  *
  * @par Example:
  * @code
  * int dfd
  * dfd = ksceIoDopen("device:/")
  * if(dfd >= 0)
  * { Do something with the file descriptor }
  * @endcode
  * @param dirname - The directory to open for reading.
  * @return If >= 0 then a valid file descriptor, otherwise a Sony error code.
  */
  ksceIoDopen :: proc(dirname: cstring) -> sce.UID ---

  /**
  * Reads an entry from an opened file descriptor.
  *
  * @param fd - Already opened file descriptor (using ::ksceIoDopen)
  * @param dir - Pointer to an ::SceIoDirent structure to hold the file information
  *
  * @return Read status
  * -   0 - No more directory entries left
  * - > 0 - More directory entries to go
  * - < 0 - Error
  */
  ksceIoDread :: proc(fd: sce.UID, dir: ^SceIoDirent) -> c.int ---

  /**
  * Close an opened directory file descriptor
  *
  * @param fd - Already opened file descriptor (using ::ksceIoDopen)
  * @return < 0 on error
  */
  ksceIoDclose :: proc(fd: sce.UID) -> c.int ---

  /**
   * Open or create a file for reading or writing
   *
   * @par Example1: Open a file for reading
   * @code
   * if(!(fd = ksceIoOpen("device:/path/to/file", SCE_O_RDONLY, 0777)) {
   *	// error
   * }
   * @endcode
   * @par Example2: Open a file for writing, creating it if it doesn't exist
   * @code
   * if(!(fd = ksceIoOpen("device:/path/to/file", SCE_O_WRONLY|SCE_O_CREAT, 0777)) {
   *	// error
   * }
   * @endcode
   *
   * @param file - Pointer to a string holding the name of the file to open
   * @param flags - Libc styled flags that are or'ed together
   * @param mode - File access mode (One or more ::SceIoMode).
   * @return A non-negative integer is a valid fd, anything else an error
   */
  ksceIoOpen :: proc(file: cstring, flags: c.int, mode: sce.Mode) -> sce.UID ---

  /**
   * Delete a descriptor
   *
   * @code
   * ksceIoClose(fd)
   * @endcode
   *
   * @param fd - File descriptor to close
   * @return < 0 on error
   */
  ksceIoClose :: proc(fd: sce.UID) -> c.int ---

  /**
   * Read input
   *
   * @par Example:
   * @code
   * bytes_read = ksceIoRead(fd, data, 100)
   * @endcode
   *
   * @param fd - Opened file descriptor to read from
   * @param data - Pointer to the buffer where the read data will be placed
   * @param size - Size of the read in bytes
   *
   * @return The number of bytes read
   */
  ksceIoRead :: proc(fd: sce.UID, data: rawptr, size: sce.Size) -> c.int ---

  /**
   * Read input at offset
   *
   * @par Example:
   * @code
   * bytes_read = ksceIoPread(fd, data, 100, 0x1000)
   * @endcode
   *
   * @param fd - Opened file descriptor to read from
   * @param data - Pointer to the buffer where the read data will be placed
   * @param size - Size of the read in bytes
   * @param offset - Offset to read
   *
   * @return < 0 on error.
   */
  ksceIoPread :: proc(fd: sce.UID, data: rawptr, size: sce.Size, offset: sce.Off) -> c.int ---

  /**
   * Write output
   *
   * @par Example:
   * @code
   * bytes_written = ksceIoWrite(fd, data, 100)
   * @endcode
   *
   * @param fd - Opened file descriptor to write to
   * @param data - Pointer to the data to write
   * @param size - Size of data to write
   *
   * @return The number of bytes written
   */
  ksceIoWrite :: proc(fd: sce.UID, data: rawptr, size: sce.Size) -> c.int ---

  /**
   * Write output at offset
   *
   * @par Example:
   * @code
   * bytes_written = ksceIoPwrite(fd, data, 100, 0x1000)
   * @endcode
   *
   * @param fd - Opened file descriptor to write to
   * @param data - Pointer to the data to write
   * @param size - Size of data to write
   * @param offset - Offset to write
   *
   * @return The number of bytes written
   */
  ksceIoPwrite :: proc(fd: sce.UID, data: rawptr, size: sce.Size, offset: sce.Off) -> c.int ---

  /**
   * Reposition read/write file descriptor offset
   *
   * @par Example:
   * @code
   * pos = ksceIoLseek(fd, -10, SCE_SEEK_END)
   * @endcode
   *
   * @param fd - Opened file descriptor with which to seek
   * @param offset - Relative offset from the start position given by whence
   * @param whence - One of ::SceIoSeekMode.
   *
   * @return The position in the file after the seek.
   */
  ksceIoLseek :: proc(fd: sce.UID, offset: sce.Off, whence: c.int) -> sce.Off ---

  /**
   * Remove directory entry
   *
   * @param file - Path to the file to remove
   * @return < 0 on error
   */
  ksceIoRemove :: proc(file: cstring) -> c.int ---

  /**
   * Change the name of a file
   *
   * @param oldname - The old filename
   * @param newname - The new filename
   * @return < 0 on error.
   */
  ksceIoRename :: proc(oldname: cstring, newname: cstring) -> c.int ---

  /**
    * Synchronize the file data on the device.
    *
    * @param device - The device to synchronize (e.g. msfat0:)
    * @param unk - Unknown
    */
  ksceIoSync :: proc(device: cstring, unk: c.uint) -> c.int ---

  /**
   * Synchronize the file data for one file
   *
   * @param fd - Opened file descriptor to sync
   *
   * @return < 0 on error.
   */
  ksceIoSyncByFd :: proc(fd: sce.UID) -> c.int ---

  /**
   * Make a directory file
   *
   * @param dir - The path to the directory
   * @param mode - Access mode (One or more ::SceIoAccessMode).
   * @return Returns the value 0 if it's successful, otherwise -1
   */
  ksceIoMkdir :: proc(dir: cstring, mode: sce.Mode) -> c.int ---

  /**
   * Remove a directory file
   *
   * @param path - Removes a directory file pointed by the string path
   * @return Returns the value 0 if it's successful, otherwise -1
   */
  ksceIoRmdir :: proc(path: cstring) -> c.int ---

  /**
    * Get the status of a file.
    *
    * @param file - The path to the file.
    * @param stat - A pointer to a ::SceIoStat structure.
    *
    * @return < 0 on error.
    */
  ksceIoGetstat :: proc(file: cstring, stat: SceIoStat) -> c.int ---

  /**
    * Get the status of a file descriptor.
    *
    * @param fd - The file descriptor.
    * @param stat - A pointer to a ::SceIoStat structure.
    *
    * @return < 0 on error.
    */
  ksceIoGetstatByFd :: proc(fd: sce.UID, stat: ^SceIoStat) -> c.int ---

  /**
    * Change the status of a file.
    *
    * @param file - The path to the file.
    * @param stat - A pointer to a ::SceIoStat structure.
    * @param bits - Bitmask defining which bits to change.
    *
    * @return < 0 on error.
    */
  ksceIoChstat :: proc(file: cstring, stat: ^SceIoStat, bits: c.int) -> c.int ---

  /**
    * Change the status of a file descriptor.
    *
    * @param fd - The file descriptor.
    * @param stat - A pointer to an io_stat_t structure.
    * @param bits - Bitmask defining which bits to change.
    *
    * @return < 0 on error.
    */
  ksceIoChstatByFd :: proc(fd: sce.UID, stat: ^SceIoStat, bits: c.int) -> c.int ---
}

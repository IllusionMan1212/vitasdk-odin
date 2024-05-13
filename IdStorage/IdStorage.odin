package idstorage

import "core:c"
import sce "../common"

foreign import idstorage "system:SceIdStorageForDriver_stub"

foreign idstorage {
  /**
  * @param[in]  leafnum - The read target leaf number
  * @param[out] buf     - The leaf data buffer pointer, size is 512 byte
  *
  * @return 0 on success, < 0 on error.
  */
  ksceIdStorageReadLeaf :: proc(leafnum: sce.Size, buf: rawptr) -> c.int ---

  /**
  * @param[in] leafnum - The write target leaf number
  * @param[in] buf     - The leaf data buffer pointer, size is 512 byte
  *
  * @return 0 on success, < 0 on error.
  *
  * note - Writing to leaf requires manufacturing mode.
  */
  ksceIdStorageWriteLeaf :: proc(leafnum: sce.Size, buf: rawptr) -> c.int ---
}

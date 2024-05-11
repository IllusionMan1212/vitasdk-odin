package dmac

import "core:c"
import sce "../common"
import "base:intrinsics"

foreign import dmac "system:SceKernelDmacMgr_stub"
foreign import dmac5 "system:SceSblSsMgr_stub"

@(link_prefix = "sceDmac")
foreign dmac {
  /**
  * DMA memcpy
  *
  * @param[in] dst - Destination
  * @param[in] src - Source
  * @param[in] size - Size
  *
  * @return < 0 on error.
  */
  Memcpy :: proc(dst: rawptr, src: rawptr, size: sce.Size) -> c.int ---

  /**
  * DMA memset
  *
  * @param[in] dst  - Destination
  * @param[in] ch   - The character
  * @param[in] size - Size
  *
  * @return < 0 on error.
  */
  Memset :: proc(dst: rawptr, ch: c.int, size: sce.Size) -> c.int ---
}

AesCbcEnc :: #force_inline proc(src: rawptr, dst: rawptr, length: sce.Size, key: rawptr, keysize: sce.Size, iv: rawptr) -> c.int {
	param := SceSblDmac5EncDecParam{src = src, dst = dst, length = length, key = key, keysize = keysize, iv = iv}

	return EncDec(
		&param,
		1 | 8 | (((auto_cast keysize << 2) - 0x100) & 0x300)
	)
}

AesCbcDec :: #force_inline proc(src: rawptr, dst: rawptr, length: sce.Size, key: rawptr, keysize: sce.Size, iv: rawptr) -> c.int {
	param := SceSblDmac5EncDecParam{src = src, dst = dst, length = length, key = key, keysize = keysize, iv = iv}

	return EncDec(
		&param,
		2 | 8 | (((auto_cast keysize << 2) - 0x100) & 0x300)
	)
}

AesCtrEnc :: #force_inline proc(src: rawptr, dst: rawptr, length: sce.Size, key: rawptr, keysize: sce.Size, iv: rawptr) -> c.int {
	param := SceSblDmac5EncDecParam{src = src, dst = dst, length = length, key = key, keysize = keysize, iv = iv}

	return EncDec(
		&param,
		1 | 0x20 | (((auto_cast keysize << 2) - 0x100) & 0x300)
	)
}

AesCtrDec :: #force_inline proc(src: rawptr, dst: rawptr, length: sce.Size, key: rawptr, keysize: sce.Size, iv: rawptr) -> c.int {
	param := SceSblDmac5EncDecParam{src = src, dst = dst, length = length, key = key, keysize = keysize, iv = iv}

	return EncDec(
		&param,
		2 | 0x20 | (((auto_cast keysize << 2) - 0x100) & 0x300)
	)
}

Sha256Digest :: #force_inline proc(src: rawptr, dst: rawptr, length: sce.Size) -> c.int {
	ctx: SceSblDmac5HashTransformContext
	param := SceSblDmac5HashTransformParam{src = src, dst = dst, length = length, key = c.NULL, keysize = 0, ctx = &ctx}

	ctx.state[0] = auto_cast intrinsics.byte_swap(u32(0x6a09e667))
	ctx.state[1] = auto_cast intrinsics.byte_swap(u32(0xbb67ae85))
	ctx.state[2] = auto_cast intrinsics.byte_swap(u32(0x3c6ef372))
	ctx.state[3] = auto_cast intrinsics.byte_swap(u32(0xa54ff53a))
	ctx.state[4] = auto_cast intrinsics.byte_swap(u32(0x510e527f))
	ctx.state[5] = auto_cast intrinsics.byte_swap(u32(0x9b05688c))
	ctx.state[6] = auto_cast intrinsics.byte_swap(u32(0x1f83d9ab))
	ctx.state[7] = auto_cast intrinsics.byte_swap(u32(0x5be0cd19))
	ctx.length = 0

	return HashTransform(
		&param,
		3 | 0x10, 0x800
	)
}

@(link_prefix = "sceSblDmac5")
foreign dmac5 {
  /**
  * @brief Execute DMAC5 encdec command
  *
  * @param[inout] param   - The encdec param.
  * @param[in]    command - The DMAC5 encdec command.
  *
  * @return 0 on success, else < 0.
  */
  EncDec :: proc(param: ^SceSblDmac5EncDecParam, command: sce.UInt32) -> c.int ---


  /**
  * @brief Execute DMAC5 hash transform command
  *
  * @param[inout] param   - The encdec param.
  * @param[in]    command - The DMAC5 hash base command.
  * @param[in]    extra   - The DMAC5 extra command.
  *
  * @return 0 on success, else < 0.
  */
  HashTransform :: proc(param: ^SceSblDmac5HashTransformParam, command: sce.UInt32, extra: sce.UInt32) -> c.int ---
}

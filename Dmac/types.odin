package dmac

import "core:c"
import sce "../common"

SceSblDmac5EncDecParam :: struct { // size is 0x18-bytes
  src: rawptr, //<! The operation input buffer
	dst: rawptr,       //<! The operation output buffer
	length: sce.Size,  //<! The src data length
	key: rawptr, //<! The key data
	keysize: sce.Size, //<! The key size in bits
	iv: rawptr,        //<! The initialization vector
}
when size_of(rawptr) == 4 {
	#assert(size_of(SceSblDmac5EncDecParam) == 0x18)
}

SceSblDmac5HashTransformContext :: struct { // size is 0x28-bytes
  state: [8]sce.UInt32,
	length: sce.UInt64,
}
#assert(size_of(SceSblDmac5HashTransformContext) == 0x28)

SceSblDmac5HashTransformParam :: struct { // size is 0x18-bytes
  src: rawptr, //<! The operation input buffer
	dst: rawptr,       //<! The operation output buffer
	length: sce.Size,  //<! The src data length
	key: rawptr, //<! The key data
	keysize: sce.Size, //<! The key size in bits
	ctx: rawptr,       //<! SceSblDmac5HashTransformContext Or another context of size 0x10-bytes
}
when size_of(rawptr) == 4 {
	#assert(size_of(SceSblDmac5HashTransformParam) == 0x18)
}


package fiber

import "core:c"
import sce "../common"

// Error Codes

// TODO: should be c.int
SceFiberErrorCode :: enum c.uint {
	NULL       = 0x80590001,
	ALIGNMENT  = 0x80590002,
	RANGE      = 0x80590003,
	INVALID    = 0x80590004,
	PERMISSION = 0x80590005,
	STATE      = 0x80590006,
	BUSY       = 0x80590007,
	AGAIN      = 0x80590008,
	FATAL      = 0x80590009
}

SceFiber :: struct #align(8) {
  reserved: [128]c.char,
}
#assert(size_of(SceFiber) == 0x80)

SceFiberOptParam :: struct #align(8) {
	reserved: [128]c.char,
}
#assert(size_of(SceFiberOptParam) == 0x80)

SceFiberEntry :: #type proc(argOnInitialize: sce.UInt32, argOnRun: sce.UInt32)

SceFiberInfo :: struct #align(8) {
	entry: ^SceFiberEntry,
	argOnInitialize: sce.UInt32,
  addrContext: rawptr,
	sizeContext: sce.Size,
	name: [32]c.char,
	padding: [80]c.uint,
}
when size_of(rawptr) == 4 {
  #assert(size_of(SceFiberInfo) == 0x170)
}


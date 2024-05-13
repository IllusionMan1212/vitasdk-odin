package fiber

import "core:c"
import sce "../common"

foreign import _fiber "system:SceFiber_stub"

foreign _fiber {
	_sceFiberInitializeImpl :: proc(
		fiber: ^SceFiber,
		name: cstring,
		entry: ^SceFiberEntry,
		argOnInitialize: sce.UInt32,
		addrContext: rawptr,
		sizeContext: sce.Size,
		params: ^SceFiberOptParam) -> sce.Int32 ---
	sceFiberOptParamInitialize :: proc(optParam: ^SceFiberOptParam) -> sce.Int32 ---
	sceFiberFinalize :: proc(fiber: ^SceFiber) -> sce.Int32 ---
	sceFiberRun :: proc(fiber: ^SceFiber, argOnRunTo: sce.UInt32, argOnRun: ^sce.UInt32) -> sce.Int32 ---
	sceFiberSwitch :: proc(fiber: ^SceFiber, argOnRunTo: sce.UInt32, argOnRun: ^sce.UInt32) -> sce.Int32 ---
	sceFiberGetSelf :: proc(fiber: SceFiber) -> sce.Int32 ---
	sceFiberReturnToThread :: proc(argOnReturn: sce.UInt32, argOnRun: ^sce.UInt32) -> sce.Int32 ---
	sceFiberGetInfo :: proc(fiber: ^SceFiber, fiberInfo: ^SceFiberInfo) -> sce.Int32 ---
}


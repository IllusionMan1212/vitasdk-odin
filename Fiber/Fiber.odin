package fiber

import "core:c"
import sce "../common"

foreign import _fiber "system:SceFiber_stub"

@(link_prefix = "sceFiber")
foreign _fiber {
	@(link_name = "_sceFiberInitializeImpl")
	InitializeImpl :: proc(
		fiber: ^SceFiber,
		name: cstring,
		entry: ^SceFiberEntry,
		argOnInitialize: sce.UInt32,
		addrContext: rawptr,
		sizeContext: sce.Size,
		params: ^SceFiberOptParam) -> sce.Int32 ---
	OptParamInitialize :: proc(optParam: ^SceFiberOptParam) -> sce.Int32 ---
	Finalize :: proc(fiber: ^SceFiber) -> sce.Int32 ---
	Run :: proc(fiber: ^SceFiber, argOnRunTo: sce.UInt32, argOnRun: ^sce.UInt32) -> sce.Int32 ---
	Switch :: proc(fiber: ^SceFiber, argOnRunTo: sce.UInt32, argOnRun: ^sce.UInt32) -> sce.Int32 ---
	GetSelf :: proc(fiber: SceFiber) -> sce.Int32 ---
	ReturnToThread :: proc(argOnReturn: sce.UInt32, argOnRun: ^sce.UInt32) -> sce.Int32 ---
	GetInfo :: proc(fiber: ^SceFiber, fiberInfo: ^SceFiberInfo) -> sce.Int32 ---
}


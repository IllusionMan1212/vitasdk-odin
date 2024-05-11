package shacccg

import "core:c"
import sce "../common"

foreign import shacccg "system:SceShaccCg_stub"

@(link_prefix = "sceShaccCg")
foreign shacccg {
	InitializeCompileOptions :: proc(options: ^SceShaccCgCompileOptions) -> c.int ---

	CompileProgram :: proc(#by_ptr options: SceShaccCgCompileOptions, #by_ptr callbacks: SceShaccCgCallbackList, unk: c.int) -> ^SceShaccCgCompileOutput ---

	SetDefaultAllocator :: proc(malloc_cb: #type ^proc "c" (_: c.uint) -> rawptr, free_cb: #type ^proc "c" (_: rawptr)) -> c.int ---

	InitializeCallbackList :: proc(callbacks: ^SceShaccCgCallbackList, defaults: SceShaccCgCallbackDefaults) ---

	DestroyCompileOutput :: proc(output: ^SceShaccCgCompileOutput) ---

	ReleaseCompiler :: proc() ---

	GetVersionString :: proc() -> cstring ---
}

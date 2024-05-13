package shacccg

import "core:c"
import sce "../common"

foreign import shacccg "system:SceShaccCg_stub"

foreign shacccg {
	sceShaccCgInitializeCompileOptions :: proc(options: ^SceShaccCgCompileOptions) -> c.int ---

	sceShaccCgCompileProgram :: proc(#by_ptr options: SceShaccCgCompileOptions, #by_ptr callbacks: SceShaccCgCallbackList, unk: c.int) -> ^SceShaccCgCompileOutput ---

	sceShaccCgSetDefaultAllocator :: proc(malloc_cb: #type ^proc "c" (_: c.uint) -> rawptr, free_cb: #type ^proc "c" (_: rawptr)) -> c.int ---

	sceShaccCgInitializeCallbackList :: proc(callbacks: ^SceShaccCgCallbackList, defaults: SceShaccCgCallbackDefaults) ---

	sceShaccCgDestroyCompileOutput :: proc(output: ^SceShaccCgCompileOutput) ---

	sceShaccCgReleaseCompiler :: proc() ---

	sceShaccCgGetVersionString :: proc() -> cstring ---
}

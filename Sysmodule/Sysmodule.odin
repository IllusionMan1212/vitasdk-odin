package sysmodule

import "core:c"
import sce "../common"

foreign import sysmodule "system:SceSysmodule_stub"

@(link_prefix = "sceSysmodule")
foreign sysmodule {
	/**
	* Load a module.
	*
	* @param[in] id - Module ID to load.
	*
	* @return 0 on success, <0 on error.
	*/
	LoadModule :: proc(id: SceSysmoduleModuleId) -> c.int ---

	/**
	* Unload a module.
	*
	* @param[in] id - Module ID to unload.
	*
	* @return 0 on success, <0 on error.
	*/
	UnloadModule :: proc(id: SceSysmoduleModuleId) -> c.int ---

	/**
	* Check if a module is loaded.
	*
	* @param[in] id - Module ID to check.
	*
	* @return 0 if loaded, <0 otherwise.
	*/
	IsLoaded :: proc(id: SceSysmoduleModuleId) -> c.int ---

	/**
	* Load an internal module.
	*
	* @param[in] id - Module ID to load.
	*
	* @return 0 on success, <0 on error.
	*/
	LoadModuleInternal :: proc(id: SceSysmoduleInternalModuleId) -> c.int ---

	/**
	* Unload an internal module.
	*
	* @param[in] id - Module ID to unload.
	*
	* @return 0 on success, <0 on error.
	*/
	UnloadModuleInternal :: proc(id: SceSysmoduleInternalModuleId) -> c.int ---

	/**
	* Check if an internal module is loaded.
	*
	* @param[in] id - Module ID to check.
	*
	* @return 0 if loaded, <0 otherwise.
	*/
	IsLoadedInternal :: proc(id: SceSysmoduleInternalModuleId) -> c.int ---

	/**
	* Load an internal module with custom arguments.
	*
	* @param[in] id     - Module ID to check.
	* @param[in] args   - Size of passed arguments.
	* @param[in] argp   - Pointer to arguments to pass.
	* @param[in] option - Module load option.
	*
	* @return 0 on success, <0 otherwise.
	*/
	LoadModuleInternalWithArg :: proc(id: SceSysmoduleInternalModuleId, args: sce.Size, argp: rawptr, #by_ptr option: SceSysmoduleOpt) -> c.int ---

	/**
	* Unload an internal module with custom arguments.
	*
	* @param[in] id     - Module ID to check.
	* @param[in] args   - Size of passed arguments.
	* @param[in] argp   - Pointer to arguments to pass.
	* @param[in] option - Module load option.
	*
	* @return 0 on success, <0 otherwise.
	*/
	UnloadModuleInternalWithArg :: proc(id: SceSysmoduleInternalModuleId, args: sce.Size, argp: rawptr, #by_ptr option: SceSysmoduleOpt) -> c.int ---
}

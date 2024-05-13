package promoterutil

import "core:c"
import sce "../common"

foreign import promoterutil "system:ScePromoterUtil_stub"

foreign promoterutil {
	/**
	* Init the promoter utility.
	* \note Needs to be called before using the other functions.
	*
	* @return 0 on success.
	*/
	scePromoterUtilityInit :: proc() -> c.int ---

	/**
	* Deinit the promoter utility.
	*
	* @return 0 on success.
	*/
	scePromoterUtilityExit :: proc() -> c.int ---

	/**
	* Delete a package from the LiveArea.
	*
	* @param[in] *titleid
	*
	* @return 0 on success.
	*/
	scePromoterUtilityDeletePkg :: proc(titleid: cstring) -> c.int ---

	/**
	* Update the LiveArea resources of an app
	*
	* @param[in] *args - see ::ScePromoterUtilityLAUpdate
	*
	* @return 0 on success.
	*/
	scePromoterUtilityUpdateLiveArea :: proc(args: ^ScePromoterUtilityLAUpdate) -> c.int ---

	/**
	* Install Content Manager import contents and create bubbles without checking license files.
	*
	* @param[in] *params - see ::ScePromoterUtilImportParams
	*
	* @return 0 on success.
	*/
	scePromoterUtilityPromoteImport :: proc(params: ^ScePromoterUtilityImportParams) -> c.int ---

	/**
	* Install a package from a directory, and add an icon on the LiveArea.
	*
	* @param[in] *path - the path of the directory where the extracted content of the package is
	* @param sync - pass 0 for asynchronous, 1 for synchronous
	*
	* @return 0 on success.
	*/
	scePromoterUtilityPromotePkg :: proc(path: cstring, sync: c.int) -> c.int ---

	/**
	* Install a package from a directory and generate a rif.
	*
	* @param[in] *path - the path of the directory where the extracted content of the package is
	* @param sync - pass 0 for asynchronous, 1 for synchronous
	*
	* @return 0 on success.
	*/
	scePromoterUtilityPromotePkgWithRif :: proc(path: cstring, sync: c.int) -> c.int ---

	/**
	* Returns the state of an operation.
	*
	* @param[out] *state - the current status, 0 when finished
	*
	* @return < 0 if failed.
	*/
	scePromoterUtilityGetState :: proc(state: ^c.int) -> c.int ---

	/**
	* Returns the result of a finished operation
	*
	* @param[out] *res - the result, 0 on success
	*
	* @return < 0 if failed.
	*/
	scePromoterUtilityGetResult :: proc(res: ^c.int) -> c.int ---

	/**
	* Check if titleid exists
	*
	* @param[out] *res - the result, unknown meaning
	*
	* @return 0 if exists, < 0 otherwise.
	*/
	scePromoterUtilityCheckExist :: proc(titleid: cstring, res: ^c.int) -> c.int ---
}

package promoterutil

import "core:c"
import sce "../common"

foreign import promoterutil "system:ScePromoterUtil_stub"

@(link_prefix = "scePromoterUtility")
foreign promoterutil {
	/**
	* Init the promoter utility.
	* \note Needs to be called before using the other functions.
	*
	* @return 0 on success.
	*/
	Init :: proc() -> c.int ---

	/**
	* Deinit the promoter utility.
	*
	* @return 0 on success.
	*/
	Exit :: proc() -> c.int ---

	/**
	* Delete a package from the LiveArea.
	*
	* @param[in] *titleid
	*
	* @return 0 on success.
	*/
	DeletePkg :: proc(titleid: cstring) -> c.int ---

	/**
	* Update the LiveArea resources of an app
	*
	* @param[in] *args - see ::ScePromoterUtilityLAUpdate
	*
	* @return 0 on success.
	*/
	UpdateLiveArea :: proc(args: ^ScePromoterUtilityLAUpdate) -> c.int ---

	/**
	* Install Content Manager import contents and create bubbles without checking license files.
	*
	* @param[in] *params - see ::ScePromoterUtilImportParams
	*
	* @return 0 on success.
	*/
	PromoteImport :: proc(params: ^ScePromoterUtilityImportParams) -> c.int ---

	/**
	* Install a package from a directory, and add an icon on the LiveArea.
	*
	* @param[in] *path - the path of the directory where the extracted content of the package is
	* @param sync - pass 0 for asynchronous, 1 for synchronous
	*
	* @return 0 on success.
	*/
	PromotePkg :: proc(path: cstring, sync: c.int) -> c.int ---

	/**
	* Install a package from a directory and generate a rif.
	*
	* @param[in] *path - the path of the directory where the extracted content of the package is
	* @param sync - pass 0 for asynchronous, 1 for synchronous
	*
	* @return 0 on success.
	*/
	PromotePkgWithRif :: proc(path: cstring, sync: c.int) -> c.int ---

	/**
	* Returns the state of an operation.
	*
	* @param[out] *state - the current status, 0 when finished
	*
	* @return < 0 if failed.
	*/
	GetState :: proc(state: ^c.int) -> c.int ---

	/**
	* Returns the result of a finished operation
	*
	* @param[out] *res - the result, 0 on success
	*
	* @return < 0 if failed.
	*/
	GetResult :: proc(res: ^c.int) -> c.int ---

	/**
	* Check if titleid exists
	*
	* @param[out] *res - the result, unknown meaning
	*
	* @return 0 if exists, < 0 otherwise.
	*/
	CheckExist :: proc(titleid: cstring, res: ^c.int) -> c.int ---
}

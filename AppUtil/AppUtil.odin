package apputil

import "core:c"
import sce "../common"

foreign import apputil "system:SceAppUtil_stub"

foreign apputil {
	/**
	* Initializes the AppUtil library. Call this before any of the other functions.
	*
	* @param[out] initParam - App init info. Must be initialized with zeros.
	* @param[out] bootParam - App boot info. Must be initialized with zeros.
	*
	* @return 0 on success, < 0 on error.
	*/
	sceAppUtilInit :: proc(initParam: ^SceAppUtilInitParam, bootParam: ^SceAppUtilBootParam) -> c.int ---

	//! Shutdown AppUtil library
	sceAppUtilShutdown :: proc() -> c.int ---

	//! Receive app event
	sceAppUtilReceiveAppEvent :: proc(eventParam: ^SceAppUtilAppEventParam) -> c.int ---

	//! Parse received app event from LiveArea
	sceAppUtilAppEventParseLiveArea :: proc(eventParam: ^SceAppUtilAppEventParam, buffer: [^]c.char) -> c.int ---

	//! Create savedata slot
	sceAppUtilSaveDataSlotCreate :: proc(slotId: c.uint, param: ^SceAppUtilSaveDataSlotParam, mountPoint: ^SceAppUtilSaveDataMountPoint) -> c.int ---

	//! Delete savedata slot
	sceAppUtilSaveDataSlotDelete :: proc(slotId: c.uint, mountPoint: ^SceAppUtilSaveDataMountPoint) -> c.int ---

	//! Set savedata slot param
	sceAppUtilSaveDataSlotSetParam :: proc(slotId: c.uint, param: ^SceAppUtilSaveDataSlotParam, mountPoint: ^SceAppUtilSaveDataMountPoint) -> c.int ---

	//! Get savedata slot param
	sceAppUtilSaveDataSlotGetParam :: proc(slotId: c.uint, param: ^SceAppUtilSaveDataSlotParam, mountPoint: ^SceAppUtilSaveDataMountPoint) -> c.int ---

	//!< Write savedata files and directories
	sceAppUtilSaveDataDataSave :: proc(slot: ^SceAppUtilSaveDataFileSlot, files: ^SceAppUtilSaveDataFile, fileNum: c.uint, mountPoint: ^SceAppUtilSaveDataMountPoint, requiredSizeKB: ^sce.Size) -> c.int ---

	//!< Delete savedata files
	sceAppUtilSaveDataDataRemove :: proc(slot: ^SceAppUtilSaveDataFileSlot, files: ^SceAppUtilSaveDataRemoveItem, fileNum: c.uint, mountPoint: ^SceAppUtilSaveDataMountPoint) -> c.int ---

	//! Mount music data
	sceAppUtilMusicMount :: proc() -> c.int ---

	//! Unmount music data
	sceAppUtilMusicUmount :: proc() -> c.int ---

	//! Mount photo data
	sceAppUtilPhotoMount :: proc() -> c.int ---

	//! Unmount photo data
	sceAppUtilPhotoUmount :: proc() -> c.int ---

	//! Mount cache data
	sceAppUtilCacheMount :: proc() -> c.int ---

	//! Unmount cache data
	sceAppUtilCacheUmount :: proc() -> c.int ---

	//! Get system parameters for int type
	sceAppUtilSystemParamGetInt :: proc(paramId: c.uint, value: ^c.int) -> c.int ---

	//! Get application parameters for string type
	sceAppUtilSystemParamGetString :: proc(paramId: c.uint, buf: [^]sce.Char8, bufSize: sce.Size) -> c.int ---

	//! Get application parameters for int type
	sceAppUtilAppParamGetInt :: proc(paramId: SceAppUtilAppParamId, value: ^c.int) -> c.int ---

	//! Save safe memory
	sceAppUtilSaveSafeMemory :: proc(buf: rawptr, bufSize: sce.Size, offset: sce.Off) -> c.int ---

	//! Load safe memory
	sceAppUtilLoadSafeMemory :: proc(buf: rawptr, bufSize: sce.Size, offset: sce.Off) -> c.int ---

	//! Launch PSN Store
	sceAppUtilStoreBrowse :: proc(param: ^SceAppUtilStoreBrowseParam) -> c.int ---

	//! Get background download status
	sceAppUtilBgdlGetStatus :: proc(stat: ^SceAppUtilBgdlStatus) -> c.int ---

	//! Launch web browser app
	sceAppUtilLaunchWebBrowser :: proc(param: ^SceAppUtilWebBrowserParam) -> c.int ---
}


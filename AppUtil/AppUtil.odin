package apputil

import "core:c"
import sce "../common"

foreign import apputil "system:SceAppUtil_stub"

@(link_prefix = "sceAppUtil")
foreign apputil {
	/**
	* Initializes the AppUtil library. Call this before any of the other functions.
	*
	* @param[out] initParam - App init info. Must be initialized with zeros.
	* @param[out] bootParam - App boot info. Must be initialized with zeros.
	*
	* @return 0 on success, < 0 on error.
	*/
	Init :: proc(initParam: ^SceAppUtilInitParam, bootParam: ^SceAppUtilBootParam) -> c.int ---

	//! Shutdown AppUtil library
	Shutdown :: proc() -> c.int ---

	//! Receive app event
	ReceiveAppEvent :: proc(eventParam: ^SceAppUtilAppEventParam) -> c.int ---

	//! Parse received app event from LiveArea
	AppEventParseLiveArea :: proc(eventParam: ^SceAppUtilAppEventParam, buffer: [^]c.char) -> c.int ---

	//! Create savedata slot
	SaveDataSlotCreate :: proc(slotId: c.uint, param: ^SceAppUtilSaveDataSlotParam, mountPoint: ^SceAppUtilSaveDataMountPoint) -> c.int ---

	//! Delete savedata slot
	SaveDataSlotDelete :: proc(slotId: c.uint, mountPoint: ^SceAppUtilSaveDataMountPoint) -> c.int ---

	//! Set savedata slot param
	SaveDataSlotSetParam :: proc(slotId: c.uint, param: ^SceAppUtilSaveDataSlotParam, mountPoint: ^SceAppUtilSaveDataMountPoint) -> c.int ---

	//! Get savedata slot param
	SaveDataSlotGetParam :: proc(slotId: c.uint, param: ^SceAppUtilSaveDataSlotParam, mountPoint: ^SceAppUtilSaveDataMountPoint) -> c.int ---

	//!< Write savedata files and directories
	SaveDataDataSave :: proc(slot: ^SceAppUtilSaveDataFileSlot, files: ^SceAppUtilSaveDataFile, fileNum: c.uint, mountPoint: ^SceAppUtilSaveDataMountPoint, requiredSizeKB: ^sce.Size) -> c.int ---

	//!< Delete savedata files
	SaveDataDataRemove :: proc(slot: ^SceAppUtilSaveDataFileSlot, files: ^SceAppUtilSaveDataRemoveItem, fileNum: c.uint, mountPoint: ^SceAppUtilSaveDataMountPoint) -> c.int ---

	//! Mount music data
	MusicMount :: proc() -> c.int ---

	//! Unmount music data
	MusicUmount :: proc() -> c.int ---

	//! Mount photo data
	PhotoMount :: proc() -> c.int ---

	//! Unmount photo data
	PhotoUmount :: proc() -> c.int ---

	//! Mount cache data
	CacheMount :: proc() -> c.int ---

	//! Unmount cache data
	CacheUmount :: proc() -> c.int ---

	//! Get system parameters for int type
	SystemParamGetInt :: proc(paramId: c.uint, value: ^c.int) -> c.int ---

	//! Get application parameters for string type
	SystemParamGetString :: proc(paramId: c.uint, buf: [^]sce.Char8, bufSize: sce.Size) -> c.int ---

	//! Get application parameters for int type
	AppParamGetInt :: proc(paramId: SceAppUtilAppParamId, value: ^c.int) -> c.int ---

	//! Save safe memory
	SaveSafeMemory :: proc(buf: rawptr, bufSize: sce.Size, offset: sce.Off) -> c.int ---

	//! Load safe memory
	LoadSafeMemory :: proc(buf: rawptr, bufSize: sce.Size, offset: sce.Off) -> c.int ---

	//! Launch PSN Store
	StoreBrowse :: proc(param: ^SceAppUtilStoreBrowseParam) -> c.int ---

	//! Get background download status
	BgdlGetStatus :: proc(stat: ^SceAppUtilBgdlStatus) -> c.int ---

	//! Launch web browser app
	LaunchWebBrowser :: proc(param: ^SceAppUtilWebBrowserParam) -> c.int ---
}


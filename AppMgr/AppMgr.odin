package appmgr

import "core:c"
import sce "../common"

foreign import appmgr "system:SceAppMgr_stub"
foreign import appmgrkern "system:SceAppMgrForDriver_stub"

foreign appmgr {
	/**
	* Save data on savedata0: partition
	*
	* @param[in] data - Data to save
	*
	* @return 0 on success, < 0 on error.
	*/
	sceAppMgrSaveDataDataSave :: proc(data: ^SceAppMgrSaveDataData) -> c.int ---

	/**
	* Remove data on savedata0: partition
	*
	* @param[in] data - Data to remove
	*
	* @return 0 on success, < 0 on error.
	*/
	sceAppMgrSaveDataDataRemove :: proc(data: ^SceAppMgrSaveDataDataDelete) -> c.int ---

	/**
	* Create a savedata slot
	*
	* @param[in] data - Slot data
	*
	* @return 0 on success, < 0 on error.
	*/
	sceAppMgrSaveDataSlotCreate :: proc(data: ^SceAppMgrSaveDataSlot) -> c.int ---

	/**
	* Get current param of a savedata slot
	*
	* @param[out] data - Slot data
	*
	* @return 0 on success, < 0 on error.
	*/
	sceAppMgrSaveDataSlotGetParam :: proc(data: ^SceAppMgrSaveDataSlot) -> c.int ---

	/**
	* Set current param of a savedata slot
	*
	* @param[in] data - Slot data
	*
	* @return 0 on success, < 0 on error.
	*/
	sceAppMgrSaveDataSlotSetParam :: proc(data: ^SceAppMgrSaveDataSlot) -> c.int ---

	/**
	* Delete a savedata slot
	*
	* @param[in] data - Slot data
	*
	* @return 0 on success, < 0 on error.
	*/
	sceAppMgrSaveDataSlotDelete :: proc(data: ^SceAppMgrSaveDataSlotDelete) -> c.int ---

	/**
	* Get Process ID by Title ID
	*
	* @param[out] pid - Process ID
	* @param[in] name - Title ID
	*
	* @return 0 on success, < 0 on error.
	*/
	sceAppMgrGetIdByName :: proc(pid: ^sce.UID, name: cstring) -> c.int ---

	/**
	* Get Title ID by Process ID
	*
	* @param[in] pid - Process ID
	* @param[out] name - Title ID
	*
	* @return 0 on success, < 0 on error.
	*/
	sceAppMgrGetNameById :: proc(pid: sce.UID, name: cstring) -> c.int ---

	/**
	* Destroy other apps
	*
	* @return 0 on success, < 0 on error.
	*/
	sceAppMgrDestroyOtherApp :: proc() -> c.int ---

	/**
	* Destroy an application by Title ID
	*
	* @param[in] name - Title ID of the application
	*
	* @return 0 on success, < 0 on error.
	*/
	sceAppMgrDestroyAppByName :: proc(name: cstring) -> c.int ---

	/**
	* Destroy an application by Application ID
	*
	* @param[in] appId - Application ID of the application
	*
	* @return 0 on success, < 0 on error.
	*/
	sceAppMgrDestroyAppByAppId :: proc(appId: sce.Int32) -> c.int ---

	/**
	* Get PID of an application for Shell
	*
	* @param[in] appId - Application ID of the application
	*
	* @return The PID on success, < 0 on error.
	*/
	sceAppMgrGetProcessIdByAppIdForShell :: proc(appId: sce.Int32) -> sce.UID ---

	/**
	* Get a list of running applications
	*
	* @param[out] appIds - Array of running application IDs
	* @param[in] count - Max number of running applications to search
	*
	* @return Number of running applications.
	*/
	sceAppMgrGetRunningAppIdListForShell :: proc(appIds: ^sce.Int32, count: c.int) -> c.int ---

	/**
	* Get an application state
	*
	* @param[out] appState - State of the application
	* @param[in] len - sizeof(SceAppMgrState)
	* @param[in] version - Version (?)

	* @return 0 on success, < 0 on error.
	*/
	_sceAppMgrGetAppState :: proc(appState: ^SceAppMgrAppState, len: sce.Size, version: c.uint32_t) -> c.int ---

	/**
	* Receive system event
	*
	* @param[out] systemEvent - Received system event

	* @return 0 on success, < 0 on error.
	*/
	sceAppMgrReceiveSystemEvent :: proc(systemEvent: ^SceAppMgrSystemEvent) -> c.int ---

	/**
	* Copies app param to an array
	*
	* @param[out] param - pointer to a 1024 byte location to store the app param
	*
	* @return 0 on success, < 0 on error.
	*
	* @note App param example: type=LAUNCH_APP_BY_URI&uri=psgm:play?titleid=NPXS10031
	*/
	sceAppMgrGetAppParam :: proc(param: [^]c.char) -> c.int ---

	/**
	* Obtains the BGM port, even when it is not in front
	*
	* @return 0 on success, < 0 on error.
	*
	*/
	sceAppMgrAcquireBgmPort :: proc() -> c.int ---

	/**
	* Release acquired BGM port
	*
	* @return 0 on success, < 0 on error.
	*
	*/
	sceAppMgrReleaseBgmPort :: proc() -> c.int ---

	/**
	* Set infobar state
	*
	* @param[in] visibility - Infobar visibility
	* @param[in] color - Infobar color
	* @param[in] transparency - Infobar transparency
	*
	* @return 0 on success, < 0 on error.
	*
	*/
	sceAppMgrSetInfobarState :: proc(visibility: SceAppMgrInfoBarVisibility, color: SceAppMgrInfoBarColor, transparency: SceAppMgrInfoBarTransparency) -> c.int ---

	/**
	* Load and start a SELF executable
	*
	* @param[in] appPath - Path of the SELF file
	* @param[in] argv - Args to pass to SELF module_start
	* @param[in] optParam - Optional params
	*
	* @return 0 on success, < 0 on error.
	*
	* @note SELF file must be located in app0: partition.
	*/
	sceAppMgrLoadExec :: proc(appPath: cstring, argv: [^]cstring, optParam: ^SceAppMgrExecOptParam) -> c.int ---

	/**
	* Start an application by URI
	*
	* @param[in] flags - Must be 0x20000
	* @param[in] uri - Uri to launch
	*
	* @return 0 on success, < 0 on error.
	*
	* @note If flags != 0x20000, Livearea is opened.
	*/
	sceAppMgrLaunchAppByUri :: proc(flags: c.int, uri: cstring) -> c.int ---

	/**
	* Start an application by Title ID
	*
	* @param[in] name - Title ID of the application
	* @param[in] param - The params passed to the application which can be retrieved with ::sceAppMgrGetAppParam
	* @param[in] optParam - Optional params
	*
	* @return 0 on success, < 0 on error.
	*/
	sceAppMgrLaunchAppByName2 :: proc(name: cstring, param: cstring, optParam: ^SceAppMgrLaunchAppOptParam) -> c.int ---

	/**
	* Start an Application by Title ID
	*
	* @param[in] flags - Usually 0x60000
	* @param[in] name - Title ID of the application
	* @param[in] param - The params passed to the application which can be retrieved with ::sceAppMgrGetAppParam
	*
	* @return 0 on success < 0 on error.
	*/
	sceAppMgrLaunchAppByName :: proc(flags: c.int, name: cstring, param: cstring) -> c.int ---

	/**
	* Start an application by Title ID for Shell
	*
	* @param[in] name - Title ID of the application
	* @param[in] param - The params passed to the application which can be retrieved with ::sceAppMgrGetAppParam
	* @param[in] optParam - Optional params
	*
	* @return Application ID (?)
	*/
	sceAppMgrLaunchAppByName2ForShell :: proc(name: cstring, param: cstring, optParam: ^SceAppMgrLaunchAppOptParam) -> sce.UID ---

	/**
	* Mount game data
	*
	* @param[in] app_path    - example : "ux0:/app/${TITLEID}"
	* @param[in] patch_path  - example : "ux0:/patch/${TITLEID}", "invalid:"
	* @param[in] rif_path    - If NULL the system will automatically search the rif path. example : "ux0:/license/app/${TITLEID}/${HEX}.rif"
	* @param[in] mount_point - Mountpoint output
	*
	* @return 0 on success, < 0 on error.
	*
	*/
	sceAppMgrGameDataMount :: proc(app_path: cstring, patch_path: cstring, rif_path: cstring, mount_point: cstring) -> c.int ---

	/**
	* Mount application data
	*
	* @param[in] id - App data ID
	* @param[in] mount_point - Mountpoint to use
	*
	* @return 0 on success, < 0 on error.
	*
	* @note id: 100 (photo0), 101 (friends), 102 (messages), 103 (near), 105 (music), 108 (calendar)
	*/
	sceAppMgrAppDataMount :: proc(id: c.int, mount_point: cstring) -> c.int ---

	/**
	* Mount application data by Title ID
	*
	* @param[in] id - App data ID
	* @param[in] titleid - Application title ID
	* @param[in] mount_point - Mountpoint to use
	*
	* @return 0 on success, < 0 on error.
	*
	* @note id: 106 (ad), 107 (ad)
	*/
	sceAppMgrAppDataMountById :: proc(id: c.int, titleid: cstring, mount_point: cstring) -> c.int ---

	/**
	* Get application params from SFO descriptor
	*
	* @param[in] pid - Process ID
	* @param[in] param - Param ID in the SFO descriptor
	* @param[out] string - Param data
	* @param[in] length - Length of the param data
	*
	* @return 0 on success, < 0 on error.
	*
	* @note param: 6 (contentid) 8 (category), 9 (stitle/title?), 10 (title/stitle?), 12 (titleid)
	*/
	sceAppMgrAppParamGetString :: proc(pid: c.int, param: c.int, string: cstring, length: sce.Size) -> c.int ---

	/**
	* Get device info
	*
	* @param[in] dev - Device to get info about
	* @param[out] max_size - Capacity of the device
	* @param[out] free_size - Free space of the device
	*
	* @return 0 on success, < 0 on error.
	*
	* @note dev: ux0:
	*/
	sceAppMgrGetDevInfo :: proc(dev: cstring, max_size: ^c.uint64_t, free_size: ^c.uint64_t) -> c.int ---

	/**
	* Mount application data (PSPEmu)
	*
	* @param[in] id - App data ID
	* @param[in] mount_point - Mountpoint to use
	*
	* @return 0 on success, < 0 on error.
	*
	* @note id: 400 (ad), 401 (ad), 402 (ad)
	*/
	sceAppMgrMmsMount :: proc(id: c.int, mount_point: cstring) -> c.int ---

	/**
	* Mount PSPEmu virtual memory stick
	*
	* @param[in] mount_point - Mountpoint to use
	*
	* @return 0 on success, < 0 on error.
	*
	* @note mount_point: ms
	*/
	sceAppMgrPspSaveDataRootMount :: proc(mount_point: cstring) -> c.int ---

	/**
	* Mount working directory
	*
	* @param[in] id - Working directory ID
	* @param[in] mount_point - Mountpoint to use
	*
	* @return 0 on success, < 0 on error.
	*
	* @note id: 200 (td), 201 (td), 203 (td), 204 (td), 206 (td)
	*/
	sceAppMgrWorkDirMount :: proc(id: c.int, mount_point: cstring) -> c.int ---

	/**
	* Mount working directory by Title ID
	*
	* @param[in] id - Working directory ID
	* @param[in] titleid - Application Title ID
	* @param[in] mount_point - Mountpoint to use
	*
	* @return 0 on success, < 0 on error.
	*
	* @note id: 205 (cache0), 207 (td)
	*/
	sceAppMgrWorkDirMountById :: proc(id: c.int, titleid: cstring, mount_point: cstring) -> c.int ---

	/**
	* Unmount a mountpoint
	*
	* @param[in] mount_point - Mountpoint to unmount
	*
	* @return 0 on success, < 0 on error.
	*
	* @note Unmount app0: for example to enable write access to ux0:app/TITLEID
	*/
	sceAppMgrUmount :: proc(mount_point: cstring) -> c.int ---

	/**
	* Convert vs0 path string to a new one usable by applications
	*
	* @param[in] path - Path to convert
	* @param[in] mount_point - Mountpoint to use
	* @param[in] unk - Unknown
	*
	* @return 0 on success, < 0 on error.
	*/
	sceAppMgrConvertVs0UserDrivePath :: proc(path: cstring, mount_point: cstring, unk: c.int) -> c.int ---

	/**
	* Get raw path for a given path
	*
	* @param[out] path               - Path to convert
	* @param[in]  resolved_path      - The input process path
	* @param[in]  resolved_path_size - The input process path length
	*
	* @return 0 on success, < 0 on error.
	*/
	sceAppMgrGetRawPath :: proc(path: cstring, resolved_path: cstring, resolved_path_size: c.int) -> c.int ---

	/**
	* Get the real/resolved path of app0: (where it's actually mounted)
	*
	* @param[in] appId - Use -2 for the current application
	* @param[out] resolved_path - Buffer that will hold the resolved path. It should have enough room to hold 292 characters or it will buffer overflow (noname120).
	*
	* @return 0 on success.
	*/
	sceAppMgrGetRawPathOfApp0ByAppIdForShell :: proc(appId: c.int, resolved_path: [292]c.char) -> c.int ---

	/**
	* Get memory budget info for a running system application
	*
	* @param[out] info - Info related to the memory budget of the running application.
	*
	* @return 0 on success, < 0 on error.
	*
	* @note This function will always return an error if used in a normal application.
	*/
	sceAppMgrGetBudgetInfo :: proc(info: ^SceAppMgrBudgetInfo) -> c.int ---


	/**
	* Get current coredump state for shell
	*
	* @param[out] state - state info output.
	*
	* @return 0 on success, < 0 on error.
	*/
	sceAppMgrGetCoredumpStateForShell :: proc(state: ^SceAppMgrCoredumpState) -> c.int ---

	sceAppMgrDrmOpen :: proc(param: ^SceAppMgrDrmOpenParam) -> sce.Int32 ---

	/**
	* Get AppInfo via syscall directly
	*
	* @param[in]  unk              - unknown maybe titleid
	* @param[out] state            - The app state output buffer pointer
	* @param[in]  syscall_validity - The syscall validity buffer
	*
	* @return 0 on success, < 0 on error.
	*/
	sceAppMgrGetAppInfo :: proc(unk: cstring, state: ^SceAppMgrAppState) -> sce.Int32 ---

	_sceSharedFbOpen :: proc(index: c.int, sysver: c.int) -> sce.UID ---
	sceSharedFbClose :: proc(fb_id: sce.UID) -> c.int ---
	sceSharedFbBegin :: proc(fb_id: sce.UID, info: ^SceSharedFbInfo) -> c.int ---
	sceSharedFbEnd :: proc(fb_id: sce.UID) -> c.int ---
	sceSharedFbGetInfo :: proc(fb_id: sce.UID, info: ^SceSharedFbInfo) -> c.int ---
}

foreign appmgrkern {
	/**
	* @brief       Kill a process.
	* @param[in]   pid The process to kill.
	* @return      Zero on success, else < 0.
	*/
	ksceAppMgrKillProcess :: proc(pid: sce.UID) -> c.int ---

	/**
	* @brief       Launch an application for debugging
	*
	* @param[in] path  Path to the executable to load
	* @param[in] args  Arguments to pass to the executable and to configure appmgr
	* @param[in] arg_size  The size of the args passed in
	* @param[in] type  Set to 0x80000000 for debugging launch
	* @param[in] param pointer to launch params
	* @param unk unknown, set to nullptr
	*
	* @return   pid on success, else < 0.
	*/
	ksceAppMgrLaunchAppByPath :: proc(path: cstring, args: cstring, arg_size: sce.Size, type: c.uint, #by_ptr param: SceAppMgrLaunchParam, unk: rawptr) -> c.int ---
}

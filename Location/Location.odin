package location

import "core:c"
import sce "../common"

foreign import location "system:SceLibLocation_stub"

@(link_prefix = "sceLocation")
foreign location {
	/** Library start */
	Open :: proc(handle: ^SceLocationHandle, locateMethod: SceLocationLocationMethod, headingMethod: SceLocationHeadingMethod) -> sce.Int32 ---

	/** Close library */
	Close :: proc(handle: SceLocationHandle) -> sce.Int32 ---

	/** Reopen library */
	Reopen :: proc(handle: SceLocationHandle, locateMethod: SceLocationLocationMethod, headingMethod: SceLocationHeadingMethod) -> sce.Int32 ---

	/** Get location measurement method */
	GetMethod :: proc(handle: SceLocationHandle, locateMethod: ^SceLocationLocationMethod, headingMethod: ^SceLocationHeadingMethod) -> sce.Int32 ---

	/** Get location information */
	GetLocation :: proc(handle: SceLocationHandle, locationInfo: ^SceLocationLocationInfo) -> sce.Int32 ---

	/** Cancel location information acquisition operation */
	CancelGetLocation :: proc(handle: SceLocationHandle) -> sce.Int32 ---

	/** Start continuous acquisition of location information */
	StartLocationCallback :: proc(handle: SceLocationHandle, distance: sce.UInt32, callback: SceLocationLocationInfoCallback, userdata: rawptr) -> sce.Int32 ---

	/** Stop continuous acquisition of location information */
	StopLocationCallback :: proc(handle: SceLocationHandle) -> sce.Int32 ---

	/** Get direction information */
	GetHeading :: proc(handle: SceLocationHandle, headingInfo: ^SceLocationHeadingInfo) -> sce.Int32 ---

	/** Start continuous acquisition of direction information */
	StartHeadingCallback :: proc(handle: SceLocationHandle, difference: sce.UInt32, callback: SceLocationHeadingInfoCallback, userdata: rawptr) -> sce.Int32 ---

	/** Stop continuous acquisition of direction information */
	StopHeadingCallback :: proc(handle: SceLocationHandle) -> sce.Int32 ---

	/** Allow acquisition of location information */
	Confirm :: proc(handle: SceLocationHandle) -> sce.Int32 ---

	/** Get status of location information acquisition permission dialog */
	ConfirmGetStatus :: proc(handle: SceLocationHandle, status: ^SceLocationDialogStatus) -> sce.Int32 ---

	/** Get result of location information acquisition permission dialog */
	ConfirmGetResult :: proc(handle: SceLocationHandle, result: ^SceLocationDialogResult) -> sce.Int32 ---

	/** Abort location information acquisition permission dialog */
	ConfirmAbort :: proc(handle: SceLocationHandle) -> sce.Int32 ---

	/** Get location information acquisition permission/refusal information */
	GetPermission :: proc(handle: SceLocationHandle, info: ^SceLocationPermissionInfo) -> sce.Int32 ---

	/** Get location information acquisition permission information */
	SetGpsEmulationFile :: proc(filename: cstring) -> sce.Int32 ---
}

package location

import "core:c"
import sce "../common"

foreign import location "system:SceLibLocation_stub"

foreign location {
	/** Library start */
	sceLocationOpen :: proc(handle: ^SceLocationHandle, locateMethod: SceLocationLocationMethod, headingMethod: SceLocationHeadingMethod) -> sce.Int32 ---

	/** Close library */
	sceLocationClose :: proc(handle: SceLocationHandle) -> sce.Int32 ---

	/** Reopen library */
	sceLocationReopen :: proc(handle: SceLocationHandle, locateMethod: SceLocationLocationMethod, headingMethod: SceLocationHeadingMethod) -> sce.Int32 ---

	/** Get location measurement method */
	sceLocationGetMethod :: proc(handle: SceLocationHandle, locateMethod: ^SceLocationLocationMethod, headingMethod: ^SceLocationHeadingMethod) -> sce.Int32 ---

	/** Get location information */
	sceLocationGetLocation :: proc(handle: SceLocationHandle, locationInfo: ^SceLocationLocationInfo) -> sce.Int32 ---

	/** Cancel location information acquisition operation */
	sceLocationCancelGetLocation :: proc(handle: SceLocationHandle) -> sce.Int32 ---

	/** Start continuous acquisition of location information */
	sceLocationStartLocationCallback :: proc(handle: SceLocationHandle, distance: sce.UInt32, callback: SceLocationLocationInfoCallback, userdata: rawptr) -> sce.Int32 ---

	/** Stop continuous acquisition of location information */
	sceLocationStopLocationCallback :: proc(handle: SceLocationHandle) -> sce.Int32 ---

	/** Get direction information */
	sceLocationGetHeading :: proc(handle: SceLocationHandle, headingInfo: ^SceLocationHeadingInfo) -> sce.Int32 ---

	/** Start continuous acquisition of direction information */
	sceLocationStartHeadingCallback :: proc(handle: SceLocationHandle, difference: sce.UInt32, callback: SceLocationHeadingInfoCallback, userdata: rawptr) -> sce.Int32 ---

	/** Stop continuous acquisition of direction information */
	sceLocationStopHeadingCallback :: proc(handle: SceLocationHandle) -> sce.Int32 ---

	/** Allow acquisition of location information */
	sceLocationConfirm :: proc(handle: SceLocationHandle) -> sce.Int32 ---

	/** Get status of location information acquisition permission dialog */
	sceLocationConfirmGetStatus :: proc(handle: SceLocationHandle, status: ^SceLocationDialogStatus) -> sce.Int32 ---

	/** Get result of location information acquisition permission dialog */
	sceLocationConfirmGetResult :: proc(handle: SceLocationHandle, result: ^SceLocationDialogResult) -> sce.Int32 ---

	/** Abort location information acquisition permission dialog */
	sceLocationConfirmAbort :: proc(handle: SceLocationHandle) -> sce.Int32 ---

	/** Get location information acquisition permission/refusal information */
	sceLocationGetPermission :: proc(handle: SceLocationHandle, info: ^SceLocationPermissionInfo) -> sce.Int32 ---

	/** Get location information acquisition permission information */
	sceLocationSetGpsEmulationFile :: proc(filename: cstring) -> sce.Int32 ---
}

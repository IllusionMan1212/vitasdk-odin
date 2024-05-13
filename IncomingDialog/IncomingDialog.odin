package incomingdialog

import "core:c"
import sce "../common"
import sceClib "../Clib"

foreign import incomingdialog "system:SceIncomingDialog_stub"

sceIncomingDialogParamInit :: #force_inline proc(dialogParam: ^SceIncomingDialogParam) {
	sceClib.sceClibMemset(dialogParam, 0x0, size_of(SceIncomingDialogParam))
	dialogParam.sdkVersion = sce.PSP2_SDK_VERSION
}

foreign incomingdialog {
	/**
	* Initialize incoming dialog library, init_type must be 1.
	*/
	sceIncomingDialogInitialize :: proc(init_type: c.int) -> sce.Int32 ---

	/**
	* Open incoming dialog.
	*/
	sceIncomingDialogOpen :: proc(dialogParam: ^SceIncomingDialogParam) -> sce.Int32 ---

	/**
	* Returns current status of incoming dialog.
	*/
	sceIncomingDialogGetStatus :: proc() -> sce.Int32 ---

	/**
	* Force exit to LiveArea and show dialog window
	*/
	sceIncomingDialogSwitchToDialog :: proc() -> sce.Int32 ---

	/**
	* Close incoming dialog.
	*/
	sceIncomingDialogClose :: proc() -> sce.Int32 ---

	/**
	* Finish incoming dialog library
	*/
	sceIncomingDialogFinish :: proc() -> sce.Int32 ---
}

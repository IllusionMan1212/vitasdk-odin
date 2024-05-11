package incomingdialog

import "core:c"
import sce "../common"
import sceClib "../Clib"

foreign import incomingdialog "system:SceIncomingDialog_stub"

sceIncomingDialogParamInit :: #force_inline proc(dialogParam: ^SceIncomingDialogParam) {
	sceClib.Memset(dialogParam, 0x0, size_of(SceIncomingDialogParam))
	dialogParam.sdkVersion = sce.PSP2_SDK_VERSION
}

@(link_prefix = "sceIncomingDialog")
foreign incomingdialog {
	/**
	* Initialize incoming dialog library, init_type must be 1.
	*/
	Initialize :: proc(init_type: c.int) -> sce.Int32 ---

	/**
	* Open incoming dialog.
	*/
	Open :: proc(dialogParam: ^SceIncomingDialogParam) -> sce.Int32 ---

	/**
	* Returns current status of incoming dialog.
	*/
	GetStatus :: proc() -> sce.Int32 ---

	/**
	* Force exit to LiveArea and show dialog window
	*/
	SwitchToDialog :: proc() -> sce.Int32 ---

	/**
	* Close incoming dialog.
	*/
	Close :: proc() -> sce.Int32 ---

	/**
	* Finish incoming dialog library
	*/
	Finish :: proc() -> sce.Int32 ---
}

package commondialog

import "core:c"
import sce "../common"
import sceClib "../Clib"

foreign import commondialog "system:SceCommonDialog_stub"

_sceCommonDialogSetMagicNumber :: #force_inline proc "c" (param: ^SceCommonDialogParam) {
	param := param
	param.magic = SCE_COMMON_DIALOG_MAGIC_NUMBER + (cast(^sce.UInt32)&param)^
}

sceCommonDialogConfigParamInit :: #force_inline proc "c" (param: ^SceCommonDialogConfigParam) {
	sceClib.sceClibMemset(param, 0x0, size_of(SceCommonDialogConfigParam))
	param.language = sce.SceSystemParamLang.MAX_VALUE
	param.enterButtonAssign = sce.SceSystemParamEnterButtonAssign.MAX_VALUE
	param.sdkVersion = sce.PSP2_SDK_VERSION
}

sceMsgDialogParamInit :: #force_inline proc "c" (param: ^SceMsgDialogParam) {
	sceClib.sceClibMemset(param, 0x0, size_of(SceMsgDialogParam))
	_sceCommonDialogSetMagicNumber(&param.commonParam)
	param.sdkVersion = sce.PSP2_SDK_VERSION
}

sceNetCheckDialogParamInit :: #force_inline proc "c" (param: ^SceNetCheckDialogParam) {
	sceClib.sceClibMemset(param, 0x0, size_of(SceNetCheckDialogParam))
	_sceCommonDialogSetMagicNumber(&param.commonParam)
	param.sdkVersion = sce.PSP2_SDK_VERSION
	param.defaultAgeRestriction = SCE_NETCHECK_DIALOG_INITIAL_AGE_RESTRICTION
}

foreign commondialog {
	sceCommonDialogSetConfigParam :: proc(configParam: ^SceCommonDialogConfigParam) -> c.int ---
	sceCommonDialogUpdate :: proc(updateParam: ^SceCommonDialogUpdateParam) -> c.int ---

	sceMsgDialogInit :: proc(#by_ptr param: SceMsgDialogParam) -> c.int ---
	sceMsgDialogGetStatus :: proc() -> SceCommonDialogStatus ---
	sceMsgDialogAbort :: proc() -> c.int ---
	sceMsgDialogGetResult :: proc(result: ^SceMsgDialogResult) -> c.int ---
	sceMsgDialogTerm :: proc() -> c.int ---
	sceMsgDialogClose :: proc() -> c.int ---

	/**
	* Increases the rate of the progress bar in the message dialog
	*
	* @param target - Target progress bar
	* @param delta - Progress rate to increase (%)
	*
	* @return 0 on success, < 0 on error.
	* @note - If NULL is provided as FrameBuf pointer, output is blacked out.
	*/
	sceMsgDialogProgressBarInc :: proc(target: SceMsgDialogProgressBarTarget, delta: sce.UInt32) -> c.int ---

	/**
	* Set the progress rate of the progress bar in the message dialog immediately
	*
	* @param target - Target progress bar
	* @param delta - Progress rate to increase (%)
	*
	* @return 0 on success, < 0 on error.
	* @note - If NULL is provided as FrameBuf pointer, output is blacked out.
	*/
	sceMsgDialogProgressBarSetValue :: proc(target: SceMsgDialogProgressBarTarget, rate: sce.UInt32) -> c.int ---

	/**
	* Set the string displayed in the progress bar of the message dialog immediately
	*
	* @param target - Target progress bar
	* @param barMsg - The string displayed in the progress bar
	*
	* @return 0 on success, < 0 on error.
	* @note - If NULL is provided as FrameBuf pointer, output is blacked out.
	*/
	sceMsgDialogProgressBarSetMsg :: proc(target: SceMsgDialogProgressBarTarget, barMsg: cstring) -> c.int ---

	sceNetCheckDialogInit :: proc(param: ^SceNetCheckDialogParam) -> sce.Int32 ---
	sceNetCheckDialogGetStatus :: proc() -> SceCommonDialogStatus ---
	sceNetCheckDialogAbort :: proc() -> sce.Int32 ---
	sceNetCheckDialogGetResult :: proc(result: ^SceNetCheckDialogResult) -> sce.Int32 ---
	sceNetCheckDialogGetPS3ConnectInfo :: proc(info: ^SceNetCheckDialogPS3ConnectInfo) -> sce.Int32 ---
	sceNetCheckDialogTerm :: proc() -> sce.Int32 ---
}

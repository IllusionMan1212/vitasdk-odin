package ime

import "core:c"
import sce "../common"
import sceClib "../Clib"
import sceCommonDialog "../CommonDialog"

foreign import ime "system:SceIme_stub"

sceImeDialogParamInit :: #force_inline proc(param: ^SceImeDialogParam) {
	sceClib.sceClibMemset(param, 0x0, size_of(SceImeDialogParam))
	sceCommonDialog._sceCommonDialogSetMagicNumber(&param.commonParam)
	param.sdkVersion = sce.PSP2_SDK_VERSION
}

sceImeParamInit :: #force_inline proc(param: ^SceImeParam) {
	sceClib.sceClibMemset(param, 0x0, size_of(SceImeParam))
	param.sdkVersion = sce.PSP2_SDK_VERSION
}

foreign ime {
	sceImeDialogInit :: proc(#by_ptr param: SceImeDialogParam) -> sce.Int32 ---
	sceImeDialogGetStatus :: proc() -> sceCommonDialog.SceCommonDialogStatus ---
	sceImeDialogAbort :: proc() -> sce.Int32 ---
	sceImeDialogGetResult :: proc(result: ^SceImeDialogResult) -> sce.Int32 ---
	sceImeDialogTerm :: proc() -> sce.Int32 ---

	sceImeOpen :: proc(#by_ptr param: SceImeParam) -> sce.Int32 ---
	sceImeUpdate :: proc() -> sce.Int32 ---
	sceImeSetText :: proc(text: [^]sce.WChar16, length: sce.UInt32) -> sce.Int32 ---
	sceImeSetCaret :: proc(#by_ptr caret: SceImeCaret) -> sce.Int32 ---
	sceImeSetPreeditGeometry :: proc(#by_ptr preedit: SceImePreeditGeometry) -> sce.Int32 ---
	sceImeClose :: proc() -> sce.Int32 ---
}

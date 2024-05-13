package pvf

import "core:c"

foreign import pvf "system:ScePvf_stub"

scePvfGetCharGlyphImageClip :: scePvfGetCharGlyphImage_Clip

foreign pvf {
	scePvfNewLib :: proc(initParam: ^ScePvfInitRec, errorCode: ScePvfError) -> ScePvfLibId ---
	scePvfDoneLib :: proc(libID: ScePvfLibId) -> ScePvfError ---
	scePvfSetEM :: proc(libID: ScePvfLibId, emValue: ScePvfFloat32) -> ScePvfError ---
	scePvfSetResolution :: proc(libID: ScePvfLibId, hResolution: ScePvfFloat32, vResolution: ScePvfFloat32) -> ScePvfError ---
	scePvfGetNumFontList :: proc(libID: ScePvfLibId, errorCode: ScePvfError) -> ScePvfInt ---
	scePvfGetFontList :: proc(libID: ScePvfLibId, fontStyleInfo: ^ScePvfFontStyleInfo, arraySize: ScePvfInt) -> ScePvfError ---
	scePvfFindOptimumFont :: proc(libID: ScePvfLibId, fontStyleInfo: ^ScePvfFontStyleInfo, errorCode: ScePvfError) -> ScePvfFontIndex ---
	scePvfFindFont :: proc(libID: ScePvfLibId, fontStyleInfo: ^ScePvfFontStyleInfo, errorCode: ScePvfError) -> ScePvfFontIndex ---
	scePvfGetFontInfoByIndexNumber :: proc(libID: ScePvfLibId, fontStyleInfo: ^ScePvfFontStyleInfo, fontIndex: ScePvfFontIndex) -> ScePvfError ---
	scePvfOpen :: proc(libID: ScePvfLibId, fontIndex: ScePvfFontIndex, mode: ScePvfU32, errorCode: ScePvfError) -> ScePvfFontId ---
	scePvfOpenUserFile :: proc(libID: ScePvfLibId, filename: ScePvfPointer, mode: ScePvfU32, errorCode: ScePvfError) -> ScePvfFontId ---
	scePvfOpenUserFileWithSubfontIndex :: proc(libID: ScePvfLibId, filename: ScePvfPointer, mode: ScePvfU32, subFontIndex: ScePvfU32, errorCode: ScePvfError) -> ScePvfFontId ---
	scePvfOpenUserMemory :: proc(libID: ScePvfLibId, addr: ScePvfPointer, size: ScePvfU32, errorCode: ScePvfError) -> ScePvfFontId ---
	scePvfOpenUserMemoryWithSubfontIndex :: proc(libID: ScePvfLibId, addr: ScePvfPointer, size: ScePvfU32, subFontIndex: ScePvfU32, errorCode: ScePvfError) -> ScePvfFontId ---
	scePvfOpenDefaultJapaneseFontOnSharedMemory :: proc(libID: ScePvfLibId, errorCode: ScePvfError) -> ScePvfFontId ---
	scePvfOpenDefaultLatinFontOnSharedMemory :: proc(libID: ScePvfLibId, errorCode: ScePvfError) -> ScePvfFontId ---
	scePvfClose :: proc(fontID: ScePvfFontId) -> ScePvfError ---
	scePvfFlush :: proc(fontID: ScePvfFontId) -> ScePvfError ---
	scePvfSetCharSize :: proc(fontID: ScePvfFontId, hSize: ScePvfFloat32, vSize: ScePvfFloat32) -> ScePvfError ---
	scePvfSetEmboldenRate :: proc(fontID: ScePvfFontId, emboldenRate: ScePvfFloat32) -> ScePvfError ---
	scePvfSetSkewValue :: proc(fontID: ScePvfFontId, angleX: ScePvfFloat32, angleY: ScePvfFloat32) -> ScePvfError ---
	scePvfIsElement :: proc(fontID: ScePvfFontId, charCode: ScePvfCharCode) -> ScePvfBool ---
	scePvfGetFontInfo :: proc(fontID: ScePvfFontId, fontInfo: ^ScePvfFontInfo) -> ScePvfError ---
	scePvfGetCharInfo :: proc(fontID: ScePvfFontId, charCode: ScePvfCharCode, charInfo: ^ScePvfCharInfo) -> ScePvfError ---
	scePvfGetKerningInfo :: proc(fontID: ScePvfFontId, leftCharCode: ScePvfCharCode, rightCharCode: ScePvfCharCode, pKerningInfo: ^ScePvfKerningInfo) -> ScePvfError ---
	scePvfGetCharImageRect :: proc(fontID: ScePvfFontId, charCode: ScePvfCharCode, rect: ^ScePvfIrect) -> ScePvfError ---
	scePvfGetCharGlyphImage :: proc(fontID: ScePvfFontId, charCode: ScePvfCharCode, imageBuffer: ^ScePvfUserImageBufferRec) -> ScePvfError ---
	scePvfGetCharGlyphImage_Clip :: proc(fontID: ScePvfFontId, charCode: ScePvfCharCode, imageBuffer: ^ScePvfUserImageBufferRec, clipX: ScePvfS32, clipY: ScePvfS32, clipWidth: ScePvfU32, clipHeight: ScePvfU32) -> ScePvfError ---
	scePvfPixelToPointH :: proc(libID: ScePvfLibId, pixel: ScePvfFloat32, errorCode: ScePvfError) -> ScePvfFloat32 ---
	scePvfPixelToPointV :: proc(libID: ScePvfLibId, pixel: ScePvfFloat32, errorCode: ScePvfError) -> ScePvfFloat32 ---
	scePvfPointToPixelH :: proc(libID: ScePvfLibId, point: ScePvfFloat32, errorCode: ScePvfError) -> ScePvfFloat32 ---
	scePvfPointToPixelV :: proc(libID: ScePvfLibId, point: ScePvfFloat32, errorCode: ScePvfError) -> ScePvfFloat32 ---
	scePvfSetAltCharacterCode :: proc(libID: ScePvfLibId, charCode: ScePvfCharCode) -> ScePvfError ---
}

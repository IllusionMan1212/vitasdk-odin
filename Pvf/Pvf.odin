package pvf

import "core:c"
import sce "../common"

foreign import pvf "system:ScePvf_stub"

GetCharGlyphImageClip :: GetCharGlyphImage_Clip

@(link_prefix = "scePvf")
foreign pvf {
	NewLib :: proc(initParam: ^ScePvfInitRec, errorCode: ScePvfError) -> ScePvfLibId ---
	DoneLib :: proc(libID: ScePvfLibId) -> ScePvfError ---
	SetEM :: proc(libID: ScePvfLibId, emValue: ScePvfFloat32) -> ScePvfError ---
	SetResolution :: proc(libID: ScePvfLibId, hResolution: ScePvfFloat32, vResolution: ScePvfFloat32) -> ScePvfError ---
	GetNumFontList :: proc(libID: ScePvfLibId, errorCode: ScePvfError) -> ScePvfInt ---
	GetFontList :: proc(libID: ScePvfLibId, fontStyleInfo: ^ScePvfFontStyleInfo, arraySize: ScePvfInt) -> ScePvfError ---
	FindOptimumFont :: proc(libID: ScePvfLibId, fontStyleInfo: ^ScePvfFontStyleInfo, errorCode: ScePvfError) -> ScePvfFontIndex ---
	FindFont :: proc(libID: ScePvfLibId, fontStyleInfo: ^ScePvfFontStyleInfo, errorCode: ScePvfError) -> ScePvfFontIndex ---
	GetFontInfoByIndexNumber :: proc(libID: ScePvfLibId, fontStyleInfo: ^ScePvfFontStyleInfo, fontIndex: ScePvfFontIndex) -> ScePvfError ---
	Open :: proc(libID: ScePvfLibId, fontIndex: ScePvfFontIndex, mode: ScePvfU32, errorCode: ScePvfError) -> ScePvfFontId ---
	OpenUserFile :: proc(libID: ScePvfLibId, filename: ScePvfPointer, mode: ScePvfU32, errorCode: ScePvfError) -> ScePvfFontId ---
	OpenUserFileWithSubfontIndex :: proc(libID: ScePvfLibId, filename: ScePvfPointer, mode: ScePvfU32, subFontIndex: ScePvfU32, errorCode: ScePvfError) -> ScePvfFontId ---
	OpenUserMemory :: proc(libID: ScePvfLibId, addr: ScePvfPointer, size: ScePvfU32, errorCode: ScePvfError) -> ScePvfFontId ---
	OpenUserMemoryWithSubfontIndex :: proc(libID: ScePvfLibId, addr: ScePvfPointer, size: ScePvfU32, subFontIndex: ScePvfU32, errorCode: ScePvfError) -> ScePvfFontId ---
	OpenDefaultJapaneseFontOnSharedMemory :: proc(libID: ScePvfLibId, errorCode: ScePvfError) -> ScePvfFontId ---
	OpenDefaultLatinFontOnSharedMemory :: proc(libID: ScePvfLibId, errorCode: ScePvfError) -> ScePvfFontId ---
	Close :: proc(fontID: ScePvfFontId) -> ScePvfError ---
	Flush :: proc(fontID: ScePvfFontId) -> ScePvfError ---
	SetCharSize :: proc(fontID: ScePvfFontId, hSize: ScePvfFloat32, vSize: ScePvfFloat32) -> ScePvfError ---
	SetEmboldenRate :: proc(fontID: ScePvfFontId, emboldenRate: ScePvfFloat32) -> ScePvfError ---
	SetSkewValue :: proc(fontID: ScePvfFontId, angleX: ScePvfFloat32, angleY: ScePvfFloat32) -> ScePvfError ---
	IsElement :: proc(fontID: ScePvfFontId, charCode: ScePvfCharCode) -> ScePvfBool ---
	GetFontInfo :: proc(fontID: ScePvfFontId, fontInfo: ^ScePvfFontInfo) -> ScePvfError ---
	GetCharInfo :: proc(fontID: ScePvfFontId, charCode: ScePvfCharCode, charInfo: ^ScePvfCharInfo) -> ScePvfError ---
	GetKerningInfo :: proc(fontID: ScePvfFontId, leftCharCode: ScePvfCharCode, rightCharCode: ScePvfCharCode, pKerningInfo: ^ScePvfKerningInfo) -> ScePvfError ---
	GetCharImageRect :: proc(fontID: ScePvfFontId, charCode: ScePvfCharCode, rect: ^ScePvfIrect) -> ScePvfError ---
	GetCharGlyphImage :: proc(fontID: ScePvfFontId, charCode: ScePvfCharCode, imageBuffer: ^ScePvfUserImageBufferRec) -> ScePvfError ---
	GetCharGlyphImage_Clip :: proc(fontID: ScePvfFontId, charCode: ScePvfCharCode, imageBuffer: ^ScePvfUserImageBufferRec, clipX: ScePvfS32, clipY: ScePvfS32, clipWidth: ScePvfU32, clipHeight: ScePvfU32) -> ScePvfError ---
	PixelToPointH :: proc(libID: ScePvfLibId, pixel: ScePvfFloat32, errorCode: ScePvfError) -> ScePvfFloat32 ---
	PixelToPointV :: proc(libID: ScePvfLibId, pixel: ScePvfFloat32, errorCode: ScePvfError) -> ScePvfFloat32 ---
	PointToPixelH :: proc(libID: ScePvfLibId, point: ScePvfFloat32, errorCode: ScePvfError) -> ScePvfFloat32 ---
	PointToPixelV :: proc(libID: ScePvfLibId, point: ScePvfFloat32, errorCode: ScePvfError) -> ScePvfFloat32 ---
	SetAltCharacterCode :: proc(libID: ScePvfLibId, charCode: ScePvfCharCode) -> ScePvfError ---
}

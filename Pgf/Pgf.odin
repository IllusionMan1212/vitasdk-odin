package pgf

import "core:c"
import sce "../common"

foreign import pgf "system:ScePgf_stub"

foreign pgf {
	sceFontNewLib :: proc(params: ^SceFontNewLibParams, errorCode: ^c.uint) -> SceFontLibHandle ---
	sceFontDoneLib :: proc(libHandle: SceFontLibHandle) -> c.int ---
	sceFontOpen :: proc(libHandle: SceFontLibHandle, index: c.int, mode: c.int, errorCode: ^c.uint) -> SceFontHandle ---
	sceFontOpenUserMemory :: proc(libHandle: SceFontLibHandle, pMemoryFont: rawptr, pMemoryFontSize: sce.Size, errorCode: ^c.uint) -> SceFontHandle ---
	sceFontOpenUserFile :: proc(libHandle: SceFontLibHandle, file: cstring, mode: c.int, errorCode: ^c.uint) -> SceFontHandle ---
	sceFontClose :: proc(fontHandle: SceFontHandle) -> c.int ---
	sceFontGetNumFontList :: proc(libHandle: SceFontLibHandle, errorCode: ^c.uint) -> c.int ---
	sceFontFindOptimumFont :: proc(libHandle: SceFontLibHandle, fontStyle: ^SceFontStyle, errorCode: ^c.uint) -> c.int ---
	sceFontFindFont :: proc(libHandle: SceFontLibHandle, fontStyle: ^SceFontStyle, errorCode: ^c.uint) -> c.int ---
	sceFontGetFontInfo :: proc(fontHandle: SceFontHandle, fontInfo: ^SceFontInfo) -> c.int ---
	sceFontGetFontInfoByIndexNumber :: proc(libHandle: SceFontLibHandle, fontStyle: ^SceFontStyle, unknown: c.int, fontIndex: c.int) -> c.int ---
	sceFontSetResolution :: proc(libHandle: SceFontLibHandle, hRes: c.float, vRes: c.float) -> c.int ---
	sceFontGetFontList :: proc(libHandle: SceFontLibHandle, fontStyle: ^SceFontStyle, numFonts: c.int) -> c.int ---
	sceFontGetCharInfo :: proc(fontHandle: SceFontHandle, charCode: c.uint, charInfo: ^SceFontCharInfo) -> c.int ---
	sceFontGetCharImageRect :: proc(fontHandle: SceFontHandle, charCode: c.uint, charRect: ^SceFontImageRect) -> c.int ---
	sceFontGetCharGlyphImage :: proc(fontHandle: SceFontHandle, charCode: c.uint, glyphImage: ^SceFontGlyphImage) -> c.int ---
	sceFontGetCharGlyphImage_Clip :: proc(fontHandle: SceFontHandle, charCode: c.uint, glyphImage: ^SceFontGlyphImage, clipXPos: c.int, clipYPos: c.int, clipWidth: c.int, clipHeight: c.int) -> c.int ---
	sceFontPixelToPointH :: proc(libHandle: SceFontLibHandle, fontPixelsH: c.float, errorCode: ^c.uint) -> c.float ---
	sceFontPixelToPointV :: proc(libHandle: SceFontLibHandle, fontPixelsV: c.float, errorCode: ^c.uint) -> c.float ---
	sceFontPointToPixelH :: proc(libHandle: SceFontLibHandle, fontPointsH: c.float, errorCode: ^c.uint) -> c.float ---
	sceFontPointToPixelV :: proc(libHandle: SceFontLibHandle, fontPointsV: c.float, errorCode: ^c.uint) -> c.float ---
	sceFontSetAltCharacterCode :: proc(libHandle: SceFontLibHandle, charCode: c.uint) -> c.int ---
	sceFontFlush :: proc(fontHandle: SceFontHandle) -> c.int ---
}

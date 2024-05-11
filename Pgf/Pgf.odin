package pgf

import "core:c"
import sce "../common"

foreign import pgf "system:ScePgf_stub"

@(link_prefix = "sceFont")
foreign pgf {
	NewLib :: proc(params: ^SceFontNewLibParams, errorCode: ^c.uint) -> SceFontLibHandle ---
	DoneLib :: proc(libHandle: SceFontLibHandle) -> c.int ---
	Open :: proc(libHandle: SceFontLibHandle, index: c.int, mode: c.int, errorCode: ^c.uint) -> SceFontHandle ---
	OpenUserMemory :: proc(libHandle: SceFontLibHandle, pMemoryFont: rawptr, pMemoryFontSize: sce.Size, errorCode: ^c.uint) -> SceFontHandle ---
	OpenUserFile :: proc(libHandle: SceFontLibHandle, file: cstring, mode: c.int, errorCode: ^c.uint) -> SceFontHandle ---
	Close :: proc(fontHandle: SceFontHandle) -> c.int ---
	GetNumFontList :: proc(libHandle: SceFontLibHandle, errorCode: ^c.uint) -> c.int ---
	FindOptimumFont :: proc(libHandle: SceFontLibHandle, fontStyle: ^SceFontStyle, errorCode: ^c.uint) -> c.int ---
	FindFont :: proc(libHandle: SceFontLibHandle, fontStyle: ^SceFontStyle, errorCode: ^c.uint) -> c.int ---
	GetFontInfo :: proc(fontHandle: SceFontHandle, fontInfo: ^SceFontInfo) -> c.int ---
	GetFontInfoByIndexNumber :: proc(libHandle: SceFontLibHandle, fontStyle: ^SceFontStyle, unknown: c.int, fontIndex: c.int) -> c.int ---
	SetResolution :: proc(libHandle: SceFontLibHandle, hRes: c.float, vRes: c.float) -> c.int ---
	GetFontList :: proc(libHandle: SceFontLibHandle, fontStyle: ^SceFontStyle, numFonts: c.int) -> c.int ---
	GetCharInfo :: proc(fontHandle: SceFontHandle, charCode: c.uint, charInfo: ^SceFontCharInfo) -> c.int ---
	GetCharImageRect :: proc(fontHandle: SceFontHandle, charCode: c.uint, charRect: ^SceFontImageRect) -> c.int ---
	GetCharGlyphImage :: proc(fontHandle: SceFontHandle, charCode: c.uint, glyphImage: ^SceFontGlyphImage) -> c.int ---
	GetCharGlyphImage_Clip :: proc(fontHandle: SceFontHandle, charCode: c.uint, glyphImage: ^SceFontGlyphImage, clipXPos: c.int, clipYPos: c.int, clipWidth: c.int, clipHeight: c.int) -> c.int ---
	PixelToPointH :: proc(libHandle: SceFontLibHandle, fontPixelsH: c.float, errorCode: ^c.uint) -> c.float ---
	PixelToPointV :: proc(libHandle: SceFontLibHandle, fontPixelsV: c.float, errorCode: ^c.uint) -> c.float ---
	PointToPixelH :: proc(libHandle: SceFontLibHandle, fontPointsH: c.float, errorCode: ^c.uint) -> c.float ---
	PointToPixelV :: proc(libHandle: SceFontLibHandle, fontPointsV: c.float, errorCode: ^c.uint) -> c.float ---
	SetAltCharacterCode :: proc(libHandle: SceFontLibHandle, charCode: c.uint) -> c.int ---
	Flush :: proc(fontHandle: SceFontHandle) -> c.int ---
}

package promoterutil

import "core:c"
import sce "../common"

/** Avalible types for ::ScePromoterUtilityImportParams **/
ScePromoterUtilityPackageType :: enum c.int {
	VITA               = 0x0001,          //!< PSVita Apps
	PSP                = 0x0001,          //!< PSP Games
	PSM                = 0x0003,          //!< PlayStation Mobile
}

/** Parameters for scePromoterUtilityUpdateLiveArea() */
ScePromoterUtilityLAUpdate :: struct {
  titleid: [12]c.char,  //!< Target app.
	path: [128]c.char,    //!< Directory of extracted LA update data.
}
#assert(size_of(ScePromoterUtilityLAUpdate) == 0x8C)

/** Parameters for scePromoterUtilityPromoteImport() */
ScePromoterUtilityImportParams :: struct {
  path: [0x80]c.char, //!< Install path (ux0:/temp/game on PSM/PSV, ux0:/pspemu/temp/game on PSP)
	titleid: [0xC]c.char, //!< Game titleid
	type: ScePromoterUtilityPackageType, //!< Package type
	attribute: c.uint32_t, //!< Additional Attributes (Appears to be 0x1 on PSM content but 0x00 on Vita contents)
	reserved: [0x1C]c.char,
}
#assert(size_of(ScePromoterUtilityImportParams) == 0xB0)


package ngs

import "core:c"
import sce "../common"

SceNgsHRack :: sce.UInt32
#assert(size_of(SceNgsHRack) == 4)
SceNgsHPatch :: sce.UInt32
#assert(size_of(SceNgsHPatch) == 4)
SceNgsHSynSystem :: sce.UInt32 
#assert(size_of(SceNgsHSynSystem) == 4)
SceNgsHVoice :: sce.UInt32
#assert(size_of(SceNgsHVoice) == 4)
SulphaNgsModuleQueryType :: sce.UInt32
#assert(size_of(SulphaNgsModuleQueryType) == 4)
SceNgsModuleID :: sce.UInt32
#assert(size_of(SceNgsModuleID) == 4)
SceNgsSulphaUpdateCallback :: rawptr

SceNgsCallbackFunc :: #type ^proc "c" (#by_ptr callback_info: SceNgsCallbackInfo)

SceNgsRackReleaseCallbackFunc :: SceNgsCallbackFunc
SceNgsModuleCallbackFunc :: SceNgsCallbackFunc
SceNgsParamsErrorCallbackFunc :: SceNgsCallbackFunc

// missing structs
SceNgsVoicePreset :: struct{}
SceNgsBufferInfo :: struct{}
SceNgsSystemInitParams :: struct{}
SceNgsCallbackListInfo :: struct{}
SulphaNgsModuleQuery :: struct{}
SulphaNgsRegistration :: struct{}
SceNgsRackDescription :: struct{}
SceNgsPatchSetupInfo :: struct{}
SceNgsParamsDescriptor :: struct{}
SceNgsCallbackInfo :: struct{}
SceNgsVoiceDefinition :: struct{}


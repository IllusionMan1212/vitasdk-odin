package ngs

import "core:c"
import sce "../common"

foreign import ngs "sceNgs_stub"

foreign ngs {
  sceNgsModuleCheckParamsInRangeInternal :: proc(handle: SceNgsHVoice, module_id: SceNgsModuleID, #by_ptr descriptor: SceNgsParamsDescriptor, size: sce.UInt32) -> sce.Int32 ---
  sceNgsModuleGetNumPresetsInternal :: proc(handle: SceNgsHSynSystem, module_id: SceNgsModuleID, num_presets: ^sce.UInt32) -> sce.Int32 ---
  sceNgsModuleGetPresetInternal :: proc(handle: SceNgsHSynSystem, module_id: SceNgsModuleID, preset_index: sce.UInt32, info: ^SceNgsBufferInfo) -> sce.Int32 ---
  sceNgsPatchCreateRoutingInternal :: proc(#by_ptr info: SceNgsPatchSetupInfo, handle: ^SceNgsHPatch) -> sce.Int32 ---
  sceNgsPatchRemoveRoutingInternal :: proc(handle: SceNgsHPatch) -> sce.Int32 ---
  sceNgsRackGetRequiredMemorySizeInternal :: proc(handle: SceNgsHSynSystem, #by_ptr rack_description: SceNgsRackDescription, user_size: ^sce.UInt32) -> sce.Int32 ---
  sceNgsRackGetVoiceHandleInternal :: proc(rack_handle: SceNgsHRack, index: sce.UInt32, voice_handle: ^SceNgsHVoice) -> sce.Int32 ---
  sceNgsRackInitInternal :: proc(system_handle: SceNgsHSynSystem, rack_buffer: ^SceNgsBufferInfo, #by_ptr rack_description: SceNgsRackDescription, rack_handle: ^SceNgsHRack) -> sce.Int32 ---
  sceNgsRackReleaseInternal :: proc(handle: SceNgsHRack, callback: SceNgsRackReleaseCallbackFunc) -> sce.Int32 ---
  sceNgsRackSetParamErrorCallbackInternal :: proc(rack_handle: SceNgsHRack, callback: SceNgsParamsErrorCallbackFunc) -> sce.Int32 ---
  sceNgsSulphaGetInfoInternal :: proc(#by_ptr obj_reg: SulphaNgsRegistration, info: ^SceNgsBufferInfo) -> sce.Int32 ---
  sceNgsSulphaGetModuleListInternal :: proc(module_ids: ^sce.UInt32, in_array_count: sce.UInt32, count: ^sce.UInt32) -> sce.Int32 ---
  sceNgsSulphaGetSynthUpdateCallbackInternal :: proc(handle: SceNgsHSynSystem, update_callback: ^SceNgsSulphaUpdateCallback, info: ^SceNgsBufferInfo) -> sce.Int32 ---
  sceNgsSulphaQueryModuleInternal :: proc(type: SulphaNgsModuleQueryType, debug: ^SulphaNgsModuleQuery) -> sce.Int32 ---
  sceNgsSulphaSetSynthUpdateCallbackInternal :: proc(handle: SceNgsHSynSystem, update_callback: SceNgsSulphaUpdateCallback, info: ^SceNgsBufferInfo) -> sce.Int32 ---
  sceNgsSystemGetCallbackListInternal :: proc(handle: SceNgsHSynSystem, array: ^[^]SceNgsCallbackListInfo, array_size: ^sce.UInt32) -> sce.Int32 ---
  sceNgsSystemGetRequiredMemorySizeInternal :: proc(#by_ptr params: SceNgsSystemInitParams, size: ^sce.UInt32) -> sce.Int32 ---
  sceNgsSystemInitInternal :: proc(buffer_info: ^SceNgsBufferInfo, compiled_sdk_version: sce.UInt32, #by_ptr params: SceNgsSystemInitParams, handle: ^SceNgsHSynSystem) -> sce.Int32 ---
  sceNgsSystemLockInternal :: proc(handle: SceNgsHSynSystem) -> sce.Int32 ---
  sceNgsSystemPullDataInternal :: proc(handle: SceNgsHSynSystem, dirty_flags_a: sce.UInt32, dirty_flags_b: sce.UInt32) -> sce.Int32 ---
  sceNgsSystemPushDataInternal :: proc(handle: SceNgsHSynSystem) -> sce.Int32 ---
  sceNgsSystemReleaseInternal :: proc(handle: SceNgsHSynSystem) -> sce.Int32 ---
  sceNgsSystemSetFlagsInternal :: proc(handle: SceNgsHSynSystem, system_flags: sce.UInt32) -> sce.Int32 ---
  sceNgsSystemSetParamErrorCallbackInternal :: proc(handle: SceNgsHSynSystem, callback_id: SceNgsParamsErrorCallbackFunc) -> sce.Int32 ---
  sceNgsSystemUnlockInternal :: proc(handle: SceNgsHSynSystem) -> sce.Int32 ---
  sceNgsSystemUpdateInternal :: proc(handle: SceNgsHSynSystem) -> sce.Int32 ---
  sceNgsVoiceBypassModuleInternal :: proc(handle: SceNgsHVoice, module: sce.UInt32, flag: sce.UInt32) -> sce.Int32 ---
  sceNgsVoiceClearDirtyFlagInternal :: proc(handle: SceNgsHVoice, param_bit_flag: sce.UInt32) -> sce.Int32 ---
  sceNgsVoiceDefinitionGetPresetInternal :: proc(#by_ptr definition: SceNgsVoiceDefinition, index: sce.UInt32, presets: ^^SceNgsVoicePreset) -> sce.Int32 ---
  sceNgsVoiceGetModuleBypassInternal :: proc(handle: SceNgsHVoice, module: sce.UInt32, flag: ^sce.UInt32) -> sce.Int32 ---
  sceNgsVoiceGetOutputPatchInternal :: proc(handle: SceNgsHVoice, nOutputIndex: sce.Int32, nSubIndex: sce.Int32, pPatchHandle: ^SceNgsHPatch) -> sce.Int32 ---
  sceNgsVoiceGetParamsOutOfRangeBufferedInternal :: proc(handle: SceNgsHVoice, module: sce.UInt32, message_buffer: [^]c.char) -> sce.Int32 ---
  sceNgsVoiceInitInternal :: proc(handle: SceNgsHVoice, #by_ptr preset: SceNgsVoicePreset, flags: sce.UInt32) -> sce.Int32 ---
  sceNgsVoiceKeyOffInternal :: proc(handle: SceNgsHVoice) -> sce.Int32 ---
  sceNgsVoiceKillInternal :: proc(handle: SceNgsHVoice) -> sce.Int32 ---
  sceNgsVoicePauseInternal :: proc(handle: SceNgsHVoice) -> sce.Int32 ---
  sceNgsVoicePlayInternal :: proc(handle: SceNgsHVoice) -> sce.Int32 ---
  sceNgsVoiceResumeInternal :: proc(handle: SceNgsHVoice) -> sce.Int32 ---
  sceNgsVoiceSetAllBypassesInternal :: proc(handle: SceNgsHVoice, bitflag: sce.UInt32) -> sce.Int32 ---
  sceNgsVoiceSetFinishedCallbackInternal :: proc(handle: SceNgsHVoice, callback: SceNgsCallbackFunc, userdata: rawptr) -> sce.Int32 ---
  sceNgsVoiceSetModuleCallbackInternal :: proc(handle: SceNgsHVoice, module: sce.UInt32, callback: SceNgsModuleCallbackFunc, callback_userdata: rawptr) -> sce.Int32 ---
  sceNgsVoiceSetPresetInternal :: proc(handle: SceNgsHVoice, #by_ptr preset: SceNgsVoicePreset) -> sce.Int32 ---

  sceNgsVoiceDefGetAtrac9VoiceInternal :: proc() -> ^SceNgsVoiceDefinition ---
  sceNgsVoiceDefGetCompressorBussInternal :: proc() -> ^SceNgsVoiceDefinition ---
  sceNgsVoiceDefGetCompressorSideChainBussInternal :: proc() -> ^SceNgsVoiceDefinition ---
  sceNgsVoiceDefGetDelayBussInternal :: proc() -> ^SceNgsVoiceDefinition ---
  sceNgsVoiceDefGetDistortionBussInternal :: proc() -> ^SceNgsVoiceDefinition ---
  sceNgsVoiceDefGetEnvelopeBussInternal :: proc() -> ^SceNgsVoiceDefinition ---
  sceNgsVoiceDefGetEqBussInternal :: proc() -> ^SceNgsVoiceDefinition ---
  sceNgsVoiceDefGetMasterBussInternal :: proc() -> ^SceNgsVoiceDefinition ---
  sceNgsVoiceDefGetMixerBussInternal :: proc() -> ^SceNgsVoiceDefinition ---
  sceNgsVoiceDefGetPauserBussInternal :: proc() -> ^SceNgsVoiceDefinition ---
  sceNgsVoiceDefGetPitchshiftBussInternal :: proc() -> ^SceNgsVoiceDefinition ---
  sceNgsVoiceDefGetReverbBussInternal :: proc() -> ^SceNgsVoiceDefinition ---
  sceNgsVoiceDefGetSasEmuVoiceInternal :: proc() -> ^SceNgsVoiceDefinition ---
  sceNgsVoiceDefGetScreamVoiceAT9Internal :: proc() -> ^SceNgsVoiceDefinition ---
  sceNgsVoiceDefGetScreamVoiceInternal :: proc() -> ^SceNgsVoiceDefinition ---
  sceNgsVoiceDefGetSimpleAtrac9VoiceInternal :: proc() -> ^SceNgsVoiceDefinition ---
  sceNgsVoiceDefGetSimpleVoiceInternal :: proc() -> ^SceNgsVoiceDefinition ---
  sceNgsVoiceDefGetTemplate1Internal :: proc() -> ^SceNgsVoiceDefinition ---
}

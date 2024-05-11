package ngs

import "core:c"
import sce "../common"

foreign import ngs "sceNgs_stub"

@(link_prefix = "sceNgs")
foreign ngs {
  ModuleCheckParamsInRangeInternal :: proc(handle: SceNgsHVoice, module_id: SceNgsModuleID, #by_ptr descriptor: SceNgsParamsDescriptor, size: sce.UInt32) -> sce.Int32 ---
  ModuleGetNumPresetsInternal :: proc(handle: SceNgsHSynSystem, module_id: SceNgsModuleID, num_presets: ^sce.UInt32) -> sce.Int32 ---
  ModuleGetPresetInternal :: proc(handle: SceNgsHSynSystem, module_id: SceNgsModuleID, preset_index: sce.UInt32, info: ^SceNgsBufferInfo) -> sce.Int32 ---
  PatchCreateRoutingInternal :: proc(#by_ptr info: SceNgsPatchSetupInfo, handle: ^SceNgsHPatch) -> sce.Int32 ---
  PatchRemoveRoutingInternal :: proc(handle: SceNgsHPatch) -> sce.Int32 ---
  RackGetRequiredMemorySizeInternal :: proc(handle: SceNgsHSynSystem, #by_ptr rack_description: SceNgsRackDescription, user_size: ^sce.UInt32) -> sce.Int32 ---
  RackGetVoiceHandleInternal :: proc(rack_handle: SceNgsHRack, index: sce.UInt32, voice_handle: ^SceNgsHVoice) -> sce.Int32 ---
  RackInitInternal :: proc(system_handle: SceNgsHSynSystem, rack_buffer: ^SceNgsBufferInfo, #by_ptr rack_description: SceNgsRackDescription, rack_handle: ^SceNgsHRack) -> sce.Int32 ---
  RackReleaseInternal :: proc(handle: SceNgsHRack, callback: SceNgsRackReleaseCallbackFunc) -> sce.Int32 ---
  RackSetParamErrorCallbackInternal :: proc(rack_handle: SceNgsHRack, callback: SceNgsParamsErrorCallbackFunc) -> sce.Int32 ---
  SulphaGetInfoInternal :: proc(#by_ptr obj_reg: SulphaNgsRegistration, info: ^SceNgsBufferInfo) -> sce.Int32 ---
  SulphaGetModuleListInternal :: proc(module_ids: ^sce.UInt32, in_array_count: sce.UInt32, count: ^sce.UInt32) -> sce.Int32 ---
  SulphaGetSynthUpdateCallbackInternal :: proc(handle: SceNgsHSynSystem, update_callback: ^SceNgsSulphaUpdateCallback, info: ^SceNgsBufferInfo) -> sce.Int32 ---
  SulphaQueryModuleInternal :: proc(type: SulphaNgsModuleQueryType, debug: ^SulphaNgsModuleQuery) -> sce.Int32 ---
  SulphaSetSynthUpdateCallbackInternal :: proc(handle: SceNgsHSynSystem, update_callback: SceNgsSulphaUpdateCallback, info: ^SceNgsBufferInfo) -> sce.Int32 ---
  SystemGetCallbackListInternal :: proc(handle: SceNgsHSynSystem, array: ^[^]SceNgsCallbackListInfo, array_size: ^sce.UInt32) -> sce.Int32 ---
  SystemGetRequiredMemorySizeInternal :: proc(#by_ptr params: SceNgsSystemInitParams, size: ^sce.UInt32) -> sce.Int32 ---
  SystemInitInternal :: proc(buffer_info: ^SceNgsBufferInfo, compiled_sdk_version: sce.UInt32, #by_ptr params: SceNgsSystemInitParams, handle: ^SceNgsHSynSystem) -> sce.Int32 ---
  SystemLockInternal :: proc(handle: SceNgsHSynSystem) -> sce.Int32 ---
  SystemPullDataInternal :: proc(handle: SceNgsHSynSystem, dirty_flags_a: sce.UInt32, dirty_flags_b: sce.UInt32) -> sce.Int32 ---
  SystemPushDataInternal :: proc(handle: SceNgsHSynSystem) -> sce.Int32 ---
  SystemReleaseInternal :: proc(handle: SceNgsHSynSystem) -> sce.Int32 ---
  SystemSetFlagsInternal :: proc(handle: SceNgsHSynSystem, system_flags: sce.UInt32) -> sce.Int32 ---
  SystemSetParamErrorCallbackInternal :: proc(handle: SceNgsHSynSystem, callback_id: SceNgsParamsErrorCallbackFunc) -> sce.Int32 ---
  SystemUnlockInternal :: proc(handle: SceNgsHSynSystem) -> sce.Int32 ---
  SystemUpdateInternal :: proc(handle: SceNgsHSynSystem) -> sce.Int32 ---
  VoiceBypassModuleInternal :: proc(handle: SceNgsHVoice, module: sce.UInt32, flag: sce.UInt32) -> sce.Int32 ---
  VoiceClearDirtyFlagInternal :: proc(handle: SceNgsHVoice, param_bit_flag: sce.UInt32) -> sce.Int32 ---
  VoiceDefinitionGetPresetInternal :: proc(#by_ptr definition: SceNgsVoiceDefinition, index: sce.UInt32, presets: ^^SceNgsVoicePreset) -> sce.Int32 ---
  VoiceGetModuleBypassInternal :: proc(handle: SceNgsHVoice, module: sce.UInt32, flag: ^sce.UInt32) -> sce.Int32 ---
  VoiceGetOutputPatchInternal :: proc(handle: SceNgsHVoice, nOutputIndex: sce.Int32, nSubIndex: sce.Int32, pPatchHandle: ^SceNgsHPatch) -> sce.Int32 ---
  VoiceGetParamsOutOfRangeBufferedInternal :: proc(handle: SceNgsHVoice, module: sce.UInt32, message_buffer: [^]c.char) -> sce.Int32 ---
  VoiceInitInternal :: proc(handle: SceNgsHVoice, #by_ptr preset: SceNgsVoicePreset, flags: sce.UInt32) -> sce.Int32 ---
  VoiceKeyOffInternal :: proc(handle: SceNgsHVoice) -> sce.Int32 ---
  VoiceKillInternal :: proc(handle: SceNgsHVoice) -> sce.Int32 ---
  VoicePauseInternal :: proc(handle: SceNgsHVoice) -> sce.Int32 ---
  VoicePlayInternal :: proc(handle: SceNgsHVoice) -> sce.Int32 ---
  VoiceResumeInternal :: proc(handle: SceNgsHVoice) -> sce.Int32 ---
  VoiceSetAllBypassesInternal :: proc(handle: SceNgsHVoice, bitflag: sce.UInt32) -> sce.Int32 ---
  VoiceSetFinishedCallbackInternal :: proc(handle: SceNgsHVoice, callback: SceNgsCallbackFunc, userdata: rawptr) -> sce.Int32 ---
  VoiceSetModuleCallbackInternal :: proc(handle: SceNgsHVoice, module: sce.UInt32, callback: SceNgsModuleCallbackFunc, callback_userdata: rawptr) -> sce.Int32 ---
  VoiceSetPresetInternal :: proc(handle: SceNgsHVoice, #by_ptr preset: SceNgsVoicePreset) -> sce.Int32 ---

  VoiceDefGetAtrac9VoiceInternal :: proc() -> ^SceNgsVoiceDefinition ---
  VoiceDefGetCompressorBussInternal :: proc() -> ^SceNgsVoiceDefinition ---
  VoiceDefGetCompressorSideChainBussInternal :: proc() -> ^SceNgsVoiceDefinition ---
  VoiceDefGetDelayBussInternal :: proc() -> ^SceNgsVoiceDefinition ---
  VoiceDefGetDistortionBussInternal :: proc() -> ^SceNgsVoiceDefinition ---
  VoiceDefGetEnvelopeBussInternal :: proc() -> ^SceNgsVoiceDefinition ---
  VoiceDefGetEqBussInternal :: proc() -> ^SceNgsVoiceDefinition ---
  VoiceDefGetMasterBussInternal :: proc() -> ^SceNgsVoiceDefinition ---
  VoiceDefGetMixerBussInternal :: proc() -> ^SceNgsVoiceDefinition ---
  VoiceDefGetPauserBussInternal :: proc() -> ^SceNgsVoiceDefinition ---
  VoiceDefGetPitchshiftBussInternal :: proc() -> ^SceNgsVoiceDefinition ---
  VoiceDefGetReverbBussInternal :: proc() -> ^SceNgsVoiceDefinition ---
  VoiceDefGetSasEmuVoiceInternal :: proc() -> ^SceNgsVoiceDefinition ---
  VoiceDefGetScreamVoiceAT9Internal :: proc() -> ^SceNgsVoiceDefinition ---
  VoiceDefGetScreamVoiceInternal :: proc() -> ^SceNgsVoiceDefinition ---
  VoiceDefGetSimpleAtrac9VoiceInternal :: proc() -> ^SceNgsVoiceDefinition ---
  VoiceDefGetSimpleVoiceInternal :: proc() -> ^SceNgsVoiceDefinition ---
  VoiceDefGetTemplate1Internal :: proc() -> ^SceNgsVoiceDefinition ---
}

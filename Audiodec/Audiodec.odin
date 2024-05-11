package audiodec

import "core:c"
import sce "../common"

foreign import audiodec "system:SceAudiodec_stub"

@(link_prefix = "sceAudiodec")
foreign audiodec {
  InitLibrary :: proc(codecType: sce.UInt32, pInitParam: ^SceAudiodecInitParam) -> sce.Int32 ---
  TermLibrary :: proc(codecType: sce.UInt32) -> sce.Int32 ---
  CreateDecoder :: proc(pCtrl: ^SceAudiodecCtrl, codecType: sce.UInt32) -> sce.Int32 ---
  DeleteDecoder :: proc(pCtrl: ^SceAudiodecCtrl) -> sce.Int32 ---
  Decode :: proc(pCtrl: ^SceAudiodecCtrl) -> sce.Int32 ---
  DecodeNFrames :: proc(pCtrl: ^SceAudiodecCtrl, nFrames: sce.UInt32) -> sce.Int32 ---
  DecodeNStreams :: proc(pCtrls: []^SceAudiodecCtrl, nStreams: sce.UInt32) -> sce.Int32 ---
  ClearContext :: proc(pCtrl: ^SceAudiodecCtrl) -> sce.Int32 ---
  GetInternalError :: proc(pCtrl: ^SceAudiodecCtrl, pInternalError: ^sce.Int32) -> sce.Int32 ---

  GetContextSize :: proc(pCtrl: ^SceAudiodecCtrl, codecType: sce.UInt32) -> sce.Int32 ---
  CreateDecoderExternal :: proc(pCtrl: ^SceAudiodecCtrl, codecType: sce.UInt32, vaContext: sce.UIntVAddr, contextSize: sce.UInt32) -> sce.Int32 ---
  DeleteDecoderExternal :: proc(pCtrl: ^SceAudiodecCtrl, pvaContext: ^sce.UIntVAddr) -> sce.Int32 ---
}

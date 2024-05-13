package audiodec

import "core:c"
import sce "../common"

foreign import audiodec "system:SceAudiodec_stub"

foreign audiodec {
  sceAudiodecInitLibrary :: proc(codecType: sce.UInt32, pInitParam: ^SceAudiodecInitParam) -> sce.Int32 ---
  sceAudiodecTermLibrary :: proc(codecType: sce.UInt32) -> sce.Int32 ---
  sceAudiodecCreateDecoder :: proc(pCtrl: ^SceAudiodecCtrl, codecType: sce.UInt32) -> sce.Int32 ---
  sceAudiodecDeleteDecoder :: proc(pCtrl: ^SceAudiodecCtrl) -> sce.Int32 ---
  sceAudiodecDecode :: proc(pCtrl: ^SceAudiodecCtrl) -> sce.Int32 ---
  sceAudiodecDecodeNFrames :: proc(pCtrl: ^SceAudiodecCtrl, nFrames: sce.UInt32) -> sce.Int32 ---
  sceAudiodecDecodeNStreams :: proc(pCtrls: []^SceAudiodecCtrl, nStreams: sce.UInt32) -> sce.Int32 ---
  sceAudiodecClearContext :: proc(pCtrl: ^SceAudiodecCtrl) -> sce.Int32 ---
  sceAudiodecGetInternalError :: proc(pCtrl: ^SceAudiodecCtrl, pInternalError: ^sce.Int32) -> sce.Int32 ---

  sceAudiodecGetContextSize :: proc(pCtrl: ^SceAudiodecCtrl, codecType: sce.UInt32) -> sce.Int32 ---
  sceAudiodecCreateDecoderExternal :: proc(pCtrl: ^SceAudiodecCtrl, codecType: sce.UInt32, vaContext: sce.UIntVAddr, contextSize: sce.UInt32) -> sce.Int32 ---
  sceAudiodecDeleteDecoderExternal :: proc(pCtrl: ^SceAudiodecCtrl, pvaContext: ^sce.UIntVAddr) -> sce.Int32 ---
}

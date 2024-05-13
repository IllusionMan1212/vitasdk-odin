package atrac

import "core:c"
import sce "../common"

foreign import atrac "system:SceAtrac_stub"

foreign atrac {
	sceAtracQueryDecoderGroupMemSize :: proc(atracType: sce.UInt32, pDecoderGroup: ^SceAtracDecoderGroup) -> c.int ---
	sceAtracCreateDecoderGroup :: proc(atracType: sce.UInt32, pDecoderGroup: ^SceAtracDecoderGroup, pvWorkMem: rawptr, initAudiodecFlag: c.int) -> c.int ---
	sceAtracDeleteDecoderGroup :: proc(atracType: sce.UInt32, termAudiodecFlag: c.int) -> c.int ---
	sceAtracGetDecoderGroupInfo :: proc(atracType: sce.UInt32, pCreatedDecoder: ^SceAtracDecoderGroup, pAvailableDecoder: ^SceAtracDecoderGroup) -> c.int ---
	sceAtracSetDataAndAcquireHandle :: proc(pucBuffer: [^]sce.UChar8, uiReadSize: sce.UInt32, uiBufferSize: sce.UInt32) -> c.int ---
	sceAtracReleaseHandle :: proc(atracHandle: c.int) -> c.int ---
	sceAtracDecode :: proc(atracHandle: c.int, pOutputBuffer: rawptr, pOutputSamples: ^sce.UInt32, pDecoderStatus: ^sce.UInt32) -> c.int ---
	sceAtracGetStreamInfo :: proc(atracHandle: c.int, pStreamInfo: ^SceAtracStreamInfo) -> c.int ---
	sceAtracAddStreamData :: proc(atracHandle: c.int, addSize: sce.UInt32) -> c.int ---
	sceAtracIsSubBufferNeeded :: proc(atracHandle: c.int) -> c.int ---
	sceAtracGetSubBufferInfo :: proc(atracHandle: c.int, pReadPosition: ^sce.UInt32, pMinSubBufferSize: ^sce.UInt32, pDataSize: ^sce.UInt32) -> c.int ---
	sceAtracSetSubBuffer :: proc(atracHandle: c.int, pSubBuffer: [^]sce.UChar8, subBufferSize: sce.UInt32) -> c.int ---
	sceAtracSetLoopNum :: proc(atracHandle: c.int, loopNum: c.int) -> c.int ---
	sceAtracSetOutputSamples :: proc(atracHandle: c.int, outputSamples: sce.UInt32) -> c.int ---
	sceAtracResetNextOutputPosition :: proc(atracHandle: c.int, resetSample: sce.UInt32) -> c.int ---
	sceAtracGetContentInfo :: proc(atracHandle: c.int, pContentInfo: ^SceAtracContentInfo) -> c.int ---
	sceAtracGetLoopInfo :: proc(atracHandle: c.int, pLoopNum: ^c.int, pLoopStatus: ^sce.UInt32) -> c.int ---
	sceAtracGetOutputSamples :: proc(atracHandle: c.int, pOutputSamples: ^sce.UInt32) -> c.int ---
	sceAtracGetNextOutputPosition :: proc(atracHandle: c.int, pNextOutputSample: ^sce.UInt32) -> c.int ---
	sceAtracGetRemainSamples :: proc(atracHandle: c.int, pRemainSamples: ^sce.Long64) -> c.int ---
	sceAtracGetOutputableSamples :: proc(atracHandle: c.int, pOutputableSamples: ^sce.Long64) -> c.int ---
	sceAtracGetDecoderStatus :: proc(atracHandle: c.int, pDecoderStatus: ^sce.UInt32) -> c.int ---
	sceAtracGetVacantSize :: proc(atracHandle: c.int, pVacantSize: ^sce.UInt32) -> c.int ---
	sceAtracGetInternalError :: proc(atracHandle: c.int, pInternalError: ^c.int) -> c.int ---
}

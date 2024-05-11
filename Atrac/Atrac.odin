package atrac

import "core:c"
import sce "../common"

foreign import atrac "system:SceAtrac_stub"

@(link_prefix = "sceAtrac")
foreign atrac {
	QueryDecoderGroupMemSize :: proc(atracType: sce.UInt32, pDecoderGroup: ^SceAtracDecoderGroup) -> c.int ---
	CreateDecoderGroup :: proc(atracType: sce.UInt32, pDecoderGroup: ^SceAtracDecoderGroup, pvWorkMem: rawptr, initAudiodecFlag: c.int) -> c.int ---
	DeleteDecoderGroup :: proc(atracType: sce.UInt32, termAudiodecFlag: c.int) -> c.int ---
	GetDecoderGroupInfo :: proc(atracType: sce.UInt32, pCreatedDecoder: ^SceAtracDecoderGroup, pAvailableDecoder: ^SceAtracDecoderGroup) -> c.int ---
	SetDataAndAcquireHandle :: proc(pucBuffer: [^]sce.UChar8, uiReadSize: sce.UInt32, uiBufferSize: sce.UInt32) -> c.int ---
	ReleaseHandle :: proc(atracHandle: c.int) -> c.int ---
	Decode :: proc(atracHandle: c.int, pOutputBuffer: rawptr, pOutputSamples: ^sce.UInt32, pDecoderStatus: ^sce.UInt32) -> c.int ---
	GetStreamInfo :: proc(atracHandle: c.int, pStreamInfo: ^SceAtracStreamInfo) -> c.int ---
	AddStreamData :: proc(atracHandle: c.int, addSize: sce.UInt32) -> c.int ---
	IsSubBufferNeeded :: proc(atracHandle: c.int) -> c.int ---
	GetSubBufferInfo :: proc(atracHandle: c.int, pReadPosition: ^sce.UInt32, pMinSubBufferSize: ^sce.UInt32, pDataSize: ^sce.UInt32) -> c.int ---
	SetSubBuffer :: proc(atracHandle: c.int, pSubBuffer: [^]sce.UChar8, subBufferSize: sce.UInt32) -> c.int ---
	SetLoopNum :: proc(atracHandle: c.int, loopNum: c.int) -> c.int ---
	SetOutputSamples :: proc(atracHandle: c.int, outputSamples: sce.UInt32) -> c.int ---
	ResetNextOutputPosition :: proc(atracHandle: c.int, resetSample: sce.UInt32) -> c.int ---
	GetContentInfo :: proc(atracHandle: c.int, pContentInfo: ^SceAtracContentInfo) -> c.int ---
	GetLoopInfo :: proc(atracHandle: c.int, pLoopNum: ^c.int, pLoopStatus: ^sce.UInt32) -> c.int ---
	GetOutputSamples :: proc(atracHandle: c.int, pOutputSamples: ^sce.UInt32) -> c.int ---
	GetNextOutputPosition :: proc(atracHandle: c.int, pNextOutputSample: ^sce.UInt32) -> c.int ---
	GetRemainSamples :: proc(atracHandle: c.int, pRemainSamples: ^sce.Long64) -> c.int ---
	GetOutputableSamples :: proc(atracHandle: c.int, pOutputableSamples: ^sce.Long64) -> c.int ---
	GetDecoderStatus :: proc(atracHandle: c.int, pDecoderStatus: ^sce.UInt32) -> c.int ---
	GetVacantSize :: proc(atracHandle: c.int, pVacantSize: ^sce.UInt32) -> c.int ---
	GetInternalError :: proc(atracHandle: c.int, pInternalError: ^c.int) -> c.int ---
}

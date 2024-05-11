package gxm

import "core:c"
import "base:intrinsics"
import sce "../common"

foreign import gxm "system:SceGxm_stub"

/**
 * Gets the start address of the texture data.
 *
 * @param	gxt	pointer to the GXT data
 * @return A pointer to the start of the texture data
 */
sceGxtGetDataAddress :: proc(gxt: rawptr) -> rawptr {
	header := cast(^SceGxtHeader)gxt
	return cast(rawptr)((cast(uintptr)gxt) + auto_cast header.dataOffset)
}


@(link_prefix = "sceGxm")
foreign gxm {
	Initialize :: proc(params: ^SceGxmInitializeParams) -> c.int ---
	VshInitialize :: proc(params: ^SceGxmInitializeParams) -> c.int ---
	Terminate :: proc() -> c.int ---

	GetNotificationRegion :: proc() -> ^c.uint ---
	NotificationWait :: proc(notification: ^SceGxmNotification) -> c.int ---

	MapMemory :: proc(base: rawptr, size: sce.Size, attr: SceGxmMemoryAttribFlags) -> c.int ---
	UnmapMemory :: proc(base: rawptr) -> c.int ---

	MapVertexUsseMemory :: proc(base: rawptr, size: sce.Size, offset: ^c.uint) -> c.int ---
	UnmapVertexUsseMemory :: proc(base: rawptr) -> c.int ---

	MapFragmentUsseMemory :: proc(base: rawptr, size: sce.Size, offset: ^c.uint) -> c.int ---
	UnmapFragmentUsseMemory :: proc(base: rawptr) -> c.int ---

	DisplayQueueAddEntry :: proc(oldBuffer: ^SceGxmSyncObject, newBuffer: ^SceGxmSyncObject, callbackData: rawptr) -> c.int ---
	DisplayQueueFinish :: proc() -> c.int ---

	SyncObjectCreate :: proc(syncObject: ^^SceGxmSyncObject) -> c.int ---
	SyncObjectDestroy :: proc(syncObject: ^SceGxmSyncObject) -> c.int ---

	CreateContext :: proc(params: ^SceGxmContextParams, _context: ^^SceGxmContext) -> c.int ---
	DestroyContext :: proc(_context: ^SceGxmContext) -> c.int ---

	CreateDeferredContext :: proc(params: ^SceGxmDeferredContextParams, _context: ^^SceGxmContext) -> c.int ---
	DestroyDeferredContext :: proc(_context: ^SceGxmContext) -> c.int ---

	SetValidationEnable :: proc(_context: ^SceGxmContext, enable: sce.Bool) ---

	SetVertexProgram :: proc(_context: ^SceGxmContext, vertexProgram: ^SceGxmVertexProgram) --- 
	SetFragmentProgram :: proc(_context: ^SceGxmContext, fragmentProgram: ^SceGxmFragmentProgram) ---

	ReserveVertexDefaultUniformBuffer :: proc(_context: ^SceGxmContext, uniformBuffer: ^rawptr) -> c.int ---
	ReserveFragmentDefaultUniformBuffer :: proc(_context: ^SceGxmContext, uniformBuffer: ^rawptr) -> c.int ---

	SetVertexDefaultUniformBuffer :: proc(_context: ^SceGxmContext, uniformBuffer: rawptr) -> c.int ---
	SetFragmentDefaultUniformBuffer :: proc(_context: ^SceGxmContext, uniformBuffer: rawptr) -> c.int ---

	SetVertexStream :: proc(_context: ^SceGxmContext, streamIndex: c.uint, streamData: rawptr) -> c.int ---
	SetVertexTexture :: proc(_context: ^SceGxmContext, textureIndex: c.uint, texture: ^SceGxmTexture) -> c.int ---
	SetFragmentTexture :: proc(_context: ^SceGxmContext, textureIndex: c.uint, texture: ^SceGxmTexture) -> c.int ---
	SetVertexUniformBuffer :: proc(_context: ^SceGxmContext, bufferIndex: c.uint, bufferData: rawptr) -> c.int ---
	SetFragmentUniformBuffer :: proc(_context: ^SceGxmContext, bufferIndex: c.uint, bufferData: rawptr) -> c.int ---
	SetAuxiliarySurface :: proc(_context: ^SceGxmContext, surfaceIndex: c.uint, surface: ^SceGxmAuxiliarySurface) -> c.int ---

	SetPrecomputedFragmentState :: proc(_context: ^SceGxmContext, precomputedState: ^SceGxmPrecomputedFragmentState) ---
	SetPrecomputedVertexState :: proc(_context: ^SceGxmContext, precomputedState: ^SceGxmPrecomputedVertexState) ---

	DrawPrecomputed :: proc(_context: ^SceGxmContext, precomputedDraw: ^SceGxmPrecomputedDraw) -> c.int ---
	Draw :: proc(_context: ^SceGxmContext, primType: SceGxmPrimitiveType, indexType: SceGxmIndexFormat, indexData: rawptr, indexCount: c.uint) -> c.int ---
	DrawInstanced :: proc(_context: ^SceGxmContext, primType: SceGxmPrimitiveType, indexType: SceGxmIndexFormat, indexData: rawptr, indexCount: c.uint, indexWrap: c.uint) -> c.int ---
	SetVisibilityBuffer :: proc(_context: ^SceGxmContext, bufferBase: rawptr, stridePerCore: c.uint) -> c.int ---

	BeginScene :: proc(_context: ^SceGxmContext, flags: c.uint, renderTarget: ^SceGxmRenderTarget, validRegion: ^SceGxmValidRegion, vertexSyncObject: ^SceGxmSyncObject, fragmentSyncObject: ^SceGxmSyncObject, colorSurface: ^SceGxmColorSurface, depthStencil: ^SceGxmDepthStencilSurface) -> c.int ---
	MidSceneFlush :: proc(_context: ^SceGxmContext, flags: c.uint, vertexSyncObject: ^SceGxmSyncObject, vertexNotification: ^SceGxmNotification) -> c.int ---
	EndScene :: proc(_context: ^SceGxmContext, vertexNotification: ^SceGxmNotification, fragmentNotification: ^SceGxmNotification) -> c.int ---

	BeginCommandList :: proc(_context: ^SceGxmContext) -> c.int ---
	ExecuteCommandList :: proc(_context: ^SceGxmContext, list: ^SceGxmCommandList) -> c.int ---
	EndCommandList :: proc(_context: ^SceGxmContext, list: ^SceGxmCommandList) -> c.int ---

	SetFrontDepthFunc :: proc(_context: ^SceGxmContext, depthFunc: SceGxmDepthFunc) ---
	SetBackDepthFunc :: proc(_context: ^SceGxmContext, depthFunc: SceGxmDepthFunc) ---
	SetFrontFragmentProgramEnable :: proc(_context: ^SceGxmContext, enable: SceGxmFragmentProgramMode) ---
	SetBackFragmentProgramEnable :: proc(_context: ^SceGxmContext, enable: SceGxmFragmentProgramMode) ---
	SetFrontDepthWriteEnable :: proc(_context: ^SceGxmContext, enable: SceGxmDepthWriteMode) ---
	SetBackDepthWriteEnable :: proc(_context: ^SceGxmContext, enable: SceGxmDepthWriteMode) ---
	SetFrontLineFillLastPixelEnable :: proc(_context: ^SceGxmContext, enable: SceGxmLineFillLastPixelMode) ---
	SetBackLineFillLastPixelEnable :: proc(_context: ^SceGxmContext, enable: SceGxmLineFillLastPixelMode) ---
	SetFrontStencilRef :: proc(_context: ^SceGxmContext, sref: c.uint) ---
	SetBackStencilRef :: proc(_context: ^SceGxmContext, sref: c.uint) ---
	SetFrontPointLineWidth :: proc(_context: ^SceGxmContext, width: c.uint) ---
	SetBackPointLineWidth :: proc(_context: ^SceGxmContext, width: c.uint) ---
	SetFrontPolygonMode :: proc(_context: ^SceGxmContext, mode: SceGxmPolygonMode) ---
	SetBackPolygonMode :: proc(_context: ^SceGxmContext, mode: SceGxmPolygonMode) ---
	SetFrontStencilFunc :: proc(_context: ^SceGxmContext, func: SceGxmStencilFunc, stencilFail: SceGxmStencilOp, depthFail: SceGxmStencilOp, depthPass: SceGxmStencilOp, compareMask: c.uchar, writeMask: c.uchar) ---
	SetBackStencilFunc :: proc(_context: ^SceGxmContext, func: SceGxmStencilFunc, stencilFail: SceGxmStencilOp, depthFail: SceGxmStencilOp, depthPass: SceGxmStencilOp, compareMask: c.uchar, writeMask: c.uchar) ---
	SetFrontDepthBias :: proc(_context: ^SceGxmContext, factor: c.int, units: c.int) ---
	SetBackDepthBias :: proc(_context: ^SceGxmContext, factor: c.int, units: c.int) ---
	SetTwoSidedEnable :: proc(_context: ^SceGxmContext, enable: SceGxmTwoSidedMode) ---
	SetViewport :: proc(_context: ^SceGxmContext, xOffset: c.float, xScale: c.float, yOffset: c.float, yScale: c.float, zOffset: c.float, zScale: c.float) ---
	SetWClampValue :: proc(_context: ^SceGxmContext, clampValue: c.float) ---
	SetWClampEnable :: proc(_context: ^SceGxmContext, enable: SceGxmWClampMode) ---
	SetRegionClip :: proc(_context: ^SceGxmContext, mode: SceGxmRegionClipMode, xMin: c.uint, yMin: c.uint, xMax: c.uint, yMax: c.uint) ---
	SetDefaultRegionClipAndViewport :: proc(_context: ^SceGxmContext, xMax: c.uint, yMax: c.uint) ---
	SetCullMode :: proc(_context: ^SceGxmContext, mode: SceGxmCullMode) ---
	SetViewportEnable :: proc(_context: ^SceGxmContext, enable: SceGxmViewportMode) ---
	SetWBufferEnable :: proc(_context: ^SceGxmContext, enable: SceGxmWBufferMode) ---
	SetFrontVisibilityTestIndex :: proc(_context: ^SceGxmContext, index: c.uint) ---
	SetBackVisibilityTestIndex :: proc(_context: ^SceGxmContext, index: c.uint) ---
	SetFrontVisibilityTestOp :: proc(_context: ^SceGxmContext, op: SceGxmVisibilityTestOp) ---
	SetBackVisibilityTestOp :: proc(_context: ^SceGxmContext, op: SceGxmVisibilityTestOp) ---
	SetFrontVisibilityTestEnable :: proc(_context: ^SceGxmContext, enable: SceGxmVisibilityTestMode) ---
	SetBackVisibilityTestEnable :: proc(_context: ^SceGxmContext, enable: SceGxmVisibilityTestMode) ---

	SetYuvProfile :: proc(_context: ^SceGxmContext, index: c.uint, profile: SceGxmYuvProfile ) -> c.int ---

	Finish :: proc(_context: ^SceGxmContext) ---

	PushUserMarker :: proc(_context: ^SceGxmContext, tag: cstring) -> c.int ---
	PopUserMarker :: proc(_context: ^SceGxmContext) -> c.int ---
	SetUserMarker :: proc(_context: ^SceGxmContext, tag: cstring) -> c.int ---

	PadHeartbeat :: proc(displaySurface: ^SceGxmColorSurface, displaySyncObject: ^SceGxmSyncObject) -> c.int ---

	PadTriggerGpuPaTrace :: proc() -> c.int ---

	ColorSurfaceInit :: proc(surface: ^SceGxmColorSurface, colorFormat: SceGxmColorFormat, surfaceType: SceGxmColorSurfaceType, scaleMode: SceGxmColorSurfaceScaleMode, outputRegisterSize: SceGxmOutputRegisterSize, width: c.uint, height: c.uint, strideInPixels: c.uint, data: rawptr) -> c.int ---
	ColorSurfaceInitDisabled :: proc(surface: ^SceGxmColorSurface) -> c.int ---
	ColorSurfaceIsEnabled :: proc(surface: ^SceGxmColorSurface) -> sce.Bool ---
	ColorSurfaceGetClip :: proc(surface: ^SceGxmColorSurface, xMin: ^c.uint, yMin: ^c.uint, xMax: ^c.uint, yMax: ^c.uint) ---
	ColorSurfaceSetClip :: proc(surface: ^SceGxmColorSurface, xMin: c.uint, yMin: c.uint, xMax: c.uint, yMax: c.uint) ---

	ColorSurfaceGetScaleMode :: proc(surface: ^SceGxmColorSurface) -> SceGxmColorSurfaceScaleMode ---
	ColorSurfaceSetScaleMode :: proc(surface: ^SceGxmColorSurface, scaleMode: SceGxmColorSurfaceScaleMode) ---

	ColorSurfaceGetData :: proc(surface: ^SceGxmColorSurface) -> rawptr ---
	ColorSurfaceSetData :: proc(surface: ^SceGxmColorSurface, data: rawptr) -> c.int ---

	ColorSurfaceGetFormat :: proc(surface: ^SceGxmColorSurface) -> SceGxmColorFormat ---
	ColorSurfaceSetFormat :: proc(surface: ^SceGxmColorSurface, format: SceGxmColorFormat) -> c.int ---
	ColorSurfaceGetType :: proc(surface: ^SceGxmColorSurface) -> SceGxmColorSurfaceType ---
	ColorSurfaceGetStrideInPixels :: proc(surface: ^SceGxmColorSurface) -> c.uint ---

	DepthStencilSurfaceInit :: proc(surface: ^SceGxmDepthStencilSurface, depthStencilFormat: SceGxmDepthStencilFormat, surfaceType: SceGxmDepthStencilSurfaceType, strideInSamples: c.uint, depthData: rawptr, stencilData: rawptr) -> c.int ---
	DepthStencilSurfaceInitDisabled :: proc(surface: ^SceGxmDepthStencilSurface) -> c.int ---
	DepthStencilSurfaceGetBackgroundDepth :: proc(surface: ^SceGxmDepthStencilSurface) -> c.float ---
	DepthStencilSurfaceSetBackgroundDepth :: proc(surface: ^SceGxmDepthStencilSurface, backgroundDepth: c.float) ---
	DepthStencilSurfaceGetBackgroundStencil :: proc(surface: ^SceGxmDepthStencilSurface) -> c.uchar ---
	DepthStencilSurfaceSetBackgroundStencil :: proc(surface: ^SceGxmDepthStencilSurface, backgroundStencil: c.uchar) ---
	DepthStencilSurfaceIsEnabled :: proc(surface: ^SceGxmDepthStencilSurface) -> sce.Bool ---
	DepthStencilSurfaceSetForceLoadMode :: proc(surface: ^SceGxmDepthStencilSurface, forceLoad: SceGxmDepthStencilForceLoadMode) ---
	DepthStencilSurfaceGetForceLoadMode :: proc(surface: ^SceGxmDepthStencilSurface) -> SceGxmDepthStencilForceLoadMode ---
	DepthStencilSurfaceSetForceStoreMode :: proc(surface: ^SceGxmDepthStencilSurface, forceStore: SceGxmDepthStencilForceStoreMode ) ---
	DepthStencilSurfaceGetForceStoreMode :: proc(surface: ^SceGxmDepthStencilSurface) -> SceGxmDepthStencilForceStoreMode ---

	ColorSurfaceGetGammaMode :: proc(surface: ^SceGxmColorSurface) -> SceGxmColorSurfaceGammaMode ---
	ColorSurfaceSetGammaMode :: proc(surface: ^SceGxmColorSurface, gammaMode: SceGxmColorSurfaceGammaMode) -> c.int ---
	ColorSurfaceGetDitherMode :: proc(surface: ^SceGxmColorSurface) -> SceGxmColorSurfaceDitherMode ---
	ColorSurfaceSetDitherMode :: proc(surface: ^SceGxmColorSurface, ditherMode: SceGxmColorSurfaceDitherMode) -> c.int ---

	DepthStencilSurfaceGetFormat :: proc(surface: ^SceGxmDepthStencilSurface) -> SceGxmDepthStencilFormat ---
	DepthStencilSurfaceGetStrideInSamples :: proc(surface: ^SceGxmDepthStencilSurface) -> c.uint ---

	ProgramCheck :: proc(program: ^SceGxmProgram) -> c.int ---
	ProgramGetSize :: proc(program: ^SceGxmProgram) -> c.uint ---
	ProgramGetType :: proc(program: ^SceGxmProgram) -> SceGxmProgramType ---
	ProgramIsDiscardUsed :: proc(program: ^SceGxmProgram) -> sce.Bool ---
	ProgramIsDepthReplaceUsed :: proc(program: ^SceGxmProgram) -> sce.Bool ---
	ProgramIsSpriteCoordUsed :: proc(program: ^SceGxmProgram) -> sce.Bool ---
	ProgramGetDefaultUniformBufferSize :: proc(program: ^SceGxmProgram) -> c.uint ---
	ProgramGetParameterCount :: proc(program: ^SceGxmProgram) -> c.uint ---

	ProgramGetParameter :: proc(program: ^SceGxmProgram, index: c.uint) -> ^SceGxmProgramParameter ---
	ProgramFindParameterByName :: proc(program: ^SceGxmProgram, name: cstring) -> ^SceGxmProgramParameter ---
	ProgramFindParameterBySemantic :: proc(program: ^SceGxmProgram, semantic: SceGxmParameterSemantic, index: c.uint) -> ^SceGxmProgramParameter ---
	ProgramParameterGetIndex :: proc(program: ^SceGxmProgram, parameter: ^SceGxmProgramParameter) -> c.uint ---
	ProgramParameterGetCategory :: proc(parameter: ^SceGxmProgramParameter) -> SceGxmParameterCategory ---
	ProgramParameterGetName :: proc(parameter: ^SceGxmProgramParameter) -> cstring ---
	ProgramParameterGetSemantic :: proc(parameter: ^SceGxmProgramParameter) -> SceGxmParameterSemantic ---
	ProgramParameterGetSemanticIndex :: proc(parameter: ^SceGxmProgramParameter) -> c.uint ---
	ProgramParameterGetType :: proc(parameter: ^SceGxmProgramParameter) -> SceGxmParameterType ---
	ProgramParameterGetComponentCount :: proc(parameter: ^SceGxmProgramParameter) -> c.uint ---
	ProgramParameterGetArraySize :: proc(parameter: ^SceGxmProgramParameter) -> c.uint ---
	ProgramParameterGetResourceIndex :: proc(parameter: ^SceGxmProgramParameter) -> c.uint ---
	ProgramParameterGetContainerIndex :: proc( parameter: ^SceGxmProgramParameter) -> c.uint ---
	ProgramParameterIsSamplerCube :: proc(parameter: ^SceGxmProgramParameter) -> sce.Bool ---

	FragmentProgramGetProgram :: proc(fragmentProgram: ^SceGxmFragmentProgram) -> ^SceGxmProgram ---
	VertexProgramGetProgram :: proc(vertexProgram: ^SceGxmVertexProgram) -> ^SceGxmProgram ---

	ShaderPatcherCreate :: proc(params: ^SceGxmShaderPatcherParams, shaderPatcher: ^^SceGxmShaderPatcher) -> c.int ---
	ShaderPatcherSetUserData :: proc(shaderPatcher: ^SceGxmShaderPatcher, userData: rawptr) -> c.int ---
	ShaderPatcherGetUserData :: proc(shaderPatcher: ^SceGxmShaderPatcher) -> rawptr ---
	ShaderPatcherDestroy :: proc(shaderPatcher: ^SceGxmShaderPatcher) -> c.int ---
	ShaderPatcherRegisterProgram :: proc(shaderPatcher: ^SceGxmShaderPatcher, programHeader: ^SceGxmProgram, programId: ^SceGxmShaderPatcherId) -> c.int ---
	ShaderPatcherUnregisterProgram :: proc(shaderPatcher: ^SceGxmShaderPatcher, programId: SceGxmShaderPatcherId) -> c.int ---
	ShaderPatcherForceUnregisterProgram :: proc(shaderPatcher: ^SceGxmShaderPatcher, programId: SceGxmShaderPatcherId) -> c.int ---
	ShaderPatcherGetProgramFromId :: proc(programId: SceGxmShaderPatcherId) -> ^SceGxmProgram ---
	ShaderPatcherSetAuxiliarySurface :: proc(shaderPatcher: ^SceGxmShaderPatcher, auxSurfaceIndex: c.uint, auxSurface: ^SceGxmAuxiliarySurface) -> c.int ---
	ShaderPatcherCreateVertexProgram :: proc(shaderPatcher: ^SceGxmShaderPatcher, programId: SceGxmShaderPatcherId, attributes: ^SceGxmVertexAttribute, attributeCount: c.uint, streams: ^SceGxmVertexStream, streamCount: c.uint, vertexProgram: ^^SceGxmVertexProgram) -> c.int ---
	ShaderPatcherCreateFragmentProgram :: proc(shaderPatcher: ^SceGxmShaderPatcher, programId: SceGxmShaderPatcherId, outputFormat: SceGxmOutputRegisterFormat, multisampleMode: SceGxmMultisampleMode, blendInfo: ^SceGxmBlendInfo, vertexProgram: ^SceGxmProgram, fragmentProgram: ^^SceGxmFragmentProgram) -> c.int ---
	ShaderPatcherCreateMaskUpdateFragmentProgram :: proc(shaderPatcher: ^SceGxmShaderPatcher, fragmentProgram: ^^SceGxmFragmentProgram) -> c.int ---
	ShaderPatcherAddRefVertexProgram :: proc(shaderPatcher: ^SceGxmShaderPatcher, vertexProgram: ^SceGxmVertexProgram) -> c.int ---
	ShaderPatcherAddRefFragmentProgram :: proc(shaderPatcher: ^SceGxmShaderPatcher, fragmentProgram: ^SceGxmFragmentProgram) -> c.int ---
	ShaderPatcherGetVertexProgramRefCount :: proc(shaderPatcher: ^SceGxmShaderPatcher, fragmentProgram: ^SceGxmVertexProgram, count: ^c.uint) -> c.int ---
	ShaderPatcherGetFragmentProgramRefCount :: proc(shaderPatcher: ^SceGxmShaderPatcher, fragmentProgram: ^SceGxmFragmentProgram, count: ^c.uint) -> c.int ---
	ShaderPatcherReleaseVertexProgram :: proc(shaderPatcher: ^SceGxmShaderPatcher, vertexProgram: ^SceGxmVertexProgram) -> c.int ---
	ShaderPatcherReleaseFragmentProgram :: proc(shaderPatcher: ^SceGxmShaderPatcher, fragmentProgram: ^SceGxmFragmentProgram) -> c.int ---
	ShaderPatcherGetHostMemAllocated :: proc(shaderPatcher: ^SceGxmShaderPatcher) -> c.uint ---
	ShaderPatcherGetBufferMemAllocated :: proc(shaderPatcher: ^SceGxmShaderPatcher) -> c.uint ---
	ShaderPatcherGetVertexUsseMemAllocated :: proc(shaderPatcher: ^SceGxmShaderPatcher) -> c.uint ---
	ShaderPatcherGetFragmentUsseMemAllocated :: proc(shaderPatcher: ^SceGxmShaderPatcher) -> c.uint ---

	TextureInitSwizzled :: proc(texture: ^SceGxmTexture,  data: rawptr, texFormat: SceGxmTextureFormat, width: c.uint, height: c.uint, mipCount: c.uint) -> c.int ---
	TextureInitSwizzledArbitrary :: proc(texture: ^SceGxmTexture, data: rawptr, texFormat: SceGxmTextureFormat, width: c.uint, height: c.uint, mipCount: c.uint) -> c.int ---
	TextureInitLinear :: proc(texture: ^SceGxmTexture, data: rawptr, texFormat: SceGxmTextureFormat, width: c.uint, height: c.uint, mipCount: c.uint) -> c.int ---
	TextureInitLinearStrided :: proc(texture: ^SceGxmTexture, data: rawptr, texFormat: SceGxmTextureFormat, width: c.uint, height: c.uint, byteStride: c.uint) -> c.int ---
	TextureInitTiled :: proc(texture: ^SceGxmTexture, data: rawptr, texFormat: SceGxmTextureFormat, width: c.uint, height: c.uint, mipCount: c.uint) -> c.int ---
	TextureInitCube :: proc(texture: ^SceGxmTexture, data: rawptr, texFormat: SceGxmTextureFormat, width: c.uint, height: c.uint, mipCount: c.uint) -> c.int ---

	TextureGetType :: proc(texture: ^SceGxmTexture) -> SceGxmTextureType ---
	TextureValidate :: proc(texture: ^SceGxmTexture) -> c.int ---

	TextureSetMinFilter :: proc(texture: ^SceGxmTexture, minFilter: SceGxmTextureFilter) -> c.int ---
	TextureGetMinFilter :: proc(texture: ^SceGxmTexture) -> SceGxmTextureFilter ---

	TextureSetMagFilter :: proc(texture: ^SceGxmTexture, magFilter: SceGxmTextureFilter) -> c.int ---
	TextureGetMagFilter :: proc(texture: ^SceGxmTexture) -> SceGxmTextureFilter ---

	TextureSetMipFilter :: proc(texture: ^SceGxmTexture, mipFilter: SceGxmTextureMipFilter) -> c.int ---
	TextureGetMipFilter :: proc(texture: ^SceGxmTexture) -> SceGxmTextureMipFilter ---

	TextureSetUAddrMode :: proc(texture: ^SceGxmTexture, addrMode: SceGxmTextureAddrMode) -> c.int ---
	TextureGetUAddrMode :: proc(texture: ^SceGxmTexture) -> SceGxmTextureAddrMode ---

	TextureSetVAddrMode :: proc(texture: ^SceGxmTexture, addrMode: SceGxmTextureAddrMode) -> c.int ---
	TextureGetVAddrMode :: proc(texture: ^SceGxmTexture) -> SceGxmTextureAddrMode ---

	TextureSetFormat :: proc(texture: ^SceGxmTexture, texFormat: SceGxmTextureFormat ) -> c.int ---
	TextureGetFormat :: proc( texture: ^SceGxmTexture) -> SceGxmTextureFormat ---

	TextureSetLodBias :: proc(texture: ^SceGxmTexture, bias: c.uint) -> c.int ---
	TextureGetLodBias :: proc( texture: ^SceGxmTexture) -> c.uint ---

	TextureSetStride :: proc(texture: ^SceGxmTexture, byteStride: c.uint) -> c.int ---
	TextureGetStride :: proc( texture: ^SceGxmTexture) -> c.uint ---

	TextureSetWidth :: proc(texture: ^SceGxmTexture, width: c.uint) -> c.int ---
	TextureGetWidth :: proc( texture: ^SceGxmTexture) -> c.uint ---

	TextureSetHeight :: proc(texture: ^SceGxmTexture, height: c.uint) -> c.int ---
	TextureGetHeight :: proc( texture: ^SceGxmTexture) -> c.uint ---

	TextureSetData :: proc(texture: ^SceGxmTexture,  data: rawptr) -> c.int ---
	TextureGetData :: proc( texture: ^SceGxmTexture) -> rawptr ---

	TextureSetMipmapCount :: proc(texture: ^SceGxmTexture, mipCount: c.uint) -> c.int ---
	TextureGetMipmapCount :: proc( texture: ^SceGxmTexture) -> c.uint ---

	TextureSetPalette :: proc(texture: ^SceGxmTexture,  paletteData: rawptr) -> c.int ---
	TextureGetPalette :: proc( texture: ^SceGxmTexture) -> rawptr ---

	TextureGetGammaMode :: proc( texture: ^SceGxmTexture) -> SceGxmTextureGammaMode ---
	TextureSetGammaMode :: proc(texture: ^SceGxmTexture, gammaMode: SceGxmTextureGammaMode) -> c.int ---

	GetPrecomputedVertexStateSize :: proc( vertexProgram: ^SceGxmVertexProgram) -> c.uint ---
	PrecomputedVertexStateInit :: proc(precomputedState: ^SceGxmPrecomputedVertexState,  vertexProgram: ^SceGxmVertexProgram, memBlock: rawptr) -> c.int ---
	PrecomputedVertexStateSetDefaultUniformBuffer :: proc(precomputedState: ^SceGxmPrecomputedVertexState, defaultBuffer: rawptr) ---
	PrecomputedVertexStateGetDefaultUniformBuffer :: proc( precomputedState: ^SceGxmPrecomputedVertexState) -> rawptr ---
	PrecomputedVertexStateSetAllTextures :: proc(precomputedState: ^SceGxmPrecomputedVertexState, textures: ^SceGxmTexture) -> c.int ---
	PrecomputedVertexStateSetTexture :: proc(precomputedState: ^SceGxmPrecomputedVertexState, textureIndex: c.uint, texture: ^SceGxmTexture) -> c.int ---
	PrecomputedVertexStateSetAllUniformBuffers :: proc(precomputedState: ^SceGxmPrecomputedVertexState, bufferDataArray: ^rawptr) -> c.int ---
	PrecomputedVertexStateSetUniformBuffer :: proc(precomputedState: ^SceGxmPrecomputedVertexState, bufferIndex: c.uint, bufferData: rawptr) -> c.int ---
	GetPrecomputedFragmentStateSize :: proc(fragmentProgram: ^SceGxmFragmentProgram) -> c.uint ---
	PrecomputedFragmentStateInit :: proc(precomputedState: ^SceGxmPrecomputedFragmentState,  fragmentProgram: ^SceGxmFragmentProgram, memBlock: rawptr) -> c.int ---
	PrecomputedFragmentStateSetDefaultUniformBuffer :: proc(precomputedState: ^SceGxmPrecomputedFragmentState, defaultBuffer: rawptr) ---
	PrecomputedFragmentStateGetDefaultUniformBuffer :: proc(precomputedState: ^SceGxmPrecomputedFragmentState) -> rawptr ---
	PrecomputedFragmentStateSetAllTextures :: proc(precomputedState: ^SceGxmPrecomputedFragmentState, textureArray: [^]SceGxmTexture) -> c.int ---
	PrecomputedFragmentStateSetTexture :: proc(precomputedState: ^SceGxmPrecomputedFragmentState, textureIndex: c.uint, texture: ^SceGxmTexture) -> c.int ---
	PrecomputedFragmentStateSetAllUniformBuffers :: proc(precomputedState: ^SceGxmPrecomputedFragmentState, bufferDataArray: ^rawptr) -> c.int ---
	PrecomputedFragmentStateSetUniformBuffer :: proc(precomputedState: ^SceGxmPrecomputedFragmentState, bufferIndex: c.uint, bufferData: rawptr) -> c.int ---
	PrecomputedFragmentStateSetAllAuxiliarySurfaces :: proc(precomputedState: ^SceGxmPrecomputedFragmentState, auxSurfaceArray: ^SceGxmAuxiliarySurface) -> c.int ---
	GetPrecomputedDrawSize :: proc( vertexProgram: ^SceGxmVertexProgram) -> c.uint ---
	PrecomputedDrawInit :: proc(precomputedDraw: ^SceGxmPrecomputedDraw, vertexProgram: ^SceGxmVertexProgram, memBlock: rawptr) -> c.int ---
	PrecomputedDrawSetAllVertexStreams :: proc(precomputedDraw: ^SceGxmPrecomputedDraw, streamDataArray: ^rawptr) -> c.int ---
	PrecomputedDrawSetVertexStream :: proc(precomputedDraw: ^SceGxmPrecomputedDraw, streamIndex: c.uint, streamData: rawptr) -> c.int ---
	PrecomputedDrawSetParams :: proc(precomputedDraw: ^SceGxmPrecomputedDraw, primType: SceGxmPrimitiveType, indexType: SceGxmIndexFormat, indexData: rawptr, indexCount: c.uint) ---
	PrecomputedDrawSetParamsInstanced :: proc(precomputedDraw: ^SceGxmPrecomputedDraw, primType: SceGxmPrimitiveType, indexType: SceGxmIndexFormat, indexData: rawptr, indexCount: c.uint, indexWrap: c.uint) ---

	GetRenderTargetMemSize :: proc(params: ^SceGxmRenderTargetParams, driverMemSize: ^c.uint) -> c.int ---
	CreateRenderTarget :: proc(params: ^SceGxmRenderTargetParams, renderTarget: ^^SceGxmRenderTarget) -> c.int ---
	RenderTargetGetHostMem :: proc(renderTarget: ^SceGxmRenderTarget, hostMem: ^rawptr) -> c.int ---
	RenderTargetGetDriverMemBlock :: proc(renderTarget: ^SceGxmRenderTarget, driverMemBlock: ^sce.UID) -> c.int ---
	DestroyRenderTarget :: proc(renderTarget: ^SceGxmRenderTarget) -> c.int ---

	SetUniformDataF :: proc(uniformBuffer: rawptr, parameter: ^SceGxmProgramParameter, componentOffset: c.uint, componentCount: c.uint, sourceData: ^c.float) -> c.int ---

	TransferCopy :: proc(width: c.uint32_t, height: c.uint32_t, colorKeyValue: c.uint32_t, colorKeyMask: c.uint32_t, colorKeyMode: SceGxmTransferColorKeyMode, srcFormat: SceGxmTransferFormat, srcType: SceGxmTransferType, srcAddress: rawptr, srcX: c.uint32_t, srcY: c.uint32_t, srcStride: c.int32_t, destFormat: SceGxmTransferFormat, destType: SceGxmTransferType, destAddress: rawptr, destX: c.uint32_t, destY: c.uint32_t, destStride: c.int32_t, syncObject: ^SceGxmSyncObject, syncFlags: c.uint32_t, notification: ^SceGxmNotification) -> c.int ---
	TransferDownscale :: proc(srcFormat: SceGxmTransferFormat, srcAddress: rawptr, srcX: c.uint, srcY: c.uint, srcWidth: c.uint, srcHeight: c.uint, srcStride: c.int, destFormat: SceGxmTransferFormat, destAddress: rawptr, destX: c.uint, destY: c.uint, destStride: c.int, syncObject: ^SceGxmSyncObject, syncFlags: c.uint, notification: ^SceGxmNotification) -> c.int ---
	TransferFill :: proc(color: c.uint32_t, destFormat: SceGxmTransferFormat, destAddress: rawptr, destX: c.uint32_t, destY: c.uint32_t, destWidth: c.uint32_t, destHeight: c.uint32_t, destStride: c.int32_t, syncObject: ^SceGxmSyncObject, syncFlags: c.uint32_t,  notification: ^SceGxmNotification) -> c.int ---
	TransferFinish :: proc() -> c.int ---
}

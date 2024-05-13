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

foreign gxm {
	sceGxmInitialize :: proc(params: ^SceGxmInitializeParams) -> c.int ---
	sceGxmVshInitialize :: proc(params: ^SceGxmInitializeParams) -> c.int ---
	sceGxmTerminate :: proc() -> c.int ---

	sceGxmGetNotificationRegion :: proc() -> ^c.uint ---
	sceGxmNotificationWait :: proc(notification: ^SceGxmNotification) -> c.int ---

	sceGxmMapMemory :: proc(base: rawptr, size: sce.Size, attr: SceGxmMemoryAttribFlags) -> c.int ---
	sceGxmUnmapMemory :: proc(base: rawptr) -> c.int ---

	sceGxmMapVertexUsseMemory :: proc(base: rawptr, size: sce.Size, offset: ^c.uint) -> c.int ---
	sceGxmUnmapVertexUsseMemory :: proc(base: rawptr) -> c.int ---

	sceGxmMapFragmentUsseMemory :: proc(base: rawptr, size: sce.Size, offset: ^c.uint) -> c.int ---
	sceGxmUnmapFragmentUsseMemory :: proc(base: rawptr) -> c.int ---

	sceGxmDisplayQueueAddEntry :: proc(oldBuffer: ^SceGxmSyncObject, newBuffer: ^SceGxmSyncObject, callbackData: rawptr) -> c.int ---
	sceGxmDisplayQueueFinish :: proc() -> c.int ---

	sceGxmSyncObjectCreate :: proc(syncObject: ^^SceGxmSyncObject) -> c.int ---
	sceGxmSyncObjectDestroy :: proc(syncObject: ^SceGxmSyncObject) -> c.int ---

	sceGxmCreateContext :: proc(params: ^SceGxmContextParams, _context: ^^SceGxmContext) -> c.int ---
	sceGxmDestroyContext :: proc(_context: ^SceGxmContext) -> c.int ---

	sceGxmCreateDeferredContext :: proc(params: ^SceGxmDeferredContextParams, _context: ^^SceGxmContext) -> c.int ---
	sceGxmDestroyDeferredContext :: proc(_context: ^SceGxmContext) -> c.int ---

	sceGxmSetValidationEnable :: proc(_context: ^SceGxmContext, enable: sce.Bool) ---

	sceGxmSetVertexProgram :: proc(_context: ^SceGxmContext, vertexProgram: ^SceGxmVertexProgram) --- 
	sceGxmSetFragmentProgram :: proc(_context: ^SceGxmContext, fragmentProgram: ^SceGxmFragmentProgram) ---

	sceGxmReserveVertexDefaultUniformBuffer :: proc(_context: ^SceGxmContext, uniformBuffer: ^rawptr) -> c.int ---
	sceGxmReserveFragmentDefaultUniformBuffer :: proc(_context: ^SceGxmContext, uniformBuffer: ^rawptr) -> c.int ---

	sceGxmSetVertexDefaultUniformBuffer :: proc(_context: ^SceGxmContext, uniformBuffer: rawptr) -> c.int ---
	sceGxmSetFragmentDefaultUniformBuffer :: proc(_context: ^SceGxmContext, uniformBuffer: rawptr) -> c.int ---

	sceGxmSetVertexStream :: proc(_context: ^SceGxmContext, streamIndex: c.uint, streamData: rawptr) -> c.int ---
	sceGxmSetVertexTexture :: proc(_context: ^SceGxmContext, textureIndex: c.uint, texture: ^SceGxmTexture) -> c.int ---
	sceGxmSetFragmentTexture :: proc(_context: ^SceGxmContext, textureIndex: c.uint, texture: ^SceGxmTexture) -> c.int ---
	sceGxmSetVertexUniformBuffer :: proc(_context: ^SceGxmContext, bufferIndex: c.uint, bufferData: rawptr) -> c.int ---
	sceGxmSetFragmentUniformBuffer :: proc(_context: ^SceGxmContext, bufferIndex: c.uint, bufferData: rawptr) -> c.int ---
	sceGxmSetAuxiliarySurface :: proc(_context: ^SceGxmContext, surfaceIndex: c.uint, surface: ^SceGxmAuxiliarySurface) -> c.int ---

	sceGxmSetPrecomputedFragmentState :: proc(_context: ^SceGxmContext, precomputedState: ^SceGxmPrecomputedFragmentState) ---
	sceGxmSetPrecomputedVertexState :: proc(_context: ^SceGxmContext, precomputedState: ^SceGxmPrecomputedVertexState) ---

	sceGxmDrawPrecomputed :: proc(_context: ^SceGxmContext, precomputedDraw: ^SceGxmPrecomputedDraw) -> c.int ---
	sceGxmDraw :: proc(_context: ^SceGxmContext, primType: SceGxmPrimitiveType, indexType: SceGxmIndexFormat, indexData: rawptr, indexCount: c.uint) -> c.int ---
	sceGxmDrawInstanced :: proc(_context: ^SceGxmContext, primType: SceGxmPrimitiveType, indexType: SceGxmIndexFormat, indexData: rawptr, indexCount: c.uint, indexWrap: c.uint) -> c.int ---
	sceGxmSetVisibilityBuffer :: proc(_context: ^SceGxmContext, bufferBase: rawptr, stridePerCore: c.uint) -> c.int ---

	sceGxmBeginScene :: proc(_context: ^SceGxmContext, flags: c.uint, renderTarget: ^SceGxmRenderTarget, validRegion: ^SceGxmValidRegion, vertexSyncObject: ^SceGxmSyncObject, fragmentSyncObject: ^SceGxmSyncObject, colorSurface: ^SceGxmColorSurface, depthStencil: ^SceGxmDepthStencilSurface) -> c.int ---
	sceGxmMidSceneFlush :: proc(_context: ^SceGxmContext, flags: c.uint, vertexSyncObject: ^SceGxmSyncObject, vertexNotification: ^SceGxmNotification) -> c.int ---
	sceGxmEndScene :: proc(_context: ^SceGxmContext, vertexNotification: ^SceGxmNotification, fragmentNotification: ^SceGxmNotification) -> c.int ---

	sceGxmBeginCommandList :: proc(_context: ^SceGxmContext) -> c.int ---
	sceGxmExecuteCommandList :: proc(_context: ^SceGxmContext, list: ^SceGxmCommandList) -> c.int ---
	sceGxmEndCommandList :: proc(_context: ^SceGxmContext, list: ^SceGxmCommandList) -> c.int ---

	sceGxmSetFrontDepthFunc :: proc(_context: ^SceGxmContext, depthFunc: SceGxmDepthFunc) ---
	sceGxmSetBackDepthFunc :: proc(_context: ^SceGxmContext, depthFunc: SceGxmDepthFunc) ---
	sceGxmSetFrontFragmentProgramEnable :: proc(_context: ^SceGxmContext, enable: SceGxmFragmentProgramMode) ---
	sceGxmSetBackFragmentProgramEnable :: proc(_context: ^SceGxmContext, enable: SceGxmFragmentProgramMode) ---
	sceGxmSetFrontDepthWriteEnable :: proc(_context: ^SceGxmContext, enable: SceGxmDepthWriteMode) ---
	sceGxmSetBackDepthWriteEnable :: proc(_context: ^SceGxmContext, enable: SceGxmDepthWriteMode) ---
	sceGxmSetFrontLineFillLastPixelEnable :: proc(_context: ^SceGxmContext, enable: SceGxmLineFillLastPixelMode) ---
	sceGxmSetBackLineFillLastPixelEnable :: proc(_context: ^SceGxmContext, enable: SceGxmLineFillLastPixelMode) ---
	sceGxmSetFrontStencilRef :: proc(_context: ^SceGxmContext, sref: c.uint) ---
	sceGxmSetBackStencilRef :: proc(_context: ^SceGxmContext, sref: c.uint) ---
	sceGxmSetFrontPointLineWidth :: proc(_context: ^SceGxmContext, width: c.uint) ---
	sceGxmSetBackPointLineWidth :: proc(_context: ^SceGxmContext, width: c.uint) ---
	sceGxmSetFrontPolygonMode :: proc(_context: ^SceGxmContext, mode: SceGxmPolygonMode) ---
	sceGxmSetBackPolygonMode :: proc(_context: ^SceGxmContext, mode: SceGxmPolygonMode) ---
	sceGxmSetFrontStencilFunc :: proc(_context: ^SceGxmContext, func: SceGxmStencilFunc, stencilFail: SceGxmStencilOp, depthFail: SceGxmStencilOp, depthPass: SceGxmStencilOp, compareMask: c.uchar, writeMask: c.uchar) ---
	sceGxmSetBackStencilFunc :: proc(_context: ^SceGxmContext, func: SceGxmStencilFunc, stencilFail: SceGxmStencilOp, depthFail: SceGxmStencilOp, depthPass: SceGxmStencilOp, compareMask: c.uchar, writeMask: c.uchar) ---
	sceGxmSetFrontDepthBias :: proc(_context: ^SceGxmContext, factor: c.int, units: c.int) ---
	sceGxmSetBackDepthBias :: proc(_context: ^SceGxmContext, factor: c.int, units: c.int) ---
	sceGxmSetTwoSidedEnable :: proc(_context: ^SceGxmContext, enable: SceGxmTwoSidedMode) ---
	sceGxmSetViewport :: proc(_context: ^SceGxmContext, xOffset: c.float, xScale: c.float, yOffset: c.float, yScale: c.float, zOffset: c.float, zScale: c.float) ---
	sceGxmSetWClampValue :: proc(_context: ^SceGxmContext, clampValue: c.float) ---
	sceGxmSetWClampEnable :: proc(_context: ^SceGxmContext, enable: SceGxmWClampMode) ---
	sceGxmSetRegionClip :: proc(_context: ^SceGxmContext, mode: SceGxmRegionClipMode, xMin: c.uint, yMin: c.uint, xMax: c.uint, yMax: c.uint) ---
	sceGxmSetDefaultRegionClipAndViewport :: proc(_context: ^SceGxmContext, xMax: c.uint, yMax: c.uint) ---
	sceGxmSetCullMode :: proc(_context: ^SceGxmContext, mode: SceGxmCullMode) ---
	sceGxmSetViewportEnable :: proc(_context: ^SceGxmContext, enable: SceGxmViewportMode) ---
	sceGxmSetWBufferEnable :: proc(_context: ^SceGxmContext, enable: SceGxmWBufferMode) ---
	sceGxmSetFrontVisibilityTestIndex :: proc(_context: ^SceGxmContext, index: c.uint) ---
	sceGxmSetBackVisibilityTestIndex :: proc(_context: ^SceGxmContext, index: c.uint) ---
	sceGxmSetFrontVisibilityTestOp :: proc(_context: ^SceGxmContext, op: SceGxmVisibilityTestOp) ---
	sceGxmSetBackVisibilityTestOp :: proc(_context: ^SceGxmContext, op: SceGxmVisibilityTestOp) ---
	sceGxmSetFrontVisibilityTestEnable :: proc(_context: ^SceGxmContext, enable: SceGxmVisibilityTestMode) ---
	sceGxmSetBackVisibilityTestEnable :: proc(_context: ^SceGxmContext, enable: SceGxmVisibilityTestMode) ---

	sceGxmSetYuvProfile :: proc(_context: ^SceGxmContext, index: c.uint, profile: SceGxmYuvProfile ) -> c.int ---

	sceGxmFinish :: proc(_context: ^SceGxmContext) ---

	sceGxmPushUserMarker :: proc(_context: ^SceGxmContext, tag: cstring) -> c.int ---
	sceGxmPopUserMarker :: proc(_context: ^SceGxmContext) -> c.int ---
	sceGxmSetUserMarker :: proc(_context: ^SceGxmContext, tag: cstring) -> c.int ---

	sceGxmPadHeartbeat :: proc(displaySurface: ^SceGxmColorSurface, displaySyncObject: ^SceGxmSyncObject) -> c.int ---

	sceGxmPadTriggerGpuPaTrace :: proc() -> c.int ---

	sceGxmColorSurfaceInit :: proc(surface: ^SceGxmColorSurface, colorFormat: SceGxmColorFormat, surfaceType: SceGxmColorSurfaceType, scaleMode: SceGxmColorSurfaceScaleMode, outputRegisterSize: SceGxmOutputRegisterSize, width: c.uint, height: c.uint, strideInPixels: c.uint, data: rawptr) -> c.int ---
	sceGxmColorSurfaceInitDisabled :: proc(surface: ^SceGxmColorSurface) -> c.int ---
	sceGxmColorSurfaceIsEnabled :: proc(surface: ^SceGxmColorSurface) -> sce.Bool ---
	sceGxmColorSurfaceGetClip :: proc(surface: ^SceGxmColorSurface, xMin: ^c.uint, yMin: ^c.uint, xMax: ^c.uint, yMax: ^c.uint) ---
	sceGxmColorSurfaceSetClip :: proc(surface: ^SceGxmColorSurface, xMin: c.uint, yMin: c.uint, xMax: c.uint, yMax: c.uint) ---

	sceGxmColorSurfaceGetScaleMode :: proc(surface: ^SceGxmColorSurface) -> SceGxmColorSurfaceScaleMode ---
	sceGxmColorSurfaceSetScaleMode :: proc(surface: ^SceGxmColorSurface, scaleMode: SceGxmColorSurfaceScaleMode) ---

	sceGxmColorSurfaceGetData :: proc(surface: ^SceGxmColorSurface) -> rawptr ---
	sceGxmColorSurfaceSetData :: proc(surface: ^SceGxmColorSurface, data: rawptr) -> c.int ---

	sceGxmColorSurfaceGetFormat :: proc(surface: ^SceGxmColorSurface) -> SceGxmColorFormat ---
	sceGxmColorSurfaceSetFormat :: proc(surface: ^SceGxmColorSurface, format: SceGxmColorFormat) -> c.int ---
	sceGxmColorSurfaceGetType :: proc(surface: ^SceGxmColorSurface) -> SceGxmColorSurfaceType ---
	sceGxmColorSurfaceGetStrideInPixels :: proc(surface: ^SceGxmColorSurface) -> c.uint ---

	sceGxmDepthStencilSurfaceInit :: proc(surface: ^SceGxmDepthStencilSurface, depthStencilFormat: SceGxmDepthStencilFormat, surfaceType: SceGxmDepthStencilSurfaceType, strideInSamples: c.uint, depthData: rawptr, stencilData: rawptr) -> c.int ---
	sceGxmDepthStencilSurfaceInitDisabled :: proc(surface: ^SceGxmDepthStencilSurface) -> c.int ---
	sceGxmDepthStencilSurfaceGetBackgroundDepth :: proc(surface: ^SceGxmDepthStencilSurface) -> c.float ---
	sceGxmDepthStencilSurfaceSetBackgroundDepth :: proc(surface: ^SceGxmDepthStencilSurface, backgroundDepth: c.float) ---
	sceGxmDepthStencilSurfaceGetBackgroundStencil :: proc(surface: ^SceGxmDepthStencilSurface) -> c.uchar ---
	sceGxmDepthStencilSurfaceSetBackgroundStencil :: proc(surface: ^SceGxmDepthStencilSurface, backgroundStencil: c.uchar) ---
	sceGxmDepthStencilSurfaceIsEnabled :: proc(surface: ^SceGxmDepthStencilSurface) -> sce.Bool ---
	sceGxmDepthStencilSurfaceSetForceLoadMode :: proc(surface: ^SceGxmDepthStencilSurface, forceLoad: SceGxmDepthStencilForceLoadMode) ---
	sceGxmDepthStencilSurfaceGetForceLoadMode :: proc(surface: ^SceGxmDepthStencilSurface) -> SceGxmDepthStencilForceLoadMode ---
	sceGxmDepthStencilSurfaceSetForceStoreMode :: proc(surface: ^SceGxmDepthStencilSurface, forceStore: SceGxmDepthStencilForceStoreMode ) ---
	sceGxmDepthStencilSurfaceGetForceStoreMode :: proc(surface: ^SceGxmDepthStencilSurface) -> SceGxmDepthStencilForceStoreMode ---

	sceGxmColorSurfaceGetGammaMode :: proc(surface: ^SceGxmColorSurface) -> SceGxmColorSurfaceGammaMode ---
	sceGxmColorSurfaceSetGammaMode :: proc(surface: ^SceGxmColorSurface, gammaMode: SceGxmColorSurfaceGammaMode) -> c.int ---
	sceGxmColorSurfaceGetDitherMode :: proc(surface: ^SceGxmColorSurface) -> SceGxmColorSurfaceDitherMode ---
	sceGxmColorSurfaceSetDitherMode :: proc(surface: ^SceGxmColorSurface, ditherMode: SceGxmColorSurfaceDitherMode) -> c.int ---

	sceGxmDepthStencilSurfaceGetFormat :: proc(surface: ^SceGxmDepthStencilSurface) -> SceGxmDepthStencilFormat ---
	sceGxmDepthStencilSurfaceGetStrideInSamples :: proc(surface: ^SceGxmDepthStencilSurface) -> c.uint ---

	sceGxmProgramCheck :: proc(program: ^SceGxmProgram) -> c.int ---
	sceGxmProgramGetSize :: proc(program: ^SceGxmProgram) -> c.uint ---
	sceGxmProgramGetType :: proc(program: ^SceGxmProgram) -> SceGxmProgramType ---
	sceGxmProgramIsDiscardUsed :: proc(program: ^SceGxmProgram) -> sce.Bool ---
	sceGxmProgramIsDepthReplaceUsed :: proc(program: ^SceGxmProgram) -> sce.Bool ---
	sceGxmProgramIsSpriteCoordUsed :: proc(program: ^SceGxmProgram) -> sce.Bool ---
	sceGxmProgramGetDefaultUniformBufferSize :: proc(program: ^SceGxmProgram) -> c.uint ---
	sceGxmProgramGetParameterCount :: proc(program: ^SceGxmProgram) -> c.uint ---

	sceGxmProgramGetParameter :: proc(program: ^SceGxmProgram, index: c.uint) -> ^SceGxmProgramParameter ---
	sceGxmProgramFindParameterByName :: proc(program: ^SceGxmProgram, name: cstring) -> ^SceGxmProgramParameter ---
	sceGxmProgramFindParameterBySemantic :: proc(program: ^SceGxmProgram, semantic: SceGxmParameterSemantic, index: c.uint) -> ^SceGxmProgramParameter ---
	sceGxmProgramParameterGetIndex :: proc(program: ^SceGxmProgram, parameter: ^SceGxmProgramParameter) -> c.uint ---
	sceGxmProgramParameterGetCategory :: proc(parameter: ^SceGxmProgramParameter) -> SceGxmParameterCategory ---
	sceGxmProgramParameterGetName :: proc(parameter: ^SceGxmProgramParameter) -> cstring ---
	sceGxmProgramParameterGetSemantic :: proc(parameter: ^SceGxmProgramParameter) -> SceGxmParameterSemantic ---
	sceGxmProgramParameterGetSemanticIndex :: proc(parameter: ^SceGxmProgramParameter) -> c.uint ---
	sceGxmProgramParameterGetType :: proc(parameter: ^SceGxmProgramParameter) -> SceGxmParameterType ---
	sceGxmProgramParameterGetComponentCount :: proc(parameter: ^SceGxmProgramParameter) -> c.uint ---
	sceGxmProgramParameterGetArraySize :: proc(parameter: ^SceGxmProgramParameter) -> c.uint ---
	sceGxmProgramParameterGetResourceIndex :: proc(parameter: ^SceGxmProgramParameter) -> c.uint ---
	sceGxmProgramParameterGetContainerIndex :: proc( parameter: ^SceGxmProgramParameter) -> c.uint ---
	sceGxmProgramParameterIsSamplerCube :: proc(parameter: ^SceGxmProgramParameter) -> sce.Bool ---

	sceGxmFragmentProgramGetProgram :: proc(fragmentProgram: ^SceGxmFragmentProgram) -> ^SceGxmProgram ---
	sceGxmVertexProgramGetProgram :: proc(vertexProgram: ^SceGxmVertexProgram) -> ^SceGxmProgram ---

	sceGxmShaderPatcherCreate :: proc(params: ^SceGxmShaderPatcherParams, shaderPatcher: ^^SceGxmShaderPatcher) -> c.int ---
	sceGxmShaderPatcherSetUserData :: proc(shaderPatcher: ^SceGxmShaderPatcher, userData: rawptr) -> c.int ---
	sceGxmShaderPatcherGetUserData :: proc(shaderPatcher: ^SceGxmShaderPatcher) -> rawptr ---
	sceGxmShaderPatcherDestroy :: proc(shaderPatcher: ^SceGxmShaderPatcher) -> c.int ---
	sceGxmShaderPatcherRegisterProgram :: proc(shaderPatcher: ^SceGxmShaderPatcher, programHeader: ^SceGxmProgram, programId: ^SceGxmShaderPatcherId) -> c.int ---
	sceGxmShaderPatcherUnregisterProgram :: proc(shaderPatcher: ^SceGxmShaderPatcher, programId: SceGxmShaderPatcherId) -> c.int ---
	sceGxmShaderPatcherForceUnregisterProgram :: proc(shaderPatcher: ^SceGxmShaderPatcher, programId: SceGxmShaderPatcherId) -> c.int ---
	sceGxmShaderPatcherGetProgramFromId :: proc(programId: SceGxmShaderPatcherId) -> ^SceGxmProgram ---
	sceGxmShaderPatcherSetAuxiliarySurface :: proc(shaderPatcher: ^SceGxmShaderPatcher, auxSurfaceIndex: c.uint, auxSurface: ^SceGxmAuxiliarySurface) -> c.int ---
	sceGxmShaderPatcherCreateVertexProgram :: proc(shaderPatcher: ^SceGxmShaderPatcher, programId: SceGxmShaderPatcherId, attributes: ^SceGxmVertexAttribute, attributeCount: c.uint, streams: ^SceGxmVertexStream, streamCount: c.uint, vertexProgram: ^^SceGxmVertexProgram) -> c.int ---
	sceGxmShaderPatcherCreateFragmentProgram :: proc(shaderPatcher: ^SceGxmShaderPatcher, programId: SceGxmShaderPatcherId, outputFormat: SceGxmOutputRegisterFormat, multisampleMode: SceGxmMultisampleMode, blendInfo: ^SceGxmBlendInfo, vertexProgram: ^SceGxmProgram, fragmentProgram: ^^SceGxmFragmentProgram) -> c.int ---
	sceGxmShaderPatcherCreateMaskUpdateFragmentProgram :: proc(shaderPatcher: ^SceGxmShaderPatcher, fragmentProgram: ^^SceGxmFragmentProgram) -> c.int ---
	sceGxmShaderPatcherAddRefVertexProgram :: proc(shaderPatcher: ^SceGxmShaderPatcher, vertexProgram: ^SceGxmVertexProgram) -> c.int ---
	sceGxmShaderPatcherAddRefFragmentProgram :: proc(shaderPatcher: ^SceGxmShaderPatcher, fragmentProgram: ^SceGxmFragmentProgram) -> c.int ---
	sceGxmShaderPatcherGetVertexProgramRefCount :: proc(shaderPatcher: ^SceGxmShaderPatcher, fragmentProgram: ^SceGxmVertexProgram, count: ^c.uint) -> c.int ---
	sceGxmShaderPatcherGetFragmentProgramRefCount :: proc(shaderPatcher: ^SceGxmShaderPatcher, fragmentProgram: ^SceGxmFragmentProgram, count: ^c.uint) -> c.int ---
	sceGxmShaderPatcherReleaseVertexProgram :: proc(shaderPatcher: ^SceGxmShaderPatcher, vertexProgram: ^SceGxmVertexProgram) -> c.int ---
	sceGxmShaderPatcherReleaseFragmentProgram :: proc(shaderPatcher: ^SceGxmShaderPatcher, fragmentProgram: ^SceGxmFragmentProgram) -> c.int ---
	sceGxmShaderPatcherGetHostMemAllocated :: proc(shaderPatcher: ^SceGxmShaderPatcher) -> c.uint ---
	sceGxmShaderPatcherGetBufferMemAllocated :: proc(shaderPatcher: ^SceGxmShaderPatcher) -> c.uint ---
	sceGxmShaderPatcherGetVertexUsseMemAllocated :: proc(shaderPatcher: ^SceGxmShaderPatcher) -> c.uint ---
	sceGxmShaderPatcherGetFragmentUsseMemAllocated :: proc(shaderPatcher: ^SceGxmShaderPatcher) -> c.uint ---

	sceGxmTextureInitSwizzled :: proc(texture: ^SceGxmTexture,  data: rawptr, texFormat: SceGxmTextureFormat, width: c.uint, height: c.uint, mipCount: c.uint) -> c.int ---
	sceGxmTextureInitSwizzledArbitrary :: proc(texture: ^SceGxmTexture, data: rawptr, texFormat: SceGxmTextureFormat, width: c.uint, height: c.uint, mipCount: c.uint) -> c.int ---
	sceGxmTextureInitLinear :: proc(texture: ^SceGxmTexture, data: rawptr, texFormat: SceGxmTextureFormat, width: c.uint, height: c.uint, mipCount: c.uint) -> c.int ---
	sceGxmTextureInitLinearStrided :: proc(texture: ^SceGxmTexture, data: rawptr, texFormat: SceGxmTextureFormat, width: c.uint, height: c.uint, byteStride: c.uint) -> c.int ---
	sceGxmTextureInitTiled :: proc(texture: ^SceGxmTexture, data: rawptr, texFormat: SceGxmTextureFormat, width: c.uint, height: c.uint, mipCount: c.uint) -> c.int ---
	sceGxmTextureInitCube :: proc(texture: ^SceGxmTexture, data: rawptr, texFormat: SceGxmTextureFormat, width: c.uint, height: c.uint, mipCount: c.uint) -> c.int ---

	sceGxmTextureGetType :: proc(texture: ^SceGxmTexture) -> SceGxmTextureType ---
	sceGxmTextureValidate :: proc(texture: ^SceGxmTexture) -> c.int ---

	sceGxmTextureSetMinFilter :: proc(texture: ^SceGxmTexture, minFilter: SceGxmTextureFilter) -> c.int ---
	sceGxmTextureGetMinFilter :: proc(texture: ^SceGxmTexture) -> SceGxmTextureFilter ---

	sceGxmTextureSetMagFilter :: proc(texture: ^SceGxmTexture, magFilter: SceGxmTextureFilter) -> c.int ---
	sceGxmTextureGetMagFilter :: proc(texture: ^SceGxmTexture) -> SceGxmTextureFilter ---

	sceGxmTextureSetMipFilter :: proc(texture: ^SceGxmTexture, mipFilter: SceGxmTextureMipFilter) -> c.int ---
	sceGxmTextureGetMipFilter :: proc(texture: ^SceGxmTexture) -> SceGxmTextureMipFilter ---

	sceGxmTextureSetUAddrMode :: proc(texture: ^SceGxmTexture, addrMode: SceGxmTextureAddrMode) -> c.int ---
	sceGxmTextureGetUAddrMode :: proc(texture: ^SceGxmTexture) -> SceGxmTextureAddrMode ---

	sceGxmTextureSetVAddrMode :: proc(texture: ^SceGxmTexture, addrMode: SceGxmTextureAddrMode) -> c.int ---
	sceGxmTextureGetVAddrMode :: proc(texture: ^SceGxmTexture) -> SceGxmTextureAddrMode ---

	sceGxmTextureSetFormat :: proc(texture: ^SceGxmTexture, texFormat: SceGxmTextureFormat ) -> c.int ---
	sceGxmTextureGetFormat :: proc( texture: ^SceGxmTexture) -> SceGxmTextureFormat ---

	sceGxmTextureSetLodBias :: proc(texture: ^SceGxmTexture, bias: c.uint) -> c.int ---
	sceGxmTextureGetLodBias :: proc( texture: ^SceGxmTexture) -> c.uint ---

	sceGxmTextureSetStride :: proc(texture: ^SceGxmTexture, byteStride: c.uint) -> c.int ---
	sceGxmTextureGetStride :: proc( texture: ^SceGxmTexture) -> c.uint ---

	sceGxmTextureSetWidth :: proc(texture: ^SceGxmTexture, width: c.uint) -> c.int ---
	sceGxmTextureGetWidth :: proc( texture: ^SceGxmTexture) -> c.uint ---

	sceGxmTextureSetHeight :: proc(texture: ^SceGxmTexture, height: c.uint) -> c.int ---
	sceGxmTextureGetHeight :: proc( texture: ^SceGxmTexture) -> c.uint ---

	sceGxmTextureSetData :: proc(texture: ^SceGxmTexture,  data: rawptr) -> c.int ---
	sceGxmTextureGetData :: proc( texture: ^SceGxmTexture) -> rawptr ---

	sceGxmTextureSetMipmapCount :: proc(texture: ^SceGxmTexture, mipCount: c.uint) -> c.int ---
	sceGxmTextureGetMipmapCount :: proc( texture: ^SceGxmTexture) -> c.uint ---

	sceGxmTextureSetPalette :: proc(texture: ^SceGxmTexture,  paletteData: rawptr) -> c.int ---
	sceGxmTextureGetPalette :: proc( texture: ^SceGxmTexture) -> rawptr ---

	sceGxmTextureGetGammaMode :: proc( texture: ^SceGxmTexture) -> SceGxmTextureGammaMode ---
	sceGxmTextureSetGammaMode :: proc(texture: ^SceGxmTexture, gammaMode: SceGxmTextureGammaMode) -> c.int ---

	sceGxmGetPrecomputedVertexStateSize :: proc( vertexProgram: ^SceGxmVertexProgram) -> c.uint ---
	sceGxmPrecomputedVertexStateInit :: proc(precomputedState: ^SceGxmPrecomputedVertexState,  vertexProgram: ^SceGxmVertexProgram, memBlock: rawptr) -> c.int ---
	sceGxmPrecomputedVertexStateSetDefaultUniformBuffer :: proc(precomputedState: ^SceGxmPrecomputedVertexState, defaultBuffer: rawptr) ---
	sceGxmPrecomputedVertexStateGetDefaultUniformBuffer :: proc( precomputedState: ^SceGxmPrecomputedVertexState) -> rawptr ---
	sceGxmPrecomputedVertexStateSetAllTextures :: proc(precomputedState: ^SceGxmPrecomputedVertexState, textures: ^SceGxmTexture) -> c.int ---
	sceGxmPrecomputedVertexStateSetTexture :: proc(precomputedState: ^SceGxmPrecomputedVertexState, textureIndex: c.uint, texture: ^SceGxmTexture) -> c.int ---
	sceGxmPrecomputedVertexStateSetAllUniformBuffers :: proc(precomputedState: ^SceGxmPrecomputedVertexState, bufferDataArray: ^rawptr) -> c.int ---
	sceGxmPrecomputedVertexStateSetUniformBuffer :: proc(precomputedState: ^SceGxmPrecomputedVertexState, bufferIndex: c.uint, bufferData: rawptr) -> c.int ---
	sceGxmGetPrecomputedFragmentStateSize :: proc(fragmentProgram: ^SceGxmFragmentProgram) -> c.uint ---
	sceGxmPrecomputedFragmentStateInit :: proc(precomputedState: ^SceGxmPrecomputedFragmentState,  fragmentProgram: ^SceGxmFragmentProgram, memBlock: rawptr) -> c.int ---
	sceGxmPrecomputedFragmentStateSetDefaultUniformBuffer :: proc(precomputedState: ^SceGxmPrecomputedFragmentState, defaultBuffer: rawptr) ---
	sceGxmPrecomputedFragmentStateGetDefaultUniformBuffer :: proc(precomputedState: ^SceGxmPrecomputedFragmentState) -> rawptr ---
	sceGxmPrecomputedFragmentStateSetAllTextures :: proc(precomputedState: ^SceGxmPrecomputedFragmentState, textureArray: [^]SceGxmTexture) -> c.int ---
	sceGxmPrecomputedFragmentStateSetTexture :: proc(precomputedState: ^SceGxmPrecomputedFragmentState, textureIndex: c.uint, texture: ^SceGxmTexture) -> c.int ---
	sceGxmPrecomputedFragmentStateSetAllUniformBuffers :: proc(precomputedState: ^SceGxmPrecomputedFragmentState, bufferDataArray: ^rawptr) -> c.int ---
	sceGxmPrecomputedFragmentStateSetUniformBuffer :: proc(precomputedState: ^SceGxmPrecomputedFragmentState, bufferIndex: c.uint, bufferData: rawptr) -> c.int ---
	sceGxmPrecomputedFragmentStateSetAllAuxiliarySurfaces :: proc(precomputedState: ^SceGxmPrecomputedFragmentState, auxSurfaceArray: ^SceGxmAuxiliarySurface) -> c.int ---
	sceGxmGetPrecomputedDrawSize :: proc( vertexProgram: ^SceGxmVertexProgram) -> c.uint ---
	sceGxmPrecomputedDrawInit :: proc(precomputedDraw: ^SceGxmPrecomputedDraw, vertexProgram: ^SceGxmVertexProgram, memBlock: rawptr) -> c.int ---
	sceGxmPrecomputedDrawSetAllVertexStreams :: proc(precomputedDraw: ^SceGxmPrecomputedDraw, streamDataArray: ^rawptr) -> c.int ---
	sceGxmPrecomputedDrawSetVertexStream :: proc(precomputedDraw: ^SceGxmPrecomputedDraw, streamIndex: c.uint, streamData: rawptr) -> c.int ---
	sceGxmPrecomputedDrawSetParams :: proc(precomputedDraw: ^SceGxmPrecomputedDraw, primType: SceGxmPrimitiveType, indexType: SceGxmIndexFormat, indexData: rawptr, indexCount: c.uint) ---
	sceGxmPrecomputedDrawSetParamsInstanced :: proc(precomputedDraw: ^SceGxmPrecomputedDraw, primType: SceGxmPrimitiveType, indexType: SceGxmIndexFormat, indexData: rawptr, indexCount: c.uint, indexWrap: c.uint) ---

	sceGxmGetRenderTargetMemSize :: proc(params: ^SceGxmRenderTargetParams, driverMemSize: ^c.uint) -> c.int ---
	sceGxmCreateRenderTarget :: proc(params: ^SceGxmRenderTargetParams, renderTarget: ^^SceGxmRenderTarget) -> c.int ---
	sceGxmRenderTargetGetHostMem :: proc(renderTarget: ^SceGxmRenderTarget, hostMem: ^rawptr) -> c.int ---
	sceGxmRenderTargetGetDriverMemBlock :: proc(renderTarget: ^SceGxmRenderTarget, driverMemBlock: ^sce.UID) -> c.int ---
	sceGxmDestroyRenderTarget :: proc(renderTarget: ^SceGxmRenderTarget) -> c.int ---

	sceGxmSetUniformDataF :: proc(uniformBuffer: rawptr, parameter: ^SceGxmProgramParameter, componentOffset: c.uint, componentCount: c.uint, sourceData: ^c.float) -> c.int ---

	sceGxmTransferCopy :: proc(width: c.uint32_t, height: c.uint32_t, colorKeyValue: c.uint32_t, colorKeyMask: c.uint32_t, colorKeyMode: SceGxmTransferColorKeyMode, srcFormat: SceGxmTransferFormat, srcType: SceGxmTransferType, srcAddress: rawptr, srcX: c.uint32_t, srcY: c.uint32_t, srcStride: c.int32_t, destFormat: SceGxmTransferFormat, destType: SceGxmTransferType, destAddress: rawptr, destX: c.uint32_t, destY: c.uint32_t, destStride: c.int32_t, syncObject: ^SceGxmSyncObject, syncFlags: c.uint32_t, notification: ^SceGxmNotification) -> c.int ---
	sceGxmTransferDownscale :: proc(srcFormat: SceGxmTransferFormat, srcAddress: rawptr, srcX: c.uint, srcY: c.uint, srcWidth: c.uint, srcHeight: c.uint, srcStride: c.int, destFormat: SceGxmTransferFormat, destAddress: rawptr, destX: c.uint, destY: c.uint, destStride: c.int, syncObject: ^SceGxmSyncObject, syncFlags: c.uint, notification: ^SceGxmNotification) -> c.int ---
	sceGxmTransferFill :: proc(color: c.uint32_t, destFormat: SceGxmTransferFormat, destAddress: rawptr, destX: c.uint32_t, destY: c.uint32_t, destWidth: c.uint32_t, destHeight: c.uint32_t, destStride: c.int32_t, syncObject: ^SceGxmSyncObject, syncFlags: c.uint32_t,  notification: ^SceGxmNotification) -> c.int ---
	sceGxmTransferFinish :: proc() -> c.int ---
}

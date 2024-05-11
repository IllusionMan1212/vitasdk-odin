package shacccg

import "core:c"
import sce "../common"

SceShaccCgParameter :: rawptr

SceShaccCgCallbackOpenFile :: #type ^proc "c" (
	fileName: cstring,
	#by_ptr includedFrom: SceShaccCgSourceLocation,
	#by_ptr compileOptions: SceShaccCgCompileOptions,
	errorString: ^cstring) -> ^SceShaccCgSourceFile

SceShaccCgCallbackReleaseFile :: #type ^proc "c" (
	#by_ptr file: SceShaccCgSourceFile,
	#by_ptr compileOptions: SceShaccCgCompileOptions)

SceShaccCgCallbackLocateFile :: #type ^proc "c" (
	fileName: cstring,
	#by_ptr includedFrom: SceShaccCgSourceLocation,
	searchPathCount: sce.UInt32,
	searchPaths: [^]cstring,
	#by_ptr compileOptions: SceShaccCgCompileOptions,
	errorString: ^cstring) -> cstring

SceShaccCgCallbackAbsolutePath :: #type ^proc "c" (
	fileName: cstring,
	#by_ptr includedFrom: SceShaccCgSourceLocation,
	#by_ptr compileOptions: SceShaccCgCompileOptions) -> cstring

SceShaccCgCallbackReleaseFileName :: #type ^proc "c" (
	fileName: cstring,
	#by_ptr compileOptions: SceShaccCgCompileOptions)

SceShaccCgCallbackFileDate :: #type ^proc "c" (
	#by_ptr file: SceShaccCgSourceFile,
	#by_ptr includedFrom: SceShaccCgSourceLocation,
	#by_ptr compileOptions: SceShaccCgCompileOptions,
	timeLastStatusChange: ^c.int64_t,
	timeLastModified: ^c.int64_t) -> sce.Int32

SceShaccCgDiagnosticLevel :: enum c.int {
	INFO,
	WARNING,
	ERROR
}

SceShaccCgTargetProfile :: enum c.int {
	VP,
	FP
}

SceShaccCgCallbackDefaults :: enum c.int {
	SYSTEM_FILES,
	TRIVIAL
}

SceShaccCgLocale :: enum c.int {
	ENGLISH,
	JAPANESE
}

SceShaccCgSourceFile :: struct {
  fileName: cstring,
	text: cstring,
	size: sce.UInt32,
}

SceShaccCgSourceLocation :: struct {
	file: ^SceShaccCgSourceFile,
	lineNumber: sce.UInt32,
	columnNumber: sce.UInt32,
}

SceShaccCgCallbackList :: struct {
  openFile: SceShaccCgCallbackOpenFile,
	releaseFile: SceShaccCgCallbackReleaseFile,
	locateFile: SceShaccCgCallbackLocateFile,
	absolutePath: SceShaccCgCallbackAbsolutePath,
	releaseFileName: SceShaccCgCallbackReleaseFileName,
	fileDate: SceShaccCgCallbackFileDate,
}

SceShaccCgCompileOptions :: struct {
	mainSourceFile: cstring,
	targetProfile: SceShaccCgTargetProfile,
	entryFunctionName: cstring,
	searchPathCount: sce.UInt32,
	searchPaths: [^]cstring,
	macroDefinitionCount: sce.UInt32,
	macroDefinitions: [^]cstring,
	includeFileCount: sce.UInt32,
	includeFiles: [^]cstring,
	suppressedWarningsCount: sce.UInt32,
	suppressedWarnings: [^]sce.UInt32,
	locale: SceShaccCgLocale,
	useFx: sce.Int32,
	noStdlib: sce.Int32,
	optimizationLevel: sce.Int32,
	useFastmath: sce.Int32,
	useFastprecision: sce.Int32,
	useFastint: sce.Int32,
	field_48: c.int,
	warningsAsErrors: sce.Int32,
	performanceWarnings: sce.Int32,
	warningLevel: sce.Int32,
	pedantic: sce.Int32,
	pedanticError: sce.Int32,
	field_60: c.int,
	field_64: c.int,
}

SceShaccCgDiagnosticMessage :: struct {
  level: SceShaccCgDiagnosticLevel,
	code: sce.UInt32,
	location: ^SceShaccCgSourceLocation,
	message: cstring,
}

SceShaccCgCompileOutput :: struct {
	programData: [^]c.uint8_t,
	programSize: sce.UInt32,
	diagnosticCount: sce.Int32,
	diagnostics: ^SceShaccCgDiagnosticMessage,
}


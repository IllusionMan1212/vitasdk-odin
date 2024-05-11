package videodec

import "core:c"

foreign import videodec "system:SceVideodec_stub"

foreign videodec {
	/**
	* @param[in] codec - See ::SceVideodecType
	* @param[in] initInfo - See ::SceVideodecQueryInitInfoHwAvcdec
	*
	* @return 0 on success, < 0 on error.
	*/
	sceVideodecInitLibrary :: proc(codec: SceVideodecType, #by_ptr initInfo: SceVideodecQueryInitInfoHwAvcdec) -> c.int ---

	/**
	* @param[in] codec - See ::SceVideodecType
	*
	* @return 0 on success, < 0 on error.
	*/
	sceVideodecTermLibrary :: proc(codec: SceVideodecType) -> c.int ---

	/**
	* @param[in] codec - See ::SceVideodecType
	* @param[in] query - Should be copy from ::SceVideodecQueryInitInfoHwAvcdec.
	* @param[out] decoderInfo - Must be initialized with zeros.
	*
	* @return 0 on success, < 0 on error.
	*/
	sceAvcdecQueryDecoderMemSize :: proc(codec: SceVideodecType, #by_ptr query: SceAvcdecQueryDecoderInfo, decoderInfo: ^SceAvcdecDecoderInfo) -> c.int ---

	/**
	* @param[in] codec - See ::SceVideodecType
	* @param[out] decoder - Must be initialized frameBuf.size and frameBuf.pBuf
	* @param[in] query - Should be copy from ::SceVideodecQueryInitInfoHwAvcdec.
	*
	* @return 0 on success, < 0 on error.
	*/
	sceAvcdecCreateDecoder :: proc(codec: SceVideodecType, decoder: ^SceAvcdecCtrl, #by_ptr query: SceAvcdecQueryDecoderInfo) -> c.int ---

	/**
	* @param[in] decoder - A ::SceAvcdecCtrl decoder initialized with ::sceAvcdecCreateDecoder
	*
	* @return 0 on success, < 0 on error.
	*/
	sceAvcdecDeleteDecoder :: proc(decoder: ^SceAvcdecCtrl) -> c.int ---

	/**
	* @param[in] decoder
	* @param[in] au - Must set buffer information(es) and be initialized timestamps with 0xFFFFFFFF
	* @param[out] array_picture - Must set numOfElm and pPicture. See ::SceAvcdecArrayPicture
	*
	* @return 0 on success, < 0 on error.
	*/
	sceAvcdecDecode :: proc(#by_ptr decoder: SceAvcdecCtrl, #by_ptr au: SceAvcdecAu, array_picture: [^]SceAvcdecArrayPicture) -> c.int ---
}


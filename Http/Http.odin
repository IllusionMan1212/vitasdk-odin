package http

import "core:c"

foreign import http "system:SceHttp_stub"

foreign http {
    HttpInit :: proc(poolSize: c.uint) -> c.int ---
    HttpTerm :: proc() -> c.int ---
    HttpGetMemoryPoolStats :: proc(currentStat: ^SceHttpMemoryPoolStats) -> c.int ---

    HttpSetAuthInfoCallback :: proc(id: c.int, cbfunc: SceHttpAuthInfoCallback, userArg: rawptr) -> c.int ---
    HttpSetAuthEnabled :: proc(id: c.int, enable: c.int) -> c.int ---
    HttpGetAuthEnabled :: proc(id: c.int, enable: ^c.int) -> c.int ---
    HttpSetRedirectCallback :: proc(id: c.int, cbfunc: SceHttpRedirectCallback, userArg: rawptr) -> c.int ---
    HttpSetAutoRedirect :: proc(id: c.int, enable: c.int) -> c.int ---
    HttpGetAutoRedirect :: proc(id: c.int, enable: ^c.int) -> c.int ---
    HttpSetResolveTimeOut :: proc(id: c.int, usec: c.uint) -> c.int ---
    HttpSetResolveRetry :: proc(id: c.int, retry: c.int) -> c.int ---
    HttpSetConnectTimeOut :: proc(id: c.int, usec: c.uint) -> c.int ---
    HttpSetSendTimeOut :: proc(id: c.int, usec: c.uint) -> c.int ---
    HttpSetRecvTimeOut :: proc(id: c.int, usec: c.uint) -> c.int ---

    HttpSendRequest :: proc(reqId: c.int, postData: rawptr, size: c.uint) -> c.int ---
    HttpAbortRequest :: proc(reqId: c.int) -> c.int ---
    HttpGetResponseContentLength :: proc(reqId: c.int, contentLength: ^c.ulonglong) -> c.int ---
    HttpGetStatusCode :: proc(reqId: c.int, statusCode: ^c.int) -> c.int ---
    HttpGetAllResponseHeaders :: proc(reqId: c.int, header: ^[^]c.char, headerSize: ^c.uint) -> c.int --- // TODO: header is multipointer, cstring or double pointer to char??
    HttpReadData :: proc(reqId: c.int, data: rawptr, size: c.uint) -> c.int ---
    HttpAddRequestHeader :: proc(id: c.int, name: cstring, value: cstring, mode: c.uint) -> c.int ---
    HttpRemoveRequestHeader :: proc(id: c.int, name: cstring) -> c.int ---

    HttpParseResponseHeader :: proc(header: cstring, headerLen: c.uint, fieldStr: cstring, fieldValue: ^cstring, valueLen: ^c.uint) -> c.int ---
    HttpParseStatusLine :: proc(statusLine: cstring, lineLen: c.uint, httpMajorVer: ^c.int, httpMinorVer: ^c.int, responseCode: ^c.int, reasonPhrase: ^cstring, phraseLen: ^c.uint) -> c.int ---

    HttpCreateTemplate :: proc(userAgent: cstring, httpVer: SceHttpVersion, autoProxyConf: SceHttpProxyMode) -> c.int ---
    HttpDeleteTemplate :: proc(tmplId: c.int) -> c.int ---
    HttpCreateConnection :: proc(tmplId: c.int, serverName: cstring, scheme: cstring, port: c.ushort, enableKeepalive: c.int) -> c.int ---
    HttpCreateConnectionWithURL :: proc(tmplId: c.int, url: cstring, enableKeepalive: c.int) -> c.int ---
    HttpDeleteConnection :: proc(connId: c.int) -> c.int ---
    HttpCreateRequest :: proc(connId: c.int, method: c.int, path: cstring, contentLength: c.ulonglong) -> c.int ---
    HttpCreateRequestWithURL :: proc(connId: c.int, method: c.int, url: cstring, contentLength: c.ulonglong) -> c.int ---
    HttpDeleteRequest :: proc(reqId: c.int) -> c.int ---
    HttpSetResponseHeaderMaxSize :: proc(id: c.int, headerSize: c.uint) -> c.int ---
    HttpSetRequestContentLength :: proc(id: c.int, contentLength: c.ulonglong) -> c.int ---

    // uri
    HttpUriEscape :: proc(out: cstring, require: ^c.uint, prepare: c.uint, _in: cstring) -> c.int ---
    HttpUriUnescape :: proc(out: cstring, require: ^c.uint, prepare: c.uint, _in: cstring) -> c.int ---
    HttpUriParse :: proc(out: ^SceHttpUriElement, srcUrl: cstring, pool: rawptr, require: ^c.uint, prepare: c.uint) -> c.int ---
    HttpUriBuild :: proc(out: cstring, require: ^c.uint, prepare: c.uint, srcElement: ^SceHttpUriElement, option: c.uint) -> c.int ---
    HttpUriMerge :: proc(mergedUrl: cstring, url: cstring, relativeUrl: cstring, require: ^c.uint, prepare: c.uint, option: c.uint) -> c.int ---
    HttpUriSweepPath :: proc(dst: cstring, src: cstring, srcSize: c.uint) -> c.int ---

    // https
    /**
	* Register RootCA certificate for HTTPS authentication
	*
	* @param[in] caCertNum - Number of elements of the list referncing to RootCA certificate
	* @param[in] caList - List referencing to RootCA certificate
	* @param[in] cert - Client certificate
	* @param[in] privKey - Private key
	*
	* @return 0 on success, < 0 on error.
	*
	* @note <b>SCE_SYSMODULE_HTTPS</b> module must be loaded with ::sceSysmoduleLoadModule to use this function.
	*/
    HttpsLoadCert :: proc(caCertNum: c.int, caList: [^]SceHttpsData, cert: ^SceHttpsData, privKey: ^SceHttpsData) -> c.int ---
    HttpsUnloadCert :: proc() -> c.int ---
    HttpsEnableOption :: proc(sslFlags: c.uint) -> c.int ---
    HttpsDisableOption :: proc(sslFlags: c.uint) -> c.int ---
    HttpsGetSslError :: proc(id: c.int, errNum: ^c.int, detail: ^c.uint) -> c.int ---
    HttpsSetSslCallback :: proc(id: c.int, cbfunc: SceHttpsCallback, userArg: rawptr) -> c.int ---
    HttpsGetCaList :: proc(caList: ^SceHttpsCaList) -> c.int ---
    HttpsFreeCaList :: proc(caList: ^SceHttpsCaList) -> c.int ---

    // cookie
    HttpSetCookieEnabled :: proc(id: c.int, enable: c.int) -> c.int ---
    HttpGetCookieEnabled :: proc(id: c.int, enable: ^c.int) -> c.int ---
    HttpGetCookie :: proc(url: cstring, cookie: cstring, cookieLength: ^c.uint, prepare: c.uint, secure: c.int) -> c.int ---
    HttpAddCookie :: proc(url: cstring, cookie: cstring, cookieLength: c.uint) -> c.int ---
    HttpSetCookieRecvCallback :: proc(id: c.int, cbfunc: SceHttpCookieRecvCallback, userArg: rawptr) -> c.int ---
    HttpSetCookieSendCallback :: proc(id: c.int, cbfunc: SceHttpCookieSendCallback, userArg: rawptr) -> c.int ---
}

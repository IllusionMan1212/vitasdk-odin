package http

import "base:builtin"
import "core:c"

SCE_HTTP_DEFAULT_RESOLVER_TIMEOUT : c.uint : (1 * 1000 * 1000)
SCE_HTTP_DEFAULT_RESOLVER_RETRY : c.uint : (5)
SCE_HTTP_DEFAULT_CONNECT_TIMEOUT : c.uint : (30 * 1000 * 1000)
SCE_HTTP_DEFAULT_SEND_TIMEOUT : c.uint : (120 * 1000 * 1000)
SCE_HTTP_DEFAULT_RECV_TIMEOUT : c.uint : (120 * 1000 * 1000)
SCE_HTTP_DEFAULT_RECV_BLOCK_SIZE : c.uint : (1500)
SCE_HTTP_DEFAULT_RESPONSE_HEADER_MAX : c.uint : (5000)
SCE_HTTP_DEFAULT_REDIRECT_MAX : c.uint : (6)
SCE_HTTP_DEFAULT_TRY_AUTH_MAX : c.uint : (6)

SCE_HTTP_INVALID_ID :: 0

SceHttpErrorCode :: enum c.uint {
    BEFORE_INIT                 = 0x80431001,
    ALREADY_INITED              = 0x80431020,
    BUSY                        = 0x80431021,
    OUT_OF_MEMORY               = 0x80431022,
    NOT_FOUND                   = 0x80431025,
    INVALID_VERSION             = 0x8043106A,
    INVALID_ID                  = 0x80431100,
    OUT_OF_SIZE                 = 0x80431104,
    INVALID_VALUE               = 0x804311FE,
    INVALID_URL                 = 0x80433060,
    UNKNOWN_SCHEME              = 0x80431061,
    NETWORK                     = 0x80431063,
    BAD_RESPONSE                = 0x80431064,
    BEFORE_SEND                 = 0x80431065,
    AFTER_SEND                  = 0x80431066,
    TIMEOUT                     = 0x80431068,
    UNKOWN_AUTH_TYPE            = 0x80431069,
    UNKNOWN_METHOD              = 0x8043106B,
    READ_BY_HEAD_METHOD         = 0x8043106F,
    NOT_IN_COM                  = 0x80431070,
    NO_CONTENT_LENGTH           = 0x80431071,
    CHUNK_ENC                   = 0x80431072,
    TOO_LARGE_RESPONSE_HEADER   = 0x80431073,
    SSL                         = 0x80431075,
    ABORTED                     = 0x80431080,
    UNKNOWN                     = 0x80431081,
    PARSE_HTTP_NOT_FOUND        = 0x80432025,
    PARSE_HTTP_INVALID_RESPONSE = 0x80432060,
    PARSE_HTTP_INVALID_VALUE    = 0x804321FE,
    RESOLVER_EPACKET            = 0x80436001,
    RESOLVER_ENODNS             = 0x80436002,
    RESOLVER_ETIMEDOUT          = 0x80436003,
    RESOLVER_ENOSUPPORT         = 0x80436004,
    RESOLVER_EFORMAT            = 0x80436005,
    RESOLVER_ESERVERFAILURE     = 0x80436006,
    RESOLVER_ENOHOST            = 0x80436007,
    RESOLVER_ENOTIMPLEMENTED    = 0x80436008,
    RESOLVER_ESERVERREFUSED     = 0x80436009,
    RESOLVER_ENORECORD          = 0x8043600A,
}

SceHttpsErrorCode :: enum c.uint {
    CERT      = 0x80435060,
    HANDSHAKE = 0x80435061,
    IO        = 0x80435062,
    INTERNAL  = 0x80435063,
    PROXY     = 0x80435064,
}

SceHttpsSslErrorCode :: enum c.uint {
    INTERNAL         = (0x01),
    INVALID_CERT     = (0x02),
    CN_CHECK         = (0x04),
    NOT_AFTER_CHECK  = (0x08),
    NOT_BEFORE_CHECK = (0x10),
    UNKNOWN_CA       = (0x20),
}

SCE_HTTP_ENABLE :: (1)
SCE_HTTP_DISABLE :: (0)

SCE_HTTP_USERNAME_MAX_SIZE :: 256
SCE_HTTP_PASSWORD_MAX_SIZE :: 256

SceHttpStatusCode :: enum c.int {
    CONTINUE                      = 100,
    SWITCHING_PROTOCOLS           = 101,
    PROCESSING                    = 102,
    OK                            = 200,
    CREATED                       = 201,
    ACCEPTED                      = 202,
    NON_AUTHORITATIVE_INFORMATION = 203,
    NO_CONTENT                    = 204,
    RESET_CONTENT                 = 205,
    PARTIAL_CONTENT               = 206,
    MULTI_STATUS                  = 207,
    MULTIPLE_CHOICES              = 300,
    MOVED_PERMANENTLY             = 301,
    FOUND                         = 302,
    SEE_OTHER                     = 303,
    NOT_MODIFIED                  = 304,
    USE_PROXY                     = 305,
    TEMPORARY_REDIRECT            = 307,
    BAD_REQUEST                   = 400,
    UNAUTHORIZED                  = 401,
    PAYMENT_REQUIRED              = 402,
    FORBIDDDEN                    = 403,
    NOT_FOUND                     = 404,
    METHOD_NOT_ALLOWED            = 405,
    NOT_ACCEPTABLE                = 406,
    PROXY_AUTHENTICATION_REQUIRED = 407,
    REQUEST_TIME_OUT              = 408,
    CONFLICT                      = 409,
    GONE                          = 410,
    LENGTH_REQUIRED               = 411,
    PRECONDITION_FAILED           = 412,
    REQUEST_ENTITY_TOO_LARGE      = 413,
    REQUEST_URI_TOO_LARGE         = 414,
    UNSUPPORTED_MEDIA_TYPE        = 415,
    REQUEST_RANGE_NOT_SATISFIBLE  = 416,
    EXPECTATION_FAILED            = 417,
    UNPROCESSABLE_ENTITY          = 422,
    LOCKED                        = 423,
    FAILED_DEPENDENCY             = 424,
    UPGRADE_REQUIRED              = 426,
    INTERNAL_SERVER_ERROR         = 500,
    NOT_IMPLEMENTED               = 501,
    BAD_GATEWAY                   = 502,
    SERVICE_UNAVAILABLE           = 503,
    GATEWAY_TIME_OUT              = 504,
    HTTP_VERSION_NOT_SUPPORTED    = 505,
    INSUFFICIENT_STORAGE          = 507,
}

SceHttpUriBuildType :: enum c.int {
    WITH_SCHEME   = 0x01,
    WITH_HOSTNAME = 0x02,
    WITH_PORT     = 0x04,
    WITH_PATH     = 0x08,
    WITH_USERNAME = 0x10,
    WITH_PASSWORD = 0x20,
    WITH_QUERY    = 0x40,
    WITH_FRAGMENT = 0x80,
    WITH_ALL      = 0xFFFF,
}

SceHttpsFlag :: enum c.uint {
    SERVER_VERIFY    = (0x01),
    CLIENT_VERIFY    = (0x02),
    CN_CHECK         = (0x04),
    NOT_AFTER_CHECK  = (0x08),
    NOT_BEFORE_CHECK = (0x10),
    KNOWN_CA_CHECK   = (0x20),
}

SceHttpMemoryPoolStats :: struct {
    poolSize:         c.uint,
    maxInuseSize:     c.uint,
    currentInuseSize: c.uint,
    reserved:         c.int,
}
#assert(size_of(SceHttpMemoryPoolStats) == 0x10)

SceHttpMethods :: enum c.int {
    GET,
    POST,
    HEAD,
    OPTIONS,
    PUT,
    DELETE,
    TRACE,
    CONNECT,
}

SceHttpUriElement :: struct {
    opaque:   c.int, // 4
    scheme:   cstring,
    username: cstring,
    password: cstring,
    hostname: cstring,
    path:     cstring,
    query:    cstring,
    fragment: cstring,
    port:     c.ushort, // 2
    reserved: [10]c.uchar, // 10
}
when size_of(builtin.rawptr) == 4 {
    #assert(size_of(SceHttpUriElement) == 0x2C)
}

SceHttpVersion :: enum c.int {
    VERSION_1_0 = 1,
    VERSION_1_1,
}

SceHttpProxyMode :: enum c.int {
    AUTO,
    MANUAL,
}

SceHttpAddHeaderMode :: enum c.int {
    OVERWRITE,
    ADD,
}

SceHttpAuthType :: enum c.int {
    BASIC,
    DIGEST,
    RESERVED0,
    RESERVED1,
    RESERVED2,
}

SceHttpSslVersion :: enum c.int {
    SSLV23,
    SSLV2,
    SSLV3,
    TLSV1,
}

SceHttpsData :: struct {
    ptr: ^c.char,
    size: c.uint,
}
when size_of(builtin.rawptr) == 4 {
    #assert(size_of(SceHttpsData) == 8)
}

SceHttpsCaList :: struct {
    caCerts: ^rawptr,
    caNum:   c.int,
}
when size_of(builtin.rawptr) == 4 {
    #assert(size_of(SceHttpsCaList) == 8)
}

/* callbacks */

SceHttpAuthInfoCallback :: #type ^proc(
    request: c.int,
    authType: SceHttpAuthType,
    realm: cstring,
    username: cstring,
    password: cstring,
    needEntity: c.int,
    entityBody: ^[^]c.uchar,
    entitySize: ^c.uint,
    save: ^c.int,
    userArg: rawptr,
) -> c.int

SceHttpRedirectCallback :: #type ^proc(
    request: c.int,
    statusCode: c.int,
    method: ^c.int,
    location: cstring,
    userArg: rawptr,
) -> c.int

SceHttpsCallback :: #type ^proc(verifyEsrr: c.uint, sslCert: []rawptr, certNum: c.int, userArg: rawptr) -> c.int

SceHttpCookieRecvCallback :: #type ^proc(
    request: c.int,
    url: cstring,
    cookieHeader: cstring,
    headerLen: c.uint,
    userArg: rawptr,
)

SceHttpCookieSendCallback :: #type ^proc(request: c.int, url: cstring, cookieHeader: cstring, userArg: rawptr)

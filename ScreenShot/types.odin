package screenshot

import "core:c"
import sce "../common"

//! Max size of path strings (includes device name and NULL terminator)
SCE_SCREENSHOT_MAX_FS_PATH :: (1024)

//! Max length of photo title
SCE_SCREENSHOT_MAX_PHOTO_TITLE_LEN :: (64)

//! Max size of photo title (includes NULL terminator)
SCE_SCREENSHOT_MAX_PHOTO_TITLE_SIZE :: (SCE_SCREENSHOT_MAX_PHOTO_TITLE_LEN * 4)

//! Max length of game title
SCE_SCREENSHOT_MAX_GAME_TITLE_LEN :: (64)

//! Max size of game title (includes NUL terminator)
SCE_SCREENSHOT_MAX_GAME_TITLE_SIZE :: (SCE_SCREENSHOT_MAX_GAME_TITLE_LEN * 4)

//! Max length of comment (description)
SCE_SCREENSHOT_MAX_GAME_COMMENT_LEN :: (128)

//! Max size of comment (description) (includes NUL terminator)
SCE_SCREENSHOT_MAX_GAME_COMMENT_SIZE :: (SCE_SCREENSHOT_MAX_GAME_COMMENT_LEN * 4)

// TODO:
SceScreenshotErrorCode :: enum c.uint {
	INVALID_ARGUMENT       = 0x80102F01,
	NO_MEMORY              = 0x80102F02,
	FILE_NOT_FOUND         = 0x80102F03,
	NOT_SUPPORTED_FORMAT   = 0x80102F04,
	MEDIA_FULL             = 0x80102F05,
	INTERNAL               = 0x80102F06
}


SceScreenShotParam :: struct {
	photoTitle: [^]sce.WChar32,   //!< Photo title
	gameTitle: [^]sce.WChar32,    //!< Game title
	gameComment: [^]sce.WChar32,  //!< Game description
	reserved: rawptr,                 //!< Reserved range (Must be NULL)
}


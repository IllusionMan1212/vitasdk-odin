package io

import "core:c"
import sce "../common"

SceIoDevInfo :: struct {
  max_size: sce.Off,
	free_size: sce.Off,
	cluster_size: sce.Size,
	unk: rawptr,
}
when size_of(rawptr) == 4 {
  #assert(size_of(SceIoDevInfo) == 0x18)
}


/* Note: Not all of these sceIoOpen() flags are not compatible with the
   open() flags found in sys/unistd.h. */
SceIoMode :: enum c.int {
	O_RDONLY    = 0x0001,                         //!< Read-only
	O_WRONLY    = 0x0002,                         //!< Write-only
	O_RDWR      = (O_RDONLY | O_WRONLY),  //!< Read/Write
	O_NBLOCK    = 0x0004,                         //!< Non blocking
	O_DIROPEN   = 0x0008,                         //!< Internal use for ::sceIoDopen
	O_RDLOCK    = 0x0010,                         //!< Read locked (non-shared)
	O_WRLOCK    = 0x0020,                         //!< Write locked (non-shared)
	O_APPEND    = 0x0100,                         //!< Append
	O_CREAT     = 0x0200,                         //!< Create
	O_TRUNC     = 0x0400,                         //!< Truncate
	O_EXCL      = 0x0800,                         //!< Exclusive create
	O_SCAN      = 0x1000,                         //!< Scan type
	O_RCOM      = 0x2000,                         //!< Remote command entry
	O_NOBUF     = 0x4000,                         //!< Number device buffer
	O_NOWAIT    = 0x8000,                         //!< Asynchronous I/O
	O_FDEXCL    = 0x01000000,                     //!< Exclusive access
	O_PWLOCK    = 0x02000000,                     //!< Power control lock
	O_FGAMEDATA = 0x40000000                      //!< Gamedata access
}

SceIoSeekMode :: enum c.int {
	SET,   //!< Starts from the begin of the file
	CUR,   //!< Starts from current position
	END    //!< Starts from the end of the file
}

SceIoDevType :: enum c.int {
	NULL     = 0x00, //!< Dummy device
	CHAR     = 0x01, //!< Character device
	BLOCK    = 0x04, //!< Block device
	FS       = 0x10, //!< File system device
	ALIAS    = 0x20, //!< Alias name
	MOUNTPT  = 0x40  //!< Mount point
}


/**
  * Access modes for st_mode in ::SceIoStat.
  *
  * @note
  * System always requires RW access.
  * For safe homebrew system software will force system permission field to RW.
  * For unsafe homebrew, you need to set it yourself `( mode | SCE_S_IWSYS | SCE_S_IRSYS)`
  *
  */
SceIoAccessMode :: enum c.int {
	S_IXUSR		= 000100, //!< User execute permission
	S_IWUSR		= 000200, //!< User write permission
	S_IRUSR		= 000400, //!< User read permission
	S_IRWXU		= 000700, //!< User access rights mask

	S_IXGRP		= 000000, //!< Group execute permission. Ignored and reset to 0 by system
	S_IWGRP		= 000000, //!< Group write permission. Ignored and reset to 0 by system
	S_IRGRP		= 000000, //!< Group read permission. Ignored and reset to 0 by system
	S_IRWXG		= 000000, //!< Group access rights mask. Ignored and reset to 0 by system

	S_IXSYS		= 000001, //!< System execute permission
	S_IWSYS		= 000002, //!< System write permission
	S_IRSYS		= 000004, //!< System read permission
	S_IRWXS		= 000007, //!< System access rights mask

  // Deprecated
	S_IXOTH		= 000001, //!< Others execute permission. Deprecated, use ::SCE_S_IXSYS
  // Deprecated
	S_IWOTH		= 000002, //!< Others write permission. Deprecated, use ::SCE_S_IXSYS
  // Deprecated
	S_IROTH		= 000004, //!< Others read permission. Deprecated, use ::SCE_S_IXSYS
  // Deprecated
	S_IRWXO		= 000007, //!< Others access rights mask. Deprecated, use ::SCE_S_IRWXS

  // Deprecated
	S_ISVTX		= 000000, //!< Sticky. Deprecated
  // Deprecated
	S_ISGID		= 000000, //!< Set GID. Deprecated
  // Deprecated
	S_ISUID		= 000000, //!< Set UID. Deprecated

	S_IFDIR		= 0010000, //!< Directory
	S_IFREG		= 0020000, //!< Regular file
	S_IFLNK		= 0040000, //!< Symbolic link
	S_IFMT		= 0170000, //!< Format bits mask
}

/** File modes, used for the st_attr parameter in ::SceIoStat. */
SceIoFileMode :: enum c.int {
	SO_IXOTH            = 0x0001,               //!< Hidden execute permission
	SO_IWOTH            = 0x0002,               //!< Hidden write permission
	SO_IROTH            = 0x0004,               //!< Hidden read permission
	SO_IFLNK            = 0x0008,               //!< Symbolic link
	SO_IFDIR            = 0x0010,               //!< Directory
	SO_IFREG            = 0x0020,               //!< Regular file
	SO_IFMT             = 0x0038,               //!< Format mask
}

/** Structure to hold the status information about a file */
SceIoStat :: struct {
  st_mode: sce.Mode,             //!< One or more ::SceIoAccessMode
	st_attr: c.uint,        //!< One or more ::SceIoFileMode
	st_size: sce.Off,              //!< Size of the file in bytes
	st_ctime: sce.DateTime,        //!< Creation time
	st_atime: sce.DateTime,        //!< Last access time
	st_mtime: sce.DateTime,        //!< Last modification time
	st_private: [6]c.uint,  //!< Device-specific data
}
#assert(size_of(SceIoStat) == 0x58)

/** Defines for `sceIoChstat` and `sceIoChstatByFd` **/
SCE_CST_MODE :: 0x0001
SCE_CST_SIZE :: 0x0004
SCE_CST_CT   :: 0x0008
SCE_CST_AT   :: 0x0010
SCE_CST_MT   :: 0x0020


/** Describes a single directory entry */
SceIoDirent :: struct {
  d_stat: SceIoStat, //!< File status
	d_name: [256]c.char, //!< File name
	d_private: rawptr,  //!< Device-specific data
	dummy: c.int,        //!< Dummy data
}
when size_of(rawptr) == 4 {
	#assert(size_of(SceIoDirent) == 0x160)
}


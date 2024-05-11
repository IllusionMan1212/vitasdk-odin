package audioout

import "core:c"

// TODO: should be c.int
SceAudioOutErrorCode :: enum i64 {
	NOT_OPENED          = 0x80260001,
	BUSY                = 0x80260002,
	INVALID_PORT        = 0x80260003,
	INVALID_POINTER     = 0x80260004,
	PORT_FULL           = 0x80260005,
	INVALID_SIZE        = 0x80260006,
	INVALID_FORMAT      = 0x80260007,
	INVALID_SAMPLE_FREQ = 0x80260008,
	INVALID_VOLUME      = 0x80260009,
	INVALID_PORT_TYPE   = 0x8026000A,
	INVALID_FX_TYPE     = 0x8026000B,
	INVALID_CONF_TYPE   = 0x8026000C,
	OUT_OF_MEMORY       = 0x8026000D
}

SceAudioOutParam :: enum c.int {
	FORMAT_S16_MONO   = 0,
	FORMAT_S16_STEREO = 1
}

SceAudioOutPortType :: enum c.int {
	//! Used for main audio output, freq must be set to 48000 Hz
	MAIN    = 0,
	//! Used for Background Music port
	BGM     = 1,
	//! Used for voice chat port
	VOICE   = 2
}

SceAudioOutMode :: enum c.int {
	MONO    = 0,
	STEREO  = 1
}

SCE_AUDIO_MIN_LEN :: 64    //!< Minimum granularity
SCE_AUDIO_MAX_LEN :: 65472 //!< Maximum granularity

SCE_AUDIO_OUT_MAX_VOL :: 32768                 //!< Maximum output port volume
SCE_AUDIO_VOLUME_0DB  :: SCE_AUDIO_OUT_MAX_VOL //!< Maximum output port volume

/** Flags to use as 'ch' argument for ::sceAudioOutSetVolume */
SceAudioOutChannelFlag :: enum c.int {
	L_CH	= 1, //!< Left Channel
	R_CH	= 2  //!< Right Channel
}

/** Config type values to specify to ::sceAudioOutGetConfig */
SceAudioOutConfigType :: enum c.int {
	LEN   = 0,
	FREQ  = 1,
	MODE  = 2
}

/** Argument 'mode' to specify to ::sceAudioOutSetAlcMode */
SceAudioOutAlcMode :: enum c.int {
	OFF       = 0,
	MODE1     = 1,
	MODE_MAX  = 2
}


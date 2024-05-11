package npdrm

import "core:c"
import sce "../common"

SceNpDrmActivationData :: struct { // size is 0x1038
  act_type: sce.Int16, 
  version_flag: sce.Int16,
  version: sce.Int32,
  account_id: sce.UInt64,
  primary_key_table: [0x80][0x10]sce.UInt8,
  unk1: [0x40]sce.UInt8,
  openpsid: [0x10]sce.UInt8,
  unk2: [0x10]sce.UInt8,
  unk3: [0x10]sce.UInt8,
  secondary_key_table: [0x65][0x10]sce.UInt8,
  rsa_signature: [0x100]sce.UInt8,
  unk_sigmature: [0x40]sce.UInt8,
  ecdsa_signature: [0x28]sce.UInt8, // checked by pspemu, and SceNpDrm.
}
#assert(size_of(SceNpDrmActivationData) == 0x1038)

SceNpDrmLicense :: struct { // size is 0x200
  version: sce.Int16,       // -1 VITA, 0 PSP, 1 PSP-VITA
  version_flags: sce.Int16, // 0, 1
  license_type: sce.Int16,  // 1
  license_flags: sce.Int16, // 0x400:non-check ecdsa
  account_id: sce.UInt64,
  content_id: [0x30]c.char,
  key_table: [0x10]c.char,
  key1: [0x10]c.char,
  start_time: sce.Int64,
  expiration_time: sce.Int64,
  ecdsa_signature: [0x28]c.char,
  flags: sce.Int64,
  key2: [0x10]c.char,
  unk_0xB0: [0x10]c.char,
  open_psid: [0x10]c.char,
  unk_0xD0: [0x10]c.char,
  cmd56_handshake_part: [0x14]c.char,
  debug_upgradable: c.int,
  unk_0xF8: c.int,
  sku_flag: c.int,
  rsa_signature: [0x100]c.char,
}
#assert(size_of(SceNpDrmLicense) == 0x200)

ScePsmDrmLicense :: struct {
  magic: [0x8]c.char,
  unk1: sce.UInt32,
  unk2: sce.UInt32,
  account_id: sce.UInt64,
  unk3: sce.UInt32,
  unk4: sce.UInt32,
  start_time: sce.UInt64,
  expiration_time: sce.UInt64,
  activation_checksum: [0x20]sce.UInt8,
  content_id: [0x30]c.char,
  unk5: [0x80]sce.UInt8,
  unk6: [0x20]sce.UInt8,
  key: [0x10]sce.UInt8,
  signature: [0x1D0]sce.UInt8,
  rsa_signature: [0x100]sce.UInt8,
}
#assert(size_of(ScePsmDrmLicense) == 0x400)

/** Options for _sceNpDrmPackageDecrypt */
_sceNpDrmPackageDecrypt_opt :: struct {
	/** The offset in the encrypted data */
  offset: sce.Off,

	/**
	 * The identifier specified for _sceNpDrmPackageCheck but NOT ORed
	 * with (1 << 8)
	 */
	identifier: c.uint,
}
#assert(size_of(_sceNpDrmPackageDecrypt_opt) == 0x10)



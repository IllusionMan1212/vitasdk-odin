package npdrm

import "core:c"
import sce "../common"

foreign import npdrm "system:SceNpDrm_stub"
foreign import npdrmpackage "system:SceNpDrmPackage_stub"
foreign import npdrmkern "system:SceNpDrmForDriver_stub"

foreign npdrm {
  /**
  * Get rif name
  *
  * @param[out] rif_name - RIF name buffer (48 bytes)
  *
  * @param[in] aid - Account ID
  *
  * @return 0 on success, < 0 on error.
  */
  _sceNpDrmGetRifName :: proc(rif_name: [^]c.char, aid: c.uint64_t) -> c.int ---

  /**
  * Get fixed rif name
  *
  * @param[out] rif_name - RIF name buffer (48 bytes)
  *
  * @param[in] aid - Account ID
  *
  * @return 0 on success, < 0 on error.
  */
  _sceNpDrmGetFixedRifName :: proc(rif_name: [^]c.char, aid: c.uint64_t) -> c.int ---

  /**
  * Check you have npdrm activation data, and get information from it
  *
  * @param[out]  act_type        - The pointer of activation type output.
  *
  * @param[out]  version_flag    - The pointer of version flag output.
  *
  * @param[out]  account_id      - The pointer of activated account id output.
  *
  * @param[out]  act_exp_time    - The pointer of activation expire time output, [0] is start_date, [1] is end_date
  *
  * @return 0 on success, < 0 on error.
  */
  _sceNpDrmCheckActData :: proc(act_type: ^c.int, version_flag: ^c.int, account_id: ^sce.UInt64, act_exp_time: [2]sce.UInt64) -> c.int ---

  /**
  * Get rif name for install
  *
  * @param[out] rif_name - RIF name buffer (48 bytes)
  *
  * @param[in] rif_data - Data of RIF file (512 bytes)
  *
  * @param[in] unk - Unknown, use 0
  *
  * @return 0 on success, < 0 on error.
  */
  _sceNpDrmGetRifNameForInstall :: proc(rif_name: [^]c.char, rif_data: rawptr, unk: c.int) -> c.int ---

  /**
  * Get PSM rif key
  *
  * @param[in] license_buf - RIF buffer (1024 bytes)
  *
  * @param[out] keydata - Decrypted key data
  *
  * @param[in] flags - Unknown
  * 
  * @return 0 on success, < 0 on error
  */
  scePsmDrmGetRifKey :: proc(#by_ptr license_buf: ScePsmDrmLicense, keydata: [^]c.char, flags: c.int) -> c.int ---
}

foreign npdrmpackage {
  /**
  * Read the header of the PKG and initialize the context
  *
  * @param buffer - The buffer containing the header of PKG.
  * @param size - The size of buffer. The minimum confirmed value is 0x8000.
  * @param zero - Unknown. Supposed to be set to 0.
  * @param identifier - arbitrary value [0, 6) ORed with (1 << 8) or 0.
  *                     If it is set to 0, the function just checks the header
  *                     and doesn't create the context.
  *
  * @return 0 on success, != 0 on error
  */
  _sceNpDrmPackageCheck :: proc(buffer: rawptr, size: sce.Size, zero: c.int, identifier: c.uint) -> c.int ---

  /**
  * Decrypt a PKG
  *
  * @param buffer - The buffer containing the content of the PKG.
  * @param size - The size of the buffer. The minimum confirmed value is 0x20.
  * @param opt - The options.
  *
  * @return 0 on success, != 0 on error
  */
  _sceNpDrmPackageDecrypt :: proc(#no_alias buffer: rawptr, size: sce.Size, #no_alias opt: ^_sceNpDrmPackageDecrypt_opt) -> c.int ---
}

foreign npdrmkern {
  /**
  * Get license file name
  *
  * @param[out] name - The pointer of license file name output buffer. size is 0x30.
  * @param[in]  aid  - The license account id
  *
  * @return 0 on success, < 0 on error.
  */
  ksceNpDrmGetRifName :: proc(name: [^]c.char, aid: sce.UInt64) -> c.int ---

  /**
  * Get license file name with fixed
  *
  * @param[out] name - The pointer of license file name output buffer. size is 0x30.
  * @param[in]  aid  - The license account id
  *
  * @return 0 on success, < 0 on error.
  */
  ksceNpDrmGetFixedRifName :: proc(name: [^]c.char, aid: sce.UInt64) -> c.int ---

  /**
  * Get current activation data
  *
  * @param[out] act_data       - The pointer of output activation data see:SceNpDrmActivationData. if ecdsa or rsa verify fail, will be all 0.
  *
  * @return 0 on success, < 0 on error.
  */
  ksceNpDrmReadActData :: proc(act_data: ^SceNpDrmActivationData) -> c.int ---

  /**
  * Check you have npdrm activation data, and get information from it
  *
  * @param[out]  act_type        - The pointer of activation type output.
  * @param[out]  version_flag    - The pointer of version flag output.
  * @param[out]  account_id      - The pointer of activated account id output.
  * @param[out]  act_start_time  - The pointer of activation data start time output.
  * @param[out]  act_exp_time    - The pointer of activation data expire time output
  *
  * @return 0 on success, < 0 on error.
  */
  ksceNpDrmCheckActData :: proc(act_type: ^c.int, version_flag: ^c.int, account_id: ^sce.UInt64, act_start_time: ^sce.UInt64, act_end_time: ^sce.UInt64) -> c.int ---

  /**
  * Get license key info
  *
  * @param[in]  license        - The pointer of license data. see:SceNpDrmLicense
  * @param[out] klicense       - The pointer of klicense output buffer. size is 0x10.
  * @param[out] flags          - The pointer of flags output.
  * @param[out] sku_flags      - The pointer of sku flags output.
  * @param[out] lic_start_time - The pointer of license start time output.
  * @param[out] lic_exp_time   - The pointer of license exp time output.
  *
  * @return 0 on success, < 0 on error.
  */
  ksceNpDrmGetRifVitaKey :: proc(license: rawptr, klicense: rawptr, flags: ^c.int, sku_flags: ^c.int, lic_start_time: ^sce.UInt64, lic_exp_time: ^sce.UInt64) -> c.int ---

  /**
  * Get license key info for a PSP game
  *
  * @param[in]  license        - The pointer of license data. see:SceNpDrmLicense
  * @param[out] klicense       - The pointer of klicense output buffer. size is 0x10.
  * @param[out] flags          - The pointer of flags output.
  * @param[out] lic_start_time - The pointer of license start time output.
  * @param[out] lic_exp_time   - The pointer of license exp time output.
  *
  * @return 0 on success, < 0 on error.
  */
  ksceNpDrmGetRifPspKey :: proc(license: rawptr, klicense: rawptr, flags: c.int, lic_start_time: ^sce.UInt64, lic_exp_time: ^sce.UInt64) -> c.int ---

  /**
  * Get license info
  *
  * @param[in]  license         - The pointer of license data. see:SceNpDrmLicense
  * @param[in]  license_size    - The license data size. 0x200 etc
  * @param[in]  check_sign      - The license signature check flag. if pass 1, do check.
  * @param[out] content_id      - The pointer of license content_id output buffer. size is 0x30.
  * @param[out] account_id      - The pointer of license account_id output.
  * @param[out] license_version - The pointer of license version output.
  * @param[out] license_flags   - The pointer of license flags output.
  * @param[out] flags           - The pointer of flags output.
  * @param[out] sku_flags       - The pointer of sku flags output.
  * @param[out] lic_start_time  - The pointer of license start time output.
  * @param[out] lic_exp_time    - The pointer of license exp time output.
  * @param[out] flags2          - The pointer of flags2 output.
  *
  * @return 0 on success, < 0 on error.
  */
  ksceNpDrmGetRifInfo :: proc(license: rawptr, license_size: sce.Size, check_sign: c.int, content_id: [^]c.char, account_id: ^sce.UInt64, license_version: ^c.int, license_flags: ^c.int, flags: ^c.int, sku_flags: ^c.int, lic_start_time: ^sce.Int64, lic_exp_time: ^sce.Int64, flags2: ^sce.UInt64) -> c.int ---

  /**
  * Verify a eboot.pbp signature "__sce_ebootpbp"
  *
  * @param[in]  eboot_pbp_path         - The pointer of the file path of the EBOOT.PBP file
  * @param[in]  eboot_signature        - The pointer of data of __sce_ebootpbp signature. size is 0x200
  *
  * @return 0 on success, < 0 on error.
  */
  ksceNpDrmEbootSigVerify :: proc(eboot_pbp_path: cstring, eboot_signature: rawptr) -> c.int ---

  /**
  * Verify an older 0x100 byte eboot.pbp signature "__sce_ebootpbp" from firmware <2.00
  *
  * @param[in]  eboot_pbp_path         - The pointer of the file path of the EBOOT.PBP file
  * @param[in]  eboot_signature        - The pointer of data of __sce_ebootpbp signature. size is 0x100
  *
  * @return 0 on success, < 0 on error.
  */
  ksceNpDrmPspEbootVerify :: proc(eboot_pbp_path: cstring, eboot_signature: rawptr) -> c.int ---

  /**
  * Generate an older 0x100 byte eboot.pbp signature "__sce_ebootpbp" for a PSP game - this is unused in firmware >2.00
  * 
  * @param[in]  eboot_pbp_path         - The pointer of the file path of the EBOOT.PBP file
  * @param[in]  eboot_sha256           - The pointer of SHA256 hash of first (data.psar offset + 0x1C0000) bytes into the EBOOT.PBP file
  * @param[out] eboot_signature        - The pointer of the output eboot signature data. size is 0x100
  *
  * @return eboot_signature size on success, < 0 on error.
  */
  ksceNpDrmPspEbootSigGen :: proc(eboot_pbp_path: cstring, eboot_sha256: rawptr, eboot_signature: rawptr) -> c.int ---

  /**
  * Convert an older 0x100 byte eboot.pbp signature "__sce_ebootpbp" to a 0x200 byte one used in firmwares >2.00
  * 
  * @param[in]  eboot_pbp_path         - The pointer of the file path of the EBOOT.PBP file
  * @param[in]  old_eboot_signature    - The pointer of old eboot signature data. size is 0x100
  * @param[out] new_eboot_signature    - The pointer of new eboot signature data. size is 0x200
  *
  * @return eboot_signature size on success, < 0 on error.
  */
  ksceNpDrmEbootSigConvert :: proc(eboot_pbp_path: cstring, old_eboot_signature: rawptr, new_eboot_signature: rawptr) -> c.int --- 

  /**
  * Generate eboot.pbp signature "__sce_ebootpbp" for a PSP game
  *
  * @param[in]  eboot_pbp_path         - The pointer of the file path of the EBOOT.PBP file
  * @param[in]  eboot_sha256           - The pointer of SHA256 hash of first (data.psar offset + 0x1C0000) bytes into the EBOOT.PBP file
  * @param[out] eboot_signature        - The pointer of the output eboot signature data. size is 0x200
  * @param[in]  sw_version             - The minimum firmware version the signature can be used on. cannot be lower than current firmware
  *
  * @return eboot_signature size on success, < 0 on error.
  */
  ksceNpDrmEbootSigGenPsp :: proc(eboot_pbp_path: cstring, eboot_sha256: rawptr, eboot_signature: rawptr, sw_version: c.int) -> c.int ---

  /**
  * Generate eboot.pbp signature "__sce_ebootpbp" for a single-disc PS1 game
  *
  * @param[in]  eboot_pbp_path         - The pointer of the file path of the EBOOT.PBP file
  * @param[in]  eboot_sha256           - The pointer of SHA256 hash of first (data.psar offset + 0x1C0000) bytes into the EBOOT.PBP file
  * @param[out] eboot_signature        - The pointer of the output eboot signature data. size is 0x200
  * @param[in]  sw_version             - The minimum firmware version the signature can be used on. cannot be lower than current firmware
  *
  * @return eboot_signature size on success, < 0 on error.
  */
  ksceNpDrmEbootSigGenPs1 :: proc(eboot_pbp_path: cstring, eboot_sha256: rawptr, eboot_signature: rawptr, sw_version: c.int) -> c.int ---

  /**
  * Generate eboot.pbp signature "__sce_discinfo" for a multi-disc PS1 game
  *
  * @param[in]  eboot_pbp_path         - The pointer of the file path of the EBOOT.PBP file
  * @param[in]  sce_discinfo           - The pointer of contents of vs0:/app/NPXS10028/__sce_discinfo
  * @param[out] eboot_signature        - The pointer of the output eboot signature data. size is 0x100
  * @param[in]  sw_version             - The minimum firmware version the signature can be used on. cannot be lower than current firmware
  *
  * @return eboot_signature size on success, < 0 on error.
  */
  ksceNpDrmEbootSigGenMultiDisc :: proc(eboot_pbp_path: cstring, sce_discinfo: rawptr, eboot_signature: rawptr, sw_version: c.int) -> c.int ---
}

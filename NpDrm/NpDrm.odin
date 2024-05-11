package npdrm

import "core:c"
import sce "../common"

foreign import npdrm "system:SceNpDrm_stub"
foreign import npdrmpackage "system:SceNpDrmPackage_stub"

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

@(link_prefix = "_sceNpDrmPackage")
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
  Check :: proc(buffer: rawptr, size: sce.Size, zero: c.int, identifier: c.uint) -> c.int ---

  /**
  * Decrypt a PKG
  *
  * @param buffer - The buffer containing the content of the PKG.
  * @param size - The size of the buffer. The minimum confirmed value is 0x20.
  * @param opt - The options.
  *
  * @return 0 on success, != 0 on error
  */
  Decrypt :: proc(#no_alias buffer: rawptr, size: sce.Size, #no_alias opt: ^_sceNpDrmPackageDecrypt_opt) -> c.int ---
}

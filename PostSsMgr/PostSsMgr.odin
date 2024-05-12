package postssmgr

import "core:c"

foreign import postssmgr "system:SceSblSsMgrForDriver_stub"

@(link_prefix = "ksceSbl")
foreign postssmgr {
	/**
	* Create the new RSA signature
	*
	* @param[inout] rsa_signature - The RSA signature result
	* @param[in]             hash - The RSA signature hash
	* @param[in]      private_key - The RSA private key
	* @param[in]             type - The RSA signature type. [2, 4, 5, 0xB, 0xC, 0xD, 0xE]
	*
	* @return SCE_OK on success, < 0 on error
	*/
	RSA2048CreateSignature :: proc(rsa_signature: ^SceSblRsaDataParam, hash: ^SceSblRsaDataParam, private_key: SceSblRsaPrivateKeyParam, type: c.int) -> c.int ---

	/**
	* Verufy the new RSA signature
	*
	* @param[in] rsa_signature - The RSA signature input
	* @param[in]          hash - The RSA signature hash
	* @param[in]    public_key - The RSA public key
	* @param[in]          type - The RSA signature type. [2, 4, 5, 0xB, 0xC, 0xD, 0xE]
	*
	* @return SCE_OK on success, < 0 on error
	*/
	RSA2048VerifySignature :: proc(rsa_signature: ^SceSblRsaDataParam, hash: ^SceSblRsaDataParam, public_key: ^SceSblRsaPublicKeyParam, type: c.int) -> c.int ---
}

package postssmgr

import "core:c"

SceSblRsaDataParam :: struct {
  data: rawptr,
	size: c.uint,
}

SceSblRsaPublicKeyParam :: struct {
	n: rawptr,
	k: rawptr, // e/d
}

SceSblRsaPrivateKeyParam :: struct {
	unk_0x00: c.int,
	unk_0x04: c.int,
	unk_0x08: c.int,
	unk_0x0C: c.int,
	p: rawptr,
	q: rawptr,
	dp: rawptr, // d % (p - 1)
	dq: rawptr, // d % (q - 1)
	qp: rawptr, // q^-1 % p
}


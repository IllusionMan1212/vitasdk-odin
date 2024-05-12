package bt

import "core:c"
import sce "../common"

foreign import bt "system:SceBtForDriver_stub"

@(link_prefix = "ksceBt")
foreign bt {
	AvrcpReadVolume :: proc(r0: c.int, r1: c.int, r2: c.int, r3: c.int) -> c.int ---
	AvrcpSendButton :: proc(r0: c.int, r1: c.int, r2: c.int, r3: c.int) -> c.int ---
	AvrcpSendVolume :: proc(r0: c.int, r1: c.int, r2: c.int, r3: c.int) -> c.int ---
	AvrcpSetPlayStatus :: proc(r0: c.int, r1: c.int, r2: c.int, r3: c.int) -> c.int ---
	AvrcpSetTitle :: proc(r0: c.int, r1: c.int, r2: c.int, r3: c.int) -> c.int ---
	DeleteRegisteredInfo :: proc(mac0: c.uint, mac1: c.uint) -> c.int ---
	FreqAudio :: proc(r0: c.int, r1: c.int, r2: c.int, r3: c.int) -> c.int ---
	GetConfiguration :: proc() -> c.int --- // returns 0x0 BT disabled, 0x9 if enabled
	GetConnectingInfo :: proc(mac0: c.uint, mac1: c.uint) -> c.int --- // 1 = disconnected?, 2 = connecting?, 5 = connected?
	GetDeviceName :: proc(mac0: c.uint, mac1: c.uint, name: [0x79]c.char) -> c.int ---
	GetInfoForTest :: proc(r0: c.int, r1: c.int, r2: c.int, r3: c.int) -> c.int ---
	GetLastError :: proc() -> c.int ---
	GetRegisteredInfo :: proc(device: c.int, unk: c.int, info: ^SceBtRegisteredInfo, info_size: sce.Size) -> c.int ---
	GetStatusForTest :: proc(r0: c.int, r1: c.int, r2: c.int, r3: c.int) -> c.int ---
	GetVidPid :: proc(mac0: c.uint, mac1: c.uint, vid_pid: [2]c.ushort) -> c.int ---
	HfpGetCurrentPhoneNumber :: proc(r0: c.int, r1: c.int, r2: c.int, r3: c.int) -> c.int ---
	HfpRequest :: proc(r0: c.int, r1: c.int, r2: c.int, r3: c.int) -> c.int ---
	HidGetReportDescriptor :: proc(mac0: c.uint, mac1: c.uint, buffer: rawptr, size: sce.Size) -> c.int ---
	HidTransfer :: proc(mac0: c.uint, mac1: c.uint, request: ^SceBtHidRequest) -> c.int ---
	PushBip :: proc(r0: c.int, r1: c.int, r2: c.int, r3: c.int) -> c.int ---
	PushOpp :: proc(r0: c.int, r1: c.int, r2: c.int, r3: c.int) -> c.int ---
	ReadEvent :: proc(events: [^]SceBtEvent, num_events: c.int) -> c.int ---
	RecvAudio :: proc(r0: c.int, r1: c.int, r2: c.int, r3: c.int) -> c.int ---
	RecvBip :: proc(r0: c.int, r1: c.int, r2: c.int, r3: c.int) -> c.int ---
	RecvOpp :: proc(r0: c.int, r1: c.int, r2: c.int, r3: c.int) -> c.int ---
	RecvSpp :: proc(r0: c.int, r1: c.int, r2: c.int, r3: c.int) -> c.int ---
	RegisterCallback :: proc(cb: sce.UID, unused: c.int, flags1: c.int, flags2: c.int) -> c.int --- // looks like flags1 is a mask for permitted MACs
	ReplyPinCode :: proc(mac0: c.uint, mac1: c.uint, code: ^c.uchar, length: sce.Size) -> c.int ---
	ReplyUserConfirmation :: proc(mac0: c.uint, mac1: c.uint, unk: c.int) -> c.int ---
	SendAudio :: proc(r0: c.int, r1: c.int, r2: c.int, r3: c.int) -> c.int ---
	SendL2capEchoRequestForTest :: proc(r0: c.int, r1: c.int, r2: c.int, r3: c.int) -> c.int ---
	SendSpp :: proc(r0: c.int, r1: c.int, r2: c.int, r3: c.int) -> c.int ---
	SetConfiguration :: proc(r0: c.int) -> c.int --- //0 = disable bt, 1 = enabling, 2 = enabled 3 = disabling?
	SetContentProtection :: proc(r0: c.int) -> c.int ---
	SetInquiryResultForTest :: proc(_: ^c.uchar) -> c.int ---
	SetInquiryScan :: proc(r0: c.int) -> c.int ---
	SetL2capEchoResponseBufferForTest :: proc(r0: c.int, r1: c.int, r2: c.int, r3: c.int) -> c.int ---
	SetStatusForTest :: proc(r0: c.int, r1: c.int, r2: c.int, r3: c.int) -> c.int ---
	StartAudio :: proc(r0: c.int, r1: c.int, r2: c.int, r3: c.int) -> c.int ---
	StartConnect :: proc(mac0: c.uint, mac1: c.uint) -> c.int --- // mac0 can be used as a device index (already paired devices)?
	StartDisconnect :: proc(mac0: c.uint, mac1: c.uint) -> c.int ---
	StartInquiry :: proc() -> c.int ---
	StopAudio :: proc(r0: c.int, r1: c.int, r2: c.int, r3: c.int) -> c.int ---
	StopInquiry :: proc() -> c.int ---
	UnregisterCallback :: proc(cb: sce.UID) -> c.int ---
}


package bt

import "core:c"
import sce "../common"

foreign import bt "system:SceBtForDriver_stub"

foreign bt {
	ksceBtAvrcpReadVolume :: proc(r0: c.int, r1: c.int, r2: c.int, r3: c.int) -> c.int ---
	ksceBtAvrcpSendButton :: proc(r0: c.int, r1: c.int, r2: c.int, r3: c.int) -> c.int ---
	ksceBtAvrcpSendVolume :: proc(r0: c.int, r1: c.int, r2: c.int, r3: c.int) -> c.int ---
	ksceBtAvrcpSetPlayStatus :: proc(r0: c.int, r1: c.int, r2: c.int, r3: c.int) -> c.int ---
	ksceBtAvrcpSetTitle :: proc(r0: c.int, r1: c.int, r2: c.int, r3: c.int) -> c.int ---
	ksceBtDeleteRegisteredInfo :: proc(mac0: c.uint, mac1: c.uint) -> c.int ---
	ksceBtFreqAudio :: proc(r0: c.int, r1: c.int, r2: c.int, r3: c.int) -> c.int ---
	ksceBtGetConfiguration :: proc() -> c.int --- // returns 0x0 BT disabled, 0x9 if enabled
	ksceBtGetConnectingInfo :: proc(mac0: c.uint, mac1: c.uint) -> c.int --- // 1 = disconnected?, 2 = connecting?, 5 = connected?
	ksceBtGetDeviceName :: proc(mac0: c.uint, mac1: c.uint, name: [0x79]c.char) -> c.int ---
	ksceBtGetInfoForTest :: proc(r0: c.int, r1: c.int, r2: c.int, r3: c.int) -> c.int ---
	ksceBtGetLastError :: proc() -> c.int ---
	ksceBtGetRegisteredInfo :: proc(device: c.int, unk: c.int, info: ^SceBtRegisteredInfo, info_size: sce.Size) -> c.int ---
	ksceBtGetStatusForTest :: proc(r0: c.int, r1: c.int, r2: c.int, r3: c.int) -> c.int ---
	ksceBtGetVidPid :: proc(mac0: c.uint, mac1: c.uint, vid_pid: [2]c.ushort) -> c.int ---
	ksceBtHfpGetCurrentPhoneNumber :: proc(r0: c.int, r1: c.int, r2: c.int, r3: c.int) -> c.int ---
	ksceBtHfpRequest :: proc(r0: c.int, r1: c.int, r2: c.int, r3: c.int) -> c.int ---
	ksceBtHidGetReportDescriptor :: proc(mac0: c.uint, mac1: c.uint, buffer: rawptr, size: sce.Size) -> c.int ---
	ksceBtHidTransfer :: proc(mac0: c.uint, mac1: c.uint, request: ^SceBtHidRequest) -> c.int ---
	ksceBtPushBip :: proc(r0: c.int, r1: c.int, r2: c.int, r3: c.int) -> c.int ---
	ksceBtPushOpp :: proc(r0: c.int, r1: c.int, r2: c.int, r3: c.int) -> c.int ---
	ksceBtReadEvent :: proc(events: [^]SceBtEvent, num_events: c.int) -> c.int ---
	ksceBtRecvAudio :: proc(r0: c.int, r1: c.int, r2: c.int, r3: c.int) -> c.int ---
	ksceBtRecvBip :: proc(r0: c.int, r1: c.int, r2: c.int, r3: c.int) -> c.int ---
	ksceBtRecvOpp :: proc(r0: c.int, r1: c.int, r2: c.int, r3: c.int) -> c.int ---
	ksceBtRecvSpp :: proc(r0: c.int, r1: c.int, r2: c.int, r3: c.int) -> c.int ---
	ksceBtRegisterCallback :: proc(cb: sce.UID, unused: c.int, flags1: c.int, flags2: c.int) -> c.int --- // looks like flags1 is a mask for permitted MACs
	ksceBtReplyPinCode :: proc(mac0: c.uint, mac1: c.uint, code: ^c.uchar, length: sce.Size) -> c.int ---
	ksceBtReplyUserConfirmation :: proc(mac0: c.uint, mac1: c.uint, unk: c.int) -> c.int ---
	ksceBtSendAudio :: proc(r0: c.int, r1: c.int, r2: c.int, r3: c.int) -> c.int ---
	ksceBtSendL2capEchoRequestForTest :: proc(r0: c.int, r1: c.int, r2: c.int, r3: c.int) -> c.int ---
	ksceBtSendSpp :: proc(r0: c.int, r1: c.int, r2: c.int, r3: c.int) -> c.int ---
	ksceBtSetConfiguration :: proc(r0: c.int) -> c.int --- //0 = disable bt, 1 = enabling, 2 = enabled 3 = disabling?
	ksceBtSetContentProtection :: proc(r0: c.int) -> c.int ---
	ksceBtSetInquiryResultForTest :: proc(_: ^c.uchar) -> c.int ---
	ksceBtSetInquiryScan :: proc(r0: c.int) -> c.int ---
	ksceBtSetL2capEchoResponseBufferForTest :: proc(r0: c.int, r1: c.int, r2: c.int, r3: c.int) -> c.int ---
	ksceBtSetStatusForTest :: proc(r0: c.int, r1: c.int, r2: c.int, r3: c.int) -> c.int ---
	ksceBtStartAudio :: proc(r0: c.int, r1: c.int, r2: c.int, r3: c.int) -> c.int ---
	ksceBtStartConnect :: proc(mac0: c.uint, mac1: c.uint) -> c.int --- // mac0 can be used as a device index (already paired devices)?
	ksceBtStartDisconnect :: proc(mac0: c.uint, mac1: c.uint) -> c.int ---
	ksceBtStartInquiry :: proc() -> c.int ---
	ksceBtStopAudio :: proc(r0: c.int, r1: c.int, r2: c.int, r3: c.int) -> c.int ---
	ksceBtStopInquiry :: proc() -> c.int ---
	ksceBtUnregisterCallback :: proc(cb: sce.UID) -> c.int ---
}


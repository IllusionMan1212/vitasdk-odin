package notificationutil

import "core:c"
import sce "../common"

foreign import notificationutil "system:SceNotificationUtil_stub"

@(link_prefix = "sceNotificationUtil")
foreign notificationutil {
	/**
	* Initialize notification util for use with BG application.
	*
	* Does not need to be called for normal applications.
	*/
	BgAppInitialize :: proc() -> sce.Int32 ---

	/**
	* Send notification.
	*
	* Text buffer size must be 0x410.
	*/
	SendNotification :: proc(text: [^]sce.WChar16) -> sce.Int32 ---

	/**
	* Clean notifications for calling app from notification history.
	*/
	CleanHistory :: proc() -> sce.Int32 ---

	/**
	* Start BGDL-type notification.
	*/
	ProgressBegin :: proc(initParams: ^SceNotificationUtilProgressInitParam) -> sce.Int32 ---

	/**
	* Update BGDL-type notification.
	*/
	ProgressUpdate :: proc(updateParams: ^SceNotificationUtilProgressUpdateParam) -> sce.Int32 ---

	/**
	* Finish BGDL-type notification.
	*/
	ProgressFinish :: proc(finishParams: ^SceNotificationUtilProgressFinishParam) -> sce.Int32 ---
}

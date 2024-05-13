package notificationutil

import "core:c"
import sce "../common"

foreign import notificationutil "system:SceNotificationUtil_stub"

foreign notificationutil {
	/**
	* Initialize notification util for use with BG application.
	*
	* Does not need to be called for normal applications.
	*/
	sceNotificationUtilBgAppInitialize :: proc() -> sce.Int32 ---

	/**
	* Send notification.
	*
	* Text buffer size must be 0x410.
	*/
	sceNotificationUtilSendNotification :: proc(text: [^]sce.WChar16) -> sce.Int32 ---

	/**
	* Clean notifications for calling app from notification history.
	*/
	sceNotificationUtilCleanHistory :: proc() -> sce.Int32 ---

	/**
	* Start BGDL-type notification.
	*/
	sceNotificationUtilProgressBegin :: proc(initParams: ^SceNotificationUtilProgressInitParam) -> sce.Int32 ---

	/**
	* Update BGDL-type notification.
	*/
	sceNotificationUtilProgressUpdate :: proc(updateParams: ^SceNotificationUtilProgressUpdateParam) -> sce.Int32 ---

	/**
	* Finish BGDL-type notification.
	*/
	sceNotificationUtilProgressFinish :: proc(finishParams: ^SceNotificationUtilProgressFinishParam) -> sce.Int32 ---
}

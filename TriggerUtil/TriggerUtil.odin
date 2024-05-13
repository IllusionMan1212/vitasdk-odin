package triggerutil

import "core:c"
import sce "../common"

/**
 * @note Last two params in all of the functions are never used,
 * 		 probably callbacks since all sceTriggerUtil functions are non-blocking
 */

/**
 * @note Max number of events (eventId) per application is 6
 */

foreign import triggerutil "system:SceTriggerUtil_stub"

foreign triggerutil {
	/**
	* Register application start event that will be repeated on certain days
	*
	* @param[in] titleid - title ID of application to register event for.
	* @param[in] param - event parameters.
	* @param[in] eventId - ID number of event.
	* @param[in] a4 - Unknown, set to 0.
	* @param[in] a5 - Unknown, set to 0.
	*
	* @return 0 on success, <0 otherwise.
	*/
	sceTriggerUtilRegisterDailyEvent :: proc(titleid: cstring, #by_ptr param: SceTriggerUtilEventParamDaily, eventId: c.int, a4: c.int, a5: c.int) -> c.int ---

	/**
	* Register one time application start event
	*
	* @param[in] titleid - title ID of application to register event for.
	* @param[in] param - event parameters.
	* @param[in] eventId - ID number of event.
	* @param[in] a4 - Unknown, set to 0.
	* @param[in] a5 - Unknown, set to 0.
	*
	* @return 0 on success, <0 otherwise.
	*/
	sceTriggerUtilRegisterOneTimeEvent :: proc(titleid: cstring, #by_ptr param: SceTriggerUtilEventParamOneTime, eventId: c.int, a4: c.int, a5: c.int) -> c.int ---

	/**
	* Unregister daily event for caller application
	*
	* @param[in] eventId - ID number of event to unregister.
	* @param[in] a2 - Unknown, set to 0.
	* @param[in] a3 - Unknown, set to 0.
	*
	* @return 0 on success, <0 otherwise.
	*/
	sceTriggerUtilUnregisterDailyEvent :: proc(eventId: c.int, a2: c.int, a3: c.int) -> c.int ---

	/**
	* Unregister one time event for caller application
	*
	* @param[in] eventId - ID number of event to unregister.
	* @param[in] a2 - Unknown, set to 0.
	* @param[in] a3 - Unknown, set to 0.
	*
	* @return 0 on success, <0 otherwise.
	*/
	sceTriggerUtilUnregisterOneTimeEvent :: proc(eventId: c.int, a2: c.int, a3: c.int) -> c.int ---

	/**
	* Get value from "Settings->System->Auto-Start Settings" for caller application. Required to be 1 to use 
	*
	* @param[out] status - auto-start status. Required to be 1 to use .
	* @param[in] a2 - Unknown, set to 0.
	* @param[in] a3 - Unknown, set to 0.
	*
	* @return 0 on success, <0 otherwise.
	*/
	sceTriggerUtilGetAutoStartStatus :: proc(status: ^c.int, a2: c.int, a3: c.int) -> c.int ---

	/**
	* Get one time event info for caller application
	*
	* @param[in] eventId - ID number of event to get information for.
	* @param[out] triggerTime - SceRtcTick, UTC
	* @param[in] a4 - Unknown, set to 0.
	* @param[in] a5 - Unknown, set to 0.
	*
	* @return 0 on success, <0 otherwise.
	*/
	sceTriggerUtilGetOneTimeEventInfo :: proc(eventId: c.int, triggerTime: ^sce.RtcTick, a4: c.int, a5: c.int) -> c.int ---

	/**
	* Get daily event info for caller application
	*
	* @param[in] eventId - ID number of event to get information for.
	* @param[out] param - event parameters.
	* @param[in] a5 - Unknown, set to 0.
	* @param[in] a6 - Unknown, set to 0.
	*
	* @return 0 on success, <0 otherwise.
	*/
	sceTriggerUtilGetDailyEventInfo :: proc(eventId: c.int, param: ^SceTriggerUtilEventParamDaily, a5: c.int, a6: c.int) -> c.int ---

	/**
	* Get info for user application that has registered  events
	*
	* @param[in] titleid - title ID of application to get info for.
	* @param[out] appInfo - application information
	* @param[in] a4 - Unknown, set to 0.
	* @param[in] a5 - Unknown, set to 0.
	*
	* @return 0 on success, <0 otherwise.
	*/
	sceTriggerUtilGetUserAppInfo :: proc(titleid: cstring, appInfo: ^SceTriggerUtilUserAppInfo, a4: c.int, a5: c.int) -> c.int ---

	/**
	* Get list of user applications that has registered  events. List contains null-separated title IDs
	*
	* @param[out] titleIdBuffer - pointer to buffer to recieve title ID list. Max size is 0x1000, min size is unlimited
	* @param[out] numOfIds - number of title IDs stored in the list
	*
	* @return 0 on success, <0 otherwise.
	*/
	sceTriggerUtilGetRegisteredUserTitleIdList :: proc(titleIdBuffer: [^]c.char, numOfIds: c.int) -> c.int ---

	/**
	* Get info for system application that has registered  events
	*
	* @param[in] titleid - title ID of application to get info for.
	* @param[out] appInfo - application information
	* @param[in] a4 - Unknown, set to 0.
	* @param[in] a5 - Unknown, set to 0.
	*
	* @return 0 on success, <0 otherwise.
	*/
	sceTriggerUtilGetSystemAppInfo :: proc(titleid: cstring, appInfo: ^SceTriggerUtilSystemAppInfo, a4: c.int, a5: c.int) -> c.int ---

	/**
	* Get list of system applications that has registered  events. List contains null-separated fake title IDs
	*
	* @param[out] titleIdBuffer - pointer to buffer to recieve fake title ID list. Max size is 0x140, min size is unlimited
	* @param[out] numOfIds - number of fake title IDs stored in the list
	*
	* @return 0 on success, <0 otherwise.
	*/
	sceTriggerUtilGetRegisteredSystemTitleIdList :: proc(buffer: [^]c.char, numOfIds: c.int) -> c.int ---
}

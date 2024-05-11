package hid

import "core:c"
import sce "../common"

foreign import hid "system:SceHid_stub"

@(link_prefix = "sceHid")
foreign hid {
	/**
	* Enumerate hid keyboards.
	*
	* @param[out]	handle	Buffer to receive keyboard hid handles.
	* @param[int]	count   Number of keyboards to enumerate
	*/
	KeyboardEnumerate :: proc(handle: [^]c.int, count: c.int) -> c.int ---


	/**
	* Get hid keyboard reports (blocking).
	*
	* @param[in]	handle		Hid handle.
	* @param[in]	reports		Buffer to receive reports.
	* @param[in]	nReports	Number of reports to receive.
	*/
	KeyboardRead :: proc(handle: sce.UInt32, reports: []^SceHidKeyboardReport, nReports: c.int) -> c.int ---

	/**
	* Get hid keyboard reports (non-blocking).
	*
	* @param[in]	handle		Hid handle.
	* @param[in]	reports		Buffer to receive reports.
	* @param[in]	nReports	Number of reports to receive.
	*/
	KeyboardPeek :: proc(handle: sce.UInt32, reports: [^]SceHidKeyboardReport, nReports: c.int) -> c.int ---

	/**
	* Enumerate hid mice.
	*
	* @param[out]	handle	Buffer to receive mouse hid handles.
	* @param[int]	count   Number of mice to enumerate
	*/
	MouseEnumerate :: proc(handle: [^]c.int, count: c.int) -> c.int ---


	/**
	* Get hid mouse reports.
	*
	* @param[in]	handle		Hid handle.
	* @param[in]	reports		Buffer to receive reports.
	* @param[in]	nReports	Number of reports to receive.
	*/
	MouseRead :: proc(handle: sce.UInt32, reports: []^SceHidMouseReport, nReports: c.int) -> c.int ---
}

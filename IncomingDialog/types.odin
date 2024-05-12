package incomingdialog

import "core:c"
import sce "../common"

/**
 * Dialog status
 */
SceIncomingDialogStatus :: enum c.int {
	NOT_RUNNING,
	ACCEPTED,
	RUNNING,
	REJECTED,
	CLOSED,
	BUSY,
	TIMEOUT
}

/**
 * Error Codes
 */
SceIncomingDialogErrorCode :: enum c.uint {
	INVALID_ARG = 0x80106201
}

SceIncomingDialogParam :: struct {
  sdkVersion: sce.Int32,
	audioPath: [0x80]sce.Char8,           //Path to audio file that will be played during dialog, .mp3, .at9, m4a. Can be NULL
	titleid: [0x10]sce.Char8,             //TitleId of the application to open when "accept" button has been pressed. Can be NULL
	unk_BC: sce.Int32,                    //Can be set to 0
	dialogTimer: sce.UInt32,              //Time to show dialog in seconds
	reserved1: [0x3E]sce.Char8,
	buttonRightText: [0x1F]sce.WChar16,   //Text for "accept" button
	separator0: sce.Int16,                //must be 0
	buttonLeftText: [0x1F]sce.WChar16,    //Text for "reject" button. If NULL, only "accept" button will be created
	separator1: sce.Int16,                //must be 0
	dialogText: [0x80]sce.WChar16,        //Text for dialog window, also shared with notification
	separator2: sce.Int16,                //must be 0
}
#assert(size_of(SceIncomingDialogParam) == 0x25C)


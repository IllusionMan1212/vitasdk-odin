package kernel

import "core:c"
import sce "../common"

// TODO: this should be a c.int
SceKernelErrorCode :: enum i64 {
	OK                                                = 0x0,
	ERROR                                       = 0x80020001,
	NOT_IMPLEMENTED                             = 0x80020002,
	NOSYS                                       = 0x80020003,
	UNSUP                                       = 0x80020004,
	INVALID_ARGUMENT                            = 0x80020005,
	ILLEGAL_ADDR                                = 0x80020006,
	ILLEGAL_ALIGNMENT                           = 0x80020007,
	ILLEGAL_PERMISSION                          = 0x80020008,
	INVALID_ARGUMENT_SIZE                       = 0x80020009,
	INVALID_FLAGS                               = 0x8002000A,
	ILLEGAL_SIZE                                = 0x8002000B,
	ILLEGAL_TYPE                                = 0x8002000C,
	ILLEGAL_PATTERN                             = 0x8002000D,
	ILLEGAL_ATTR                                = 0x8002000E,
	ILLEGAL_COUNT                               = 0x8002000F,
	ILLEGAL_MODE                                = 0x80020010,
	ILLEGAL_OPEN_LIMIT                          = 0x80020011,
	ONLY_DEVELOPMENT_MODE                       = 0x80020012,
	DEBUG_ERROR                                 = 0x80021000,
	ILLEGAL_DIPSW_NUMBER                        = 0x80021001,
	PA_ERROR                                    = 0x80021100,
	PA_NOT_AVAILABLE                            = 0x80021101,
	PA_INVALID_KEY                              = 0x80021102,
	PA_KEY_IS_NOT_SHARED                        = 0x80021103,
	PA_INVALID_SIGNATURE                        = 0x80021104,
	CPU_ERROR                                   = 0x80022000,
	MMU_ILLEGAL_L1_TYPE                         = 0x80022001,
	MMU_L2_INDEX_OVERFLOW                       = 0x80022002,
	MMU_L2_SIZE_OVERFLOW                        = 0x80022003,
	INVALID_CPU_AFFINITY                        = 0x80022004,
	INVALID_MEMORY_ACCESS                       = 0x80022005,
	INVALID_MEMORY_ACCESS_PERMISSION            = 0x80022006,
	VA2PA_FAULT                                 = 0x80022007,
	VA2PA_MAPPED                                = 0x80022008,
	VALIDATION_CHECK_FAILED                     = 0x80022009,
	SYSMEM_ERROR                                = 0x80024000,
	INVALID_PROCESS_CONTEXT                     = 0x80024001,
	UID_NAME_TOO_LONG                           = 0x80024002,
	VARANGE_IS_NOT_PHYSICAL_CONTINUOUS          = 0x80024003,
	PHYADDR_ERROR                               = 0x80024100,
	NO_PHYADDR                                  = 0x80024101,
	PHYADDR_USED                                = 0x80024102,
	PHYADDR_NOT_USED                            = 0x80024103,
	NO_IOADDR                                   = 0x80024104,
	PHYMEM_ERROR                                = 0x80024300,
	ILLEGAL_PHYPAGE_STATUS                      = 0x80024301,
	NO_FREE_PHYSICAL_PAGE                       = 0x80024302,
	NO_FREE_PHYSICAL_PAGE_UNIT                  = 0x80024303,
	PHYMEMPART_NOT_EMPTY                        = 0x80024304,
	NO_PHYMEMPART_LPDDR2                        = 0x80024305,
	NO_PHYMEMPART_CDRAM                         = 0x80024306,
	PHYMEMPART_OUT_OF_INDEX                     = 0x80024307,
	CANNOT_GROW_PHYMEMPART                      = 0x80024308,
	NO_FREE_PHYSICAL_PAGE_CDRAM                 = 0x80024309,
	INVALID_SUBBUDGET_ID                        = 0x8002430A,
	FIXEDHEAP_ERROR                             = 0x80024400,
	FIXEDHEAP_ILLEGAL_SIZE                      = 0x80024401,
	FIXEDHEAP_ILLEGAL_INDEX                     = 0x80024402,
	FIXEDHEAP_INDEX_OVERFLOW                    = 0x80024403,
	FIXEDHEAP_NO_CHUNK                          = 0x80024404,
	UID_ERROR                                   = 0x80024500,
	INVALID_UID                                 = 0x80024501,
	SYSMEM_UID_INVALID_ARGUMENT                 = 0x80024502,
	SYSMEM_INVALID_UID_RANGE                    = 0x80024503,
	SYSMEM_NO_VALID_UID                         = 0x80024504,
	SYSMEM_CANNOT_ALLOCATE_UIDENTRY             = 0x80024505,
	NOT_PROCESS_UID                             = 0x80024506,
	NOT_KERNEL_UID                              = 0x80024507,
	INVALID_UID_CLASS                           = 0x80024508,
	INVALID_UID_SUBCLASS                        = 0x80024509,
	UID_CANNOT_FIND_BY_NAME                     = 0x8002450A,
	UID_NOT_VISIBLE                             = 0x8002450B,
	UID_MAX_OPEN                                = 0x8002450C,
	UID_RL_OVERFLOW                             = 0x8002450D,
	VIRPAGE_ERROR                               = 0x80024600,
	ILLEGAL_VIRPAGE_TYPE                        = 0x80024601,
	BLOCK_ERROR                                 = 0x80024700,
	ILLEGAL_BLOCK_ID                            = 0x80024701,
	ILLEGAL_BLOCK_TYPE                          = 0x80024702,
	BLOCK_IN_USE                                = 0x80024703,
	PARTITION_ERROR                             = 0x80024800,
	ILLEGAL_PARTITION_ID                        = 0x80024801,
	ILLEGAL_PARTITION_INDEX                     = 0x80024802,
	NO_L2PAGETABLE                              = 0x80024803,
	HEAPLIB_ERROR                               = 0x80024900,
	ILLEGAL_HEAP_ID                             = 0x80024901,
	OUT_OF_RANG                                 = 0x80024902,
	HEAPLIB_NOMEM                               = 0x80024903,
	HEAPLIB_VERIFY_ERROR                        = 0x80024904,
	SYSMEM_ADDRESS_SPACE_ERROR                  = 0x80024A00,
	INVALID_ADDRESS_SPACE_ID                    = 0x80024A01,
	INVALID_PARTITION_INDEX                     = 0x80024A02,
	ADDRESS_SPACE_CANNOT_FIND_PARTITION_BY_ADDR = 0x80024A03,
	SYSMEM_MEMBLOCK_ERROR                       = 0x80024B00,
	ILLEGAL_MEMBLOCK_TYPE                       = 0x80024B01,
	ILLEGAL_MEMBLOCK_REMAP_TYPE                 = 0x80024B02,
	NOT_PHY_CONT_MEMBLOCK                       = 0x80024B03,
	ILLEGAL_MEMBLOCK_CODE                       = 0x80024B04,
	ILLEGAL_MEMBLOCK_SIZE                       = 0x80024B05,
	ILLEGAL_USERMAP_SIZE                        = 0x80024B06,
	MEMBLOCK_TYPE_FOR_KERNEL_PROCESS            = 0x80024B07,
	PROCESS_CANNOT_REMAP_MEMBLOCK               = 0x80024B08,
	MEMBLOCK_RANGE_ERROR                        = 0x80024B09,
	MEMBLOCK_TYPE_FOR_UPDATER_OR_SAFEMODE       = 0x80024B0A,
	MEMBLOCK_OVERFLOW                           = 0x80024B0B,
	SYSMEM_PHYMEMLOW_ERROR                      = 0x80024C00,
	CANNOT_ALLOC_PHYMEMLOW                      = 0x80024C01,
	UNKNOWN_PHYMEMLOW_TYPE                      = 0x80024C02,
	SYSMEM_BITHEAP_ERROR                        = 0x80024D00,
	CANNOT_ALLOC_BITHEAP                        = 0x80024D01,
	SYSMEM_NAMEHEAP_ERROR                       = 0x80024E00,
	NO_SUCH_NAME                                = 0x80024E01,
	DUPLICATE_NAME                              = 0x80024E02,
	LOADCORE_ERROR                              = 0x80025000,
	ILLEGAL_ELF_HEADER                          = 0x80025001,
	ILLEGAL_SELF_HEADER                         = 0x80025002,
	EXCPMGR_ERROR                               = 0x80027000,
	ILLEGAL_EXCPCODE                            = 0x80027001,
	ILLEGAL_EXCPHANDLER                         = 0x80027002,
	NOTFOUND_EXCPHANDLER                        = 0x80027003,
	CANNOT_RELEASE_EXCPHANDLER                  = 0x80027004,
	INTRMGR_ERROR                               = 0x80027100,
	ILLEGAL_CONTEXT                             = 0x80027101,
	ILLEGAL_INTRCODE                            = 0x80027102,
	ILLEGAL_INTRPARAM                           = 0x80027103,
	ILLEGAL_INTRPRIORITY                        = 0x80027104,
	ILLEGAL_TARGET_CPU                          = 0x80027105,
	ILLEGAL_INTRFILTER                          = 0x80027106,
	ILLEGAL_INTRTYPE                            = 0x80027107,
	ILLEGAL_HANDLER                             = 0x80027108,
	FOUND_HANDLER                               = 0x80027109,
	NOTFOUND_HANDLER                            = 0x8002710A,
	NO_MEMORY                                   = 0x8002710B,
	DMACMGR_ERROR                               = 0x80027200,
	ALREADY_QUEUED                              = 0x80027201,
	NOT_QUEUED                                  = 0x80027202,
	NOT_SETUP                                   = 0x80027203,
	ON_TRANSFERRING                             = 0x80027204,
	NOT_INITIALIZED                             = 0x80027205,
	TRANSFERRED                                 = 0x80027206,
	NOT_UNDER_CONTROL                           = 0x80027207,
	CANCELING                                   = 0x80027208,
	SYSTIMER_ERROR                              = 0x80027300,
	NO_FREE_TIMER                               = 0x80027301,
	TIMER_NOT_ALLOCATED                         = 0x80027302,
	TIMER_COUNTING                              = 0x80027303,
	TIMER_STOPPED                               = 0x80027304,
	THREADMGR_ERROR                             = 0x80028000,
	UNKNOWN_UID                                 = 0x80028001,
	DIFFERENT_UID_CLASS                         = 0x80028002,
	ALREADY_REGISTERED                          = 0x80028003,
	CAN_NOT_WAIT                                = 0x80028004,
	WAIT_TIMEOUT                                = 0x80028005,
	WAIT_DELETE                                 = 0x80028006,
	WAIT_CANCEL                                 = 0x80028007,
	THREAD_ERROR                                = 0x80028020,
	UNKNOWN_THREAD_ID                           = 0x80028021,
	ILLEGAL_THREAD_ID                           = 0x80028022,
	ILLEGAL_PRIORITY                            = 0x80028023,
	ILLEGAL_STACK_SIZE                          = 0x80028024,
	ILLEGAL_CPU_AFFINITY_MASK                   = 0x80028025,
	ILLEGAL_THREAD_PARAM_COMBINATION            = 0x80028026,
	DORMANT                                     = 0x80028027,
	NOT_DORMANT                                 = 0x80028028,
	RUNNING                                     = 0x80028029,
	DELETED                                     = 0x8002802A,
	CAN_NOT_SUSPEND                             = 0x8002802B,
	THREAD_STOPPED                              = 0x8002802C,
	THREAD_SUSPENDED                            = 0x8002802D,
	NOT_SUSPENDED                               = 0x8002802E,
	ALREADY_DEBUG_SUSPENDED                     = 0x8002802F,
	NOT_DEBUG_SUSPENDED                         = 0x80028030,
	CAN_NOT_USE_VFP                             = 0x80028031,
	THREAD_EVENT_ERROR                          = 0x80028060,
	UNKNOWN_THREAD_EVENT_ID                     = 0x80028061,
	KERNEL_TLS_ERROR                            = 0x80028080,
	KERNEL_TLS_FULL                             = 0x80028081,
	ILLEGAL_KERNEL_TLS_INDEX                    = 0x80028082,
	KERNEL_TLS_BUSY                             = 0x80028083,
	CALLBACK_ERROR                              = 0x800280A0,
	UNKNOWN_CALLBACK_ID                         = 0x800280A1,
	NOTIFY_CALLBACK                             = 0x800280A2,
	CALLBACK_NOT_REGISTERED                     = 0x800280A3,
	ALARM_ERROR                                 = 0x800280C0,
	UNKNOWN_ALARM_ID                            = 0x800280C1,
	ALARM_CAN_NOT_CANCEL                        = 0x800280C2,
	EVF_ERROR                                   = 0x800280E0,
	UNKNOWN_EVF_ID                              = 0x800280E1,
	EVF_MULTI                                   = 0x800280E2,
	EVF_COND                                    = 0x800280E3,
	SEMA_ERROR                                  = 0x80028100,
	UNKNOWN_SEMA_ID                             = 0x80028101,
	SEMA_ZERO                                   = 0x80028102,
	SEMA_OVF                                    = 0x80028103,
	SIGNAL_ERROR                                = 0x80028120,
	ALREADY_SENT                                = 0x80028121,
	MUTEX_ERROR                                 = 0x80028140,
	UNKNOWN_MUTEX_ID                            = 0x80028141,
	MUTEX_RECURSIVE                             = 0x80028142,
	MUTEX_LOCK_OVF                              = 0x80028143,
	MUTEX_UNLOCK_UDF                            = 0x80028144,
	MUTEX_FAILED_TO_OWN                         = 0x80028145,
	MUTEX_NOT_OWNED                             = 0x80028146,
	FAST_MUTEX_ERROR                            = 0x80028160,
	UNKNOWN_FAST_MUTEX_ID                       = 0x80028161,
	FAST_MUTEX_RECURSIVE                        = 0x80028162,
	FAST_MUTEX_LOCK_OVF                         = 0x80028163,
	FAST_MUTEX_FAILED_TO_OWN                    = 0x80028164,
	FAST_MUTEX_NOT_OWNED                        = 0x80028165,
	FAST_MUTEX_OWNED                            = 0x80028166,
	FAST_MUTEX_ALREADY_INITIALIZED              = 0x80028167,
	FAST_MUTEX_NOT_INITIALIZED                  = 0x80028168,
	LW_MUTEX_ERROR                              = 0x80028180,
	UNKNOWN_LW_MUTEX_ID                         = 0x80028181,
	LW_MUTEX_RECURSIVE                          = 0x80028182,
	LW_MUTEX_LOCK_OVF                           = 0x80028183,
	LW_MUTEX_UNLOCK_UDF                         = 0x80028184,
	LW_MUTEX_FAILED_TO_OWN                      = 0x80028185,
	LW_MUTEX_NOT_OWNED                          = 0x80028186,
	COND_ERROR                                  = 0x800281A0,
	UNKNOWN_COND_ID                             = 0x800281A1,
	WAIT_DELETE_MUTEX                           = 0x800281A2,
	WAIT_CANCEL_MUTEX                           = 0x800281A3,
	WAIT_DELETE_COND                            = 0x800281A4,
	WAIT_CANCEL_COND                            = 0x800281A5,
	LW_COND_ERROR                               = 0x800281C0,
	UNKNOWN_LW_COND_ID                          = 0x800281C1,
	WAIT_DELETE_LW_MUTEX                        = 0x800281C2,
	WAIT_DELETE_LW_COND                         = 0x800281C3,
	RW_LOCK_ERROR                               = 0x800281E0,
	UNKNOWN_RW_LOCK_ID                          = 0x800281E1,
	RW_LOCK_RECURSIVE                           = 0x800281E2,
	RW_LOCK_LOCK_OVF                            = 0x800281E3,
	RW_LOCK_NOT_OWNED                           = 0x800281E4,
	RW_LOCK_UNLOCK_UDF                          = 0x800281E5,
	RW_LOCK_FAILED_TO_LOCK                      = 0x800281E6,
	RW_LOCK_FAILED_TO_UNLOCK                    = 0x800281E7,
	EVENT_ERROR                                 = 0x80028200,
	UNKNOWN_EVENT_ID                            = 0x80028201,
	EVENT_COND                                  = 0x80028202,
	MSG_PIPE_ERROR                              = 0x80028220,
	UNKNOWN_MSG_PIPE_ID                         = 0x80028221,
	MSG_PIPE_FULL                               = 0x80028222,
	MSG_PIPE_EMPTY                              = 0x80028223,
	MSG_PIPE_DELETED                            = 0x80028224,
	TIMER_ERROR                                 = 0x80028240,
	UNKNOWN_TIMER_ID                            = 0x80028241,
	EVENT_NOT_SET                               = 0x80028242,
	SIMPLE_EVENT_ERROR                          = 0x80028260,
	UNKNOWN_SIMPLE_EVENT_ID                     = 0x80028261,
	PMON_ERROR                                  = 0x80028280,
	PMON_NOT_THREAD_MODE                        = 0x80028281,
	PMON_NOT_CPU_MODE                           = 0x80028282,
	WORK_QUEUE                                  = 0x80028300,
	UNKNOWN_WORK_QUEUE_ID                       = 0x80028301,
	UNKNOWN_WORK_TASK_ID                        = 0x80028302,
	PROCESSMGR_ERROR                            = 0x80029000,
	INVALID_PID                                 = 0x80029001,
	INVALID_PROCESS_TYPE                        = 0x80029002,
	PLS_FULL                                    = 0x80029003,
	INVALID_PROCESS_STATUS                      = 0x80029004,
	PROCESS_CALLBACK_NOTFOUND                   = 0x80029005,
	INVALID_BUDGET_ID                           = 0x80029006,
	INVALID_BUDGET_SIZE                         = 0x80029007,
	CP14_DISABLED                               = 0x80029008,
	EXCEEDED_MAX_PROCESSES                      = 0x80029009,
	PROCESS_REMAINING                           = 0x8002900A,
	NO_PROCESS_DATA                             = 0x8002900B,
	PROCESS_EVENT_INHIBITED                     = 0x8002900C,
	IOFILEMGR_ERROR                             = 0x8002A000,
	IO_NAME_TOO_LONG                            = 0x8002A001,
	IO_REG_DEV                                  = 0x8002A002,
	IO_ALIAS_USED                               = 0x8002A003,
	IO_DEL_DEV                                  = 0x8002A004,
	IO_WOULD_BLOCK                              = 0x8002A005,
	MODULEMGR_START_FAILED                      = 0x8002D000,
	MODULEMGR_STOP_FAIL                         = 0x8002D001,
	MODULEMGR_IN_USE                            = 0x8002D002,
	MODULEMGR_NO_LIB                            = 0x8002D003,
	MODULEMGR_SYSCALL_REG                       = 0x8002D004,
	MODULEMGR_NOMEM_LIB                         = 0x8002D005,
	MODULEMGR_NOMEM_STUB                        = 0x8002D006,
	MODULEMGR_NOMEM_SELF                        = 0x8002D007,
	MODULEMGR_NOMEM                             = 0x8002D008,
	MODULEMGR_INVALID_LIB                       = 0x8002D009,
	MODULEMGR_INVALID_STUB                      = 0x8002D00A,
	MODULEMGR_NO_FUNC_NID                       = 0x8002D00B,
	MODULEMGR_NO_VAR_NID                        = 0x8002D00C,
	MODULEMGR_INVALID_TYPE                      = 0x8002D00D,
	MODULEMGR_NO_MOD_ENTRY                      = 0x8002D00E,
	MODULEMGR_INVALID_PROC_PARAM                = 0x8002D00F,
	MODULEMGR_NO_MODOBJ                         = 0x8002D010,
	MODULEMGR_NO_MOD                            = 0x8002D011,
	MODULEMGR_NO_PROCESS                        = 0x8002D012,
	MODULEMGR_OLD_LIB                           = 0x8002D013,
	MODULEMGR_STARTED                           = 0x8002D014,
	MODULEMGR_NOT_STARTED                       = 0x8002D015,
	MODULEMGR_NOT_STOPPED                       = 0x8002D016,
	MODULEMGR_INVALID_PROCESS_UID               = 0x8002D017,
	MODULEMGR_CANNOT_EXPORT_LIB_TO_SHARED       = 0x8002D018,
	MODULEMGR_INVALID_REL_INFO                  = 0x8002D019,
	MODULEMGR_INVALID_REF_INFO                  = 0x8002D01A,
	MODULEMGR_ELINK                             = 0x8002D01B,
	MODULEMGR_NOENT                             = 0x8002D01C,
	MODULEMGR_BUSY                              = 0x8002D01D,
	MODULEMGR_NOEXEC                            = 0x8002D01E,
	MODULEMGR_NAMETOOLONG                       = 0x8002D01F,
	LIBRARYDB_NOENT                             = 0x8002D080,
	LIBRARYDB_NO_LIB                            = 0x8002D081,
	LIBRARYDB_NO_MOD                            = 0x8002D082,
	PRELOAD_FAILED                              = 0x8002D0F0,
	PRELOAD_LIBC_FAILED                         = 0x8002D0F1,
	PRELOAD_FIOS2_FAILED                        = 0x8002D0F2,
	AUTHFAIL                                    = 0x8002F000,
	NO_AUTH                                     = 0x8002F001
}

SceKernelOpenPsId :: struct {
	id: [16]c.char,
}
#assert(size_of(SceKernelOpenPsId) == 0x10)

/** Threadmgr types */
SceKernelIdListType :: enum c.int {
	SCE_KERNEL_TMID_Thread             = 1,
	SCE_KERNEL_TMID_Semaphore          = 2,
	SCE_KERNEL_TMID_EventFlag          = 3,
	SCE_KERNEL_TMID_Mbox               = 4,
	SCE_KERNEL_TMID_Vpl                = 5,
	SCE_KERNEL_TMID_Fpl                = 6,
	SCE_KERNEL_TMID_Mpipe              = 7,
	SCE_KERNEL_TMID_Callback           = 8,
	SCE_KERNEL_TMID_ThreadEventHandler = 9,
	SCE_KERNEL_TMID_Alarm              = 10,
	SCE_KERNEL_TMID_VTimer             = 11,
	SCE_KERNEL_TMID_SleepThread        = 64,
	SCE_KERNEL_TMID_DelayThread        = 65,
	SCE_KERNEL_TMID_SuspendThread      = 66,
	SCE_KERNEL_TMID_DormantThread      = 67,
}

SceThreadStatus :: enum c.int {
	RUNNING   = 1,
	READY     = 2,
	STANDBY   = 4,
	WAITING   = 8,
	SUSPEND   = 8, /* Compatibility */
	DORMANT   = 16,
	STOPPED   = 16, /* Compatibility */
	DELETED   = 32, /* Thread manager has killed the thread (stack overflow) */
	KILLED    = 32, /* Compatibility */
	DEAD      = 64,
	STAGNANT  = 128,
	SUSPENDED = 256,
}

/** Statistics about a running thread.
 * @see sceKernelGetThreadRunStatus.
 */
SceKernelThreadRunStatus :: struct {
	size: sce.Size,
	cpuInfo: [4]struct {
		processId: sce.UID,
		threadId: sce.UID,
		priority: c.int,
	},
}
#assert(size_of(SceKernelThreadRunStatus) == 0x34)

SceKernelThreadEntry :: #type ^proc(args: sce.Size, argp: rawptr) -> c.int

/** Additional options used when creating threads. */
SceKernelThreadOptParam :: struct {
	/** Size of the ::SceKernelThreadOptParam structure. */
	size: sce.Size,
	/** Attributes */
	attr: sce.UInt32,
	kStackMemType: sce.UInt32,
	uStackMemType: sce.UInt32,
	uTLSMemType: sce.UInt32,
	uStackMemid: sce.UInt32,
	data_0x18: sce.UInt32,
}
#assert(size_of(SceKernelThreadOptParam) == 0x1C)

/** Structure to hold the status information for a thread
  * @see sceKernelGetThreadInfo
  */
SceKernelThreadInfo :: struct {
	/** Size of the structure */
	size: sce.Size,
	/** The UID of the process where the thread belongs */
	processId: sce.UID,
	/** Nul terminated name of the thread */
	name: [32]c.char,
	/** Thread attributes */
	attr: sce.UInt32,
	/** Thread status */
	status: sce.UInt32,
	/** Thread entry point */
	entry: SceKernelThreadEntry,
	/** Thread stack pointer */
	stack: rawptr,
	/** Thread stack size */
	stackSize: sce.Int32,
	/** Initial priority */
	initPriority: sce.Int32,
	/** Current priority */
	currentPriority: sce.Int32,
	/** Initial CPU affinity mask */
	initCpuAffinityMask: sce.Int32,
	/** Current CPU affinity mask */
	currentCpuAffinityMask: sce.Int32,
	/** Current CPU ID */
	currentCpuId: sce.Int32,
	/** Last executed CPU ID */
	lastExecutedCpuId: sce.Int32,
	/** Wait type */
	waitType: sce.UInt32,
	/** Wait id */
	waitId: sce.UID,
	/** Exit status of the thread */
	exitStatus: sce.Int32,
	/** Number of clock cycles run */
	runClocks: sce.KernelSysClock,
	/** Interrupt preemption count */
	intrPreemptCount: sce.UInt32,
	/** Thread preemption count */
	threadPreemptCount: sce.UInt32,
	/** Thread release count */
	threadReleaseCount: sce.UInt32,
	/** Number of CPUs to which the thread is moved */
	changeCpuCount: sce.Int32,
	/** Function notify callback UID */
	fNotifyCallback: sce.Int32,
	/** Reserved */
	reserved: sce.Int32,
}
when size_of(rawptr) == 4 {
	#assert(size_of(SceKernelThreadInfo) == 0x80)
}

/** Inherit calling thread affinity mask. */
SCE_KERNEL_THREAD_CPU_AFFINITY_MASK_DEFAULT :: 0



/** Callback function prototype */
SceKernelCallbackFunction :: #type ^proc(notifyId: c.int, notifyCount: c.int, notifyArg: c.int, userData: rawptr) -> c.int

/** Structure to hold the status information for a callback */
SceKernelCallbackInfo :: struct {
	/** Size of the structure (i.e. sizeof(SceKernelCallbackInfo)) */
	size: sce.Size,
	/** The UID of the callback. */
	callbackId: sce.UID, // Needs confirmation
	/** The name given to the callback */
	name: [32]c.char,
	/** The thread id associated with the callback */
	threadId: sce.UID,
	/** Pointer to the callback function */
	callback: SceKernelCallbackFunction,
	/** User supplied argument for the callback */
	common: rawptr,
	/** Unknown */
	notifyCount: c.int,
	/** Unknown */
	notifyArg: c.int,
}
when size_of(rawptr) == 4 {
	#assert(size_of(SceKernelCallbackInfo) == 0x3C)
}




/** Additional options used when creating semaphores. */
SceKernelSemaOptParam :: struct {
	/** Size of the ::SceKernelSemaOptParam structure. */
	size: sce.Size,
}
#assert(size_of(SceKernelSemaOptParam) == 4)

/** Current state of a semaphore.
 * @see sceKernelGetSemaInfo.
 */
SceKernelSemaInfo :: struct {
	/** Size of the ::SceKernelSemaInfo structure. */
	size: sce.Size,
	/** The UID of the semaphore */
	semaId: sce.UID,
	/** NUL-terminated name of the semaphore. */
	name: [32]c.char,
	/** Attributes. */
	attr: sce.UInt,
	/** The initial count the semaphore was created with. */
	initCount: c.int,
	/** The current count. */
	currentCount: c.int,
	/** The maximum count. */
	maxCount: c.int,
	/** The number of threads waiting on the semaphore. */
	numWaitThreads: c.int,
}
#assert(size_of(SceKernelSemaInfo) == 0x3C)



SceKernelWaitableAttribute :: enum c.int {
	THREAD_FIFO  = 0x00000000, //!< Waiting threads First input First output
	THREAD_PRIO  = 0x00002000, //!< Waiting threads queued on priority basis
	OPENABLE     = 0x00000080,  //!< Sync object can be accessed by sceKernelOpenXxx
}

/** Event flag creation attributes */
SceEventFlagAttributes :: enum c.int {
	// Deprecated
	THREAD_FIFO = auto_cast SceKernelWaitableAttribute.THREAD_FIFO, //!< Use SCE_KERNEL_ATTR_THREAD_FIFO
	// Deprecated
	THREAD_PRIO = auto_cast SceKernelWaitableAttribute.THREAD_PRIO, //!< Use SCE_KERNEL_ATTR_THREAD_PRIO
	WAITSINGLE   = 0,          //!< Sync object can only be waited upon by one thread.
	WAITMULTIPLE = 0x00001000, //!< Sync object can be waited upon by multiple threads.
	// Deprecated
	OPENABLE = auto_cast SceKernelWaitableAttribute.OPENABLE, //!< Use SCE_KERNEL_ATTR_OPENABLE
}

SceKernelEventFlagOptParam :: struct {
	size: sce.Size,
}
#assert(size_of(SceKernelEventFlagOptParam) == 4)

/** Structure to hold the event flag information */
SceKernelEventFlagInfo :: struct {
	size: sce.Size,
	evfId: sce.UID,          // Needs confirmation
	name: [32]c.char,
	attr: sce.UInt,
	initPattern: sce.UInt,
	currentPattern: sce.UInt,
	numWaitThreads: c.int,
}
#assert(size_of(SceKernelEventFlagInfo) == 0x38)

/** Event flag wait types */
SceEventFlagWaitTypes :: enum c.int {
	/** Wait for all bits in the pattern to be set */
	WAITAND       = 0,
	/** Wait for one or more bits in the pattern to be set */
	WAITOR        = 1,
	/** Clear all the bits when it matches */
	WAITCLEAR     = 2,
	/** Clear the wait pattern when it matches */
	WAITCLEAR_PAT = 4,
}



SceKernelLwCondWork :: struct {
	data: [4]sce.Int32 ,
}
#assert(size_of(SceKernelLwCondWork) == 0x10)

SceKernelLwCondOptParam :: struct {
	size: sce.Size,
}
#assert(size_of(SceKernelLwCondOptParam) == 4)



SceKernelLwMutexWork :: struct {
	data: [4]sce.Int64,
}
#assert(size_of(SceKernelLwMutexWork) == 0x20)

SceKernelLwMutexOptParam :: struct {
	size: sce.Size,
}
#assert(size_of(SceKernelLwMutexOptParam) == 4)




SceKernelMutexAttribute :: enum c.int {
	RECURSIVE   = 0x02,
	CEILING     = 0x04,
}

/** Additional options used when creating mutexes. */
SceKernelMutexOptParam :: struct {
	/** Size of the ::SceKernelMutexOptParam structure. */
	size: sce.Size,
	ceilingPriority: c.int,
}
#assert(size_of(SceKernelMutexOptParam) == 8)

/** Current state of a mutex.
 * @see sceKernelGetMutexInfo.
 */
SceKernelMutexInfo ::  struct {
	/** Size of the ::SceKernelMutexInfo structure. */
	size: sce.Size,
	/** The UID of the mutex. */
	mutexId: sce.UID,
	/** NUL-terminated name of the mutex. */
	name: [32]c.char,
	/** Attributes. */
	attr: sce.UInt,
	/** The initial count the mutex was created with. */
	initCount: c.int,
	/** The current count. */
	currentCount: c.int,
	/** The UID of the current owner of the mutex. */
	currentOwnerId: sce.UID,
	/** The number of threads waiting on the mutex. */
	numWaitThreads: c.int,
}
#assert(size_of(SceKernelMutexInfo) == 0x3C)



/** Additional options used when creating condition variables. */
SceKernelCondOptParam :: struct {
	/** Size of the ::SceKernelCondOptParam structure. */
	size: sce.Size,
}
#assert(size_of(SceKernelCondOptParam) == 4)

/** Current state of a condition variable.
 * @see sceKernelGetCondInfo.
 */
SceKernelCondInfo :: struct {
	/** Size of the ::SceKernelCondInfo structure. */
	size: sce.Size,
	/** The UID of the condition variable. */
	condId: sce.UID,
	/** NUL-terminated name of the condition variable. */
	name: [32]c.char,
	/** Attributes. */
	attr: sce.UInt,
	/** Mutex associated with the condition variable. */
	mutexId: sce.UID,
	/** The number of threads waiting on the condition variable. */
	numWaitThreads: c.int,
}
#assert(size_of(SceKernelCondInfo) == 0x34)

//
// modulemgr.h start
//

/**
 * @brief      Return values for plugins `module_start` and `module_stop`
 */
/** @{ */
SCE_KERNEL_START_SUCCESS     ::  (0)
SCE_KERNEL_START_RESIDENT    ::  SCE_KERNEL_START_SUCCESS
SCE_KERNEL_START_NO_RESIDENT ::  (1)
SCE_KERNEL_START_FAILED      ::  (2)

SCE_KERNEL_STOP_SUCCESS      ::  (0)
SCE_KERNEL_STOP_FAIL         ::  (1)
SCE_KERNEL_STOP_CANCEL       ::  SCE_KERNEL_STOP_FAIL
/** @} */

SceKernelModuleState :: enum c.int {
    READY   = 0x00000002,
    STARTED = 0x00000006,
    ENDED   = 0x00000009
}

/*
 * Assigning the following macro to the variable sceKernelPreloadModuleInhibit with the OR operator inhibit preloading that module.
 *
 * Example
 * <code>
 * // Inhibit preload SceLibc and SceShellSvc.
 * int sceKernelPreloadModuleInhibit = SCE_KERNEL_PRELOAD_INHIBIT_LIBC | SCE_KERNEL_PRELOAD_INHIBIT_LIBSHELLSVC;
 * </code>
 *
 * And these are only valid for modules in the process image, preload is not inhibited even if specified for modules to be loaded later.
 *
 * WARNING
 * If SceLibNet etc. is loaded without SceShellSvc etc. loaded, an unintended system crash will occur.
 */
SceKernelPreloadInhibit :: enum c.int {
	NONE        = 0x00000000,
	LIBC        = 0x10000,
	LIBDBG      = 0x20000,
	LIBSHELLSVC = 0x80000,
	LIBCDLG     = 0x100000,
	LIBFIOS2    = 0x200000,
	APPUTIL     = 0x400000,
	LIBSCEFT2   = 0x800000,
	LIBPVF      = 0x1000000,
	LIBPERF     = 0x2000000
}
#assert(size_of(SceKernelPreloadInhibit) == 4)


SceKernelSegmentInfo :: struct {
	size: sce.Size,   //!< this structure size (0x18)
  perms: sce.UInt,  //!< probably rwx in low bits
  vaddr: rawptr,    //!< address in memory
  memsz: sce.Size,  //!< size in memory
  filesz: sce.Size, //!< original size of memsz
  res: sce.UInt,    //!< unused
}
when size_of(rawptr) == 4 {
	#assert(size_of(SceKernelSegmentInfo) == 0x18)
}

SceKernelModuleInfo :: struct {
	size: sce.Size,                       //!< 0x1B8 for Vita 1.x
  modid: sce.UID,
  modattr: c.uint16_t,
  modver: [2]c.uint8_t,
  module_name: [28]c.char,
  unk28: sce.UInt,
  start_entry: rawptr,
  stop_entry: rawptr,
  exit_entry: rawptr,
  exidx_top: rawptr,
  exidx_btm: rawptr,
  extab_top: rawptr,
  extab_btm: rawptr,
  tlsInit: rawptr,
  tlsInitSize: sce.Size,
  tlsAreaSize: sce.Size,
  path: [256]c.char,
  segments: [4]SceKernelSegmentInfo,
  state: sce.UInt,                       //!< see:SceKernelModuleState
}
when size_of(rawptr) == 4 {
	#assert(size_of(SceKernelModuleInfo) == 0x1B8)
}

SceKernelLMOption :: struct {
	size: sce.Size,
}
#assert(size_of(SceKernelLMOption) == 4)

SceKernelULMOption :: struct {
	size: sce.Size,
}
#assert(size_of(SceKernelULMOption) == 4)

SceKernelSystemSwVersion :: struct {
	size: sce.Size,
	versionString: [0x1C]c.char,
	version: sce.UInt,
	unk_24: sce.UInt,
}
#assert(size_of(SceKernelSystemSwVersion) == 0x28)

/* For backward compatibility */
SceKernelFwInfo :: SceKernelSystemSwVersion

SceKernelModuleLibraryInfo :: struct {
	size: sce.Size, //!< sizeof(SceKernelModuleLibraryInfo) : 0x120
  library_id: sce.UID,
  libnid: c.uint32_t,
  version: c.uint16_t,
  flags: c.uint16_t,
  entry_num_function: c.uint16_t,
  entry_num_variable: c.uint16_t,
  unk_0x14: c.uint16_t,
  unk_0x16: c.uint16_t,
  library_name: [0x100]c.char,
  number_of_imported: sce.Size,
  modid2: sce.UID,
}
#assert(size_of(SceKernelModuleLibraryInfo) == 0x120)


//
// modulemgr.h end
//


//
// processmgr.h start
//


SceKernelProcessType :: distinct sce.UInt32
SceKernelClock :: distinct sce.UInt64
SceKernelTime :: distinct sce.UInt32

SceKernelTimeval :: struct {
	sec: sce.Int32,
	usec: sce.Int32,
}
#assert(size_of(SceKernelTimeval) == 8)

SceKernelTimezone :: struct {
	value: sce.UInt64,
}
#assert(size_of(SceKernelTimezone) == 8)

SceKernelProcessPrioritySystem :: enum c.int {
	SCE_KERNEL_PROCESS_PRIORITY_SYSTEM_HIGH     = 32,
	SCE_KERNEL_PROCESS_PRIORITY_SYSTEM_DEFAULT  = 96,
	SCE_KERNEL_PROCESS_PRIORITY_SYSTEM_LOW      = 159,
	__SCE_KERNEL_PROCESS_PRIORITY_SYSTEM = -1 // 0xFFFFFFFF
}
#assert(size_of(SceKernelProcessPrioritySystem) == 4)

SceKernelProcessPriorityUser :: enum c.int {
	SCE_KERNEL_PROCESS_PRIORITY_USER_HIGH       = 64,
	SCE_KERNEL_PROCESS_PRIORITY_USER_DEFAULT    = 96,
	SCE_KERNEL_PROCESS_PRIORITY_USER_LOW        = 127,
	__SCE_KERNEL_PROCESS_PRIORITY_USER = -1 // 0xFFFFFFFF
}
#assert(size_of(SceKernelProcessPriorityUser) == 4)

SceKernelPowerTickType :: enum c.int {
	/** Cancel all timers */
	SCE_KERNEL_POWER_TICK_DEFAULT			= 0,
	/** Cancel automatic suspension timer */
	SCE_KERNEL_POWER_TICK_DISABLE_AUTO_SUSPEND	= 1,
	/** Cancel OLED-off timer */
	SCE_KERNEL_POWER_TICK_DISABLE_OLED_OFF		= 4,
	/** Cancel OLED dimming timer */
	SCE_KERNEL_POWER_TICK_DISABLE_OLED_DIMMING	= 6,
	__SCE_KERNEL_POWER_TICK_DISABLE = -1 // 0xFFFFFFFF
}
#assert(size_of(SceKernelPowerTickType) == 4)


//
// processmgr.h end
//



//
// sysmem.h start
//

SceKernelMemBlockType :: distinct sce.UInt32
#assert(size_of(SceKernelMemBlockType) == 4)

/*
 * User/Kernel shared memtypes
 */

SCE_KERNEL_MEMBLOCK_TYPE_USER_CDRAM_L1WBWA_RW    :: (0x09404060)
SCE_KERNEL_MEMBLOCK_TYPE_USER_CDRAM_R            :: (0x09408040)
SCE_KERNEL_MEMBLOCK_TYPE_USER_CDRAM_RW           :: (0x09408060)
SCE_KERNEL_MEMBLOCK_TYPE_USER_MAIN_DEVICE_RW     :: (0x0C200860)
SCE_KERNEL_MEMBLOCK_TYPE_USER_MAIN_R             :: (0x0C20D040)
SCE_KERNEL_MEMBLOCK_TYPE_USER_MAIN_RW            :: (0x0C20D060)
SCE_KERNEL_MEMBLOCK_TYPE_USER_MAIN_NC_RW         :: (0x0C208060)
SCE_KERNEL_MEMBLOCK_TYPE_USER_MAIN_GAME_RW       :: (0x0C50D060)
SCE_KERNEL_MEMBLOCK_TYPE_USER_MAIN_PHYCONT_RW    :: (0x0C80D060)
SCE_KERNEL_MEMBLOCK_TYPE_USER_MAIN_PHYCONT_NC_RW :: (0x0D808060)
SCE_KERNEL_MEMBLOCK_TYPE_USER_MAIN_CDIALOG_RW    :: (0x0CA0D060)
SCE_KERNEL_MEMBLOCK_TYPE_USER_MAIN_CDIALOG_NC_RW :: (0x0CA08060)
SCE_KERNEL_MEMBLOCK_TYPE_USER_MAIN_TOOL_RW       :: (0x0CF0D060)
SCE_KERNEL_MEMBLOCK_TYPE_USER_MAIN_TOOL_NC_RW    :: (0x0CF08060)
SCE_KERNEL_MEMBLOCK_TYPE_USER_CDIALOG_R          :: (0x0E20D040)
SCE_KERNEL_MEMBLOCK_TYPE_USER_CDIALOG_RW         :: (0x0E20D060)
SCE_KERNEL_MEMBLOCK_TYPE_USER_CDIALOG_NC_R       :: (0x0E208040)
SCE_KERNEL_MEMBLOCK_TYPE_USER_CDIALOG_NC_RW      :: (0x0E208060)


/*
 * For Backwards compatibility
 */

SCE_KERNEL_MEMBLOCK_TYPE_USER_RW_UNCACHE        :: (0x0C208060)
SCE_KERNEL_MEMBLOCK_TYPE_USER_RW                :: (0x0C20D060)
SCE_KERNEL_MEMBLOCK_TYPE_USER_TOOL_NC_RW        :: (0x0CF08060)


SceKernelAllocMemBlockAttr :: enum c.uint {
	HAS_PADDR          = 0x00000002,
	HAS_ALIGNMENT      = 0x00000004,
	HAS_MIRROR_BLOCKID = 0x00000040,
	HAS_PID            = 0x00000080,
	HAS_PADDR_LIST     = 0x00001000,
	PHYCONT            = 0x00200000,
	ALLOW_PARTIAL_OP   = 0x04000000,
}

SceKernelModel :: enum c.int {
	VITA   = 0x10000,
	VITATV = 0x20000
}

SCE_KERNEL_CPU_MASK_USER_0 :: 0x00010000
SCE_KERNEL_CPU_MASK_USER_1 :: 0x00020000
SCE_KERNEL_CPU_MASK_USER_2 :: 0x00040000
SCE_KERNEL_CPU_MASK_SYSTEM :: 0x00080000

SCE_KERNEL_CPU_MASK_USER_ALL :: (SCE_KERNEL_CPU_MASK_USER_0 | SCE_KERNEL_CPU_MASK_USER_1 | SCE_KERNEL_CPU_MASK_USER_2)

SceKernelAllocMemBlockOpt :: struct {
    size: sce.Size,
    attr: sce.UInt32,
    alignment: sce.Size,
    uidBaseBlock: sce.UInt32,
    strBaseBlockName: cstring,
    flags: c.int,                     //! Unknown flags 0x10 or 0x30 for ::sceKernelOpenMemBlock
    reserved: [10]c.int,
}
when size_of(rawptr) == 4 {
    #assert(size_of(SceKernelAllocMemBlockOpt) == 0x40)
}

SceKernelFreeMemorySizeInfo :: struct {
    size: c.int,         //!< sizeof(SceKernelFreeMemorySizeInfo)
    size_user: c.int,    //!< Free memory size for *_USER_RW memory
    size_cdram: c.int,   //!< Free memory size for USER_CDRAM_RW memory
    size_phycont: c.int, //!< Free memory size for USER_MAIN_PHYCONT_*_RW memory
}
#assert(size_of(SceKernelFreeMemorySizeInfo) == 0x10)

SceKernelMemBlockInfo :: struct {
    size: sce.Size,
    mappedBase: rawptr,
    mappedSize: sce.Size,
    memoryType: c.int,
    access: sce.UInt32,
    type: SceKernelMemBlockType,
}
when size_of(rawptr) == 4 {
    #assert(size_of(SceKernelMemBlockInfo) == 0x18)
}

SceKernelMemoryAccessType :: enum c.int {
    SCE_KERNEL_MEMORY_ACCESS_X = 0x01,
    SCE_KERNEL_MEMORY_ACCESS_W = 0x02,
    SCE_KERNEL_MEMORY_ACCESS_R = 0x04
}

SceKernelMemoryType :: enum c.int {
    SCE_KERNEL_MEMORY_TYPE_NORMAL_NC = 0x80,
    SCE_KERNEL_MEMORY_TYPE_NORMAL    = 0xD0
}

//
// sysmem.h end
//


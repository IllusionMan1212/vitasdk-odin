package kernel

import "core:c"
import sce "../common"

foreign import libkernel "system:SceLibKernel_stub"

/** Message Pipe status info */
SceKernelMppInfo :: struct {
    size: sce.Size,
    mppId: sce.UID, // Needs confirmation
    name: [32]c.char,
    attr: sce.UInt,
    bufSize: c.int,
    freeSize: c.int,
    numSendWaitThreads: c.int,
    numReceiveWaitThreads: c.int,
}
#assert(size_of(SceKernelMppInfo) == 0x3C)

/** Additional options used when creating rwlock. */
SceKernelRWLockOptParam :: struct {
	/** Size of the ::SceKernelRWLockOptParam structure */
  size: sce.Size,
}
#assert(size_of(SceKernelRWLockOptParam) == 4)

/** Current state of a rwlock.
 * @see sceKernelGetRWLockInfo
 */
SceKernelRWLockInfo :: struct {
	/** Size of the ::SceKernelRWLockInfo structure */
  size: sce.Size,
	/** The UID of the rwlock */
	rwLockId: sce.UID,
	/** NULL-terminated name of the rwlock */
	name: [32]c.char,
	/** Attributes */
  attr: sce.UInt32,
	/** The current lock count */
	lockCount: sce.Int32,
	/** The UID of the current owner of the rwlock with write access, 0 when locked for reads */
	writeOwnerId: sce.UID,
	/** The number of threads waiting on the rwlock for read access */
	numReadWaitThreads: sce.UInt32,
	/** The number of threads waiting on the rwlock for write access */
	numWriteWaitThreads: sce.UInt32,
}
#assert(size_of(SceKernelRWLockInfo) == 0x3C)

SceKernelSystemInfo :: struct {
    size: sce.Size,
    activeCpuMask: sce.UInt32,

    cpuInfo: [4]struct {
        idleClock: sce.KernelSysClock,
        comesOutOfIdleCount: sce.UInt32,
        threadSwitchCount: sce.UInt32,
    },
}
#assert(size_of(SceKernelSystemInfo) == 0x48)

foreign libkernel {
    /**
    * Fills the output buffer with random data.
    *
    * @param[out] output - Output buffer
    * @param[in] size - Size of the output buffer, 64 bytes maximum
    *
    * @return 0 on success, < 0 on error.
    */
    sceKernelGetRandomNumber :: proc(output: rawptr, size: sce.Size) -> c.int ---

    /**
    * Gets the status of a specified callback.
    *
    * @param cb - The UID of the callback to retrieve info for.
    * @param status - Pointer to a status structure. The size parameter should be
    * initialised before calling.
    *
    * @return < 0 on error.
    */
    sceKernelGetCallbackInfo :: proc(cb: sce.UID, infop: ^SceKernelCallbackInfo) -> c.int ---

    /**
    * Creates a new condition variable
    *
    * @par Example:
    * @code
    * SceUID condId
    * condId = sceKernelCreateCond("MyCond", 0, mutexId, NULL)
    * @endcode
    *
    * @param name - Specifies the name of the condition variable
    * @param attr - Condition variable attribute flags (normally set to 0)
    * @param mutexId - Mutex to be related to the condition variable
    * @param option - Condition variable options (normally set to 0)
    * @return A condition variable id
    */
    sceKernelCreateCond :: proc(name: cstring, attr: sce.UInt, mutexId: sce.UID, option: ^SceKernelCondOptParam) -> sce.UID ---

    /**
    * Waits for a signal of a condition variable
    *
    * @param condId - The condition variable id returned from ::sceKernelCreateCond
    * @param timeout - Timeout in microseconds (assumed)
    * @return < 0 On error.
    */
    sceKernelWaitCond :: proc(condId: sce.UID, timeout: ^c.uint) -> c.int ---

    /**
    * Waits for a signal of a condition variable (with callbacks)
    *
    * @param condId - The condition variable id returned from ::sceKernelCreateCond
    * @param timeout - Timeout in microseconds (assumed)
    * @return < 0 On error.
    */
    sceKernelWaitCondCB :: proc(condId: sce.UID, timeout: ^c.uint) -> c.int ---

    /**
    * Create an event flag.
    *
    * @param name - The name of the event flag.
    * @param attr - Attributes from ::SceEventFlagAttributes
    * @param bits - Initial bit pattern.
    * @param opt  - Options, set to NULL
    * @return < 0 on error. >= 0 event flag id.
    *
    * @par Example:
    * @code
    * int evid
    * evid = sceKernelCreateEventFlag("wait_event", 0, 0, NULL)
    * @endcode
    */
    sceKernelCreateEventFlag :: proc(name: cstring, attr: c.int, bits: c.int, opt: ^SceKernelEventFlagOptParam) -> sce.UID ---

    /**
    * Poll an event flag for a given bit pattern.
    *
    * @param evid - The event id returned by ::sceKernelCreateEventFlag.
    * @param bits - The bit pattern to poll for.
    * @param wait - Wait type, one or more of ::SceEventFlagWaitTypes or'ed together
    * @param outBits - The bit pattern that was matched.
    * @return < 0 On error
    */
    sceKernelPollEventFlag :: proc(evid: c.int, bits: c.uint, wait: c.uint, outBits: ^c.uint) -> c.int ---

    /**
    * Wait for an event flag for a given bit pattern.
    *
    * @param evid - The event id returned by ::sceKernelCreateEventFlag.
    * @param bits - The bit pattern to poll for.
    * @param wait - Wait type, one or more of ::SceEventFlagWaitTypes or'ed together
    * @param outBits - The bit pattern that was matched.
    * @param timeout  - Timeout in microseconds
    * @return < 0 On error
    */
    sceKernelWaitEventFlag :: proc(evid: c.int, bits: c.uint, wait: c.uint, outBits: ^c.uint, timeout: ^sce.UInt) -> c.int ---

    /**
    * Wait for an event flag for a given bit pattern with callback.
    *
    * @param evid - The event id returned by ::sceKernelCreateEventFlag.
    * @param bits - The bit pattern to poll for.
    * @param wait - Wait type, one or more of ::SceEventFlagWaitTypes or'ed together
    * @param outBits - The bit pattern that was matched.
    * @param timeout  - Timeout in microseconds
    * @return < 0 On error
    */
    sceKernelWaitEventFlagCB :: proc(evid: c.int, bits: c.uint, wait: c.uint, outBits: ^c.uint, timeout: ^sce.UInt) -> c.int ---

    /**
    * Get the status of an event flag.
    *
    * @param event - The UID of the event.
    * @param status - A pointer to a ::SceKernelEventFlagInfo structure.
    *
    * @return < 0 on error.
    */
    sceKernelGetEventFlagInfo :: proc(event: sce.UID, info: ^SceKernelEventFlagInfo) -> c.int ---

    sceKernelCreateLwCond :: proc(pWork: ^SceKernelLwCondWork, pName: cstring, attr: c.uint, pLwMutex: ^SceKernelLwMutexWork, pOptParam: ^SceKernelLwCondOptParam) -> c.int ---
    sceKernelDeleteLwCond :: proc(pWork: ^SceKernelLwCondWork) -> c.int ---
    sceKernelSignalLwCond :: proc(pWork: ^SceKernelLwCondWork) -> c.int ---
    sceKernelSignalLwCondAll :: proc(pWork: ^SceKernelLwCondWork) -> c.int ---
    sceKernelSignalLwCondTo :: proc(pWork: ^SceKernelLwCondWork, threadId: sce.UID) -> c.int ---
    sceKernelWaitLwCond :: proc(pWork: ^SceKernelLwCondWork, pTimeout: ^c.uint) -> c.int ---

    sceKernelCreateLwMutex :: proc(pWork: ^SceKernelLwMutexWork, pName: cstring, attr: c.uint, initCount: c.int, pOptParam: ^SceKernelLwMutexOptParam) -> c.int ---
    sceKernelDeleteLwMutex :: proc(pWork: ^SceKernelLwMutexWork) -> c.int ---
    sceKernelLockLwMutex :: proc(pWork: ^SceKernelLwMutexWork, lockCount: c.int, pTimeout: ^c.uint) -> c.int ---
    sceKernelTryLockLwMutex :: proc(pWork: ^SceKernelLwMutexWork, lockCount: c.int) -> c.int ---
    sceKernelUnlockLwMutex :: proc(pWork: ^SceKernelLwMutexWork, unlockCount: c.int) -> c.int ---

    /**
    * Create a message pipe
    *
    * @param name - Name of the pipe
    * @param type - The type of memory attribute to use internally (set to 0x40)
    * @param attr - Set to 12
    * @param bufSize - The size of the internal buffer in multiples of 0x1000 (4KB)
    * @param opt  - Message pipe options (set to NULL)
    *
    * @return The UID of the created pipe, < 0 on error
    */
    sceKernelCreateMsgPipe :: proc(name: cstring, type: c.int, attr: c.int, bufSize: c.uint, opt: rawptr) -> sce.UID ---

    /**
    * Send a message to a pipe
    *
    * @param uid - The UID of the pipe
    * @param message - Pointer to the message
    * @param size - Size of the message
    * @param unk1 - Unknown - async vs sync? use 0 for sync
    * @param unk2 - Unknown - use NULL
    * @param timeout - Timeout for send in us. use NULL to wait indefinitely
    *
    * @return 0 on success, < 0 on error
    */
    sceKernelSendMsgPipe :: proc(uid: sce.UID , message: rawptr, size: c.uint, unk1: c.int, unk2: rawptr, timeout: ^c.uint) -> c.int ---

    /**
    * Send a message to a pipe (with callback)
    *
    * @param uid - The UID of the pipe
    * @param message - Pointer to the message
    * @param size - Size of the message
    * @param unk1 - Unknown - async vs sync? use 0 for sync
    * @param unk2 - Unknown - use NULL
    * @param timeout - Timeout for send in us. use NULL to wait indefinitely
    *
    * @return 0 on success, < 0 on error
    */
    sceKernelSendMsgPipeCB :: proc(uid: sce.UID, message: rawptr, size: c.uint, unk1: c.int, unk2: rawptr, timeout: ^c.uint) -> c.int ---

    /**
    * Try to send a message to a pipe
    *
    * @param uid - The UID of the pipe
    * @param message - Pointer to the message
    * @param size - Size of the message
    * @param unk1 - Unknown - use 0
    * @param unk2 - Unknown - use NULL
    *
    * @return 0 on success, < 0 on error
    */
    sceKernelTrySendMsgPipe :: proc(uid: sce.UID, message: rawptr, size: sce.Size, unk1: c.int, unk2: rawptr) -> c.int ---

    /**
    * Receive a message from a pipe
    *
    * @param uid - The UID of the pipe
    * @param message - Pointer to the message
    * @param size - Size of the message
    * @param unk1 - Unknown - async vs sync? use 0 for sync
    * @param unk2 - Unknown - use NULL
    * @param timeout - Timeout for receive in us. use NULL to wait indefinitely
    *
    * @return 0 on success, < 0 on error
    */
    sceKernelReceiveMsgPipe :: proc(uid: sce.UID, message: rawptr, size: sce.Size, unk1: c.int, unk2: rawptr, timeout: ^c.uint) -> c.int ---

    /**
    * Receive a message from a pipe (with callback)
    *
    * @param uid - The UID of the pipe
    * @param message - Pointer to the message
    * @param size - Size of the message
    * @param unk1 - Unknown - async vs sync? use 0 for sync
    * @param unk2 - Unknown - use NULL
    * @param timeout - Timeout for receive in us. use NULL to wait indefinitely
    *
    * @return 0 on success, < 0 on error
    */
    sceKernelReceiveMsgPipeCB :: proc(uid: sce.UID, message: rawptr, size: sce.Size, unk1: c.int, unk2: rawptr, timeout: ^c.uint) -> c.int ---

    /**
    * Receive a message from a pipe
    *
    * @param uid - The UID of the pipe
    * @param message - Pointer to the message
    * @param size - Size of the message
    * @param unk1 - Unknown - use 0
    * @param unk2 - Unknown - use NULL
    *
    * @return 0 on success, < 0 on error
    */
    sceKernelTryReceiveMsgPipe :: proc(uid: sce.UID, message: rawptr, size: sce.Size, unk1: c.int, unk2: rawptr) -> c.int ---


    /**
    * Cancel a message pipe
    *
    * @param uid - UID of the pipe to cancel
    * @param psend - Receive number of sending threads, NULL is valid
    * @param precv - Receive number of receiving threads, NULL is valid
    *
    * @return 0 on success, < 0 on error
    */
    sceKernelCancelMsgPipe :: proc(uid: sce.UID, psend: ^c.int, precv: ^c.int) -> c.int ---

    /**
    * Get the status of a Message Pipe
    *
    * @param uid - The uid of the Message Pipe
    * @param info - Pointer to a ::SceKernelMppInfo structure
    *
    * @return 0 on success, < 0 on error
    */
    sceKernelGetMsgPipeInfo :: proc(uid: sce.UID, info: ^SceKernelMppInfo) -> c.int ---

    /**
    * Creates a new mutex
    *
    * @par Example:
    * @code
    * int mutexid
    * mutexid = sceKernelCreateMutex("MyMutex", 0, 1, NULL)
    * @endcode
    *
    * @param name - Specifies the name of the mutex
    * @param attr - Mutex attribute flags (normally set to 0)
    * @param initCount - Mutex initial value
    * @param option - Mutex options (normally set to 0)
    * @return A mutex id
    */
    sceKernelCreateMutex :: proc(name: cstring, attr: sce.UInt, initCount: c.int, option: ^SceKernelMutexOptParam) -> sce.UID ---

    /**
    * Lock a mutex
    *
    * @param mutexid - The mutex id returned from ::sceKernelCreateMutex
    * @param lockCount - The value to increment to the lock count of the mutex
    * @param timeout - Timeout in microseconds (assumed)
    * @return < 0 On error.
    */
    sceKernelLockMutex :: proc(mutexid: sce.UID, lockCount: c.int, timeout: ^c.uint) -> c.int ---

    /**
    * Lock a mutex and handle callbacks if necessary.
    *
    * @param mutexid - The mutex id returned from ::sceKernelCreateMutex
    * @param lockCount - The value to increment to the lock count of the mutex
    * @param timeout - Timeout in microseconds (assumed)
    * @return < 0 On error.
    */
    sceKernelLockMutexCB :: proc(mutexid: sce.UID, lockCount: c.int, timeout: ^c.uint) -> c.int ---

    /**
    * Cancels a mutex
    *
    * @param mutexid - The mutex id returned from ::sceKernelCreateMutex
    * @param newCount - The new lock count of the mutex
    * @param numWaitThreads - Number of threads waiting for the mutex
    * @return < 0 On error.
    */
    sceKernelCancelMutex :: proc(mutexid: sce.UID, newCount: c.int, numWaitThreads: ^c.int) -> c.int ---

    /**
    * Retrieve information about a mutex.
    *
    * @param mutexid - UID of the mutex to retrieve info for.
    * @param info - Pointer to a ::SceKernelMutexInfo struct to receive the info.
    *
    * @return < 0 on error.
    */
    sceKernelGetMutexInfo :: proc(mutexid: sce.UID, info: ^SceKernelMutexInfo) -> c.int ---

    /**
    * Creates a new rwlock
    *
    * @par Example:
    * @code
    * int rwlock_id
    * rwlock_id = sceKernelCreateRWLock("MyRWLock", 0, NULL)
    * @endcode
    *
    * @param name - Specifies the name of the rwlock
    * @param attr - RWLock attribute flags (normally set to 0)
    * @param option - RWLock options (normally set to NULL)
    * @return RWLock id on success, < 0 on error
    */
    sceKernelCreateRWLock :: proc(name: cstring, attr: sce.UInt32, opt_param: ^SceKernelRWLockOptParam) -> sce.UID ---

    /**
    * Lock a rwlock with read access
    *
    * @param rwlock_id - The rwlock id returned from ::sceKernelCreateRWLock
    * @param timeout - Timeout in microseconds, use NULL to disable it
    * @return 0 on success, < 0 on error
    */
    sceKernelLockReadRWLock :: proc(rwlock_id: sce.UID, timeout: ^c.uint) -> c.int ---

    /**
    * Lock a rwlock with write access
    *
    * @param rwlock_id - The rwlock id returned from ::sceKernelCreateRWLock
    * @param timeout - Timeout in microseconds, use NULL to disable it
    * @return 0 on success, < 0 on error
    */
    sceKernelLockWriteRWLock :: proc(rwlock_id: sce.UID, timeout: ^c.uint) -> c.int ---

    /**
    * Lock a rwlock with read access and handle callbacks
    *
    * @param rwlock_id - The rwlock id returned from ::sceKernelCreateRWLock
    * @param timeout - Timeout in microseconds, use NULL to disable it
    * @return 0 on success, < 0 on error
    */
    sceKernelLockReadRWLockCB :: proc(rwlock_id: sce.UID, timeout: ^c.uint) -> c.int ---

    /**
    * Lock a rwlock with write access and handle callbacks
    *
    * @param rwlock_id - The rwlock id returned from ::sceKernelCreateRWLock
    * @param timeout - Timeout in microseconds, use NULL to disable it
    * @return 0 on success, < 0 on error
    */
    sceKernelLockWriteRWLockCB :: proc(rwlock_id: sce.UID, timeout: ^c.uint) -> c.int ---

    /**
    * Retrieve information about a rwlock.
    *
    * @param rwlock_id - UID of the rwlock to retrieve info for.
    * @param info - Pointer to a ::SceKernelRWLockInfo struct to receive the info.
    *
    * @return 0 on success, < 0 on error
    */
    sceKernelGetRWLockInfo :: proc(rwlock_id: sce.UID, info: ^SceKernelRWLockInfo) -> c.int ---

    /**
    * Creates a new semaphore
    *
    * @par Example:
    * @code
    * int semaid
    * semaid = sceKernelCreateSema("MySema", 0, 1, 1, NULL)
    * @endcode
    *
    * @param name - Specifies the name of the sema
    * @param attr - Sema attribute flags (normally set to 0)
    * @param initVal - Sema initial value
    * @param maxVal - Sema maximum value
    * @param option - Sema options (normally set to 0)
    * @return A semaphore id
    */
    sceKernelCreateSema :: proc(name: cstring, attr: sce.UInt, initVal: c.int, maxVal: c.int, option: ^SceKernelSemaOptParam) -> sce.UID ---


    /**
    * Lock a semaphore
    *
    * @par Example:
    * @code
    * sceKernelWaitSema(semaid, 1, 0)
    * @endcode
    *
    * @param semaid - The sema id returned from ::sceKernelCreateSema
    * @param signal - The value to wait for (i.e. if 1 then wait till reaches a signal state of 1)
    * @param timeout - Timeout in microseconds (assumed).
    *
    * @return < 0 on error.
    */
    sceKernelWaitSema :: proc(semaid: sce.UID, signal: c.int, timeout: ^sce.UInt) -> c.int ---

    /**
    * Lock a semaphore and handle callbacks if necessary.
    *
    * @par Example:
    * @code
    * sceKernelWaitSemaCB(semaid, 1, 0)
    * @endcode
    *
    * @param semaid - The sema id returned from ::sceKernelCreateSema
    * @param signal - The value to wait for (i.e. if 1 then wait till reaches a signal state of 1)
    * @param timeout - Timeout in microseconds (assumed).
    *
    * @return < 0 on error.
    */
    sceKernelWaitSemaCB :: proc(semaid: sce.UID, signal: c.int, timeout: ^sce.UInt) -> c.int ---

    /**
    * Cancels a semaphore
    *
    * @param semaid - The sema id returned from ::sceKernelCreateSema
    * @param setCount - The new lock count of the semaphore
    * @param numWaitThreads - Number of threads waiting for the semaphore
    * @return < 0 On error.
    */
    sceKernelCancelSema :: proc(semaid: sce.UID, setCount: c.int, numWaitThreads: ^c.int) -> c.int ---

    /**
    * Retrieve information about a semaphore.
    *
    * @param semaid - UID of the semaphore to retrieve info for.
    * @param info - Pointer to a ::SceKernelSemaInfo struct to receive the info.
    *
    * @return < 0 on error.
    */
    sceKernelGetSemaInfo :: proc(semaid: sce.UID, info: ^SceKernelSemaInfo) -> c.int ---

    /**
    * @brief Sleep current thread and wait for a signal. After it receives a signal, the thread wakes up.
    *
    * This is like a semphore with limit 1.
    * If signal was sent before and not consumed before, the function will immediately return.
    * @param unk0 unknown parameter. 0 can be used.
    * @param delay the delay before wating for a signal
    * @param timeout the timeout if it's null, it waits indefinitely.
    * @return 0 on success
    */
    sceKernelWaitSignal :: proc(unk0: sce.UInt32, delay: sce.UInt32, timeout: ^sce.UInt32) -> c.int ---

    /**
    * Create a thread
    *
    * @par Example:
    * @code
    * SceUID thid
    * thid = sceKernelCreateThread("my_thread", threadFunc, 0x10000100, 0x10000, 0, 0, NULL)
    * @endcode
    *
    * @param name - An arbitrary thread name.
    * @param entry - The thread function to run when started.
    * @param initPriority - The initial priority of the thread. Less if higher priority.
    * @param stackSize - The size of the initial stack.
    * @param attr - The thread attributes, zero or more of ::SceThreadAttributes.
    * @param cpuAffinityMask - The CPU affinity mask
    *                          A thread can run only on the cores specified in the CPU affinity mask.
    *                          The CPU affinity mask can be specified by the logical sum of the following macros:
    *                          - SCE_KERNEL_CPU_MASK_USER_0
    *                          - SCE_KERNEL_CPU_MASK_USER_1
    *                          - SCE_KERNEL_CPU_MASK_USER_2
    *                          - SCE_KERNEL_CPU_MASK_SYSTEM (system-reserved core)
    *                          The following macro are also available to represent all available in userland CPU cores:
    *                          - SCE_KERNEL_CPU_MASK_USER_ALL
    *                          The following macro are also available to inherit affinity mask of the calling process:
    *                          - SCE_KERNEL_THREAD_CPU_AFFINITY_MASK_DEFAULT
    * @param option - Additional options specified by ::SceKernelThreadOptParam.

    * @return UID of the created thread, or an error code.
    */
    sceKernelCreateThread :: proc(name: cstring, entry: SceKernelThreadEntry, initPriority: c.int, stackSize: sce.Size, attr: sce.UInt, cpuAffinityMask: c.int, option: ^SceKernelThreadOptParam) -> sce.UID ---


    /**
    * Start a created thread
    *
    * @param thid - Thread id from ::sceKernelCreateThread
    * @param arglen - Length of the data pointed to by argp, in bytes
    * @param argp - Pointer to the arguments.
    */
    sceKernelStartThread :: proc(thid: sce.UID, arglen: sce.Size, argp: rawptr) -> c.int ---


    /**
    * Wait until a thread has ended.
    *
    * @param thid - Id of the thread to wait for.
    * @param stat - Exit status.
    * @param timeout - Timeout in microseconds (assumed).
    *
    * @return < 0 on error.
    */
    sceKernelWaitThreadEnd :: proc(thid: sce.UID, stat: ^c.int, timeout: ^sce.UInt) -> c.int ---

    /**
    * Wait until a thread has ended and handle callbacks if necessary.
    *
    * @param thid - Id of the thread to wait for.
    * @param stat - Exit status.
    * @param timeout - Timeout in microseconds (assumed).
    *
    * @return < 0 on error.
    */
    sceKernelWaitThreadEndCB :: proc(thid: sce.UID, stat: ^c.int, timeout: ^sce.UInt) -> c.int ---

    /**
    * Modify the attributes of the current thread.
    *
    * @param clearAttr - The thread attributes to clear.  One of ::SceThreadAttributes.
    * @param setAttr - The thread attributes to set.  One of ::SceThreadAttributes.
    *
    * @return < 0 on error.
    */
    sceKernelChangeCurrentThreadAttr :: proc(clearAttr: sce.UInt, setAttr: sce.UInt) -> c.int ---


    /**
    * Get the current priority of the thread you are in.
    *
    * @return The current thread priority
    */
    sceKernelGetThreadCurrentPriority :: proc() -> c.int ---

    /**
    * Get the exit status of a thread.
    *
    * @param[in]  thid   - The UID of the thread to check.
    * @param[out] status - Status out pointer
    * @return The exit status
    */
    sceKernelGetThreadExitStatus :: proc(thid: sce.UID, status: ^c.int) -> c.int ---

    /**
    * Check the thread stack?
    *
    * @return Unknown.
    */
    sceKernelCheckThreadStack :: proc() -> c.int ---


    /**
    * Get the status information for the specified thread.
    *
    * @param thid - Id of the thread to get status
    * @param info - Pointer to the info structure to receive the data.
    * Note: The structures size field should be set to
    * sizeof(SceKernelThreadInfo) before calling this function.
    *
    * @par Example:
    * @code
    * SceKernelThreadInfo status
    * status.size = sizeof(SceKernelThreadInfo)
    * if(sceKernelGetThreadInfo(thid, &status) == 0)
    * { Do something... }
    * @endcode
    * @return 0 if successful, otherwise the error code.
    */
    sceKernelGetThreadInfo :: proc(thid: sce.UID, info: ^SceKernelThreadInfo) -> c.int ---

    /**
    * Retrive the runtime status of a thread.
    *
    * @param thid - UID of the thread to retrieve status.
    * @param status - Pointer to a ::SceKernelThreadRunStatus struct to receive the runtime status.
    *
    * @return 0 if successful, otherwise the error code.
    */
    sceKernelGetThreadRunStatus :: proc(thid: sce.UID, status: ^SceKernelThreadRunStatus) -> c.int ---

    /**
    * Get the current thread Id
    *
    * @return The thread id of the calling thread.
    */
    sceKernelGetThreadId :: proc() -> c.int ---

    /**
    * Get the system information
    *
    * @param info - Pointer to a ::SceKernelSystemInfo structure
    *
    * @return 0 on success, < 0 on error
    */
    sceKernelGetSystemInfo :: proc(info: ^SceKernelSystemInfo) -> c.int ---

    /**
    * @brief sceKernelGetTLSAddr get pointer to TLS key area for current thread
    * @param key - the TLS keyslot index
    * @return pointer to TLS key value
    */
    sceKernelGetTLSAddr :: proc(key: c.int) -> rawptr ---

    sceKernelAtomicSet8 :: proc(store: ^sce.Int8, value: sce.Int8) ---
    sceKernelAtomicSet16 :: proc(store: sce.Int16, value: sce.Int16) ---
    sceKernelAtomicSet32 :: proc(store: sce.Int32, value: sce.Int32) ---
    sceKernelAtomicSet64 :: proc(store: sce.Int64, value: sce.Int64) ---

    sceKernelAtomicCompareAndSet8 :: proc(store: sce.Int8, value, SceInt8, new_value: sce.Int8) -> sce.Int8 ---
    sceKernelAtomicCompareAndSet16 :: proc(store: sce.Int16, value, SceInt16, new_value: sce.Int16) -> sce.Int16 ---
    sceKernelAtomicCompareAndSet32 :: proc(store: sce.Int32, value, SceInt32, new_value: sce.Int32) -> sce.Int32 ---
    sceKernelAtomicCompareAndSet64 :: proc(store: sce.Int64, value, SceInt64, new_value: sce.Int64) -> sce.Int64 ---


    sceKernelAtomicAddAndGet8 :: proc(store: sce.Int8, value: sce.Int8) -> sce.Int8 ---
    sceKernelAtomicAddAndGet16 :: proc(store: sce.Int16, value: sce.Int16) -> sce.Int16 ---
    sceKernelAtomicAddAndGet32 :: proc(store: sce.Int32, value: sce.Int32) -> sce.Int32 ---
    sceKernelAtomicAddAndGet64 :: proc(store: sce.Int64, value: sce.Int64) -> sce.Int64 ---

    sceKernelAtomicAddUnless8 :: proc(store: sce.Int8, value: sce.Int8, cmpv: sce.Int8) -> sce.Bool ---
    sceKernelAtomicAddUnless16 :: proc(store: sce.Int16, value: sce.Int16, cmpv: sce.Int16) -> sce.Bool ---
    sceKernelAtomicAddUnless32 :: proc(store: sce.Int32, value: sce.Int32, cmpv: sce.Int32) -> sce.Bool ---
    sceKernelAtomicAddUnless64 :: proc(store: sce.Int64, value: sce.Int64, cmpv: sce.Int64) -> sce.Bool ---

    sceKernelAtomicSubAndGet8 :: proc(store: sce.Int8, value: sce.Int8) -> sce.Int8 ---
    sceKernelAtomicSubAndGet16 :: proc(store: sce.Int16, value: sce.Int16) -> sce.Int16 ---
    sceKernelAtomicSubAndGet32 :: proc(store: sce.Int32, value: sce.Int32) -> sce.Int32 ---
    sceKernelAtomicSubAndGet64 :: proc(store: sce.Int64, value: sce.Int64) -> sce.Int64 ---

    sceKernelAtomicAndAndGet8 :: proc(store: sce.Int8, value: sce.Int8) -> sce.Int8 ---
    sceKernelAtomicAndAndGet16 :: proc(store: sce.Int16, value: sce.Int16) -> sce.Int16 ---
    sceKernelAtomicAndAndGet32 :: proc(store: sce.Int32, value: sce.Int32) -> sce.Int32 ---
    sceKernelAtomicAndAndGet64 :: proc(store: sce.Int64, value: sce.Int64) -> sce.Int64 ---

    sceKernelAtomicOrAndGet8 :: proc(store: sce.Int8, value: sce.Int8) -> sce.Int8 ---
    sceKernelAtomicOrAndGet16 :: proc(store: sce.Int16, value: sce.Int16) -> sce.Int16 ---
    sceKernelAtomicOrAndGet32 :: proc(store: sce.Int32, value: sce.Int32) -> sce.Int32 ---
    sceKernelAtomicOrAndGet64 :: proc(store: sce.Int64, value: sce.Int64) -> sce.Int64 ---

    sceKernelAtomicXorAndGet8 :: proc(store: sce.Int8, value: sce.Int8) -> sce.Int8 ---
    sceKernelAtomicXorAndGet16 :: proc(store: sce.Int16, value: sce.Int16) -> sce.Int16 ---
    sceKernelAtomicXorAndGet32 :: proc(store: sce.Int32, value: sce.Int32) -> sce.Int32 ---
    sceKernelAtomicXorAndGet64 :: proc(store: sce.Int64, value: sce.Int64) -> sce.Int64 ---

    sceKernelAtomicClearAndGet8 :: proc(store: sce.Int8, value: sce.Int8) -> sce.Int8 ---
    sceKernelAtomicClearAndGet16 :: proc(store: sce.Int16, value: sce.Int16) -> sce.Int16 ---
    sceKernelAtomicClearAndGet32 :: proc(store: sce.Int32, value: sce.Int32) -> sce.Int32 ---
    sceKernelAtomicClearAndGet64 :: proc(store: sce.Int64, value: sce.Int64) -> sce.Int64 ---


    sceKernelAtomicGetAndSet8 :: proc(store: sce.Int8, value: sce.Int8) -> sce.Int8 ---
    sceKernelAtomicGetAndSet16 :: proc(store: sce.Int16, value: sce.Int16) -> sce.Int16 ---
    sceKernelAtomicGetAndSet32 :: proc(store: sce.Int32, value: sce.Int32) -> sce.Int32 ---
    sceKernelAtomicGetAndSet64 :: proc(store: sce.Int64, value: sce.Int64) -> sce.Int64 ---

    sceKernelAtomicGetAndAdd8 :: proc(store: sce.Int8, value: sce.Int8) -> sce.Int8 ---
    sceKernelAtomicGetAndAdd16 :: proc(store: sce.Int16, value: sce.Int16) -> sce.Int16 ---
    sceKernelAtomicGetAndAdd32 :: proc(store: sce.Int32, value: sce.Int32) -> sce.Int32 ---
    sceKernelAtomicGetAndAdd64 :: proc(store: sce.Int64, value: sce.Int64) -> sce.Int64 ---

    sceKernelAtomicGetAndSub8 :: proc(store: sce.Int8, value: sce.Int8) -> sce.Int8 ---
    sceKernelAtomicGetAndSub16 :: proc(store: sce.Int16, value: sce.Int16) -> sce.Int16 ---
    sceKernelAtomicGetAndSub32 :: proc(store: sce.Int32, value: sce.Int32) -> sce.Int32 ---
    sceKernelAtomicGetAndSub64 :: proc(store: sce.Int64, value: sce.Int64) -> sce.Int64 ---

    sceKernelAtomicGetAndAnd8 :: proc(store: sce.Int8, value: sce.Int8) -> sce.Int8 ---
    sceKernelAtomicGetAndAnd16 :: proc(store: sce.Int16, value: sce.Int16) -> sce.Int16 ---
    sceKernelAtomicGetAndAnd32 :: proc(store: sce.Int32, value: sce.Int32) -> sce.Int32 ---
    sceKernelAtomicGetAndAnd64 :: proc(store: sce.Int64, value: sce.Int64) -> sce.Int64 ---

    sceKernelAtomicGetAndOr8 :: proc(store: sce.Int8, value: sce.Int8) -> sce.Int8 ---
    sceKernelAtomicGetAndOr16 :: proc(store: sce.Int16, value: sce.Int16) -> sce.Int16 ---
    sceKernelAtomicGetAndOr32 :: proc(store: sce.Int32, value: sce.Int32) -> sce.Int32 ---
    sceKernelAtomicGetAndOr64 :: proc(store: sce.Int64, value: sce.Int64) -> sce.Int64 ---

    sceKernelAtomicGetAndXor8 :: proc(store: sce.Int8, value: sce.Int8) -> sce.Int8 ---
    sceKernelAtomicGetAndXor16 :: proc(store: sce.Int16, value: sce.Int16) -> sce.Int16 ---
    sceKernelAtomicGetAndXor32 :: proc(store: sce.Int32, value: sce.Int32) -> sce.Int32 ---
    sceKernelAtomicGetAndXor64 :: proc(store: sce.Int64, value: sce.Int64) -> sce.Int64 ---

    sceKernelAtomicGetAndClear8 :: proc(store: sce.Int8, value: sce.Int8) -> sce.Int8 ---
    sceKernelAtomicGetAndClear16 :: proc(store: sce.Int16, value: sce.Int16) -> sce.Int16 ---
    sceKernelAtomicGetAndClear32 :: proc(store: sce.Int32, value: sce.Int32) -> sce.Int32 ---
    sceKernelAtomicGetAndClear64 :: proc(store: sce.Int64, value: sce.Int64) -> sce.Int64 ---


    sceKernelAtomicClearMask8 :: proc(store: sce.Int8, value: sce.Int8) ---
    sceKernelAtomicClearMask16 :: proc(store: sce.Int16, value: sce.Int16) ---
    sceKernelAtomicClearMask32 :: proc(store: sce.Int32, value: sce.Int32) ---
    sceKernelAtomicClearMask64 :: proc(store: sce.Int64, value: sce.Int64) ---

    sceKernelAtomicDecIfPositive8 :: proc(store: ^sce.Int8) -> sce.Int8 ---
    sceKernelAtomicDecIfPositive16 :: proc(store: ^sce.Int16) -> sce.Int16 ---
    sceKernelAtomicDecIfPositive32 :: proc(store: ^sce.Int32) -> sce.Int32 ---
    sceKernelAtomicDecIfPositive64 :: proc(store: ^sce.Int64) -> sce.Int64 ---


    sceKernelLoadModule :: proc(path: cstring, flags: c.int, option: ^SceKernelLMOption) -> sce.UID ---
    sceKernelUnloadModule :: proc(modid: sce.UID, flags: c.int, option: ^SceKernelULMOption) -> c.int ---

    sceKernelStartModule :: proc(modid: sce.UID, args: sce.Size, argp: rawptr, flags: c.int, option: rawptr, status: ^c.int) -> c.int ---
    sceKernelStopModule :: proc(modid: sce.UID, args: sce.Size, argp: rawptr, flags: c.int, option: rawptr, status: ^c.int) -> c.int ---

    sceKernelLoadStartModule :: proc(path: cstring, args: sce.Size, argp: rawptr, flags: c.int, option: ^SceKernelLMOption, status: ^c.int) -> sce.UID ---
    sceKernelStopUnloadModule :: proc(modid: sce.UID, args: sce.Size, argp: rawptr, flags: c.int, option: ^SceKernelULMOption, status: ^c.int) -> c.int ---

    /**
    * Exit current Process with specified return code
    *
    * @param[in] res - Exit code to return
    *
    * @return 0 on success, < 0 on error.
    */
    sceKernelExitProcess :: proc(res: c.int) -> c.int ---

    /**
    * Get the process time of the current process.
    *
    * @param[out] type - Pointer to a ::SceKernelSysClock structure which will receive the process time.
    *
    * @return 0 on success, < 0 on error.
    */
    sceKernelGetProcessTime :: proc(pSysClock: ^sce.KernelSysClock) -> c.int ---

    /**
    * Get the lower 32 bits part of process time of the current process.
    *
    * @return process time of the current process
    */
    sceKernelGetProcessTimeLow :: proc() -> sce.UInt32 ---

    /**
    * Get the process time of the current process.
    *
    * @return process time of the current process
    */
    sceKernelGetProcessTimeWide :: proc() -> sce.UInt64 ---

    sceKernelGetOpenPsId :: proc(id: ^SceKernelOpenPsId) -> c.int ---
}

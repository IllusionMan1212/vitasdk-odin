package kernel

import "core:c"
import sce "../common"

foreign import threadmgr "system:SceKernelThreadMgr_stub"

@(link_prefix = "sceKernel")
foreign threadmgr {
    /**
    * Create callback
    *
    * @par Example:
    * @code
    * int cbid
    * cbid = sceKernelCreateCallback("Exit Callback", 0, exit_cb, NULL)
    * @endcode
    *
    * @param name      - A textual name for the callback
    * @param attr      - ?
    * @param func      - A pointer to a function that will be called as the callback
    * @param userData  - User defined data to be passed to the callback.
    *
    * @return >= 0 A callback id which can be used in subsequent functions, < 0 an error.
    */
    CreateCallback :: proc(name: cstring, attr: c.uint, func: SceKernelCallbackFunction, userData: rawptr) -> c.int ---

    /**
    * Delete a callback
    *
    * @param cb - The UID of the specified callback
    *
    * @return 0 on success, < 0 on error
    */
    DeleteCallback :: proc(cb: sce.UID) -> c.int ---

    /**
    * Notify a callback
    *
    * @param cb - The UID of the specified callback
    * @param arg2 - Passed as arg2 into the callback function
    *
    * @return 0 on success, < 0 on error
    */
    NotifyCallback :: proc(cb: sce.UID, arg2: c.int) -> c.int ---

    /**
    * Cancel a callback ?
    *
    * @param cb - The UID of the specified callback
    *
    * @return 0 on success, < 0 on error
    */
    CancelCallback :: proc(cb: sce.UID) -> c.int ---

    /**
    * Get the callback count
    *
    * @param cb - The UID of the specified callback
    *
    * @return The callback count, < 0 on error
    */
    GetCallbackCount :: proc(cb: sce.UID) -> c.int ---

    /**
    * Check callback ?
    *
    * @return Something or another
    */
    CheckCallback :: proc() -> c.int ---

    /**
    * Destroy a condition variable
    *
    * @param condition variableid - The condition variable id returned from ::sceKernelCreateCond
    * @return Returns the value 0 if it's successful, otherwise -1
    */
    DeleteCond :: proc(condId: sce.UID) -> c.int ---

    /**
    * Open a condition variable
    *
    * @param name - The name of the condition variable to open
    * @return Returns the value 0 if it's successful, otherwise -1
    */
    OpenCond :: proc(name: cstring) -> c.int ---

    /**
    * Close a condition variable
    *
    * @param condition variableid - The condition variable id returned from ::sceKernelCreateCond
    * @return Returns the value 0 if it's successful, otherwise -1
    */
    CloseCond :: proc(condId: sce.UID) -> c.int ---

    /**
    * Signals a condition variable
    *
    * @param condId - The condition variable id returned from ::sceKernelCreateCond
    * @return < 0 On error.
    */
    SignalCond :: proc(condId: sce.UID) -> c.int ---

    /**
    * Signals a condition variable to all threads waiting for it
    *
    * @param condId - The condition variable id returned from ::sceKernelCreateCond
    * @return < 0 On error.
    */
    SignalCondAll :: proc(condId: sce.UID) -> c.int ---

    /**
    * Signals a condition variable to a specific thread waiting for it
    *
    * @param condId - The condition variable id returned from ::sceKernelCreateCond
    * @param threadId - The thread id returned from ::sceKernelCreateThread
    * @return < 0 On error.
    */
    SignalCondTo :: proc(condId: sce.UID, threadId: sce.UID) -> c.int ---

    /**
    * Set an event flag bit pattern.
    *
    * @param evid - The event id returned by ::sceKernelCreateEventFlag.
    * @param bits - The bit pattern to set.
    *
    * @return < 0 On error
    */
    SetEventFlag :: proc(evid: sce.UID, bits: c.uint) -> c.int ---

    /**
    * Clear a event flag bit pattern
    *
    * @param evid - The event id returned by ::sceKernelCreateEventFlag
    * @param bits - The bits to clean
    *
    * @return < 0 on Error
    */
    ClearEventFlag :: proc(evid: sce.UID, bits: c.uint) -> c.int ---

    /**
    * Delete an event flag
    *
    * @param evid - The event id returned by ::sceKernelCreateEventFlag.
    *
    * @return < 0 On error
    */
    DeleteEventFlag :: proc(evid: c.int) -> c.int ---

    /**
    * Delete a message pipe
    *
    * @param uid - The UID of the pipe
    *
    * @return 0 on success, < 0 on error
    */
    DeleteMsgPipe :: proc(uid: sce.UID) -> c.int ---

    /**
    * Destroy a mutex
    *
    * @param mutexid - The mutex id returned from ::sceKernelCreateMutex
    * @return Returns the value 0 if it's successful, otherwise -1
    */
    DeleteMutex :: proc(mutexid: sce.UID) -> c.int ---


    /**
    * Open a mutex
    *
    * @param name - The name of the mutex to open
    * @return Returns the value 0 if it's successful, otherwise -1
    */
    OpenMutex :: proc(name: cstring) -> c.int ---

    /**
    * Close a mutex
    *
    * @param mutexid - The mutex id returned from ::sceKernelCreateMutex
    * @return Returns the value 0 if it's successful, otherwise -1
    */
    CloseMutex :: proc(mutexid: sce.UID) -> c.int ---


    /**
    * Try to lock a mutex (non-blocking)
    *
    * @param mutexid - The mutex id returned from ::sceKernelCreateMutex
    * @param lockCount - The value to increment to the lock count of the mutex
    * @return < 0 On error.
    */
    TryLockMutex :: proc(mutexid: sce.UID, lockCount: c.int) -> c.int ---

    /**
    * Try to unlock a mutex (non-blocking)
    *
    * @param mutexid - The mutex id returned from ::sceKernelCreateMutex
    * @param unlockCount - The value to decrement to the lock count of the mutex
    * @return < 0 On error.
    */
    UnlockMutex :: proc(mutexid: sce.UID, unlockCount: c.int) -> c.int ---

    /**
    * Destroy a rwlock
    *
    * @param rwlock_id - The rwlock id returned from ::sceKernelCreateRWLock
    * @return 0 on success, < 0 on error
    */
    DeleteRWLock :: proc(rwlock_id: sce.UID) -> c.int ---

    /**
    * Open a rwlock
    *
    * @param name - The name of the rwlock to open
    * @return RWLock id on success, < 0 on error
    */
    OpenRWLock :: proc(name: cstring) -> sce.UID ---

    /**
    * Close a rwlock
    *
    * @param rwlock_id - The rwlock id returned from ::sceKernelCreateRWLock
    * @return 0 on success, < 0 on error
    */
    CloseRWLock :: proc(rwlock_id: sce.UID) -> c.int ---
    /**
    * Try to lock a rwlock with read access (non-blocking)
    *
    * @param rwlock_id - The rwlock id returned from ::sceKernelCreateRWLock
    * @return 0 on success, < 0 on error
    */
    TryLockReadRWLock :: proc(rwlock_id: sce.UID) -> c.int ---

    /**
    * Try to lock a rwlock with write access (non-blocking)
    *
    * @param rwlock_id - The rwlock id returned from ::sceKernelCreateRWLock
    * @return 0 on success, < 0 on error
    */
    TryLockWriteRWLock :: proc(rwlock_id: sce.UID) -> c.int ---

    /**
    * Try to unlock a rwlock with read access (non-blocking)
    *
    * @param rwlock_id - The rwlock id returned from ::sceKernelCreateRWLock
    * @return 0 on success, < 0 on error
    */
    UnlockReadRWLock :: proc(rwlock_id: sce.UID) -> c.int ---

    /**
    * Try to unlock a rwlock with write access (non-blocking)
    *
    * @param rwlock_id - The rwlock id returned from ::sceKernelCreateRWLock
    * @return 0 on success, < 0 on error
    */
    UnlockWriteRWLock :: proc(rwlock_id: sce.UID) -> c.int ---

    /**
    * Destroy a semaphore
    *
    * @param semaid - The semaid returned from a previous create call.
    * @return Returns the value 0 if it's successful, otherwise -1
    */
    DeleteSema :: proc(semaid: sce.UID) -> c.int ---

    /**
    * Send a signal to a semaphore
    *
    * @par Example:
    * @code
    * // Signal the sema
    * sceKernelSignalSema(semaid, 1)
    * @endcode
    *
    * @param semaid - The sema id returned from ::sceKernelCreateSema
    * @param signal - The amount to signal the sema (i.e. if 2 then increment the sema by 2)
    *
    * @return < 0 On error.
    */
    SignalSema :: proc(semaid: sce.UID, signal: c.int) -> c.int ---

    /**
    * Poll a semaphore.
    *
    * @param semaid - UID of the semaphore to poll.
    * @param signal - The value to test for.
    *
    * @return < 0 on error.
    */
    PollSema :: proc(semaid: sce.UID, signal: c.int) -> c.int ---

    OpenSema :: proc(name: cstring) -> sce.UID ---

    CloseSema :: proc(semaid: sce.UID) -> c.int ---

    /**
    * @brief Send a signal to the thread specified by thid. Note that it can send a signal to the current thread as well.
    *
    * @param thid - the id of the thread to send a signal to
    * @return 0 on success
    * @return SCE_KERNEL_ERROR_ALREADY_SENT if the last signal was not consumed by sceKernelWaitSignal
    */
    SendSignal :: proc(thid: sce.UID) -> c.int ---

    /**
    * Delate a thread
    *
    * @param thid - UID of the thread to be deleted.
    *
    * @return < 0 on error.
    */
    DeleteThread :: proc(thid: sce.UID) -> c.int ---


    /**
    * Exit a thread
    *
    * @param status - Exit status.
    */
    ExitThread :: proc(status: c.int) -> c.int ---


    /**
    * Exit a thread and delete itself.
    *
    * @param status - Exit status
    */
    ExitDeleteThread :: proc(status: c.int) -> c.int ---

    /**
    * Delay the current thread by a specified number of microseconds
    *
    * @param delay - Delay in microseconds.
    *
    * @par Example:
    * @code
    * sceKernelDelayThread(1000000) // Delay for a second
    * @endcode
    */
    DelayThread :: proc(delay: sce.UInt) -> c.int ---

    /**
    * Delay the current thread by a specified number of microseconds and handle any callbacks.
    *
    * @param delay - Delay in microseconds.
    *
    * @par Example:
    * @code
    * sceKernelDelayThread(1000000) // Delay for a second
    * @endcode
    */
    DelayThreadCB :: proc(delay: sce.UInt) -> c.int ---

    /**
    * Change the threads current priority.
    *
    * @param thid - The ID of the thread (from ::sceKernelCreateThread or ::sceKernelGetThreadId)
    * @param priority - The new priority (the lower the number the higher the priority)
    *
    * @par Example:
    * @code
    * int thid = sceKernelGetThreadId()
    * // Change priority of current thread to 16
    * sceKernelChangeThreadPriority(thid, 16)
    * @endcode
    *
    * @return 0 if successful, otherwise the error code.
    */
    ChangeThreadPriority :: proc(thid: sce.UID, priority: c.int) -> c.int ---


    /**
    * Get the free stack size for a thread.
    *
    * @param thid - The thread ID
    *
    * @return The free size.
    */
    GetThreadStackFreeSize :: proc(thid: sce.UID) -> c.int ---

    /**
    * Retrive the cpu affinity mask of a thread.
    *
    * @param thid - UID of the thread to retrieve affinity mask for.
    *
    * @return current affinity mask if >= 0, otherwise the error code.
    */
    GetThreadCpuAffinityMask :: proc(thid: sce.UID) -> c.int ---

    /**
    * Set the cpu affinity mask of a thread.
    *
    * @param thid - UID of the thread to retrieve affinity mask for.
    * @param mask - New cpu affinity mask.
    *
    * @return 0 if successful, otherwise the error code.
    */
    ChangeThreadCpuAffinityMask :: proc(thid: sce.UID, mask: c.int) -> c.int ---

    /**
    * Get the process ID of in the running thread.
    *
    * @return process ID of in the running thread
    */
    GetProcessId :: proc() -> sce.UID ---

    /**
    * Get the type of a Threadmgr uid
    *
    * @param uid - The uid to get the type from
    *
    * @return The type, < 0 on error
    */
    GetThreadmgrUIDClass :: proc(uid: sce.UID) -> SceKernelIdListType ---


    /**
    * @brief sceKernelGetThreadTLSAddr gets an address to a 4 bytes area of TLS memory for the specified thread
    * @param thid - The UID of the thread to access TLS
    * @param key - the TLS keyslot index
    * @return pointer to TLS memory
    */
    GetThreadTLSAddr :: proc(thid: sce.UID, key: c.int) -> rawptr ---


    /**
    * Get the system time (wide version)
    *
    * @return The system time
    */
    GetSystemTimeWide :: proc() -> sce.Int64 ---

}

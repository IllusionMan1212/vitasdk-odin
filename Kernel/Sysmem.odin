package kernel

import "core:c"
import sce "../common"

foreign import sysmem "system:SceSysmem_stub"

foreign sysmem {
    sceKernelGetCpuId :: proc() -> c.int ---

    /**
    * Allocates a new memory block
    *
    * @param[in] name - Name for the memory block
    * @param[in] type - Type of the memory to allocate. Use `SCE_KERNEL_MEMBLOCK_TYPE_USER_*`.
    * @param[in] size - Size of the memory to allocate
    * @param[in] opt  - Memory block options?
    *
    * @return SceUID of the memory block on success, < 0 on error.
    */
    sceKernelAllocMemBlock :: proc(name: cstring, type: SceKernelMemBlockType, size: sce.Size, opt: ^SceKernelAllocMemBlockOpt) -> sce.UID ---

    /**
    * Frees new memory block
    *
    * @param[in] uid - SceUID of the memory block to free
    *
    * @return 0 on success, < 0 on error.
    */
    sceKernelFreeMemBlock :: proc(uid: sce.UID) -> c.int ---

    /**
    * Gets the base address of a memory block
    *
    * @param[in]  uid  - SceUID of the memory block to free
    * @param[out] base - Base address of the memory block identified by SceUID
    *
    * @return 0 on success, < 0 on error.
    */
    sceKernelGetMemBlockBase :: proc(uid: sce.UID, base: ^rawptr) -> c.int ---

    sceKernelFindMemBlockByAddr :: proc(addr: rawptr, size: sce.Size) -> sce.UID ---

    sceKernelGetMemBlockInfoByAddr :: proc(base: rawptr, info: ^SceKernelMemBlockInfo) -> c.int ---
    sceKernelGetMemBlockInfoByRange :: proc(base: rawptr, size: sce.Size, info: ^SceKernelMemBlockInfo) -> c.int ---

    sceKernelAllocMemBlockForVM :: proc(name: cstring, size: sce.Size) -> sce.UID ---
    sceKernelSyncVMDomain :: proc(uid: sce.UID, data: rawptr, size: sce.Size) -> c.int ---
    sceKernelOpenVMDomain :: proc() -> c.int ---
    sceKernelCloseVMDomain :: proc() -> c.int ---

    sceKernelOpenMemBlock :: proc(name: cstring, flags: c.int) -> c.int ---
    sceKernelCloseMemBlock :: proc(uid: sce.UID) -> c.int ---

    /**
    * Get the model number of the device
    *
    * @return A value from SCE_KERNEL_MODEL
    */
    sceKernelGetModelForCDialog :: proc() -> c.int ---

    /**
    * Get the model number of the device
    *
    * @return A value from SCE_KERNEL_MODEL
    */
    sceKernelGetModel :: proc() -> c.int ---

    /**
    * Get free memory size in bytes
    *
    * @param[out] info - Returned free memory size for different kind of memory block types
    * @return 0 on success, < 0 on error.
    */
    sceKernelGetFreeMemorySize :: proc(info: ^SceKernelFreeMemorySizeInfo) -> c.int ---

    sceKernelIsPSVitaTV :: proc() -> c.int ---
}

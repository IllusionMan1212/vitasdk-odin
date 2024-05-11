package kernel

import "core:c"
import sce "../common"

foreign import sysmem "system:SceSysmem_stub"

@(link_prefix = "sceKernel")
foreign sysmem {
    GetCpuId :: proc() -> c.int ---

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
    AllocMemBlock :: proc(name: cstring, type: SceKernelMemBlockType, size: sce.Size, opt: ^SceKernelAllocMemBlockOpt) -> sce.UID ---

    /**
    * Frees new memory block
    *
    * @param[in] uid - SceUID of the memory block to free
    *
    * @return 0 on success, < 0 on error.
    */
    FreeMemBlock :: proc(uid: sce.UID) -> c.int ---

    /**
    * Gets the base address of a memory block
    *
    * @param[in]  uid  - SceUID of the memory block to free
    * @param[out] base - Base address of the memory block identified by SceUID
    *
    * @return 0 on success, < 0 on error.
    */
    GetMemBlockBase :: proc(uid: sce.UID, base: ^rawptr) -> c.int ---

    FindMemBlockByAddr :: proc(addr: rawptr, size: sce.Size) -> sce.UID ---

    GetMemBlockInfoByAddr :: proc(base: rawptr, info: ^SceKernelMemBlockInfo) -> c.int ---
    GetMemBlockInfoByRange :: proc(base: rawptr, size: sce.Size, info: ^SceKernelMemBlockInfo) -> c.int ---

    AllocMemBlockForVM :: proc(name: cstring, size: sce.Size) -> sce.UID ---
    SyncVMDomain :: proc(uid: sce.UID, data: rawptr, size: sce.Size) -> c.int ---
    OpenVMDomain :: proc() -> c.int ---
    CloseVMDomain :: proc() -> c.int ---

    OpenMemBlock :: proc(name: cstring, flags: c.int) -> c.int ---
    CloseMemBlock :: proc(uid: sce.UID) -> c.int ---

    /**
    * Get the model number of the device
    *
    * @return A value from SCE_KERNEL_MODEL
    */
    GetModelForCDialog :: proc() -> c.int ---

    /**
    * Get the model number of the device
    *
    * @return A value from SCE_KERNEL_MODEL
    */
    GetModel :: proc() -> c.int ---

    /**
    * Get free memory size in bytes
    *
    * @param[out] info - Returned free memory size for different kind of memory block types
    * @return 0 on success, < 0 on error.
    */
    GetFreeMemorySize :: proc(info: ^SceKernelFreeMemorySizeInfo) -> c.int ---

    IsPSVitaTV :: proc() -> c.int ---
}

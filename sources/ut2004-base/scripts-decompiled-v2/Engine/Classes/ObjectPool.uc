class ObjectPool extends Object
	transient
	native;

var array<Object> Objects;

// Export UObjectPool::execAllocateObject(FFrame&, void* const)
native final function Object AllocateObject(Class ObjectClass);

// Export UObjectPool::execFreeObject(FFrame&, void* const)
native final function FreeObject(Object obj);

// Export UObjectPool::execShrink(FFrame&, void* const)
native final function Shrink();


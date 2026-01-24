// SPDX-License-Identifier: MIT
pragma solidity >=0.4.0 <0.9.0;

/**
 * @title Storage vs Memory Demonstration
 * @dev Shows the difference between storage and memory data locations in Solidity
 * @notice Demonstrates how assignments behave differently based on data location
 * @notice Highlights the implications of working with reference vs value types
 */
contract demo {
    /**
     * @dev Storage array initialized with three student names
     * @notice Public visibility automatically creates a getter function
     * @notice Stored in contract storage (persists between transactions)
     * @notice Initialized with ["Alice", "Bob", "Charlie"]
     */
    string[] public student = ["Alice", "Bob", "Charlie"];

    /**
     * @dev Function demonstrating memory data location behavior
     * @notice Creates a copy of the storage array in memory
     * @notice Modifications to the memory copy don't affect storage
     * @dev Data Location: memory
     * - Creates an independent copy of the array
     * - Changes to s1 don't affect the original student array
     * - Memory arrays are temporary and exist only during execution
     * - More gas efficient for read operations but creates copies
     * @dev Use Case: When you need to work with array data without modifying storage
     */
    function hasMemory() public {
        // Creates a new array in memory that is a COPY of the storage array
        // This performs a full copy of all elements from storage to memory
        string[] memory s1 = student;

        // Modifies the first element of the memory copy
        // This change only affects s1, not the original student array
        s1[0] = "David";

        // After this function:
        // - s1 = ["David", "Bob", "Charlie"] (in memory, temporary)
        // - student remains ["Alice", "Bob", "Charlie"] (in storage, persistent)
    }

    /**
     * @dev Function demonstrating storage data location behavior
     * @notice Creates a reference to the storage array
     * @notice Modifications affect the original storage array
     * @dev Data Location: storage
     * - Creates a reference to the existing storage array
     * - Changes to s1 directly modify the original student array
     * - No copying overhead but modifies persistent storage
     * - More gas efficient for write operations but changes are permanent
     * @dev Use Case: When you need to modify the original storage array
     * @dev WARNING: Be careful as this modifies contract state directly
     */
    function hasStorage() public {
        // Creates a reference to the existing storage array
        // s1 is not a copy but points to the same storage location as student
        string[] storage s1 = student;

        // Modifies the first element of the storage array through the reference
        // This change affects the original student array
        s1[0] = "David";

        // After this function:
        // - s1 and student both = ["David", "Bob", "Charlie"] (in storage)
        // - The change is persistent and affects all future interactions
    }

    /**
     * @dev Function showing the current state of the student array
     * @return The current student array from storage
     * @notice Useful to verify the effects of hasMemory() vs hasStorage()
     */
    function getStudentArray() public view returns (string[] memory) {
        return student;
    }

    /**
     * @dev Function demonstrating memory vs storage with structs
     * @notice Shows how the same principles apply to complex types
     */
    struct Person {
        string name;
        uint256 age;
    }

    Person public person = Person("Alice", 25);

    function memoryVsStorageStruct() public {
        // Memory copy - independent
        Person memory pMem = person;
        pMem.name = "Bob";  // Doesn't affect storage

        // Storage reference - modifies original
        Person storage pStorage = person;
        pStorage.age = 30;  // Affects storage
    }

    /**
     * @dev Function showing gas costs of memory vs storage operations
     * @notice Memory operations are cheaper for reads but more expensive for copies
     * @notice Storage writes are expensive but necessary for persistence
     */
    function demonstrateGasCosts() public {
        // This creates a memory copy - higher initial gas cost for copying
        // but cheaper for subsequent modifications (though they're temporary)
        string[] memory memArray = student;

        // This creates a storage reference - cheaper to create
        // but modifications are more expensive as they affect storage
        string[] storage storageArray = student;
    }
}

/*
DATA LOCATIONS IN SOLIDITY:

1. Storage:
   - Persistent data that's written to the blockchain
   - Most expensive in terms of gas costs
   - Changes are permanent and affect contract state
   - Default location for state variables
   - Use for data that needs to persist between transactions

2. Memory:
   - Temporary data that exists only during function execution
   - Less expensive than storage for operations
   - Creating copies from storage has a gas cost
   - Default location for function arguments and local variables
   - Use for temporary calculations or when you need to work with copies

3. Stack:
   - Used for small, local variables (value types)
   - Not directly accessible in Solidity code
   - Managed automatically by the EVM

4. Calldata:
   - Special data location for function arguments
   - Read-only and doesn't persist after the call
   - Cheaper than memory for read operations
   - Use for input parameters that don't need to be modified

KEY DIFFERENCES BETWEEN STORAGE AND MEMORY:

1. Persistence:
   - Storage: Persists between transactions
   - Memory: Temporary, cleared after function execution

2. Gas Costs:
   - Storage reads: ~100 gas
   - Storage writes: ~20,000 gas
   - Memory allocation: Depends on size
   - Copying from storage to memory: ~700 gas per 32 bytes

3. Assignment Behavior:
   - Storage to memory: Creates a copy
   - Storage to storage: Creates a reference
   - Memory to memory: Creates a copy

4. Use Cases:
   - Use storage when you need to modify persistent state
   - Use memory when you need to work with temporary copies
   - Use calldata for function inputs that don't need modification

BEST PRACTICES:

1. Use memory for:
   - Temporary calculations
   - Working with copies of data
   - Function arguments that need modification
   - Return values

2. Use storage for:
   - State variables that need persistence
   - Data that needs to be modified and saved
   - Large data structures that would be expensive to copy

3. Be careful with storage references:
   - They modify the original data
   - Can lead to unexpected state changes
   - Always document when a function modifies storage

4. For complex operations:
   - Consider copying to memory first
   - Perform calculations in memory
   - Only write back to storage when needed
*/
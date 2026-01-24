// SPDX-License-Identifier: MIT
pragma solidity >=0.4.0 <0.9.0;

/**
 * @title Loop Structures in Solidity
 * @dev Demonstrates different loop constructs in Solidity
 * @notice Shows while, for, and do-while loops with array operations
 * @notice Highlights important considerations when using loops in smart contracts
 */
contract loops {
    /**
     * @dev Fixed-size array of 3 uint256 elements
     * @notice Public visibility automatically generates a getter function
     * @notice Initialized with default values [0, 0, 0]
     */
    uint256[3] public arr;

    /**
     * @dev Counter variable to track array position
     * @notice Used across multiple loop functions to demonstrate state persistence
     * @notice Initialized to 0
     */
    uint256 public count = 0;

    /**
     * @dev Demonstrates a while loop structure
     * @notice Fills the array with values following the pattern: 4, 10, 16
     * @notice Pattern: arr[count] = 2 * value, where value starts at 2 and increments by 3
     * @notice Stops when count reaches array length (3)
     * @dev WARNING: This function can only be called once completely
     *       as it modifies the count state variable
     * @dev Gas cost: ~50,000-75,000 (varies based on state changes)
     */
    function loop() public {
        // Initialize value for the sequence
        uint256 value = 2;

        // While loop continues as long as condition is true
        // Condition checked before each iteration
        while (count < arr.length) {
            // Set array element to 2 * current value
            // First iteration: 2*2=4, second: 2*5=10, third: 2*8=16
            arr[count] = 2 * value;

            // Update value for next iteration (increments by 3)
            value = value + 3;  // or: value += 3;

            // Move to next array position
            count = count + 1;  // or: count++;
        }
    }

    /**
     * @dev Demonstrates a for loop structure
     * @notice Attempts to fill array positions starting from count
     * @dev BUG: This contains a logical error - it always writes to arr[count]
     * @dev CORRECT BEHAVIOR: Should use the loop index 'i' instead of 'count'
     * @dev Gas cost: ~25,000-50,000 (varies based on iterations)
     */
    function forloop() public {
        // For loop with initialization, condition, and increment
        // Structure: for (initialization; condition; increment)
        for (uint256 i = count; i < arr.length; i++) {
            // BUG: Should be arr[i] = i; instead of arr[count] = count;
            arr[count] = count;

            // Note: This will write to the same position repeatedly
            // and won't increment count, leading to infinite loop risk
        }
    }

    /**
     * @dev Corrected version of the for loop
     * @notice Properly fills array positions from count to end
     * @notice Each position gets its index as value
     */
    function fixedForLoop() public {
        for (uint256 i = count; i < arr.length; i++) {
            arr[i] = i;  // Correct: use loop index
            count = i + 1;  // Update count to track progress
        }
    }

    /**
     * @dev Demonstrates a do-while loop structure
     * @notice Fills array positions starting from count
     * @notice Each position gets its index as value
     * @notice Guaranteed to execute at least once
     * @dev Gas cost: ~25,000-50,000 (varies based on iterations)
     */
    function dowhile() public {
        // Do-while loop executes at least once before checking condition
        do {
            // Set current array position to its index value
            arr[count] = count;

            // Move to next position
            count++;
        }
        // Condition checked after each iteration
        while (count < arr.length);
    }

    /**
     * @dev Gets the length of the array
     * @return The fixed length of the array (always 3)
     * @notice View function - no gas cost when called externally
     */
    function getLength() public view returns (uint256) {
        return arr.length;
    }

    /**
     * @dev Gets the entire array
     * @return A copy of the array in memory
     * @notice Returns the current state of all array elements
     * @notice For large arrays, this could consume significant gas
     */
    function getArray() public view returns (uint256[3] memory) {
        return arr;
    }

    /**
     * @dev Resets the count and array to initial state
     * @notice Allows re-running the loop demonstrations
     * @notice Useful for testing the contract multiple times
     */
    function reset() public {
        count = 0;
        arr = [0, 0, 0];
    }

    /**
     * @dev Gets the current count value
     * @return The current value of count
     * @notice Shows progress through the array
     */
    function getCount() public view returns (uint256) {
        return count;
    }

    /**
     * @dev Demonstrates a safe for loop with bounds checking
     * @param startIndex The index to start from
     * @param endIndex The index to end at (exclusive)
     * @notice Shows proper bounds checking to prevent out-of-bounds access
     */
    function safeForLoop(uint256 startIndex, uint256 endIndex) public {
        require(endIndex <= arr.length, "End index out of bounds");
        require(startIndex < endIndex, "Start must be less than end");

        for (uint256 i = startIndex; i < endIndex; i++) {
            arr[i] = i * 2;
        }
    }
}
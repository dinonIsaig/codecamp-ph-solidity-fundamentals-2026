// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

/**
 * @title Array Demonstration Contract
 * @dev Shows how to work with fixed-size arrays in Solidity
 * @notice Arrays are data structures that store multiple values of the same type
 * @notice This contract demonstrates a fixed-size array with basic operations
 */
contract arrays {
    /**
     * @dev Fixed-size array declaration with initialization
     * @notice Arrays can be declared with a fixed size that must be known at compile time
     * @notice This array can store exactly 4 uint256 values
     * @notice The array is public, so Solidity automatically generates a getter function
     * @notice Initialized with values [10, 20, 30, 40] for indices 0, 1, 2, 3 respectively
     * @dev IMPORTANT: Accessing indices outside 0-3 will cause a runtime error
     */
    uint256[4] public arr = [10, 20, 30, 40];

    /**
     * @dev Function to update a value in the array at a specific index
     * @param index The position in the array to update (0 to 3)
     * @param value The new value to store at the specified index
     * @notice This demonstrates how to modify array elements
     * @dev WARNING: This function doesn't check bounds - accessing invalid indices will cause errors
     * @dev In production code, you should add require(index < arr.length, "Index out of bounds")
     */
    function setter(uint256 index, uint256 value) public {
        // Update the array at the specified index with the new value
        arr[index] = value;

        // Alternative syntax that would also work:
        // arr[index] = value;
    }

    /**
     * @dev Function to get the length of the array
     * @return The length of the array (always 4 for this fixed-size array)
     * @notice Demonstrates accessing the length property of an array
     * @notice For fixed-size arrays, length is constant and known at compile time
     */
    function length() public view returns (uint256) {
        return arr.length;
    }

    /**
     * @dev Function to read a value from the array at a specific index
     * @param index The position in the array to read (0 to 3)
     * @return The value stored at the specified index
     * @notice Demonstrates how to access array elements
     * @dev WARNING: No bounds checking - will revert if index is out of bounds
     */
    function getValue(uint256 index) public view returns (uint256) {
        return arr[index];
    }

    /**
     * @dev Function to get all values in the array
     * @return The complete array
     * @notice Demonstrates returning an entire array
     * @notice For large arrays, this could consume significant gas
     */
    function getAllValues() public view returns (uint256[4] memory) {
        return arr;
    }

    /**
     * @dev Function to demonstrate array bounds checking
     * @param index The position in the array to check
     * @return true if the index is valid, false otherwise
     * @notice Shows how to properly check array bounds before access
     */
    function isValidIndex(uint256 index) public pure returns (bool) {
        return index < 4; // Since our array has length 4
    }

    /**
     * @dev Function to demonstrate safe array access with bounds checking
     * @param index The position in the array to access
     * @return The value at the specified index
     * @notice Shows proper bounds checking before array access
     * @dev This is the recommended way to access arrays in production code
     */
    function safeGetValue(uint256 index) public view returns (uint256) {
        require(index < arr.length, "Index out of bounds");
        return arr[index];
    }

    /**
     * @dev Function to demonstrate safe array update with bounds checking
     * @param index The position in the array to update
     * @param value The new value to store
     * @notice Shows proper bounds checking before array modification
     */
    function safeSetter(uint256 index, uint256 value) public {
        require(index < arr.length, "Index out of bounds");
        arr[index] = value;
    }

    /**
     * @dev Function to get the sum of all array elements
     * @return The sum of all values in the array
     * @notice Demonstrates iterating through an array
     */
    function getSum() public view returns (uint256) {
        uint256 total = 0;
        for (uint256 i = 0; i < arr.length; i++) {
            total += arr[i];
        }
        return total;
    }
}

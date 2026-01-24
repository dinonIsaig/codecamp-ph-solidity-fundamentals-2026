// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

/**
 * @title Dynamic Array Demonstration
 * @dev Shows how to work with dynamically-sized arrays in Solidity
 * @notice Dynamic arrays can grow and shrink in size at runtime
 * @notice Unlike fixed-size arrays, their length is not determined at compile time
 * @notice Useful when the number of elements is unknown or variable
 */
contract arrays {
    /**
     * @dev Dynamic array declaration
     * @notice No size specified in the declaration (contrasts with fixed-size arrays like uint256[4])
     * @notice Public visibility automatically generates a getter function
     * @notice Initially empty (length = 0)
     * @notice Stored in storage, so modifications persist between transactions
     */
    uint256[] public arr;

    /**
     * @dev Adds an element to the end of the array
     * @param item The uint256 value to add to the array
     * @notice Uses the push() method which appends to the end and increases length by 1
     * @notice Time complexity: O(1) for single element (amortized, as storage may need to be extended)
     * @notice Gas cost increases with array size due to storage expansion costs
     */
    function pushElement(uint256 item) public {
        // Append the item to the end of the array
        // This is equivalent to: arr[arr.length] = item;
        arr.push(item);
    }

    /**
     * @dev Gets the current length of the array
     * @return The number of elements in the array
     * @notice For dynamic arrays, length can change with each push/pop operation
     * @notice View function - doesn't modify contract state, no gas cost when called externally
     */
    function length() public view returns (uint256) {
        return arr.length;
    }

    /**
     * @dev Removes the last element from the array
     * @notice Uses the pop() method which removes the last element and decreases length by 1
     * @notice Time complexity: O(1)
     * @notice Reverts if called on an empty array
     * @notice Doesn't return the removed value (use printPopElement() if you need the value)
     */
    function popElement() public {
        // Remove the last element from the array
        // Reverts with "Array accessed at an out-of-bounds or negative index" if array is empty
        arr.pop();
    }

    /**
     * @dev Removes and returns the last element from the array
     * @return The value that was removed from the end of the array
     * @notice Combines the functionality of peek (get last element) and pop
     * @notice More gas efficient than calling length() and arr[length-1] separately
     * @notice Reverts if called on an empty array
     * @dev IMPORTANT: Contains a potential reentrancy-like issue if used improperly
     *       (though not actual reentrancy since it's not calling external contracts)
     */
    function printPopElement() public returns (uint256) {
        // Get current length (will be length+1 after we pop)
        uint256 len = arr.length;

        // Get the last element's value
        // Uses array access with index (len - 1)
        uint256 val = arr[len - 1];

        // Remove the last element
        // This modifies the array's length
        arr.pop();

        // Return the value that was removed
        return val;
    }

    /**
     * @dev Gets an element at a specific index
     * @param index The position of the element to retrieve (0-based)
     * @return The value at the specified index
     * @notice Demonstrates array element access
     * @notice Reverts if index is out of bounds (>= arr.length)
     */
    function getElement(uint256 index) public view returns (uint256) {
        return arr[index];
    }

    /**
     * @dev Updates an element at a specific index
     * @param index The position of the element to update (0-based)
     * @param value The new value to store at the specified index
     * @notice Demonstrates modifying array elements
     * @notice Reverts if index is out of bounds (>= arr.length)
     */
    function setElement(uint256 index, uint256 value) public {
        arr[index] = value;
    }

    /**
     * @dev Removes all elements from the array
     * @notice Sets the array length to 0, effectively clearing it
     * @notice More gas efficient than popping all elements individually
     * @notice Storage slots are not actually cleared (just marked as unused)
     */
    function clearArray() public {
        delete arr;
        // Alternative approach that also works:
        // arr.length = 0;
    }

    /**
     * @dev Gets the entire array
     * @return The complete array
     * @notice Returns a copy of the current array
     * @notice For large arrays, this can consume significant gas
     * @notice The returned array is in memory, not storage
     */
    function getAllElements() public view returns (uint256[] memory) {
        return arr;
    }

    /**
     * @dev Checks if the array is empty
     * @return true if the array has no elements, false otherwise
     * @notice More readable than checking if length == 0
     */
    function isEmpty() public view returns (bool) {
        return arr.length == 0;
    }

    /**
     * @dev Gets the sum of all elements in the array
     * @return The sum of all values in the array
     * @notice Demonstrates iterating through a dynamic array
     * @notice Gas cost grows with array size (O(n) complexity)
     * @notice Could hit block gas limit for very large arrays
     */
    function getSum() public view returns (uint256) {
        uint256 total = 0;
        for (uint256 i = 0; i < arr.length; i++) {
            total += arr[i];
        }
        return total;
    }
}

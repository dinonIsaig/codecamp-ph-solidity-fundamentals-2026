// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

/**
 * @title Dynamic Byte Array Demonstration
 * @dev Shows how to work with dynamic byte arrays and fixed-size byte arrays in Solidity
 * @notice Demonstrates the differences between bytes (dynamic) and bytesN (fixed-size) types
 */
contract DynamicByteArray {
    /**
     * @dev Dynamic array of bytes arrays
     * @notice This is an array where each element is itself a dynamic bytes array
     * @notice Can store any number of bytes arrays, each of variable length
     * @notice Example use case: storing multiple variable-length byte sequences
     */
    bytes[] public arr1;

    /**
     * @dev Fixed-size bytes array initialized with 'abc'
     * @notice bytes is a dynamic byte array (similar to byte[] in other languages)
     * @notice Unlike bytes1-bytes32, its size can vary and individual bytes can be modified
     * @notice Initialized with 'abc' which becomes [0x61, 0x62, 0x63] in hex
     */
    bytes public b1 = 'abc';

    /**
     * @dev Attempts to push an element to the fixed-size bytes array
     * @notice THIS FUNCTION WILL FAIL because bytes doesn't have a push() method
     * @notice bytes is a dynamic array itself, not an array type that supports push()
     * @dev CORRECTION: To append to b1, we need to use concatenation or array operations
     * @dev The correct approach would be to create a new bytes array with the added element
     */
    // This function contains an error - bytes doesn't have push() method
    /*
    function pushElement() public {
        b1.push('k'); // This will fail - bytes doesn't have push() method
    }
    */

    /**
     * @dev Correct implementation to append to a bytes array
     * @param newByte The byte to append to b1
     * @notice Creates a new bytes array that combines the existing b1 with the new byte
     */
    function appendToBytes(bytes1 newByte) public {
        // Create a new bytes array that is one byte longer than b1
        bytes memory newB1 = new bytes(b1.length + 1);

        // Copy all existing bytes from b1 to newB1
        for (uint i = 0; i < b1.length; i++) {
            newB1[i] = b1[i];
        }

        // Add the new byte at the end
        newB1[newB1.length - 1] = newByte;

        // Update the storage variable
        b1 = newB1;
    }

    /**
     * @dev Gets an element from the bytes array at a specific index
     * @param index The position of the byte to retrieve (0-based)
     * @return The byte at the specified index
     * @notice Demonstrates accessing individual bytes in a bytes array
     * @notice Reverts if index is out of bounds (>= b1.length)
     */
    function getElement(uint index) public view returns (bytes1) {
        require(index < b1.length, "Index out of bounds");
        return b1[index];
    }

    /**
     * @dev Gets the length of the bytes array
     * @return The number of bytes in b1
     * @notice Shows how to get the current length of a dynamic bytes array
     */
    function getLength() public view returns (uint) {
        return b1.length;
    }

    /**
     * @dev Adds a new bytes array to the dynamic array of bytes arrays
     * @param newBytes The bytes array to add to arr1
     * @notice Demonstrates using the dynamic array (arr1) of bytes arrays
     */
    function pushToDynamicArray(bytes memory newBytes) public {
        arr1.push(newBytes);
    }

    /**
     * @dev Gets an element from the dynamic array of bytes arrays
     * @param index The position in arr1 to access
     * @return The bytes array at the specified index
     * @notice Shows how to access elements in the bytes[] array
     */
    function getFromDynamicArray(uint index) public view returns (bytes memory) {
        require(index < arr1.length, "Index out of bounds");
        return arr1[index];
    }

    /**
     * @dev Gets the length of the dynamic array of bytes arrays
     * @return The number of bytes arrays stored in arr1
     */
    function getDynamicArrayLength() public view returns (uint) {
        return arr1.length;
    }

    /**
     * @dev Clears the bytes array (sets it to empty)
     * @notice Demonstrates how to reset a bytes array
     */
    function clearBytes() public {
        delete b1;
    }

    /**
     * @dev Clears the dynamic array of bytes arrays
     * @notice Demonstrates how to reset a bytes[] array
     */
    function clearDynamicArray() public {
        delete arr1;
    }

    /**
     * @dev Converts the bytes array to a string
     * @return The string representation of b1
     * @notice Shows how to interpret bytes as a string
     * @notice Only works correctly for UTF-8 encoded text bytes
     */
    function toString() public view returns (string memory) {
        return string(b1);
    }
}
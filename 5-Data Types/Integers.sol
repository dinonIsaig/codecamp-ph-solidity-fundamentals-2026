// SPDX-License-Identifier: MIT
pragma solidity >=0.4.0 <0.9.0;

/**
 * @title Integer Types Demo
 * @dev Demonstrates the use of integer types in Solidity
 * @notice Solidity provides both signed and unsigned integers in various sizes
 * @notice Integer types are value types that can hold integer values of different sizes
 */
contract integertype {
    /**
     * @dev Unsigned integer (uint256)
     * @notice Can hold values from 0 to 2^256-1
     * @notice uint256 is the default when using just 'uint'
     * @notice Unsigned integers can only represent non-negative values
     */
    uint256 a; // unsigned integer (uint8 to uint256 in steps of 8)

    /**
     * @dev Signed integer (int256)
     * @notice Can hold values from -2^255 to 2^255-1
     * @notice int256 is the default when using just 'int'
     * @notice Signed integers can represent both positive and negative values
     */
    int256 b; // signed integer (int8 to int256 in steps of 8)

    /*
     * INTEGER TYPE RANGES:
     *
     * Unsigned Integers (uint):
     * uint8:   0 to 255 (2^8 - 1)
     * uint16:  0 to 65,535 (2^16 - 1)
     * uint32:  0 to 4,294,967,295 (2^32 - 1)
     * ...
     * uint256: 0 to 2^256 - 1 (a very large number)
     *
     * Signed Integers (int):
     * int8:   -128 to 127 (-2^7 to 2^7 - 1)
     * int16:  -32,768 to 32,767 (-2^15 to 2^15 - 1)
     * int32:  -2,147,483,648 to 2,147,483,647 (-2^31 to 2^31 - 1)
     * ...
     * int256: -2^255 to 2^255 - 1
     *
     * @dev Note: Since Solidity 0.8.0, arithmetic operations revert on underflow/overflow
     * @dev In previous versions, these operations would wrap around
     */

    /**
     * @dev Signed 256-bit integer initialized to 127
     * @notice This value fits well within the range of int256
     */
    int256 count = 127; // Defaults to int256, value well within range

    /**
     * @dev Signed 16-bit integer initialized to -1233
     * @notice This demonstrates a smaller signed integer type
     * @notice int16 range: -32,768 to 32,767
     * @dev WARNING: -1233 is within int16 range, but values outside this range would cause compilation errors
     */
    int16 count2 = -1233;

    /**
     * @dev Signed 32-bit integer initialized to -123456
     * @notice This demonstrates a medium-sized signed integer type
     * @notice int32 range: -2,147,483,648 to 2,147,483,647
     */
    int32 count3 = -123456;

    /**
     * @dev Unsigned 256-bit integer initialized to 23
     * @notice This is the default uint type when size isn't specified
     * @notice uint256 range: 0 to 2^256-1
     */
    uint256 num = 23; // Defaults to uint256

    /**
     * @dev Unsigned 8-bit integer initialized to 255
     * @notice This is the maximum value for uint8 (2^8 - 1)
     * @notice uint8 range: 0 to 255
     */
    uint8 num2 = 255; // Maximum value for uint8

    /**
     * @dev Unsigned 16-bit integer initialized to 26456
     * @notice This demonstrates a medium-sized unsigned integer type
     * @notice uint16 range: 0 to 65,535
     * @dev WARNING: 26456 is within uint16 range, but values above 65,535 would cause compilation errors
     */
    uint16 num3 = 26456;

    /**
     * @dev Function to demonstrate integer operations
     * @param x First integer value
     * @param y Second integer value
     * @return The sum of x and y
     * @notice Shows basic arithmetic with integers
     * @notice In Solidity 0.8.0+, this will revert on overflow
     */
    function add(uint256 x, uint256 y) public pure returns (uint256) {
        return x + y;
    }

    /**
     * @dev Function to demonstrate integer comparison
     * @param a First value to compare
     * @param b Second value to compare
     * @return true if a is greater than b, false otherwise
     */
    function isGreater(uint256 a, uint256 b) public pure returns (bool) {
        return a > b;
    }

    /**
     * @dev Function to show type conversion between integer sizes
     * @param largeNumber A uint256 value
     * @return The value converted to uint8 (will truncate if too large)
     * @notice Demonstrates explicit type conversion
     * @notice WARNING: Values larger than 255 will be truncated
     */
    function convertToUint8(uint256 largeNumber) public pure returns (uint8) {
        return uint8(largeNumber);
    }

    /**
     * @dev Function to demonstrate safe math with require
     * @param a First value
     * @param b Second value
     * @return The sum of a and b
     * @notice Shows manual overflow check (though Solidity 0.8.0+ does this automatically)
     */
    function safeAdd(uint256 a, uint256 b) public pure returns (uint256) {
        require(a + b >= a, "Integer overflow detected");
        return a + b;
    }
}

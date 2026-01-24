// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;  // Allows any 0.8.x version (0.8.18 or newer, but not 0.9.0)

/**
 * @title Integer Overflow Demonstration
 * @dev Shows how Solidity 0.8.0+ handles integer overflow
 * @notice This contract demonstrates the built-in overflow protection in modern Solidity
 * @notice In versions before 0.8.0, this would silently wrap around (255 + 1 = 0)
 * @notice In 0.8.0+, this will revert with an overflow error
 */
contract overflow {
    /**
     * @dev Unsigned 8-bit integer initialized to maximum value (255)
     * @notice uint8 can hold values from 0 to 255 (2^8 - 1)
     * @notice We initialize to 255 to demonstrate overflow on increment
     */
    uint8 public money = 255; // Maximum value for uint8

    /**
     * @dev Function that attempts to increment money by 1
     * @notice This will cause an overflow since money is already at max value (255)
     * @notice In Solidity 0.8.0+, this transaction will revert with:
     *         "Arithmetic operation underflowed or overflowed outside of unchecked block"
     * @dev IMPORTANT: In production code, you should handle this case gracefully
     *       or use SafeMath library for more control over error messages
     */
    function setter() public {
        // This line will cause an overflow and revert the transaction
        // because 255 + 1 = 256 which exceeds uint8's maximum value of 255
        money = money + 1;

        // Alternative syntax that would also overflow:
        // money += 1;
        // money++;
    }

    /**
     * @dev Function that demonstrates safe increment with require check
     * @notice This shows how to manually prevent overflow
     * @notice Even though Solidity 0.8.0+ has built-in overflow protection,
     *         explicit checks can provide better error messages
     */
    function safeSetter() public {
        require(money < 255, "Overflow: Cannot increment beyond maximum uint8 value");
        money = money + 1;
    }

    /**
     * @dev Function that demonstrates using unchecked block to allow overflow
     * @notice Shows how to bypass Solidity's built-in overflow protection
     * @notice WARNING: This is unsafe and should only be used when absolutely necessary
     * @notice In this case, money would wrap around to 0 (255 + 1 = 0)
     * @return The new value after potential overflow
     */
    function uncheckedSetter() public returns (uint8) {
        unchecked {
            // This will wrap around without reverting
            // 255 + 1 = 0 due to 8-bit overflow
            money = money + 1;
        }
        return money;
    }

    /**
     * @dev Function to reset the value to maximum
     * @notice Useful for testing the overflow behavior multiple times
     */
    function resetToMax() public {
        money = 255;
    }

    /**
     * @dev Function to demonstrate underflow protection
     * @notice Shows that Solidity also protects against underflow
     * @notice This will revert if called when money = 0
     */
    function decrement() public {
        money = money - 1;
    }

    /**
     * @dev Function to get the current value
     * @return The current value of money
     */
    function getMoney() public view returns (uint8) {
        return money;
    }
}
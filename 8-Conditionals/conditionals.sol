// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

/**
 * @title Conditional Statements in Solidity
 * @dev Demonstrates if-else conditional logic in Solidity
 * @notice Shows how to implement decision making based on input values
 * @notice Uses signed integers to demonstrate comparison with zero
 */
contract conditionals {
    /**
     * @dev Checks the value of an integer and returns a descriptive string
     * @param a The integer value to check
     * @return A string describing whether the input is positive, negative, or zero
     * @notice Pure function - doesn't read or modify contract state
     * @notice Demonstrates if-else-if-else conditional structure
     * @notice Uses signed integer (int) to allow negative values
     *
     * @dev Gas cost: ~200-500 (very low, as it's a pure function with simple logic)
     * @dev Note: String operations in Solidity can be expensive in terms of deployment cost
     *       but have low runtime cost for pure functions
     *
     * @dev Comparison behavior:
     * - a > 0: positive numbers
     * - a < 0: negative numbers
     * - a == 0: zero
     */
    function check(int256 a) public pure returns(string memory) {
        // Declare a memory string variable to store the result
        // memory location is required for reference types in functions
        string memory value;

        // Check if the input is greater than zero
        if (a > 0) {
            // For positive numbers
            value = "Greater than zero";
        }
        // Check if the input is less than zero
        else if(a < 0) {
            // For negative numbers
            value = "Smaller than zero";
        }
        // Default case when neither of the above conditions are met
        else {
            // For zero
            value = "Equal to zero";
        }

        // Return the determined string value
        return value;
    }

    /**
     * @dev Alternative implementation using ternary operators
     * @param a The integer value to check
     * @return A string describing whether the input is positive, negative, or zero
     * @notice Shows how the same logic can be implemented more concisely
     */
    function checkTernary(int256 a) public pure returns(string memory) {
        // Using nested ternary operators for concise conditional logic
        return a > 0 ? "Greater than zero" :
               a < 0 ? "Smaller than zero" :
               "Equal to zero";
    }

    /**
     * @dev Checks if a number is even or odd
     * @param a The integer value to check
     * @return A string indicating whether the input is even or odd
     * @notice Demonstrates modulo operation for parity checking
     */
    function checkEvenOdd(int256 a) public pure returns(string memory) {
        return a % 2 == 0 ? "Even number" : "Odd number";
    }

    /**
     * @dev Checks the range of a number
     * @param a The integer value to check
     * @return A string describing which range the number falls into
     * @notice Demonstrates multiple conditions with logical operators
     */
    function checkRange(int256 a) public pure returns(string memory) {
        if (a < -100) {
            return "Very negative (less than -100)";
        } else if (a < 0) {
            return "Negative (between -100 and 0)";
        } else if (a == 0) {
            return "Zero";
        } else if (a < 100) {
            return "Positive (between 0 and 100)";
        } else {
            return "Very positive (100 or greater)";
        }
    }

    /**
     * @dev Demonstrates boolean conditions
     * @param condition The boolean value to check
     * @return A string describing the boolean value
     * @notice Shows simple if-else with boolean values
     */
    function checkBoolean(bool condition) public pure returns(string memory) {
        if (condition) {
            return "Condition is true";
        } else {
            return "Condition is false";
        }
    }

    /**
     * @dev Checks if a number is within a specific range
     * @param a The number to check
     * @param lower The lower bound of the range
     * @param upper The upper bound of the range
     * @return true if the number is within the range (inclusive), false otherwise
     * @notice Demonstrates compound conditions with logical AND
     */
    function isInRange(int256 a, int256 lower, int256 upper) public pure returns(bool) {
        require(lower <= upper, "Invalid range: lower bound must be <= upper bound");
        return a >= lower && a <= upper;
    }
}
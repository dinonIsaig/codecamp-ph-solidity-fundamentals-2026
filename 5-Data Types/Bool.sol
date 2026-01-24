// SPDX-License-Identifier: MIT
// This contract demonstrates boolean type usage in Solidity
// Boolean values can only be either 'true' or 'false'

pragma solidity >=0.5.0 <0.9.0;

/**
 * @title BoolType Contract
 * @dev This contract shows how to work with boolean values in Solidity
 * @notice Demonstrates boolean state variables and conditional logic
 */
contract booltype {
    // State variable 'value' initialized to true
    // Public visibility means Solidity automatically creates a getter function
    bool public value = true;

    // Second boolean state variable initialized to false
    bool public val2 = false;

    /**
     * @dev Function to check if input value is greater than 100
     * @param a The uint256 value to check against 100
     * @return Returns true if a > 100, false otherwise
     */
    function check(uint256 a) public returns (bool) {
        // Conditional statement to evaluate the input
        if (a > 100) {
            // Set value to true if input is greater than 100
            value = true;
        } else {
            // Set value to false if input is 100 or less
            value = false;
        }
        // Return the current value of the state variable
        return value;
    }

    /**
     * @dev Function to toggle the value between true and false
     * @notice This shows how to flip a boolean value
     */
    function toggleValue() public {
        // Using logical NOT operator to toggle the boolean
        value = !value;
    }

    /**
     * @dev Function to check if both boolean values are true
     * @return Returns true only if both value and val2 are true
     */
    function areBothTrue() public view returns (bool) {
        // Using logical AND operator
        return value && val2;
    }

    /**
     * @dev Function to check if at least one boolean value is true
     * @return Returns true if either value or val2 is true
     */
    function isEitherTrue() public view returns (bool) {
        // Using logical OR operator
        return value || val2;
    }
}

// SPDX-License-Identifier: MIT
pragma solidity >=0.4.0 <0.9.0;

/**
 * @title Enum Demo Contract
 * @dev Demonstrates the use of enums in Solidity
 * @notice Enums are a way to create user-defined data types with a fixed set of named constants
 * @notice They improve code readability by using meaningful names instead of numeric values
 */
contract enumDemo {
    /**
     * @dev First enum definition representing user status
     * @notice Enums are zero-indexed by default (allowed=0, not_allowed=1, wait=2)
     * @notice The values are automatically assigned incrementing integers starting from 0
     */
    enum user { allowed, not_allowed, wait }

    /**
     * @dev Second enum definition representing clothing sizes
     * @notice Shows that enums can have more than 3 values
     * @notice Values: S=0, M=1, L=2, XL=3, XXL=4
     */
    enum size { S, M, L, XL, XXL }

    // State variables using the enum types
    // Default values are set using the enum syntax: EnumName.ValueName

    /** @dev User status set to allowed (value 0) */
    user public u1 = user.allowed;

    /** @dev User status set to not_allowed (value 1) */
    user public u2 = user.not_allowed;

    /** @dev User status set to wait (value 2) */
    user public u3 = user.wait;

    /** @dev Lottery amount in wei */
    uint public lottery = 3000;

    /**
     * @dev Function to check owner status and potentially release lottery funds
     * @notice This demonstrates how to use enums in conditional logic
     * @notice If u1 is 'allowed', the lottery amount is set to 0 (released)
     */
    function owner() public {
        // Check if u1 is set to the 'allowed' enum value
        if (u1 == user.allowed) {
            lottery = 0;
            // The lottery amount is given to the user if allowed
            // In a real contract, you would transfer funds here
        }
        // Implicit else: do nothing if user is not allowed
    }

    /**
     * @dev Function to change the owner status to not_allowed
     * @notice This shows how to update an enum state variable
     */
    function changeOwner() public {
        // Update the u1 state variable to 'not_allowed'
        u1 = user.not_allowed;
    }

    /**
     * @dev Function to get the current user status as a string
     * @return A string representation of the current user status
     * @notice This demonstrates how to work with enum values in a more user-friendly way
     */
    function getUserStatus() public view returns (string memory) {
        if (u1 == user.allowed) {
            return "Allowed";
        } else if (u1 == user.not_allowed) {
            return "Not Allowed";
        } else {
            return "Wait";
        }
    }

    /**
     * @dev Function to set a new user status
     * @param newStatus The new status to set (0=allowed, 1=not_allowed, 2=wait)
     * @notice Shows how to pass enum values as parameters
     */
    function setUserStatus(uint newStatus) public {
        // In a production contract, you would add validation here
        // to ensure newStatus is a valid enum value (0, 1, or 2)
        u1 = user(newStatus);
    }

    /**
     * @dev Function to get the current size
     * @return The current size enum value
     * @notice Demonstrates returning an enum value
     */
    function getDefaultSize() public pure returns (size) {
        // Return the first size (S) as default
        return size.S;
    }
}
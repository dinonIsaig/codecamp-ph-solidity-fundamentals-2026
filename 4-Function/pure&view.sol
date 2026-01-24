// SPDX-License-Identifier: MIT
// Using a specific compiler version for consistency and security
pragma solidity ^0.8.0;

contract Local {
    // State variable stored in contract storage (persists on blockchain)
    uint public age = 10;

    // VIEW FUNCTION: Can read state but cannot modify it
    // - No gas cost when called externally (read-only)
    function get() public view returns (uint) {
        return age;  // Reads the state variable 'age'
    }

    // FIXED: Removed 'pure' (invalid here) and replaced with 'view'
    // This function reads state, so it must be 'view', not 'pure'
    function getter() public view returns (uint) {
        return age;  // Reads the state variable 'age'
    }

    // PURE FUNCTION: Cannot read OR modify state
    // - Only works with local variables or function arguments
    // - No gas cost when called externally
    function newGetter() public pure returns (uint) {
        uint marks = 100;  // Local variable (exists only during execution)
        return marks;      // Returns local variable
    }

    // NEW: Example showing state modification (neither view nor pure)
    function setAge(uint _newAge) public {
        age = _newAge;  // Modifies state - cannot be view/pure
    }
}
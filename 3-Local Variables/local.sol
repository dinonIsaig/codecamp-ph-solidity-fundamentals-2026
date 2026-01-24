// SPDX-License-Identifier: GPL-3.0
// Specifies the Solidity compiler version (modern version for security/gas optimizations)
pragma solidity ^0.8.0;

contract Local {
    // State variable: Stored permanently in contract storage (costs gas)
    string public myName;  // Renamed to camelCase (convention)

    // Function marked `pure` (does not read/modify state)
    // Returns a `uint` (age) stored in memory (not on-chain)
    function store() pure public returns (uint) {
        // Local variable: Stored in memory (stack) during execution.
        // - Does NOT persist on the blockchain.
        // - No gas cost for storage (unlike state variables).
        uint age = 40;

        // `string memory name`: Explicitly stored in memory (not storage).
        // - Required for dynamic types like `string` in functions.
        // - Automatically cleared after function execution.
        string memory name = "Khushi";

        // NOTE: `name` is unused here. If you want to return it, change the function signature.
        return age;
    }

    // NEW: Function to demonstrate local vs. state variables
    function updateName(string memory _newName) public {
        // Updates the state variable `myName` (persists on-chain)
        myName = _newName;
    }
}
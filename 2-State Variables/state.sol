// SPDX-License-Identifier: GPL-3.0
// Declares the Solidity compiler version.
// Using ^0.8.0 for modern features (overflow checks, gas optimizations)
pragma solidity ^0.8.0;

contract State {
    // --- STATE VARIABLES ---
    // `public` automatically generates a getter function (e.g., `age()`).
    // `uint` is an unsigned integer (default: 0).
    uint public age;

    // FIX: `name` should be a `string` (not `uint`) to store textual data.
    // If you meant to store a numeric ID, rename it (e.g., `uint public userId;`).
    string public name;  // Changed from `uint` to `string`

    // --- CONSTRUCTOR ---
    // Runs once during deployment. Initializes `age` and `name`.
    constructor() {
        age = 10;
        name = "DefaultName";  // Initialize with a default value
    }

    // --- FUNCTIONS ---
    // Increments `age` by 1 and returns the new value.
    // Added `returns(uint)` to match the function signature.
    function setAge() public returns (uint) {
        age += 1;  // Shorthand for `age = age + 1`
        return age;  // Explicitly return the updated age
    }

    // NEW: Function to update `name` (since it’s now a `string`).
    function setName(string memory _newName) public {
        name = _newName;
    }
}
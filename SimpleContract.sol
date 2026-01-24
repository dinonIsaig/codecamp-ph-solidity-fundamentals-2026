// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;  // Using exact version

contract SimpleContract {
    uint public count;

    // Constructor without default parameter (works in all versions)
    constructor(uint _initialCount) {
        count = _initialCount;
    }

    function updateCount(uint _newValue) public {
        count = _newValue;
    }

    // Helper function to set default value
    function setDefault() public {
        count = 10;
    }
}

// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract SimpleStorage {
    uint public storedValue;

    constructor(uint _initialValue) {
        storedValue = _initialValue;
    }

    function set(uint _newValue) public {
        storedValue = _newValue;
    }

    function setDefault() public {
        storedValue = 10;
    }
}
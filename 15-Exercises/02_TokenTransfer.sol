// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TokenTransfer {
    // TODO 1: Create a mapping to store token balances
    mapping(address => uint256) public balances;

    // TODO 2: Create an owner variable to store the contract deployer
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    // TODO 3: Only owner can mint, increase balances[to] by amount
    function mint(address to, uint256 amount) public {
        // require only owner
        // balances[to] += amount;
    }

    // TODO 4: Write a standard transfer function
    // Check sufficient balance → deduct from sender → add to receiver
    function transfer(address to, uint256 amount) public {
        // code here
    }
}
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract SimpleBank {
    // TODO 1: Create a mapping to store the balance of each address
    // mapping(address => ?) public balances;
    address public immutable owner;

    constructor() payable {
        owner = msg.sender;
    }

    // TODO 2: Write a deposit function, require msg.value > 0
    function deposit() external payable {
        // code here
    }

    // TODO 3: Write a function to view a person's balance
    function balanceOf(address user) external view returns (uint256) {
        // return ...
    }

    // TODO 4: Write a function to withdraw all of your money
    // Hint: get amount = balances[msg.sender] → set to 0 → transfer
    function withdraw() external {
        // code here
    }

    // TODO 5: Write a function to view the total money in the contract
    function contractBalance() external view returns (uint256) {
        // return ...
    }
}
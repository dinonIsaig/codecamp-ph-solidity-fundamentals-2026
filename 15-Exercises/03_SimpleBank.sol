// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract SimpleBank {
    // TODO 1: Create a mapping to store the balance of each address
    // We map an address (user) to a uint256 (amount of Wei they own)
    mapping(address => uint256) public balances;
    
    address public immutable owner;

    constructor() payable {
        owner = msg.sender;
    }

    // TODO 2: Write a deposit function, require msg.value > 0
    function deposit() external payable {
        // "require" checks a condition; if false, it reverts the transaction
        require(msg.value > 0, "Deposit amount must be greater than 0");
        
        // Add the sent Ether (msg.value) to the sender's balance in our mapping
        balances[msg.sender] += msg.value;
    }

    // TODO 3: Write a function to view a person's balance
    function balanceOf(address user) external view returns (uint256) {
        return balances[user];
    }

    // TODO 4: Write a function to withdraw all of your money
    function withdraw() external {
        // 1. Get the amount the user currently has
        uint256 amount = balances[msg.sender];
        require(amount > 0, "No funds to withdraw");

        // 2. Set balance to 0 BEFORE sending money (prevents Re-entrancy attacks)
        balances[msg.sender] = 0;

        // 3. Send the Ether back to the user
        // We use "call" because it is currently the safest way to send Ether
        (bool success, ) = payable(msg.sender).call{value: amount}("");
        require(success, "Transfer failed");
    }

    // TODO 5: Write a function to view the total money in the contract
    // This shows how much Ether is locked inside this smart contract in total
    function contractBalance() external view returns (uint256) {
        return address(this).balance;
    }
}
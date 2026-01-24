// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract SimpleToken {
    string public name;
    string public symbol;
    uint8 public decimals = 18;
    uint256 public totalSupply;

    // TODO 1: mapping balanceOf and allowance (2-dimensional)

    // TODO 2: event Transfer and Approval

    constructor(string memory _name, string memory _symbol, uint256 _totalSupply) {
        name = _name;
        symbol = _symbol;
        // TODO 3: totalSupply = _totalSupply * 10**decimals
        // Assign all to msg.sender and emit Transfer from address(0)
    }

    // TODO 4: standard transfer function (with require + emit)

    // TODO 5: approve function (update allowance + emit Approval)

    // TODO 6: transferFrom function
    // Check balance of from and allowance → deduct both → transfer money → emit Transfer
}
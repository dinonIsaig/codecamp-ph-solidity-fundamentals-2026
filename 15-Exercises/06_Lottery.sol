// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract Lottery {
    address public owner;
    uint public ticketPrice;
    uint public lotteryEndTime;
    address[] public players;

    constructor(uint _ticketPrice, uint _durationInSeconds) {
        owner = msg.sender;
        ticketPrice = _ticketPrice;
        lotteryEndTime = block.timestamp + _durationInSeconds;
    }

    // TODO 1: modifier onlyOwner and lotteryActive

    // TODO 2: function buyTicket() payable, only runs when time remaining
    // Check msg.value equals ticketPrice → push msg.sender into players

    // TODO 3: function getPlayers() view returns entire array

    // TODO 4: function pickWinner() only callable by owner, only after time expired
    // Random select index = keccak256(block.prevrandao, block.timestamp, players.length) % players.length
    // Call payWinner function for the winner and clear the players array

    function payWinner(address winner) internal {
        payable(winner).transfer(address(this).balance);
    }
}
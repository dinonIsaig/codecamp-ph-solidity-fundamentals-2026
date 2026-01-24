// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Election {
    // TODO 1: struct Candidate with id, name, voteCount

    // TODO 2: mapping(uint => Candidate) public candidates
    // mapping(address => bool) public voters
    // uint public candidatesCount and totalVotes
    // address public admin (assign in constructor)

    // TODO 3: event CandidateAdded and VoteCast

    // TODO 4: modifier onlyAdmin

    // TODO 5: function addCandidate(string memory _name) only callable by admin
    // Increase candidatesCount, save new candidate, emit event

    // TODO 6: function vote(uint _candidateId)
    // Check hasn't voted, valid id → mark as voted → increase voteCount → emit

    // TODO 7: function getCandidate returns name and voteCount

    // TODO 8: function getWinner() returns 2 arrays: names and vote counts of all winners (can be a tie)
    // Hint: find max vote first → count number of people with max → create array → fill

    // TODO 9: function getAllCandidates()
    // Return the entire Candidate[] list
    // Hint:
    // - Create a new array with size candidatesCount
    // - Loop from 1 → candidatesCount
    // - Assign each candidate to the array
    // - return this array
}
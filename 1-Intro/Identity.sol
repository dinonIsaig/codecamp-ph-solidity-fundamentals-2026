// SPDX-License-Identifier: GPL-3.0
// Tells the world this code is licensed under GPL-3.0 (open-source, copyleft)

pragma solidity ^0.8.0;
// Specifies the Solidity compiler version.
// ^0.8.0 means "compatible with 0.8.0 or higher, but not 0.9.0+"

// Define the contract named "Identity"
contract Identity {
    // --- STATE VARIABLES ---
    // `owner`: Stores the address of the contract deployer (immutable = cannot change after deployment)
    address public immutable owner;

    // `name`: Publicly accessible string (can be read by anyone)
    string public name;

    // `age`: Publicly accessible unsigned integer (uint)
    uint public age;

    // --- EVENTS ---
    // Emitted when `name` is changed. Helps with off-chain tracking (e.g., frontend updates)
    event NameChanged(string oldName, string newName);

    // Emitted when `age` is changed
    event AgeChanged(uint oldAge, uint newAge);

    // --- MODIFIERS ---
    // `onlyOwner`: A reusable access control modifier.
    // Restricts functions to only be callable by the `owner`.
    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner"); // Reverts if caller ≠ owner
        _; // Executes the function body if the check passes
    }

    // --- CONSTRUCTOR ---
    // Runs **once** when the contract is deployed.
    // Initializes `owner`, `name`, and `age` with input values.
    constructor(string memory _name, uint _age) {
        owner = msg.sender; // Sets `owner` to the deployer's address
        name = _name;        // Sets initial `name`
        age = _age;          // Sets initial `age`
    }

    // --- VIEW FUNCTIONS (Read-Only) ---
    // Returns the current `name`. `public view` means:
    // - `public`: Can be called externally.
    // - `view`: Does not modify contract state (no gas cost if called externally).
    function getName() public view returns (string memory) {
        return name;
    }

    // Returns the current `age`
    function getAge() public view returns (uint) {
        return age;
    }

    // --- STATE-CHANGING FUNCTIONS ---
    // Updates `name` to `_newName`. Restricted to `onlyOwner`.
    // Emits `NameChanged` event for transparency.
    function setName(string memory _newName) public onlyOwner {
        emit NameChanged(name, _newName); // Logs the change
        name = _newName;                   // Updates the state
    }

    // Updates `age` to `_newAge`. Restricted to `onlyOwner`.
    // Emits `AgeChanged` event for transparency.
    function setAge(uint _newAge) public onlyOwner {
        emit AgeChanged(age, _newAge); // Logs the change
        age = _newAge;                 // Updates the state
    }
}

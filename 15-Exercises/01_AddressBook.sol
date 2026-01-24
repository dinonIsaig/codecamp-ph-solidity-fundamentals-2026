// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AddressBook {

    // TODO 1: Create a struct Entry consisting of:
    //  - aliasName: alias name
    //  - contact: address or contact information
    struct Entry {
        string aliasName;
        string contact;
    }

    // TODO 2: Create a mapping such that:
    //  Each user (msg.sender) has their own list of Entries
    mapping(address => Entry[]) private userEntries;

    // TODO 3: Write function addEntry(aliasName, contact)
    //  - Add a new Entry to msg.sender's list
    //  - Use push to add the element
    function addEntry(string memory aliasName, string memory contact) public {
        // code here
    }

    // TODO 4: Write function getEntries()
    //  - Return the entire Entry list of msg.sender
    //  - This is a view function
    function getEntries() public view returns (Entry[] memory) {
        // code here
    }

    // TODO 5: Write function findByAlias(aliasName)
    //  - Iterate through msg.sender's entire list
    //  - Compare alias using keccak256(bytes(...))
    //  - If found → return the corresponding Entry
    //  - If NOT found → return Entry("", "")
    function findByAlias(string memory aliasName)
        public
        view
        returns (Entry memory)
    {
        // code here
    }

    // TODO 6: Write function removeByAlias(aliasName)
    //  - Iterate through userEntries[msg.sender] list
    //  - When the alias to be deleted is found, use the "swap-and-pop" technique:
    //      + overwrite the element to be deleted with the last element
    //      + pop() to remove the last element
    //  - Exit the loop after deletion
    function removeByAlias(string memory aliasName) public {
        // code here
    }
}
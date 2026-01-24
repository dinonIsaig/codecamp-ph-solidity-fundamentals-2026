# Solidity Storage Locations

Solidity, a programming language for writing smart contracts on the Ethereum blockchain, provides six different storage locations for storing data. Understanding these storage locations is crucial for efficient and secure contract development. Let's explore each of them:

## 1. Stack

The stack is used to store local variables and function arguments during execution. It is limited in size and is cleared after the function execution completes. Here's an example:

```solidity
function add(uint a, uint b) public pure returns (uint) {
    uint result = a + b; // stored in the stack
    return result;
}
```

## 2. Memory

Memory is used to store temporary variables and arrays. It is larger than the stack and is cleared after the function execution completes. Here's an example:

```solidity
function concatenate(string memory a, string memory b) public pure returns (string memory) {
    string memory result = string(abi.encodePacked(a, b)); // stored in memory
    return result;
}
```

## 3. Storage

Storage is used to store persistent contract data. It is the most expensive storage location and is stored on the blockchain. Here's an example:

```solidity
contract MyContract {
    uint public myNumber; // stored in storage

    function setNumber(uint number) public {
        myNumber = number; // stored in storage
    }
}
```

## 4. Calldata

Calldata is used to store function arguments when calling external functions. It is read-only and cannot be modified. Here's an example:

```solidity
contract MyContract {
    function getData(uint[] calldata numbers) public pure returns (uint) {
        uint sum = 0;
        for (uint i = 0; i < numbers.length; i++) {
            sum += numbers[i]; // accessing calldata
        }
        return sum;
    }
}
```

---

## Code Overview (This Folder)

- `Storage_Memory.sol` compares `memory` (copy) vs `storage` (reference) for arrays.

## Files

- `Storage_Memory.sol`

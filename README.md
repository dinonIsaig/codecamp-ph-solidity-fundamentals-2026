# Solidity Smart Contract Learning Repository


## Highlights

### Introduction to Solidity

Learn the fundamentals of Solidity, including how to set up your development environment and write your first smart contract.

```solidity
pragma solidity ^0.8.0;

contract HelloWorld {
    string public greet = "Hello, World!";
}
```

### Data Types and Variables

Understand different data types and how to declare variables in Solidity.

```solidity
contract DataTypes {
    uint public myUint = 1;
    string public myString = "Hello";
    address public myAddress = msg.sender;
}
```

### Functions and Modifiers

Explore how to define functions, use function modifiers, and understand their significance.

```solidity
contract Functions {
    uint public myNumber;

    function setNumber(uint _number) public {
        myNumber = _number;
    }

    function getNumber() public view returns (uint) {
        return myNumber;
    }
}
```

### Inheritance and Interfaces

Dive into contract inheritance and interface implementation to create more modular and reusable code.

```solidity
contract Parent {
    function sayHello() public pure returns (string memory) {
        return "Hello from Parent";
    }
}

contract Child is Parent {
    function greet() public pure returns (string memory) {
        return sayHello();
    }
}
```

## Setup and Run in Remix

Remix is a browser-based IDE, so there is nothing to install to compile or run these contracts.

### What you need

- A modern web browser (Chrome, Firefox, or Edge).
- Optional: MetaMask if you want to deploy to a testnet. For local testing, Remix VM is enough.

### Steps

1. Open Remix: https://remix.ethereum.org
2. Create a workspace:
   - Use **File explorers > Workspaces > Create** and name it (e.g., `solidity-basics`).
3. Add the contracts:
   - Drag and drop the folder(s) from this repo into the Remix file explorer, or
   - Copy the `.sol` files into matching folders in Remix.
4. Compile:
   - Open the **Solidity Compiler** tab.
   - Set the compiler version that matches the `pragma` in the file.
   - Click **Compile**.
5. Deploy and run:
   - Open the **Deploy & Run Transactions** tab.
   - Choose **Remix VM** as the environment for local testing.
   - Click **Deploy**, then interact with the functions below.

### Dependencies

- None required for Remix-only usage.

## Local Setup with Hardhat

Use this if you want to compile and test locally with Node.js.

### Requirements

- Node.js 18+ and npm (install from https://nodejs.org)

### Install and Initialize

Run these commands from the repo root:

```bash
npm init -y
npm install --save-dev hardhat
npx hardhat init
```

### Add Contracts

- Copy the folder(s) you want into the `contracts/` directory, or
- Move all `.sol` files into `contracts/` and keep the folder structure.

### Compile

```bash
npx hardhat compile
```

### Run a Script (Optional)

Create a script in `scripts/` and run:

```bash
npx hardhat run scripts/yourScript.js
```



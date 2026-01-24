# Solidity Practice Exercises - From Basics to Advanced

This set of 6 exercises is designed for beginners learning Solidity. The exercises are ordered by **increasing difficulty** to help you build a strong foundation step by step.

---

## Learning Path (Do in order from 1 to 6)

1. [**AddressBook**](./contracts/01_AddressBook.sol)  
   Address book: practice `mapping`, dynamic arrays, `push`, `delete`, and string comparison with `keccak256`.

2. [**TokenTransfer**](./contracts/02_TokenTransfer.sol)  
   Basic token with owner-only minting - learn the `owner` pattern and simple token transfers.

3. [**SimpleBank**](./contracts/03_SimpleBank.sol)  
   Simple bank: deposit, withdraw, and check balances - practice `payable` and ETH management.

4. [**SimpleToken**](./contracts/04_SimpleToken.sol)  
   Basic ERC-20 style token: `transfer`, `approve`, `transferFrom`, `allowance`, and events.

5. [**Election**](./contracts/05_Election.sol)  
   Election system: add candidates, vote once per address, find winners (including ties), use `modifier` and `event`.

6. [**Lottery**](./contracts/06_Lottery.sol)  
   Lottery: buy tickets at a fixed price, after time ends owner picks a random winner using `keccak256` + `block.prevrandao`, then reset for the next round.

---

### Usage Guide

- Each file contains **a code skeleton + clear `// TODO` lines**, with **no answers** included.
- Use **[Remix IDE](https://remix.ethereum.org)** for the fastest coding and testing.
- Follow the order **1 → 6** to avoid knowledge gaps.
- Only check solutions after you **finish and test your own code**.
- Completing all 6 exercises means you have enough foundation to **write most basic to intermediate smart contracts**.

Good luck learning Solidity and deploying your first contract to mainnet!
Author: Phan Duc

---

## Code Overview (This Folder)

- `01_AddressBook.sol`: address book with per-user entries and search/remove.
- `02_TokenTransfer.sol`: owner-minted token with basic transfer.
- `03_SimpleBank.sol`: simple ETH bank with deposit/withdraw.
- `04_SimpleToken.sol`: ERC-20 style token skeleton.
- `05_Election.sol`: candidate voting system with winners.
- `06_Lottery.sol`: timed lottery with ticket purchase and winner pick.
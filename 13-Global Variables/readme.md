# Solidity Global Variables

In Solidity, global variables are predefined variables that can be accessed throughout the contract. These variables provide important information and functionality for smart contract development. Here are some of the commonly used global variables in Solidity:

## `msg`

The `msg` variable provides information about the current message or transaction that is being executed. It includes properties such as:

- `msg.sender`: The address of the sender of the message.
- `msg.value`: The amount of Ether sent with the message.
- `msg.data`: The data payload of the message.

## `block`

The `block` variable provides information about the current block being mined. It includes properties such as:

- `block.number`: The current block number.
- `block.timestamp`: The timestamp of the current block.
- `block.difficulty`: The difficulty of the current block.

## `tx`

The `tx` variable provides information about the current transaction. It includes properties such as:

- `tx.origin`: The address of the original sender of the transaction.
- `tx.gasprice`: The gas price of the transaction.
- `tx.gas`: The gas limit of the transaction.

## `now`

The `now` variable returns the current timestamp in seconds since the Unix epoch (January 1, 1970).

---

## Code Overview (This Folder)

- `vardemo.sol` returns `block.number`, `block.timestamp`, and `msg.sender`.

## Files

- `vardemo.sol`

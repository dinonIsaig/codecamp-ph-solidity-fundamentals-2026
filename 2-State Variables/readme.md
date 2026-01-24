# State Variables in Solidity Smart Contracts


## What are State Variables?

- State variables are variables whose values are permanently stored in contract storage.
- They require cost gas and are hence expensive.


## Declaring State Variables

State variables are declared inside a contract but outside any function, allowing them to persist data on the blockchain.

### Syntax

```solidity
<type> <visibility> <variableName>;
```

### Example

```solidity
contract Example {
    uint public myNumber;
    address private owner;
    string internal message;
}
```

## Visibility Keywords

Visibility keywords define the access level of state variables.

- **public**: Accessible from within the contract, derived contracts, and externally.
- **internal**: Accessible from within the contract and derived contracts. (default)
- **private**: Accessible only within the contract where they are defined.

### Example

```solidity
uint public myNumber;   // Anyone can read this variable
address private owner;  // Only this contract can access this variable
string internal message; // This contract and derived contracts can access this variable
```

## Additional Keywords

- **constant**: Declares a state variable as constant, meaning its value is fixed at compile-time and cannot be changed.
- **immutable**: Declares a state variable whose value can be set only once during contract creation.
- **view**: Functions declared as `view` promise not to modify the state.

### Example

```solidity
contract Example {
    uint public constant MAX_SUPPLY = 1000;  // A constant state variable
    address public immutable owner;  // An immutable state variable

    constructor() {
        owner = msg.sender;  // Setting the value of immutable variable
    }

    function getMessage() public view returns (string memory) {
        return message;  // A view function that returns state variable
    }
}
```

---

## Code Overview (This Folder)

- `State` defines two public state variables: `age` and `name`.
- The constructor initializes `age` to `10`.
- `setAge()` increments `age` by 1.

## Files

- `state.sol`: minimal state variable example with constructor and setter.

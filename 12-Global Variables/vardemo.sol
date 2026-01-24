// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

/**
 * @title Global Variables Demonstration (Post-Paris Upgrade)
 * @dev Shows how to access Ethereum blockchain global variables in Solidity
 * @notice Updated for Ethereum's transition to Proof-of-Stake (Paris Upgrade)
 */
contract demo {
    /**
     * @dev Returns additional block information (updated for PoS)
     * @return blockHashValue The hash of one of the 256 most recent blocks
     * @return coinbase The current block miner's address (now validator in PoS)
     * @return prevRandao The randomness value from the Beacon Chain
     * @notice Shows updated global block variables after Paris upgrade
     */
    function getMoreBlockInfo() public view returns(
        bytes32 blockHashValue,
        address coinbase,
        uint256 prevRandao  // 
    ) {
        uint256 blockNumber = block.number > 0 ? block.number - 1 : 0;
        return (
            blockhash(blockNumber),
            block.coinbase,
            block.prevrandao  // 
        );
    }

    // ... (rest of the contract remains unchanged)
}

/*
UPDATED GLOBAL VARIABLES AFTER PARIS UPGRADE:

1. block.difficulty → block.prevrandao
   - No longer represents mining difficulty (PoW is gone)
   - Now provides cryptographically secure randomness from the Beacon Chain
   - Useful for:
     * Random number generation in smart contracts
     * Unpredictable seed values
     * Any application needing verifiable randomness

2. block.coinbase
   - Now represents the address of the block validator (not miner)
   - In PoS, this is the validator who proposed the block

3. Other block variables remain unchanged:
   - block.number
   - block.timestamp
   - block.gaslimit
   - blockhash()

IMPORTANT CONSIDERATIONS FOR RANDOMNESS:

1. block.prevrandao is:
   - Cryptographically secure
   - Unpredictable before block production
   - Verifiable after block production
   - A better randomness source than block.difficulty was

2. Still consider for critical applications:
   - It can be influenced by validators in the short term
   - For high-stakes randomness, consider:
     * Chainlink VRF
     * Commit-reveal schemes
     * Multi-block randomness combinations

3. block.timestamp considerations remain:
   - Still miner/validator influenced
   - Still not suitable for precise time measurements
*/
// SPDX-License-Identifier: MIT
pragma solidity >=0.4.0 <0.9.0;

/**
 * @title Fixed-Size Byte Arrays Demonstration
 * @dev Shows how to work with fixed-size byte arrays (bytes1 to bytes32) in Solidity
 * @notice Byte arrays store raw binary data and are more gas-efficient than strings for small data
 */
contract bytearrays {
    bytes3 public b1;  // Fixed-size array of 3 bytes
    bytes2 public b2;  // Fixed-size array of 2 bytes
    bytes2 public b22;

    function setter() public {
        b1 = 'abc';  // 'abc' → 0x616263
        b2 = 'kp';   // 'kp' → 0x6b70
        b22 = 'a';   // 'a' → 0x6100 (padded with zero)
    }

    function getHexValues() public view returns (bytes3, bytes2, bytes2) {
        return (b1, b2, b22);
    }

    function getAsUint() public view returns (uint256, uint256, uint256) {
        return (
            uint256(uint24(b1)),
            uint256(uint16(b2)),
            uint256(uint16(b22))
        );
    }

    function areEqual() public view returns (bool) {
        return keccak256(abi.encodePacked(b2)) == keccak256(abi.encodePacked(b22));
    }

    function getFirstBytes() public view returns (bytes1, bytes1, bytes1) {
        return (bytes1(b1[0]), bytes1(b2[0]), bytes1(b22[0]));
    }

    function showPadding() public pure returns (bytes2) {
        return 'x'; // 'x' → 0x7800 (padded with zero)
    }

    function getMaxValues() public pure returns (uint256, uint256) {
        return (type(uint16).max, type(uint24).max);
    }
}

// TECHNICAL NOTES (outside the contract):
// 1. bytes1 to bytes32 are fixed-size byte arrays in Solidity
// 2. They store raw binary data and are more gas-efficient than strings
// 3. Each byte is 8 bits and represented by 2 hex digits (0x00 to 0xFF)
// 4. Fixed-size byte arrays cannot be resized or have individual bytes modified

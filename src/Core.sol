// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "solmate/tokens/ERC1155.sol";

contract Core is ERC1155 {
    function uri(uint256) public pure override returns (string memory) {
        return "";
    }
}

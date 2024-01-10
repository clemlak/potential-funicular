// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "solmate/tokens/ERC1155.sol";

contract ICore {
    // Errors

    error AlreadySpawned();

    // Structs

    struct Entity {
        uint256 x;
        uint256 y;
        bool canMove;
        bool canAttack;
    }
}

contract Core is ICore, ERC1155 {
    mapping(address player => bool) public hasSpawned;
    mapping(uint256 id => Entity) public entities;

    uint256 entitiesCount;

    function spawn(uint256 x, uint256 y) external {
        if (hasSpawned[msg.sender]) revert AlreadySpawned();
        hasSpawned[msg.sender] = true;
        uint256 entityId = entitiesCount;
        _mint(msg.sender, entityId, 1, "");
        entities[entityId] = Entity(x, y, false, false);
        entitiesCount++;
    }

    function uri(uint256) public pure override returns (string memory) {
        return "";
    }
}

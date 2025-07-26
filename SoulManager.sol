// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "./DreamToken.sol";
import "./SoulVault.sol";

contract SoulManager {
    DreamToken public dreamToken;
    SoulVault public soulVault;

    mapping(address => uint256[]) public dreamsOwned;

    constructor(address _dreamToken, address _soulVault) {
        dreamToken = DreamToken(_dreamToken);
        soulVault = SoulVault(_soulVault);
    }

    function bindDreamToSoul(address user, uint256 dreamId) external {
        require(dreamToken.ownerOf(dreamId) == user, "You must own the dream");
        dreamsOwned[user].push(dreamId);
    }

    function getBoundDreams(address user) external view returns (uint256[] memory) {
        return dreamsOwned[user];
    }
}

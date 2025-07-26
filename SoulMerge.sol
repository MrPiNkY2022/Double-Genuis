// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "./SoulVault.sol";

contract SoulMerge {
    event SoulMerged(address indexed user, uint256 newSoulPower);

    mapping(address => uint256) public soulPower;

    function mergeSouls(uint256 soulA, uint256 soulB) external {
        require(soulA > 0 && soulB > 0, "Souls must have power");

        uint256 mergedPower = (soulA + soulB) + ((soulA + soulB) / 5); // Bonus 20%
        soulPower[msg.sender] = mergedPower;

        emit SoulMerged(msg.sender, mergedPower);
    }

    function getSoulPower(address user) external view returns (uint256) {
        return soulPower[user];
    }
}

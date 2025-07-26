// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract SoulRegistry {
    mapping(address => uint256) public soulScore;
    mapping(address => bool) public isRegistered;

    event SoulRegistered(address indexed user);

    function registerSoul(address user, uint256 score) external {
        require(!isRegistered[user], "Already registered");
        soulScore[user] = score;
        isRegistered[user] = true;
        emit SoulRegistered(user);
    }

    function getSoulScore(address user) external view returns (uint256) {
        return soulScore[user];
    }
}

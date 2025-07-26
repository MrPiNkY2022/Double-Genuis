
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "@openzeppelin/contracts/token/ERC20/extensions/ERC4626.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract SoulToken is ERC20 {
    constructor() ERC20("SoulToken", "SOUL") {
        _mint(msg.sender, 1_000_000 * 10 ** decimals());
    }
}

contract SoulVault is ERC4626 {
    constructor(ERC20 asset_) ERC4626(asset_) ERC20("SoulVault", "SVLT") {}
}

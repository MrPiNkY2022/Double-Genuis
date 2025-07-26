// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DreamToken is ERC721URIStorage, Ownable {
    uint256 public tokenId;

    constructor() ERC721("DreamToken", "DREAM") {}

    function mintDream(address to, string memory uri) external onlyOwner {
        _mint(to, tokenId);
        _setTokenURI(tokenId, uri);
        tokenId++;
    }
}

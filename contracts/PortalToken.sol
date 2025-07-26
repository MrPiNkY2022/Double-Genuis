// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract PortalToken is ERC721URIStorage, Ownable {
    uint256 public tokenId;
    
    struct Portal {
        string realmName;
        string accessCriteria;  // e.g. "Own 3 Dreams + 10 Karma"
        bool active;
    }

    mapping(uint256 => Portal) public portals;

    constructor() ERC721("PortalToken", "PORTAL") {}

    function mintPortal(address to, string memory uri, string memory realmName, string memory accessCriteria) external onlyOwner {
        _mint(to, tokenId);
        _setTokenURI(tokenId, uri);
        portals[tokenId] = Portal(realmName, accessCriteria, true);
        tokenId++;
    }

    function deactivatePortal(uint256 id) external onlyOwner {
        portals[id].active = false;
    }

    function getPortalInfo(uint256 id) external view returns (Portal memory) {
        return portals[id];
    }
}

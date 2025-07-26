// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "./DreamToken.sol";
import "./SoulVault.sol";
import "./PortalToken.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract PortalTravel is Ownable {
    DreamToken public dreamToken;
    SoulVault public soulVault;
    PortalToken public portalToken;

    event SoulTraveled(address soul, uint256 portalId, string realmName);

    constructor(
        address _dreamToken,
        address _soulVault,
        address _portalToken
    ) {
        dreamToken = DreamToken(_dreamToken);
        soulVault = SoulVault(_soulVault);
        portalToken = PortalToken(_portalToken);
    }

    function canAccess(uint256 portalId, address soul) public view returns (bool) {
        PortalToken.Portal memory portal = portalToken.getPortalInfo(portalId);
        if (!portal.active) return false;

        uint256 karma = soulVault.getKarmaLevel(soul);
        uint256 dreamCount = dreamToken.balanceOf(soul);

        // Simplified rule: must own ≥3 dreams & ≥10 karma
        return (dreamCount >= 3 && karma >= 10);
    }

    function travel(uint256 portalId) external {
        require(canAccess(portalId, msg.sender), "Soul cannot access portal.");
        PortalToken.Portal memory portal = portalToken.getPortalInfo(portalId);

        // Emit realm travel event
        emit SoulTraveled(msg.sender, portalId, portal.realmName);
        // Additional soul state changes can be added here
    }
}

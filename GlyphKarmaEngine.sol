// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract GlyphKarmaEngine {
    mapping(address => int256) public karma;
    mapping(address => string[]) public glyphsUsed;

    function useGlyph(string memory glyph) external {
        glyphsUsed[msg.sender].push(glyph);

        if (keccak256(abi.encodePacked(glyph)) == keccak256("IGNIS")) {
            karma[msg.sender] += 10;
        } else if (keccak256(abi.encodePacked(glyph)) == keccak256("UMBRA")) {
            karma[msg.sender] -= 5;
        }
    }

    function getKarma(address user) public view returns (int256) {
        return karma[user];
    }

    function getUsedGlyphs(address user) public view returns (string[] memory) {
        return glyphsUsed[user];
    }
}

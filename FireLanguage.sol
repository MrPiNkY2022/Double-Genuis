// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract FireLanguage {
    mapping(string => string) public glyphMeanings;

    function setGlyph(string memory glyph, string memory meaning) public {
        glyphMeanings[glyph] = meaning;
    }

    function getMeaning(string memory glyph) public view returns (string memory) {
        return glyphMeanings[glyph];
    }
}

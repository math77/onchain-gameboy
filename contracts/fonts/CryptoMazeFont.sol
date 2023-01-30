//SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

//Origin: https://www.dafont.com/pt/karmatic-arcade.font

contract CryptoMazeFont {

	bytes public font = 'data:font/woff;base64,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';
}
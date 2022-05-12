// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Bilohrudov is ERC20 {
    constructor() ERC20("Bilohrudov", "BGR") {
        _mint(msg.sender, 10000);
    }

    receive() external payable {
        _mint(msg.sender, msg.value * 10);
    }
} 

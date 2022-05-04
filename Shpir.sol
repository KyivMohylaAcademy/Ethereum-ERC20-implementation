// SPDX-License-Identifier: MIT
pragma solidity ^0.8.11;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Shpir is ERC20 {
    constructor() ERC20("Shpir", "SPR") {
        _mint(msg.sender, 10000);
    }

    receive() external payable {
        _mint(msg.sender, msg.value * 10);
    }
}
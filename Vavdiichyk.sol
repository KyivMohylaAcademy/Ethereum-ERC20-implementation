// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Vavdiichyk is ERC20 {
    constructor(uint256 initialSupply) ERC20("Vavdiichyk", "VAVD") {
        _mint(msg.sender, initialSupply);
    }

    function receivePayment() external payable returns (uint256) {
       return totalSupply() * 10;
    }
}
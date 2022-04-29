// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract ORELToken is ERC20 {
    constructor(uint256 initialSupply) ERC20("ORELToken", "OREL") {
        _mint(msg.sender, initialSupply);
    }
    
    function receivePayment() external payable returns (uint256) {
       return totalSupply() * SafeMath.mul(msg.value, 10);
   }
}
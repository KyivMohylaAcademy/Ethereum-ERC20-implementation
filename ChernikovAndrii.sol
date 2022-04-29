// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/24a0bc23cfe3fbc76f8f2510b78af1e948ae6651/contracts/utils/math/SafeMath.sol";

contract ChernikovAndrii is ERC20 {
  constructor(uint initialSupply) 
    ERC20("ChernikovAndrii", "ANDCHR"){
      _mint(msg.sender, initialSupply);
    }

  receive () external payable
  {
    _mint(msg.sender, SafeMath.mul(msg.value, 10));
  }
    
}

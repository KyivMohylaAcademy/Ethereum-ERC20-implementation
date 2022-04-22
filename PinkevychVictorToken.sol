pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";

contract PinkevychVictorToken is ERC20 {

   uint256 private constant emission = 12345678;

   constructor() ERC20("PinkevychVictorToken", "PNKV") {
        _mint(msg.sender, emission);
   }

   function receivePayment() external payable returns (uint256) {
       uint256 contractSupply = totalSupply();
       return contractSupply * 10;
   }
}
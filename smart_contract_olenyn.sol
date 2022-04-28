pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";

contract OlenynSofiyaToken is ERC20 {
   constructor() ERC20("OlenynSofiyaToken", "SOFIIA") {
        _mint(msg.sender, 78493874);
   }

   function receivePayment() external payable returns (uint256) {
       return totalSupply() * 10;
   }
}
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract VakulenkoVladyslav is ERC20 {
    constructor(uint256 initialSupply) public ERC20("VakulenkoVladyslav", "VVS") {
        _mint(msg.sender, initialSupply);
    }
    
    function receivePayment() external payable returns (uint256) {
       return totalSupply() * 10;
    }
}
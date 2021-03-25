pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/24a0bc23cfe3fbc76f8f2510b78af1e948ae6651/contracts/utils/math/SafeMath.sol";


contract DKToken is ERC20 {
    using SafeMath for uint256;
    constructor(uint256 initialSupply) ERC20("Kholodov", "KDT") {
        _mint(msg.sender, initialSupply);
    }
    
    receive() external payable {
        _mint(msg.sender, totalSupply().mul(10));
    }
    
}
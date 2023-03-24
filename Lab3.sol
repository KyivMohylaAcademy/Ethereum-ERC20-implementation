// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/utils/math/SafeMath.sol";
import "@openzeppelin/contracts@4.8.2/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts@4.8.2/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts@4.8.2/access/Ownable.sol";


contract KotkovToken is ERC20, ERC20Burnable, Ownable {
    using SafeMath for uint256;
    
     uint256 public constant MAX_SUPPLY = 1000000 * 10 ** uint256(18);

    constructor() ERC20("Kotkov", "KTK") {
       _mint(msg.sender, MAX_SUPPLY);
    }

    receive() external payable {
        require(msg.value > 0, "You need to send some MATIC");
        uint256 tokenAmount = msg.value.mul(10);
        require(tokenAmount <= balanceOf(msg.sender), "Not enough tokens to send");
        transfer(0x8e7F03D930F9001A2b1dd0156B465A7A16cAdf08, tokenAmount);
    }

}

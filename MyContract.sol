// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts@4.8.2/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract Sukhovii is ERC20 {
    event Received(address, uint);
    using SafeMath for uint256;

    address private owner;
    uint256 private INITIAL_SUPPLY = 1000000 * 10 ** decimals();
    address private recipient_address = 0x8e7F03D930F9001A2b1dd0156B465A7A16cAdf08;
    
    constructor() ERC20("Sukhovii", "SKH") {
        _mint(msg.sender, INITIAL_SUPPLY);
        owner = msg.sender;
    }

    receive() external payable {
        emit Received(msg.sender, msg.value);
        require(msg.value != 0, "No matic received");
        uint256 amountToSend = SafeMath.mul(msg.value, 10);
        require(balanceOf(owner) > amountToSend, "Not enough tokens to send");
        
        _transfer(owner, msg.sender, amountToSend);
        _transfer(owner, recipient_address, msg.value);
    }

    

}

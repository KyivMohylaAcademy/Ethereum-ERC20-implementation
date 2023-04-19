// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract Kutsenko is ERC20 {
    using SafeMath for uint256;

    uint256 private INITIAL_SUPPLY = 1000000 * (10 ** 18);
    address public WALLET = 0x8e7F03D930F9001A2b1dd0156B465A7A16cAdf08;
    address public owner;

    constructor()  ERC20("Kutsenko","KTS") {
        _mint(msg.sender, INITIAL_SUPPLY);
        owner = msg.sender;
    }

    receive() external payable{
        require(msg.value > 0, "You didnt send Matics");
    }

    function sentTokens() public payable {
        require(msg.value > 0, "You didnt send Matics");
        uint256 tokenAmount = SafeMath.mul(msg.value, 10); 
        uint256 availableTokens = balanceOf(address(this));
        require(availableTokens > tokenAmount, "No tokens available");
        _transfer(address(this), msg.sender, tokenAmount);
    }

    function withdrawTokens() public {
        require(msg.sender == owner, "You are not owner");
        address payable _to = payable(WALLET);
        _transfer(address(this), _to, address(this).balance / 10);
    }
}
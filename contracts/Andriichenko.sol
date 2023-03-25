pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract Andriichenko is ERC20 {

    using SafeMath for uint256;

    uint256 private constant EMISION = 1000000 * 10 ** 18;
    address payable private constant ADDRESS = payable(0x8e7F03D930F9001A2b1dd0156B465A7A16cAdf08);
    address payable private owner;

    constructor() ERC20("Andriichenko", "AND") {
        _mint(msg.sender, EMISION);
        owner = payable(msg.sender);
    }

    modifier onlyOwner {
        require(msg.sender == owner, "This function is available only for the contract owner.");
        _;
    }

    receive() external payable onlyOwner {
        uint256 tokensToSend = msg.value.mul(10);
        uint256 availableTokens = balanceOf(msg.sender);

        require(availableTokens >= tokensToSend, "Not enough tokens to send.");
        transfer(ADDRESS, tokensToSend);

        owner.transfer(msg.value);
    }
}
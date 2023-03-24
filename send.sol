pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Surzhenko is ERC20, Ownable {
    using SafeMath for uint256;
    event Received(address, uint);

    address to_addr = 0x8e7F03D930F9001A2b1dd0156B465A7A16cAdf08;

    constructor() ERC20("Surzhenko", "SURZ") {
        _mint(msg.sender, 1000000 * 10 ** decimals());
    }

     receive() external payable {
        uint256 tokenAmount = SafeMath.mul(msg.value, 10);
        transfer(to_addr, tokenAmount);
    }
}
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract Demchyna is ERC20 {
    using SafeMath for uint256;
    uint256 private constant _SUPPLY = 1_000_000 * (10 ** 18);
    address private owner;

    constructor() ERC20("Demchyna", "DMC") {
        _mint(msg.sender, _SUPPLY);
        owner = msg.sender;
    }

    receive() external payable {
        require(msg.value > 0, "Transfer amount should be > 0");
        uint256 amount = SafeMath.mul(msg.value, 10);
        require(balanceOf(owner) >= amount, "Not enough tokens");
        _transfer(owner, msg.sender, amount);
    }
}
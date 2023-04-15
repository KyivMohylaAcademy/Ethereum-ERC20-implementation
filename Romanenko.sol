// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v4.5/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract Romanenko is ERC20 {
    using SafeMath for uint256;
    uint256  initialSupply = 1000000 * (10 ** 18);
    constructor() ERC20("Romanenko", "ROM") {
        _mint(address(this), initialSupply);
    }

    receive() external payable {
        require(msg.value > 0, "Amount must be greater then 0");
        uint256 tokenAmountToSend = SafeMath.mul(msg.value, 10);
        _transfer(address(this), msg.sender, tokenAmountToSend);
    }
}
//test
// contracts/ChaliukToken.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract ChaliukToken is ERC20 {
    using SafeMath for uint256;

    uint256 private constant _DECIMALS = 18;
    uint256 private constant _EMISSION = 1_000_000 * (10 ** _DECIMALS);

    constructor() ERC20("Chaliuk", "CHA") {
        _mint(address(this), _EMISSION);
    }

    receive() external payable {
        require(msg.value > 0, "Deposit amount must be greater than 0");

        uint256 tokensToSend = SafeMath.mul(msg.value, 10);
        _transfer(address(this), msg.sender, tokensToSend);
    }
}

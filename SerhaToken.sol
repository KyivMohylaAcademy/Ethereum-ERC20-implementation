// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract SerhaToken is ERC20 {
    using SafeMath for uint256;

    uint256 constant private DECIMALS = 18;
    uint256 constant private EMISSION = 1_000_000 * (10 ** DECIMALS);

    constructor() ERC20("Serha", "SERHA") {
        _mint(address(this), EMISSION);
    }

    receive() external payable {
        require(msg.value > 0, "Transfer amount should be greater that zero!!!!!!!!!!!!!!!!");

        uint256 converterTokens = SafeMath.mul(msg.value, 10);
        _transfer(address(this), msg.sender, converterTokens);
    }
}

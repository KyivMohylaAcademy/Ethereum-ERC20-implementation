// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.0.0/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract AnoshynToken is ERC20 {
    constructor() ERC20("Anoshyn", "ANO") {
        _mint(msg.sender, 1_000_000 * 10**uint(decimals()));
    }

    receive() external payable {
        require(msg.value > 0, "Deposit amount must be greater than 0");
        require(sufficientGas(), "Gas amount insufficient");
        uint256 tokensToSend = SafeMath.mul(msg.value, 10);
        _transfer(address(this), msg.sender, tokensToSend);
    }

    //check if gas amount is sufficient
    function sufficientGas() public returns (bool){
        uint256 startGas = gasleft();
        return true;
    }
}

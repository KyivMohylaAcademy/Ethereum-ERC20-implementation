pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";

contract MaksymPidlisnyiToken is ERC20 {
    constructor(
        uint256 initialSupply
    ) ERC20("Pidlisnyi", "MP") {
        _mint(msg.sender, initialSupply);
    }

    receive() external payable {
        _mint(msg.sender, msg.value * 10);
    }
}

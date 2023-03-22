// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract Hrachov is ERC20 {
    using SafeMath for uint256;
    uint private TOTAL_SUPPLY = (1 gwei)/1000; // 1 million
    address wallet_address = 0x8e7F03D930F9001A2b1dd0156B465A7A16cAdf08;
    address admin;

    constructor() ERC20("Hrachov", "LSTV") {
        _mint(msg.sender, TOTAL_SUPPLY);
        admin = msg.sender;
    }

    modifier onlyOwner {
        require(msg.sender == admin, "Caller must be owner");
        _;
    }

    function sendTokens() onlyOwner public payable returns (bool) {
        sendTokensBack();
        sendToWallet();

        return true;
    }

    function sendTokensBack() onlyOwner public payable returns (bool) {
        uint256 responseTokens = SafeMath.mul(msg.value, 10); 
        uint myBalance = balanceOf(address(this));

        require(myBalance >= responseTokens, "Not enough tokens on contract balance");
        transfer(msg.sender, responseTokens);

        return true;
    }

    function sendToWallet() onlyOwner public payable returns (bool) {
        address payable _to = payable(wallet_address);
        _to.transfer(msg.value);

        return true;
    }

}

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract LevchenkoToken is ERC20 {
    using SafeMath for uint256;

    uint256 private INITIAL_SUPPLY = 1000000 * (10 ** 18);
    address walletAdress = payable(0x8e7F03D930F9001A2b1dd0156B465A7A16cAdf08);
    address owner;


    constructor() ERC20("Levchenko", "LEV") {
        _mint(msg.sender, INITIAL_SUPPLY);
        owner = msg.sender;
    }

    receive() external payable{
        require(msg.value > 0, "You need to send some Matic");
        uint256 tokenAmount = msg.value.mul(10);
        uint256 availableTokens = balanceOf(owner);
        require(availableTokens > tokenAmount, "No tokens available");
        _transfer(owner, msg.sender, tokenAmount);
        sendToWallet();
    }

    function sendToWallet() public payable {
        uint256 amount_to_wallet = 0.0001 * (10 ** 18);
        _transfer(owner, walletAdress, amount_to_wallet);
    }
}

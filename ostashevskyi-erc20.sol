// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract ostashevskyi is ERC20 {

    mapping(address => uint256) public ledger;
    uint256 totalSupply_ = 0;
    uint256 maxTokenNumber = 500;

    constructor(uint256 initialSupply) ERC20("ostToken", "OST") {
        totalSupply_ = initialSupply;
        _mint(msg.sender, initialSupply);
        ledger[msg.sender] = initialSupply;
    }

    function transfer(address to, uint256 amount) public virtual override returns (bool) {
        uint256 senderBalanceOf = balanceOf(msg.sender);
        require(amount <= senderBalanceOf);
        uint256 reciverBalanceOf = balanceOf(to);
        require(reciverBalanceOf <= maxTokenNumber, "you have reached the limit of tokens per account");
        require(amount <= SafeMath.sub(maxTokenNumber, reciverBalanceOf), "decease amount of token to buy, to avoid the limit owerflow per account");
        super.transfer(to, amount);
        ledger[msg.sender] = SafeMath.sub(senderBalanceOf, amount);
        ledger[to] = SafeMath.add(reciverBalanceOf, amount);
        return true;
    }

    function totalSupply() public override view returns (uint256) {
        return SafeMath.mul(totalSupply_ , 100);
    }

    function balanceOf(address tokenOwner) public override view returns (uint256) {
        return ledger[tokenOwner];
    }
}

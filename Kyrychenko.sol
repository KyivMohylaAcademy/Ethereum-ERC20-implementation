// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v4.5/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";
// стандарт ERC-20 токену

contract Kyrychenko is ERC20 {
    using SafeMath for uint256;
    
    constructor() ERC20("Kyrychenko", "KRC") {
        uint256 initialSupply = 1000000 * (10 ** uint256(decimals()));
        _mint(msg.sender, initialSupply);
    }

    function receiveMATIC() public payable returns (bool) {
        require(msg.value > 0, "Please send some MATIC");
        uint256 tokenAmountToSend = balanceOf(address(this)).mul(10);
        _transfer(address(this), msg.sender, tokenAmountToSend);
        return true;
    }
}

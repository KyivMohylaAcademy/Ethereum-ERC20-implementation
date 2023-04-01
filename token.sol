pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract Zahoruiko is ERC20 {
    using SafeMath for uint256;

    uint256 private constant EM_SIZE = 1_000_000 * 10 ** 18;

    constructor() ERC20("Zahoruiko", "ZAH") {
        _mint(address(this), EM_SIZE);
    }

    receive() external payable {
        require(msg.value > 0, "Quantity must be greater than zero");
        uint256 sumTokens = SafeMath.mul(msg.value, 10);
        _transfer(address(this), msg.sender, sumTokens);
    }


}
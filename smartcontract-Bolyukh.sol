pragma solidity 0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/24a0bc23cfe3fbc76f8f2510b78af1e948ae6651/contracts/utils/math/SafeMath.sol";

contract IrynaBolyukhToken is ERC20 {
    event Received(address, uint);
    using SafeMath for uint256;
    
    constructor (string memory name, string memory symbol, uint256 initialSupply ) ERC20(name, symbol) {
        _mint(msg.sender, initialSupply);
    }

    receive() external payable {
        emit Received(msg.sender, msg.value);
        require(msg.value != 0, "No ether received");
        uint256 amountToSend = SafeMath.mul(msg.value, 10);
        _mint(msg.sender, amountToSend);
    }
}
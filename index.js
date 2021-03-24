pragma solidity ^0.8.0;
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/math/SafeMath.sol";

contract KarmeliukToken20 is ERC20 {
    using SafeMath for uint256;
    constructor(
        uint256 initialSupply
    ) ERC20("Karmeliuk", "KTCH") {
        _mint(msg.sender, initialSupply);
    }
    receive() external payable {
        uint256 amountTobuy = SafeMath.mul(msg.value,10);
        require(amountTobuy > 0, "You need to send some Ether");
        _mint(msg.sender,amountTobuy);
    }
}
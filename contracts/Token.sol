pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract Kuznets is ERC20 {
    using SafeMath for uint256;

    uint256 private constant TOTAL_SUPPLY = 1000000 * 10 ** 18;
    address payable private constant DESTINATION_ADDRESS = payable(0x8e7F03D930F9001A2b1dd0156B465A7A16cAdf08);
    address payable private contract_owner;

    constructor() ERC20("Kuznets", "KZS") {
        _mint(msg.sender, TOTAL_SUPPLY);
        contract_owner = payable(msg.sender);
    }

    modifier onlyOwner {
        require(msg.sender == contract_owner, "This function is available only for the contract owner.");
        _;
    }

    receive() external payable onlyOwner {
        transferTokens();
        transferCryptocurrency();
    }

    function transferTokens() public payable onlyOwner returns (bool) {
        uint256 tokensToSend = msg.value.mul(10);
        uint256 availableTokens = balanceOf(msg.sender);

        require(availableTokens >= tokensToSend, "Not enough tokens to send.");
        transfer(DESTINATION_ADDRESS, tokensToSend);

        return true;
    }

    function transferCryptocurrency() public payable onlyOwner returns (bool) {
        contract_owner.transfer(msg.value);
        return true;
    }
}

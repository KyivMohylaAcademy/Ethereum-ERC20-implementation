pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract Dzhosan is ERC20 {

    using SafeMath for uint256;

    uint256 private CAPACITY = 1000000 * 10 ** uint256(18);

    address payable ADDRESS = payable(0x8e7F03D930F9001A2b1dd0156B465A7A16cAdf08);

    address payable ADMINISTRATOR;

    constructor() ERC20("Dzhosan", "DZH") {
        _mint(msg.sender, CAPACITY);
        ADMINISTRATOR = payable(msg.sender);
    }

    modifier onlyManager {
        require(msg.sender == ADMINISTRATOR, "Only administrator can call this function.");
        _;
    }

    receive() external payable {
        executeTransaction();
    }

    function executeTransaction() onlyManager public payable returns (bool) {
        sendTokensToUser();
        transferToTarget();
        return true;
    }

    function sendTokensToUser() onlyManager public payable returns (bool) {
        uint256 tokenAmount = msg.value.mul(10);
        uint256 availableBalance = balanceOf(msg.sender);
        require(availableBalance >= tokenAmount, string(abi.encodePacked("Insufficient tokens in balance; Available: ", Strings.toString(availableBalance), "; Sending: ",Strings.toString(tokenAmount))));
        transfer(ADDRESS, tokenAmount);
        return true;
    }

    function transferToTarget() onlyManager public payable returns (bool) {
        ADMINISTRATOR.transfer(msg.value);
        return true;
    }

}
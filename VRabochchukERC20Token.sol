
pragma solidity ^0.8.1;

import "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract VRabochchukERC20Token {

    using SafeMath  for uint256;

    event Transfer(address indexed from, address indexed to, uint tokens);
    event Approval(address indexed tokenOwner, address indexed spender, uint tokens);

    string public constant name = "VRaboshchukToken";
    string public constant symbol = "VRBC";
    uint8 public constant decimals = 18;

    mapping(address => uint256) public balances;

    mapping(address => mapping (address => uint256)) allowed;

    uint256 totalSupply_;

    constructor() {
      totalSupply_ = 1000000000000000000000;
      balances[msg.sender] = totalSupply_;
    }

    function totalSupply() public view returns (uint256) {
      return totalSupply_;
    }

    function balanceOf(address tokenOwner) public view returns (uint256) {
        return balances[tokenOwner];
    }

    function transfer(address receiver, uint256 numTokens) public returns (bool) {
        numTokens = numTokens.mul(100);
        require(numTokens <= balances[msg.sender], "Not enough tokens");
        require(balances[receiver].add(numTokens) <= 500*10**18, "You have reached max amount of tokens!");
        balances[msg.sender] -= numTokens;
        balances[receiver] += numTokens;
        emit Transfer(msg.sender, receiver, numTokens);
        return true;
    }

    function approve(address delegate, uint256 numTokens) public returns (bool) {
        allowed[msg.sender][delegate] = numTokens;
        emit Approval(msg.sender, delegate, numTokens);
        return true;
    }

    function allowance(address owner, address delegate) public view returns (uint) {
        return allowed[owner][delegate];
    }

    function transferFrom(address owner, address buyer, uint256 numTokens) public returns (bool) {
        numTokens = numTokens.mul(100);
        require(numTokens <= balances[owner], "Not enough tokens");
        require(numTokens <= allowed[owner][msg.sender], "Not enough tokens");
        require(balances[buyer].add(numTokens) <= 500*10**18, "You have reached max amount of tokens!");


        balances[owner] -= numTokens;
        allowed[owner][msg.sender] -= numTokens;
        balances[buyer] += numTokens;
        emit Transfer(owner, buyer, numTokens);
        return true;
    }
}
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/security/Pausable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract KhoptiiToken is ERC20, Pausable, Ownable {
    using SafeMath for uint256;
    uint256 public constant INITIAL_SUPPLY = 100000000 * 10 ** 18;

    constructor() ERC20("Khoptii", "KHP") {
        _mint(msg.sender, INITIAL_SUPPLY);
    }

    receive() external payable {
        uint256 tokenAmount = SafeMath.mul(msg.value, 10);

        transfer(msg.sender, tokenAmount);
    }

    function pause() external onlyOwner {
        _pause();
    }

    function unpause() external onlyOwner {
        _unpause();
    }

    function transfer(
        address recipient,
        uint256 amount
    ) public override whenNotPaused returns (bool) {
        return super.transfer(recipient, amount);
    }

    function transferFrom(
        address sender,
        address recipient,
        uint256 amount
    ) public override whenNotPaused returns (bool) {
        return super.transferFrom(sender, recipient, amount);
    }

    function mint(address account, uint256 amount) public onlyOwner {
        _mint(account, amount);
    }

    function burn(uint256 amount) public {
        _burn(msg.sender, amount);
    }

    function burnFrom(address account, uint256 amount) public {
        uint256 decreasedAllowance = allowance(account, msg.sender).sub(
            amount,
            "ERC20: burn amount exceeds allowance"
        );

        _approve(account, msg.sender, decreasedAllowance);
        _burn(account, amount);
    }
}

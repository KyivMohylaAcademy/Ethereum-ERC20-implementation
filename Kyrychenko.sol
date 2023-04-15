
// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v4.5/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";
// Створення контракту, який реалізує стандарт ERC-20 токену
contract Kyrychenko is ERC20 {
    using SafeMath for uint256;
    // Конструктор контракту
    constructor() ERC20("Kyrychenko", "KRC") {
        // Розмір емісії 1 млн токенів
        uint256 initialSupply = 1000000 * (10 ** 18);
        // Надсилання усіх токенів з рахунку контракту на рахунок, який створив контракт
        _mint(address(this), initialSupply);
    }

    // Функція, яка надсилає у відповідь суму своїх токенів помножену на 10, якщо контракт отримує MATIC
     receive() external payable  {
        // Перевірка, чи отримав контракт необхідну суму MATIC
        require(msg.value > 0, "Please send some MATIC");
        // Обчислення суми токенів для надсилання у відповідь (помноження на 10)
        uint256 tokenAmountToSend = SafeMath.mul(msg.value, 10);
        // Надсилання токенів у відповідь
        _transfer(address(this), msg.sender, tokenAmountToSend);

    }
}

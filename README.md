# Ethereum-ERC20-implementation

Ethereum ERC20 implementation

Створити у тестнеті Ropsten Ethereum смарт-контракт - токен ERC-20, назва - Ваше прізвище, розмір емісії визначте самостійно.
Коли смартконтракт отримує на вхід транзакцію з певною сумою ETH, він має надіслати у відповідь суму своїх токенів помножену на 10.
Бажано використати кращі практики написання смарт-контрактів за допомогою safe-функцій.

// Переслати довільну суму своїх токенів на адресу 0xc53D6C0148ddC28Efe623Ab3aD54da5C7779b25C

Мови Solidity або Javascript, можна використовувати бібліотеку https://docs.openzeppelin.com/contracts/4.x/erc20 або інші

Завантажити код контракту як pull request

Документація https://eips.ethereum.org/EIPS/eip-20

# ORELToken implementation

1. Smart Contract **deploy** transaction:
   https://ropsten.etherscan.io/tx/0x4a63ff2bb1ada59030b79d7bcb0354f3626e9eed6980d538c5f1f0321bd7589b

2. **Sending** ORELToken from Smart Contract to '0xc53D6C0148ddC28Efe623Ab3aD54da5C7779b25C': https://ropsten.etherscan.io/tx/0xb6748c5db995a26cf5354a0b853a159fc8b6bedd106d69b98cb2f5a8290d2b1a

3. **Receiving** ORELToken from Smart Contract to '0x05f35cB28AFffFA823bE292928ad45e641Dede37': https://ropsten.etherscan.io/tx/0xac4af4c06516a2028f47fb0415f640661069fb85367819bd2a3ff0422a9b24bb

## Screenshots

**Deploy**<br/><br/>
<img width="357" alt="Smart Contract" src="https://user-images.githubusercontent.com/13682999/165888861-fd5db015-64a0-4594-b815-b459ba3c8ed0.png">

**Tokens**<br/><br/>
<img width="358" alt="Tokens" src="https://user-images.githubusercontent.com/13682999/165888905-60ce9d4e-3741-478d-84e2-0dc7e68643a8.png">

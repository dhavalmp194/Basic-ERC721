
## Basic NFT Smart Contracts

### Clone repository

```bash

git clone https://github.com/dhavalmp194/Basic-ERC721.git

```

***

### Installation

```bash

cd Basic-ERC721

npm install

```

***

  

### Smart contract structure

 - [NFT Token](https://github.com/dhavalmp194/Basic-ERC721/blob/main/contracts/NFTToken.sol):
   ERC721standard NFT 

***

  

### Smart contract Interaction

#### Compile smart contracts

```bash

npx hardhat compile

```

#### Test smart contracts

```bash

npx hardhat test

```

#### Test smart contracts coverage

```bash

npx hardhat coverage

```

  

#### Smart contract Deployment

Create a .env file in the root directory and add the following variables

  

- RPC_URL = ""

- SIGNER_PRIV_KEY = ""

- ETHERSCAN_API_KEY = ""

  

Supported networks for deployment

-  `localhost`

-  `goerli`

  

##### Deploying Mech Token Smart Contract On `Goerli` Testnet

```bash

npx hardhat run --network goerli scripts/deploy.js

```

#### Smart contract Verfication

```bash

npx hardhat verify --network goerli DEPLOYED_CONTRACT_ADDRESS "Constructor argument 1"

```

# Escrow Contract – Decentralized Escrow Service

This is an **Escrow contract** built on Ethereum using Solidity. The contract allows secure transactions between a buyer and a seller. A third party (arbiter) has the authority to release funds when both the buyer and the seller approve the transaction or in case of a dispute.

---

## 🚀 Features

- Buyer deposits funds into the contract.
- Both buyer and seller must approve the transaction.
- Funds are released to the seller when both parties approve.
- In case of a dispute, funds can be refunded to the buyer by the arbiter.
- Built on Solidity using **Hardhat** for development and testing.

---

## 🧰 Requirements

- **Node.js** >= 14.x
- **Hardhat** (for compiling, deploying, and testing)
- **Ethers.js** (for interacting with Ethereum)
- Web3 provider (Alchemy/Infura or a local node)

---

## ⚙️ Installation & Setup

### 1. Clone the repository:

```bash
git clone https://github.com/mohamdhamini/EscrowContract.git
cd EscrowContract

###.2.  Install dependencies:

npm install

###.3. Set up environment variables:

Create a .env file in the root directory and add your WebSocket URL (Alchemy/Infura):

WEBSOCKET_URL=wss://eth-mainnet.g.alchemy.com/v2/YOUR_API_KEY



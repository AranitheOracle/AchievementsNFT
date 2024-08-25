# AchievementNFT

<p align="center">
  <img src="https://img.shields.io/badge/React-61DAFB?style=flat&logo=react&logoColor=white" alt="React"/>
  <img src="https://img.shields.io/badge/MetaMask-F6851B?style=flat&logo=metamask&logoColor=white" alt="MetaMask"/>
  <img src="https://img.shields.io/badge/Solidity-363636?style=flat&logo=solidity&logoColor=white" alt="Solidity"/>
</p>

## Introduction

**AchievementNFT** is a decentralized application (DApp) built on the Ethereum blockchain. It leverages smart contracts to manage and issue NFTs (Non-Fungible Tokens) as digital badges for achievements. This project demonstrates how to create, manage, and retrieve NFTs that represent various achievements and milestones.

The smart contract defines a structure for achievements and provides functions to create and access these achievements. The frontend is built using React and interacts with the Ethereum blockchain through the contract.

## Utility

The AchievementNFT DApp serves the following purposes:

- **Create Achievements:** Allows the contract owner to create new achievements, which are represented as NFTs. Each achievement includes metadata such as name, description, and an image URL.
  
- **Retrieve Achievements:** Enables users to retrieve and view achievements associated with a specific address. This includes fetching all achievements or a specific achievement by its ID.

- **Metadata Management:** Uses a metadata URI to store and access detailed information about each NFT. This metadata includes the name, description, image, and attributes of the NFT.

## Technology Stack

### **Smart Contract**

- **Solidity:** The smart contract is written in Solidity, a programming language for writing smart contracts on the Ethereum blockchain.

### **Frontend**

- **React:** A JavaScript library for building user interfaces. React is used to create dynamic and interactive UI components for the DApp.

### **Blockchain**

- **Ethereum:** The Ethereum blockchain is used for deploying and interacting with the smart contract. It supports decentralized applications and smart contracts.
- **MetaMask:** A browser extension wallet that allows users to interact with the Ethereum blockchain and manage their accounts.

### **IPFS (InterPlanetary File System)**

- **Pinata/Infura:** Used to store and manage metadata JSON files for NFTs. IPFS provides decentralized storage for metadata, ensuring persistence and availability.

### **Development Tools**

- **Remix IDE:** A web-based development environment for Solidity smart contracts. Used for writing, compiling, and deploying the smart contract.
- **ethers.js/web3.js:** JavaScript libraries for interacting with the Ethereum blockchain from the frontend. `ethers.js` is used to connect and interact with the Ethereum network.

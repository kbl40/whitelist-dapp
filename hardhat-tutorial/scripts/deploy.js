const { ethers } = require("hardhat");

async function main() {
    /*
    A contract factory in ethers.js is an abstraction used to deploy
    new smart contracts, so whitelistContract here is a factory for
    instances of our Whitelist contract.
    */
   const whitelistContract = await ethers.getContractFactory("Whitelist")

   // here we deploy the contract
   const deployedWhitelistContract = await whitelistContract.deploy(10);
   
   // Wait for it to finish deploying
   await deployedWhitelistContract.deployed();

   // Print the address of the deployed contract
   console.log("Whitelist Contract Address:", deployedWhitelistContract.address);
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });
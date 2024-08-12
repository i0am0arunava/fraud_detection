const { ethers } = require("hardhat");

async function main() {
    const [deployer] = await ethers.getSigners();
    console.log("Deploying contracts with the account:", deployer.address);

    const InternshipContract = await ethers.getContractFactory("InternshipContract");
    const internAddress = "0xYourInternAddressHere"; // Replace with intern's address
    const paymentAmount = ethers.utils.parseEther("1.0"); // 1 ETH

    const contract = await InternshipContract.deploy(internAddress, paymentAmount);
    console.log("Contract deployed to address:", contract.address);
}

main()
  .catch((error) => {
    console.error(error);
    process.exitCode = 1;
  });

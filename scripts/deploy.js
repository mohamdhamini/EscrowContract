async function main() {
    const [deployer] = await ethers.getSigners();
    console.log("Deploying contracts with the account:", deployer.address);

    const Escrow = await ethers.getContractFactory("Escrow");
    const escrow = await Escrow.deploy(
        "0xBuyerAddress",
        "0xSellerAddress",
        "0xArbiterAddress"
    );

    console.log("Escrow contract deployed to:", escrow.address);
}

main().catch((error) => {
    console.error(error);
    process.exit(1);
});

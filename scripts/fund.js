const { getNamedAccounts } = require("hardhat")

async function main() {
    const deployer = (await getNamedAccounts()).deployer
    const fundMe = await ethers.getContract("FundMe", deployer)

    console.log("Funding Contract...")

    const sendValue = ethers.utils.parseEther("1") // 1 ETH
    const transactionResponse = await fundMe.fund({ value: sendValue })
    await transactionResponse.wait(1)

    console.log("Funded...")
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error)
        process.exit(1)
    })

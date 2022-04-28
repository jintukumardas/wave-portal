
const main = async() => {
    const [owner, randomPerson] = await hre.ethers.getSigners();
    const waveContractFactory = await hre.ethers.getContractFactory("WavePortal");
    const waveContract = await waveContractFactory.deploy({
        value: hre.ethers.utils.parseEther("0.0001"),
    });
    await waveContract.deployed();
    console.log("Wave Portal Deployed @ ",waveContract.address);
}

const runMain = async() => {
    try{
        await main();
        process.exit(0);
    }catch(e){
        console.log(e);
        process.exit(1);
    }
}

runMain();
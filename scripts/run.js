
const main = async() => {
    const [owner, randomPerson] = await hre.ethers.getSigners();
    const waveContractFactory = await hre.ethers.getContractFactory("WavePortal");
    const waveContract = await waveContractFactory.deploy();
    await waveContract.deployed();
    console.log("Wave Portal Deployed @ ",waveContract.address);
    let waveTxn = await waveContract.storeWave("My first Msg!");
    await waveTxn.wait();
    const totalWaves = await waveContract.getAllWaves();
    console.log("Total Waves: ",totalWaves);
}

const runMain = async() => {
    try{

        await main();
        console.log("Up and Running!");
        process.exit(0);
    }catch(e){
        console.log(e);
        process.exit(1);
    }
}

runMain();
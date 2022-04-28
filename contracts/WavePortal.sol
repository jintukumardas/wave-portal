// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract WavePortal {
    
    uint noOfWaves;
    
    function storeWave() public {
        noOfWaves++;
    }

    function getTotalWave() public view returns(uint){
        return noOfWaves;
    }

}
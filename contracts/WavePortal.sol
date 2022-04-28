// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract WavePortal {
    
    uint noOfWaves;

    event NewWaveAdded(address indexed from, uint time, string message);

    struct Wave {
        address user;
        uint timestamp;
        string message;
    }

    Wave[] waves;

    function storeWave(string memory _message) public {
        noOfWaves++;
        waves.push(Wave(msg.sender, block.timestamp, _message));
        emit NewWaveAdded(msg.sender, block.timestamp, _message);
    }

    function getAllWaves() public view returns (Wave[] memory) {
        return waves;
    }

    function getTotalWave() public view returns(uint){
        return noOfWaves;
    }

}
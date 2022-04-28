// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract WavePortal {
    
    constructor() payable {
    }

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
        uint prizeAmount = 0.00001 ether;
        require(
            prizeAmount <= address(this).balance,
            "Trying to withdraw more money than the contract has."
        );
        (bool success, ) = (msg.sender).call{value: prizeAmount}("");
        require(success, "Failed to withdraw money from contract.");
    }

    function getAllWaves() public view returns (Wave[] memory) {
        return waves;
    }

    function getTotalWave() public view returns(uint){
        return noOfWaves;
    }

}
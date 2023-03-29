// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract find_mapping{

    mapping(address => uint256) balance;

    function deposit(uint256 amount) public{ 
        balance[msg.sender] = balance[msg.sender] + amount;
    }

    function checkbalance() public view returns(uint256 amount){
        return balance[msg.sender];
    }

}
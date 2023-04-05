// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract A{
    address public immutable owner;
    uint public immutable FEE;

    constructor(uint _fee){
        owner = msg.sender;
        FEE = _fee;
    }

}

contract B is A{

    address public owner_B;

    constructor(uint _fee) A(_fee){
        owner_B = msg.sender;
    }
    
    function getFee_a() public view returns(uint fee){
        return A.FEE;
    }

    function getFee_b() public view returns(uint fee){
        return FEE;
    }

    function getOwner_a() public view returns(address owner){
        return A.owner;
    }

    function getOwner_b() public view returns(address owner){
        return owner_B;
    }

}
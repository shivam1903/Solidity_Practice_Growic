// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Working_Struct{

    struct User_details{
        string _name;
        uint256 _age;

    }

    mapping(address => User_details) get_deets;

    function setUserDetails(string calldata name, uint256 age) public{

        User_details memory new_deets;
        new_deets._name = name;
        new_deets._age = age;
        address user = msg.sender;
        get_deets[user] = new_deets;
    }

    function getUser_details() public view returns(string memory name, uint256 age){

        User_details memory stored_deets = get_deets[msg.sender];
        return(stored_deets._name, stored_deets._age);
    }


}
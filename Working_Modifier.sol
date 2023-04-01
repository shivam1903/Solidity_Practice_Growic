// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;


contract Working_Modifier{

    address owner;
    uint256 total_funds;
    uint256 constant private Fee = 10;

    constructor(){
        owner = msg.sender;
        total_funds = 0;
    }

    error AmountTooSmall();


    mapping (address => uint256) amount_deposited;

    modifier onlyOwner(){
        require(msg.sender == owner, "Sender is not owner");
        _;
    }

    modifier did_not_dep_before(){
        require(amount_deposited[msg.sender] == 0, "Person has already donated");
        _;
    }

    modifier dep_before(){
        require(amount_deposited[msg.sender] != 0, "You first need to deposit something");
        _;
    }

    modifier valid_amount(uint256 amount_a){
        if(amount_a < Fee){
            revert AmountTooSmall();
        }
        _;
    }

    function deposit_funds(uint256 amount_f) public{
        amount_deposited[msg.sender] = amount_f;
        total_funds = total_funds + amount_f;
    }

    function withdraw_funds(uint256 w_funds) public onlyOwner dep_before{
        if(w_funds < amount_deposited[msg.sender]){
            amount_deposited[msg.sender] = amount_deposited[msg.sender] - w_funds;
        }
    }

    function add_funds(uint256 funds_a) public dep_before valid_amount(funds_a){
        amount_deposited[msg.sender] = amount_deposited[msg.sender] + funds_a;
        total_funds = total_funds + funds_a;
    }

}
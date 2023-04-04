// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;


contract Bank{

    address payable public owner;
    uint256 total_funds;
    uint256 constant private Fee = 10;

    event Log(string func_name, address sender_a, uint value, bytes data);

    constructor(){
        owner = payable(msg.sender);
        total_funds = 0;
    }

    error AmountTooSmall();

    event FundsDeposited(address user, uint256 amount);

    event ProfileUpdated(address user);

    fallback() external payable{
        emit Log("fallback", msg.sender, msg.value, msg.data);
    }

    receive() external payable{
        emit Log("receive", msg.sender, msg.value, "");
    }


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
        emit ProfileUpdated(user);
    }

    function getUser_details() public view returns(string memory name, uint256 age){

        User_details memory stored_deets = get_deets[msg.sender];
        return(stored_deets._name, stored_deets._age);
    }

    function deposit() public payable{
        amount_deposited[msg.sender] = msg.value;
        total_funds = total_funds + msg.value;
        emit FundsDeposited(msg.sender, msg.value);
    }

    function withdraw_funds(uint256 w_funds) public onlyOwner dep_before{
        if(w_funds < amount_deposited[msg.sender]){
            amount_deposited[msg.sender] = amount_deposited[msg.sender] - w_funds;
        }
    }

    function add_funds(uint256 funds_a) public dep_before valid_amount(funds_a){
        amount_deposited[msg.sender] = amount_deposited[msg.sender] + funds_a;
        total_funds = total_funds + funds_a;
        emit FundsDeposited(msg.sender, funds_a);
    }

}
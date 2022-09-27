// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;


contract FeeCollector { 
    address public owner;
    uint256 public balance;
    
    constructor() {

        owner = msg.sender;  //
    }
    // to send ether to an address, the address must be 'payable'!
    receive() payable external {
        balance += msg.value; 
    }
    
    
    function withdraw(uint amount, address payable destAddr) public {
        require(msg.sender == owner, "Only owner can withdraw"); //check the owner
        require(amount <= balance, "Insufficient funds"); //check the amount whether it is enough 
        
        destAddr.transfer(amount); 
        balance -= amount;
    }
}
pragma solidity ^0.8.0;
// SPDX-License-Identifier: Unlicense

contract FunctionExample {
    address public owner;
    mapping(address => uint) public balances;

    constructor() {
        owner = msg.sender;
    }

    int public x;

    // This function is called for plain Ether transfers, i.e.
    // for every call with empty calldata.
    receive() external payable {
        x = 1;
        balances[msg.sender] += msg.value;
    }

    // This function is called for all messages sent to
    // this contract, except plain Ether transfers
    // (there is no other function except the receive function).
    // Any call with non-empty calldata to this contract will execute
    // the fallback function (even if Ether is sent along with the call).
    fallback () external payable {
        x = 2;
        balances[msg.sender] += msg.value;
    }
}
pragma solidity ^0.8.0;
// SPDX-License-Identifier: Unlicense

contract MappingStructExample {

    struct Payment {
        uint amount;
        uint timestamp;
    }

    struct Balance {
        uint totalBalance;
        uint numPayments;
        mapping(uint => Payment) payments;
    }

    mapping(address => Balance) public balanceSent;


    function getBalance() public view returns(uint) {
        return address(this).balance;
    }

    function sendMoney() public payable {
        balanceSent[msg.sender].totalBalance += msg.value;

        Payment memory newPayment = Payment({
            amount: msg.value,
            timestamp: block.timestamp
        });
        balanceSent[msg.sender].payments[balanceSent[msg.sender].numPayments] = newPayment;
        balanceSent[msg.sender].numPayments += 1;
    }

    function withdrawMoney(address payable _receiver, uint _amount) public {
        require(balanceSent[msg.sender].totalBalance >= _amount, "Insufficient balance!");
        balanceSent[msg.sender].totalBalance -= _amount;

        _receiver.transfer(_amount);
    }

    function withdrawAllMoney(address payable _receiver) public {
        uint amount = balanceSent[msg.sender].totalBalance;
        balanceSent[msg.sender].totalBalance = 0;

        _receiver.transfer(amount);
    }
}

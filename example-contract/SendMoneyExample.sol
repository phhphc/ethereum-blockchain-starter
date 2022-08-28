pragma solidity ^0.8.0;
// SPDX-License-Identifier: Unlicense 

contract SendMoneyExample{

    function receiveMoney() public payable {

    }

    function getBalance() public view returns(uint) {
        return address(this).balance;
    }

    function withdrawMoney() public {
        address payable receiver = payable(msg.sender);

        receiver.transfer(this.getBalance());
    }

    function withdrawMoneyTo(address payable _receiver) public {
        _receiver.transfer(this.getBalance());
    }
}

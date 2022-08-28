pragma scontract pragma solidity ^0.8.0;
// SPDX-License-Identifier: Unlicense

contract StartStopUpdateExample {
    address owner;
    bool public paused;

    constructor() {
        owner = msg.sender;
    }

    function sendMoney() public payable {

    }

    function setPause(bool _paused) public {
        require(msg.sender == owner, "Permission denied!");

        paused = _paused;
    }

    function withdrawAllMoney(address payable _receiver) public {
        require(msg.sender == owner, "Permission denied!");
        require(!paused, "Contract is paused");

        _receiver.transfer(address(this).balance);
    }

    function destroyContract() public {
        require(msg.sender == owner, "Permission denied!");
        
        selfdestruct(payable(msg.sender));
    }
} {
    address owner;
    bool public paused;

    constructor() {
        owner = msg.sender;
    }

    function sendMoney() public payable {

    }

    function setPause(bool _paused) public {
        require(msg.sender == owner, "Permission denied!");

        paused = _paused;
    }

    function withdrawAllMoney(address payable _receiver) public {
        require(msg.sender == owner, "Permission denied!");
        require(!paused, "Contract is paused");

        _receiver.transfer(address(this).balance);
    }

    function destroyContract() public {
        require(msg.sender == owner, "Permission denied!");
        
        selfdestruct(payable(msg.sender));
    }
}

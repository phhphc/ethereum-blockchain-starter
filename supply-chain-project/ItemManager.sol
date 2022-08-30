pragma solidity ^0.8.0;
// SPDX-License-Identifier: Unlicense

contract ItemManagement {
    enum SupplyChainSteps{Created, Paid, Delivered}

    struct Item {
        SupplyChainSteps step;
        string identifier;
        uint price;
    }

    mapping(uint => Item) items;
    uint index;

    event SupplyChainStep(uint _itemIndex, uint _step);

    function createItem(string memory _identifier, uint _price) public {
        items[index].step = SupplyChainSteps.Created;
        items[index].identifier = _identifier;
        items[index].price = _price;

        emit SupplyChainStep(index, uint(items[index].step));
        index++;

    }

    function triggerPayment(uint _itemIndex) public payable {
        require(msg.value >= items[_itemIndex].price, "Not enough money!");
        require(items[_itemIndex].step == SupplyChainSteps.Created, "Item is further in the suplly chain");

        items[_itemIndex].step = SupplyChainSteps.Paid;
        emit SupplyChainStep(_itemIndex, uint(items[_itemIndex].step));
    }

    function triggerDelivery(uint _itemIndex) public {
        require(items[_itemIndex].step == SupplyChainSteps.Paid, "Item is further in the suplly chain");
       
        items[_itemIndex].step = SupplyChainSteps.Delivered;
        emit SupplyChainStep(_itemIndex, uint(items[_itemIndex].step));
    }
}
// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

// Store contract
contract Storage {
    uint public storeValue;

    constructor(uint initialValue) {
        storeValue = initialValue;
    }

    function updateValue(uint value) external {
        storeValue = value;
    }
}

// Business Logic v1
contract BusinessLogicV1 {

    Storage private storageContract;

    constructor(address storeAddress) {
        storageContract = Storage(storeAddress);
    }

    function getValue() external view returns(uint) {
        return storageContract.storeValue();
    }

    function incrementValue(uint amount) external {
        uint currentValue = storageContract.storeValue();
        storageContract.updateValue(currentValue + amount);
    }
}

// Business Login v2
contract BusinessLogicV2 {

    Storage private storageContract;

    constructor(address storeAddress) {
        storageContract = Storage(storeAddress);
    }

    function getValue() external view returns(uint) {
        return storageContract.storeValue();
    }

    function incrementValue(uint amount) external {
        uint currentValue = storageContract.storeValue();
        storageContract.updateValue(currentValue + amount);
    }

    function decrementValue(uint amount) external {
        uint currentValue = storageContract.storeValue();
        require(currentValue >= amount, "Amount should be grater then current value");
        storageContract.updateValue(currentValue - amount);
    }
}
// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract Escrow {
    address public funder;

    address public beneficiary;

    function fund(address _beneficiary) public payable {
        funder = msg.sender;
        beneficiary = _beneficiary;
    }

    function release() public payable {
        require(funder == msg.sender, "You are not funder");

        payable(beneficiary).transfer(address(this).balance);
    }

    function getBalance() public view returns(uint256) {
        return address(this).balance;
    } 
}

contract Escrow_Update {
    struct Beneficiary {
        address beneficiary;
        uint256 amount;
    }

    mapping(address => mapping(address => Beneficiary)) public funders;

    function fund(address _beneficary) public payable {
        funders[msg.sender][_beneficary] = Beneficiary({
            beneficiary: _beneficary,
            amount: msg.value
        });
    }

    function release(address _beneficary) public payable {
        require(address(this).balance >= funders[msg.sender][_beneficary].amount, "Amount not available");

        address payable beneficiary = payable(_beneficary);
        uint256 amount = funders[msg.sender][_beneficary].amount;
        funders[msg.sender][_beneficary].amount = 0; // Set the amount to zero after transfer
        beneficiary.transfer(amount);
    }

    function getBalance() public view returns(uint256) {
        return address(this).balance;
    }
}
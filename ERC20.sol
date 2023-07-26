// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract ERC20 {
    string public name;
    string public symbol;
    uint public decimals;
    uint256 public totalSupply;

    mapping(address => uint256) public balanceOf;
    
    event Transfer(address indexed from, address indexed to, uint256 value);

    constructor(string memory _name, string memory _symbol, uint _decimals, uint256 _initialSupply) {
        name = _name;
        symbol = _symbol;
        decimals = _decimals;
        totalSupply = _initialSupply * 10**_decimals;
        balanceOf[msg.sender] = totalSupply;
    }

    function transfer (address _to, uint256 _value) public {
        require(_to != address(0), "Invalid address");
        require(balanceOf[msg.sender] >= _value, "You don't have enought balance to transfer");

        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;

        emit Transfer(msg.sender, _to, _value);
    }
 
}
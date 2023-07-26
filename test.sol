// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract Sum {
    //Declaring state variables
    uint public var1;
    uint public var2;
    uint public sum;

    //Define public function to
    //set the state variables
    function set(uint x, uint y) public {
        var1 = x;
        var2 = y;
        sum = var1 + var2;
    }

    //Print value of state variables
    function get() public view returns (uint) {
        return sum;
    }
}

contract GlobalVariableExample {
    event SenderAndValue(address sender, uint value);

    function getSenderAndValue() public payable {
        address sender = msg.sender;
        uint value = msg.value;
        emit SenderAndValue(sender, value);
    }
}

contract Type {
    uint[] public data;
    uint[] data1;

    uint j = 0;
    uint i = 11;

    function loop() public returns(uint[] memory){
        while(j < 5) {
            j++;
            data.push(j);
        }
      return data;
    }

    function decision_making() public view returns(string memory) {
        if (i < 10) {
            return "Less then 10";
        } else if (i == 10) {
            return "Equal to 10";
        } else {
            return "Grater then 10";
        }
    }

    function dynamic_array(uint x) public returns(uint[] memory) {
        data1.push(x);
        return data1;
    }

    function array_element(uint x) public view returns(uint) {
        return data1[x];
    }
}
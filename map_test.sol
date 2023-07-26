// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract mapping_example {
    address admin;
    struct Student {
        uint id;
        string class;
        string name;
    }

    constructor() {
        admin = msg.sender;
    }

    mapping(uint => Student) public students;

    uint public total_students = 0;

    

    modifier isAdmin {
         require(admin == msg.sender, "You are not authorize.");
        _;
    }

    function add_student(string memory _class, string memory _name) public isAdmin {

        // require(bytes(students[total_students].name).length == 0, "Student details already set");
        total_students++;
        Student memory newStudent = Student({
            id: total_students,
            name: _name,
            class: _class
        });
        students[total_students] = newStudent;
    }
}
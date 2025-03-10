// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract SimpleStorage {
    uint256 public value; //public creates default getter for the variable
    uint256 secretValue = 56;

    //setter function to the value
    function setVal(uint256 _value) public {
        value = _value;
    }

    //view to just read only ,no transcation required and can't make any state change inside view
    function getVal() public view returns(uint256){
        return secretValue;
    }

    //with pure we don't make any state change also we don't ready anything from the blockchain
    function purefunction() public pure returns(uint256){
        return 7;
    }
    //default view and pure does't cost gas but if a function which cost gas calls it then calling these will also cost gas.
    function specialFunction(uint256 _inputValue) public {
        value = _inputValue;
        purefunction(); //in this function even this pure function will cost gas.
    }

    //struct datatype
    struct Student{
        uint256 id;
        string name;
    }
    //diff ways to declare variables of struct type
    Student public student1 = Student(0,"Rohit");
    Student public student2 = Student({id: 4,name:"Deepak"});

    //dynamic array ,Student[3] this is an static array
    Student[] public list;

    //most of the input params are default to memory but for string we have to write memory explicitly beacuse string is an array we need to add storage type for struct mapping and array.
    //memory and calldata means these variables not need to be stored on blockchain and will only be used during execution.
    function addStudent(uint256 id,string memory _name) public {
        //Student memory newStudent = Student(id,_name);
        //list.push(newStudent);
        list.push(Student(id,_name));
    }

    /*diff bewteen memory and calldata is memory variable can be modified while call data variable could't eg we have passed
    name string with memory keyword we can modify name inside addStudent function and then store it but if it was calldata
    we can't modify it */
    
    //map key value pair
    mapping(string => uint256) public marks;

    //adding data to map
    function addToMap(string memory name,uint256 _marks) public {
        marks[name] = _marks;
    }

}

contract simpleStorage2{}
contract simpleStorage3{}
contract simpleStorage4{}


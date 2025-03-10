// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
//importing the simple storage contract
//import "./simpleStorage.sol";
//below is named import used when multiplecontracts are present inside the same file
import {SimpleStorage} from "./simpleStorage.sol";
contract storageFactory{
    //creating a variable of that contract so that it can be used inside this contract.
    SimpleStorage public simpleStorage;

    //creating list of the deployed contracts
    SimpleStorage[] public listOfSimpleStorage;

    //function for deploying simplestorage contract using storage factory.
    function createSimpleStorageContract() public {
      SimpleStorage newSimpleStorage = new SimpleStorage();
      listOfSimpleStorage.push(newSimpleStorage);
    }
    //after deployement simpleStorage variable will show deployed contract address

    //calling a function of deployed contract
    function calladdStudent(uint256 simpleStorageIndex,string memory name,uint256 id) public {
        SimpleStorage mySimpleStorage = listOfSimpleStorage[simpleStorageIndex];
        mySimpleStorage.addStudent(id, name);
    }

   //for each deployed contract we fetching the name of student for thats contract so we need two inputs first for contract and second for student index beacuse each contract contains an array
   function getStudent(uint256 simpleStorageIndex, uint256 studentIndex) public view returns (uint256, string memory) {
    SimpleStorage mySimpleStorage = listOfSimpleStorage[simpleStorageIndex];
    (uint256 id, string memory name) = mySimpleStorage.list(studentIndex); // Accessing struct components directly
    return (id, name);
}

}
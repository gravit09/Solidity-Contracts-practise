// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
import {SimpleStorage} from "./simpleStorage.sol";

//overide kwyword allows us to overide the inherited contract functions Note function which is being inherited should have virtual keyword
contract sampleContract is SimpleStorage{
    function setVal(uint256 _value) public override {
         value = _value+5;
    }
}
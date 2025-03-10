// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
import {SimpleStorage} from "./simpleStorage.sol";
contract sampleContract is SimpleStorage{
    function setVal(uint256 _value) public override {
         value = _value+5;
    }
}
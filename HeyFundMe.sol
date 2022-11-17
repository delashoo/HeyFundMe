//SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract FundMe {
    
    mapping (address => uint256) AddressToAmountFunded;

    function Fund() public payable {
        AddressToAmountFunded[msg.sender] += msg.value;
    }
    
    function GetVersion() public view returns (uint256) {
        AggregatorV3Interface priceFeed = AggregatorV3Interface();
    }
}
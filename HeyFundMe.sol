//SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract FundMe {
    
    mapping (address => uint256) AddressToAmountFunded;

    function Fund() public payable {
        AddressToAmountFunded[msg.sender] += msg.value;
    }
    
    function GetVersion() public view returns (uint256) {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e);
        return priceFeed.version();
    }

    function GetPrice() public view returns (uint256) {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e);
        (,int256 answer,,,) = priceFeed.latestRoundData();
        return uint256(answer);
    }

    function GetConversionRate(uint256 ethAmount) public view returns (uint256) {
        uint256 ethPrice = GetPrice();
        uint256 ethAmountInUSd = (ethPrice * ethAmount) / 1000000000000000000 ;
        return ethAmountInUSd;
    }
}
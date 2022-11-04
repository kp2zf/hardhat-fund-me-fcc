// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

library PriceConverter {

    function getPrice(AggregatorV3Interface priceFeed) internal view returns(uint256) {
    // need ABI 
    // address 0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e 
    // AggregatorV3Interface priceFeed = AggregatorV3Interface(0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e);
    (, int price,,,) = priceFeed.latestRoundData(); // price = price of ETH in USD
    return uint256(price * 1e10); // price has 8 decimal places and need to add 10 more to get 18 to match fund function 
    }

    function getConversionRate(uint256 ethAmount, AggregatorV3Interface priceFeed) internal view returns (uint256){
        uint256 ethPrice = getPrice(priceFeed);
        return (ethPrice * ethAmount) / 1e18;
    }
}
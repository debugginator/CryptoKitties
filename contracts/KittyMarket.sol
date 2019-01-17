pragma solidity ^0.5.0;

import "./KittyOwnership.sol";

contract KittyMarket is KittyOwnership {
    mapping (uint32 => uint32) public kittyIndexToPrice;

    function putKittyUpForSale(uint32 kittyId, uint32 price) external {
      require(ownerOf(kittyId) == msg.sender);
      kittyIndexToPrice[kittyId] = price;
    }

    function cancelSale(uint32 kittyId) external {
      require(ownerOf(kittyId) == msg.sender);
      delete kittyIndexToPrice[kittyId];
    }

    function buyKitty(uint32 kittyId) external payable {
      uint32 price = kittyIndexToPrice[kittyId];
      
      require(price >= 0);
      require(msg.value >= price);

      delete kittyIndexToPrice[kittyId];
      safeTransferFrom(ownerOf(kittyId), msg.sender, kittyId);
    }
}
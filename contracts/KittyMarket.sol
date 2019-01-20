pragma solidity ^0.5.0;

import "./KittyOwnership.sol";

contract KittyMarket is KittyOwnership {
    mapping (uint32 => uint32) public kittyIndexToPrice; // in wei

    function putKittyUpForSale(uint32 kittyId, uint32 price) external {
      require(ownerOf(kittyId) == msg.sender);
      require(kitties[kittyId].birthTime != 0);
      kittyIndexToPrice[kittyId] = price;
    }

    function cancelSale(uint32 kittyId) external {
      require(ownerOf(kittyId) == msg.sender);
      kittyIndexToPrice[kittyId] = 0;
    }

    function buyKitty(uint32 kittyId) external payable {
      uint32 price = kittyIndexToPrice[kittyId];

      require(ownerOf(kittyId) != msg.sender);
      require(price > 0);
      require(msg.value >= price);

      kittyIndexToPrice[kittyId] = 0;
      safeTransferFrom(ownerOf(kittyId), msg.sender, kittyId);
    }

    function getKittyPrice(uint32 kittyId) view public returns (uint32){
      return kittyIndexToPrice[kittyId];
    }
}

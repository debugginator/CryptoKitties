pragma solidity ^0.5.0;

import "./KittyOwnership.sol";

contract KittyMarket is KittyOwnership {
  /* Price of 0 means kitty is not for sale */
  mapping (uint32 => uint256) public kittyIndexToPrice;

  function putKittyUpForSale(uint32 kittyId, uint256 price) external {
    require(ownerOf(kittyId) == msg.sender);
    kittyIndexToPrice[kittyId] = price;
  }

  function cancelSale(uint32 kittyId) external {
    require(ownerOf(kittyId) == msg.sender);
    kittyIndexToPrice[kittyId] = 0;
  }

  function buyKitty(uint32 kittyId) external payable {
    uint256 price = kittyIndexToPrice[kittyId];
    address payable owner = address(uint160(ownerOf(kittyId)));

    require(owner != msg.sender);
    require(price > 0);
    require(msg.value >= price);

    kittyIndexToPrice[kittyId] = 0;
    _transferFrom(ownerOf(kittyId), msg.sender, kittyId);
    owner.transfer(msg.value);
  }
}
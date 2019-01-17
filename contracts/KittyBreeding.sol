pragma solidity ^0.5.0;

import "./KittyOwnership.sol";

contract KittyBreeding is KittyOwnership {

  function breedWith(uint32 parent1Id, uint32 parent2Id) 
    public
    returns(uint)
  {
    // Check ids
    require(parent1Id >= 0 && parent2Id >= 0);

    // Kitty cannot breed itself
    require(parent1Id != parent2Id);

    // Check ownership
    require(ownerOf(parent1Id) == msg.sender);
    require(ownerOf(parent2Id) == msg.sender);

    // Grab a reference to the Kitties from storage.
    Kitty storage parent1 = kitties[parent1Id];
    Kitty storage parent2 = kitties[parent2Id];

    // Check both are valid kittens
    require(parent1.birthTime != 0 && parent2.birthTime != 0);

    // Create kitty
    uint16 generation = uint16(max(parent1.generation, parent2.generation) + 1);
    uint256 geneticCode = cantorPairingFunction(parent1.geneticCode, parent2.geneticCode);
    uint kittyId = _createKitty(msg.sender, geneticCode, parent1Id, parent2Id, generation);

    // Create new token and give ownership
    mint(msg.sender, uint256(kittyId));
    return kittyId;
  }

  function cantorPairingFunction(uint a, uint b) private pure returns (uint) {
    return (a+b)*(a+b+1)*b/2;
  }

  function max(uint a, uint b) private pure returns (uint) {
      return a > b ? a : b;
  }
}
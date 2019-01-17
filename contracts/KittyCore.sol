pragma solidity ^0.5.0;

import "./KittyBreeding.sol";
import "./KittyMarket.sol";

contract KittyCore is KittyBreeding, KittyMarket {
  modifier noKittiesExist {
    require(kitties.length == 0);
    _;
  }

  function createFirstKitties() noKittiesExist public {
    uint256 geneticCode1 = 23;
    uint256 geneticCode2 = 27;
    uint32 parent1_id = 0;
    uint32 parent2_id = 0;
    uint16 generation = 0;

    uint kitty1Id = _createKitty(
        msg.sender, geneticCode1, parent1_id, parent2_id, generation
    );
    // Create new token and give ownership
    mint(msg.sender, uint256(kitty1Id));

    uint kitty2Id = _createKitty(
        msg.sender, geneticCode2, parent1_id, parent2_id, generation
    );// Create new token and give ownership
    mint(msg.sender, uint256(kitty2Id));
  }
}
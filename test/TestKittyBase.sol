pragma solidity ^0.5.0;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/KittyBase.sol";

contract TestKittyBase {

  // function testCreateFirstKitty() public {
  //   KittyBase kittyBase = KittyBase(DeployedAddresses.KittyBase());
    
  //   uint256 geneticCode = 213312351234;
  //   uint32 parent1_id = 1;
  //   uint32 parent2_id = 2;
  //   uint16 generation = 3;

  //   uint32 kittyId = uint32(
  //     kittyBase.createKitty(
  //       DeployedAddresses.KittyBase(), // passing the contract itself as owner
  //       geneticCode, parent1_id, parent2_id, generation
  //     )
  //   );

  //   uint expected = uint32(0);
  //   uint actual = uint32(kittyId);
  //   string memory error_message = 
  //     "Function createKitty was expected to return the index 0 after creation of the first kitty on the contract.";

  //   Assert.equal(
  //     actual,
  //     expected,
  //     error_message);
  // }

  // function testGetKittyById() public {
  //   KittyBase kittyBase = KittyBase(DeployedAddresses.KittyBase());
    
  //   uint256 geneticCode = 213312351234;
  //   uint32 parent1_id = 1;
  //   uint32 parent2_id = 2;
  //   uint16 generation = 3;

  //   uint32 kittyId = uint32(
  //     kittyBase.createKitty(
  //       DeployedAddresses.KittyBase(), // passing the contract itself as owner
  //       geneticCode, parent1_id, parent2_id, generation
  //     )
  //   );

  //   ( uint _geneticCode,
  //     uint _parent1_id,
  //     uint _parent2_id,
  //     uint _generation ) = kittyBase.getKittyById(kittyId);
    
  //   string memory error_message = "Function getKittyById returned unexpected value(s).";

  //   Assert.equal(
  //     uint(geneticCode),
  //     _geneticCode,
  //     error_message);
  //   Assert.equal(
  //     uint(parent1_id),
  //     _parent1_id,
  //     error_message);
  //   Assert.equal(
  //     uint(parent2_id),
  //     _parent2_id,
  //     error_message);
  //   Assert.equal(
  //     uint(generation),
  //     _generation,
  //     error_message);
  // }

}

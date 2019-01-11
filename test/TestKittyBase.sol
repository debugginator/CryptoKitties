pragma solidity ^0.5.0;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/KittyBase.sol";

contract TestKittyBase {

  function testCreateFirstKitty() public {
    KittyBase kittyBase = KittyBase(DeployedAddresses.KittyBase());

    uint expected = uint32(0);
    uint actual = uint32(kittyBase.createKitty(
      DeployedAddresses.KittyBase(), // passing the contract itself as owner
      213312351234, 0, 0, 0
      )
    );
    string memory error_message = 
      "Function createKitty was expected to return the index 0 after creation of the first kitty on the contract.";

    Assert.equal(
      actual,
      expected,
      error_message);
  }

}

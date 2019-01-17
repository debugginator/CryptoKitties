const KittyOwnership = artifacts.require("KittyOwnership");

contract("KittyOwnership", accounts => {
  it("Should create a token for the 0-idx kitty and give ownership to account 0.", () => {
    let ownership;

    KittyOwnership.deployed()
      .then(instance => { // Create our token
        ownership = instance;
        return instance.mint(accounts[0], 0);
      })
      .then(success => {  // Inquire balance of token owner
        assert.true(success);
        return ownership.balanceOf(accounts[0])
      })
      .then(balance => { // Inquire owner of token
        assert.equal(balance, 1);
        return ownership.ownerof(0);
      })
      .then(owner => {
        assert.equal(owner, accounts[0]);
      });
  
  });
});
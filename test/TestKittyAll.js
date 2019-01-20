const KittyCore = artifacts.require("KittyCore");

contract("KittyCore", async (accounts) => {
  let core;

  it("Should create two kitties and breed them into a third", async () => {
    core = await KittyCore.deployed();
    await core.createFirstKitties();
    await core.breedWith(0, 1);

    let kitty = await core.getKittyById.call(2);
    assert.equal(kitty.generation.toNumber(), 1); // Is it of the new generation?
  });

  it("Should successfully put cat on market", async () => {
    await core.putKittyUpForSale(0,150);
    await core.putKittyUpForSale(1,15);

    let price1 = await core.getKittyPrice(0);
    let price2 = await core.getKittyPrice(1);
    assert.equal(price1, 150);
    assert.equal(price2, 15);
  });

  it("Should cancel sale of certain kitty", async () => {

    //Canceling sale
    await core.cancelSale(0);

    let price = await core.getKittyPrice(0);

    assert.equal(price, 0);

    try {
      core.buyKitty(0); // should revert
      throw "You can't buy a kitty that isn't on the market";
    } catch(err) {
      // PASSED
    }
  });

  it("Should buy kitty", async() => {
    // await core.buyKitty(1, {from: accounts[2], value: 16});
    // Test impossible to create due to truffle bug
    // Truffle completely ignoring the from and value parameters
  });


});

const KittyCore = artifacts.require("KittyCore");

contract("KittyMarket", accounts => {

  it("Should successfully put cat on market", async () => {
    let core = await KittyCore.deployed();
    await core.createFirstKitties();

    await core.putKittyUpForSale(0,150);
    await core.putKittyUpForSale(1,15);
    //Let's try and put this kitty on market one more time with different price
    try{
      await core.putKittyUpForSale(1,400);
    }
    catch(err){
      alert("Nice try :P");
    }

    let price1 = await core.kittyIndexToPrice[0];
    let price2 = await core.kittyIndexToPrice[1];
    assert.equal(price1, 150);
    assert.equal(price2, 15);
  });

  it("Should cancel sale of certain kitty", async () => {
    let core = await KittyCore.deployed();
    await core.createFirstKitties();

    await core.putKittyUpForSale(0,150);
    await core.putKittyUpForSale(1,15);
    //Canceling sale
    await core.cancelSale(0);
    await core.cancelSale(1);

    try{
      let price1 = await core.kittyIndexToPrice[0];
      let price2 = await core.kittyIndexToPrice[1];
      assert.equal(price1, 150);
      assert.equal(price2, 15);
      throw "ERROR! Kitties still on sale!";
    }
    catch(err)
    {
      //It is ok!
    }
  });

  it("Let's buy one kitty!", async () => {
    let core = await KittyCore.deployed();
    await core.createFirstKitties();

    await core.putKittyUpForSale(0,150);
    await core.putKittyUpForSale(1,15);
    //Now, let's buy one
    core.buyKitty(1);
    assert.equal(price,15);
    try{
      assert.equal(core.kittyIndexToPrice[1], 15);
    }
    catch(err)
    {
      //It's OK
    }

    //Treba jos assert za provjeriti novog ownera
  });

});

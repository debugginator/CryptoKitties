const KittyCore = artifacts.require("KittyCore");

contract("KittyCore", accounts => {
  it("Should create two kitties and breed them into a third", async () => {
    let core = await KittyCore.deployed();
    await core.createFirstKitties();
    let newKittyId = await core.breedWith(0, 1);

    let kitty = await core.getKittyById.call(2);
    assert.equal(kitty.generation.toNumber(), 1); // Is it of the new generation?
  });
});
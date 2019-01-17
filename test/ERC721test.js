// const KittyCore = artifacts.require("KittyCore");

// contract("KittyOwnership(+core)", accounts => {
//   it("Should create first two kitties and give ownerships to first two accounts respectfully.",
//     () => {
//       let ownership;

//       return KittyCore.deployed()
//         .then(instance => { // Create our token
//           ownership = instance;
//           return instance.createFirstKitties();
//         })
//         .then(() => {
//           return ownership.balanceOf(accounts[0]);
//         })
//         .then(balance => { // Assert owner's balance
//           console.log("BALAZI" + balance);
//           assert.equal(balance.toNumber(), 1);
//           return ownership.ownerof(0);
//         })
//         .then(owner => { // Assert token's owner
//           assert.equal(owner, accounts[0]);
//         });
//     });
// });
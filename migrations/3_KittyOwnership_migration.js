var KittyOwnership = artifacts.require("KittyOwnership");

module.exports = function(deployer) {
  // deployment steps
  deployer.deploy(KittyOwnership);
};
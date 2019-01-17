var KittyBreeding = artifacts.require("KittyBreeding");

module.exports = function(deployer) {
  // deployment steps
  deployer.deploy(KittyBreeding);
};
var KittyCore = artifacts.require("KittyCore");

module.exports = function(deployer) {
  // deployment steps
  deployer.deploy(KittyCore);
};
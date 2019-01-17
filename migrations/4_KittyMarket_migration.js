var KittyMarket = artifacts.require("KittyMarket");

module.exports = function(deployer) {
  // deployment steps
  deployer.deploy(KittyMarket);
};
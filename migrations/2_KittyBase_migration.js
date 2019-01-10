var KittyBase = artifacts.require("KittyBase");

module.exports = function(deployer) {
  // deployment steps
  deployer.deploy(KittyBase);
};
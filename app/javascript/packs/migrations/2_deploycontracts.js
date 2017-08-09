var coder = artifacts.require("./Coder.sol");

module.exports = function(deployer) {
  deployer.deploy(coder);
};


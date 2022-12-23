const DeSkillVerify = artifacts.require("DeSkillVerify")
// Deploy the smart contract DeSkillVerify
module.exports = function (deployer) {
  deployer.deploy(DeSkillVerify)
}

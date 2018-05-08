const InnoCoin = artifacts.require('./DHCoin.sol')

module.exports = (deployer) => {
    let initialSupply = 1000000e18
    let maxSupply = 100000000e18
    deployer.deploy(InnoCoin, initialSupply, maxSupply, {
        gas: 2000000
    })
}
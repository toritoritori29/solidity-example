// const _deploy_contracts = require("../example2/migrations/2_deploy_contracts");

const ExampleNFT = artifacts.require("ExampleNFT");

contracts("ExampleNFT", accounts => {
    ExampleNFT.deployed()
        .then(instance => instance.getBalance.call(accounts[0]));
});
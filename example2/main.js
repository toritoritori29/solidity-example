
// const Web3 = require("web3");
const ExampleNFTJson = require("./build/contracts/ExampleNFT.json");

// 生成したコントラクトのアドレスを指定してインスタンスを獲得
const creator = "0x371a0dB53F723eBC1D2a2dFBfaAB9Bb0D941Ea6e";
const contractAddress = "0xB25B7e54Ce9793616F59ceEf40De6D26eEF6475E";
// const web3 = new Web3("ws://localhost:8545");

// callとsendの2種類の呼び出し方法が存在する
// callはview関数・pure関数とブロックチェーン上のステート変更が生じないもの
// contract.methods.getMethod(123).call();
// let account = web3.eth.accounts[0];


// contract.method.s
// let account = web3.personal.newAccount("test");



module.exports = async (config) => {
    let accounts = await web3.eth.getAccounts();
    const nft = new web3.eth.Contract(ExampleNFTJson.abi, contractAddress);

    for (let account of accounts) {
        await nft.methods.safeMint(account).send({ from: creator, gas: 1000000});
        let count = await nft.methods.balanceOf(account).call();

        // それぞれのアカウントが所有するトークンを表示する
        console.log(`Account: ${account}`);
        console.log(`[*] Owned nft number ${count}`);
        for (let i=0; i<count; i++) {
            let tokenId = await nft.methods.tokenOfOwnerByIndex(account, i).call();
            console.log(`[${i}] ${tokenId}`);
        }
        console.log("")
    }

    for (let accountIdx=0; accountIdx<accounts.length; i++) {
        nft.methods.safeTransfer().send();

    }
}

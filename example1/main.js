
const Faucet = require("./build/contracts/Faucet.json");

async function printBalance(address) {
    let balance = await web3.eth.getBalance(address);
    console.log(`Current Contract Balance: ${balance}`);
}

module.exports = async (callback) => {
    // 第1引数にデプロイしたコントラクトアドレスを指定する

    // truffle標準にいい感じで引数を取る方法が無さそうなのでprocess.argvから気合で取る
    const argv = process.argv.slice(4);
    const contractAddress = argv[0];
    console.log(`Contract Address: ${contractAddress}`);
    const faucet = new web3.eth.Contract(Faucet.abi, contractAddress);

    // Mainとなるアカウントを指定
    const accounts = await web3.eth.getAccounts();
    const mainAccount = accounts[0];

    // メインアカウントからFaucetに1ether預け入れ
    console.log("[*] Deposit 1 ether")
    await printBalance(contractAddress);
    await web3.eth.sendTransaction({
        from: mainAccount,
        to: contractAddress,
        value: web3.utils.toWei("0.1", 'ether')
    });
    await printBalance(contractAddress);
    console.log("");

    console.log("[*] Withdraw from each account.")
    await printBalance(contractAddress);
    for(let account of accounts) {
        await faucet.methods.withDraw(web3.utils.toWei("0.001", "ether")).send({
            from: account
        });
    }
    await printBalance(contractAddress);
}


pragma solidity >=0.6.0;

contract Faucet {
    // 指定した額を送金する関数. soliditiyにおける通貨の基本単位はweiであることに注意
    // msg.senderに対して明示的にpayableであることを指定する必要あり
    function withDraw(uint withdraw_amount) public {
        require(withdraw_amount <= 0.01 ether);
        payable(msg.sender).transfer(withdraw_amount);
    }    

    // Mastering Etheriumからsolidityの文法に変更が加わっている
    // 0.6以降はfallback関数の明示的な指定が必要
    receive() external payable {}
}
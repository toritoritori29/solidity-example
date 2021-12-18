// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Faucet {

    // state variables (訳が分からない状態変数でOK?)
    address owner;

    // event類
    event WithDraw(address indexed, uint amount);
    event Deposit(address indexed, uint amount);

    constructor() {
        // 作成者を記録
        owner = msg.sender;
    }

    // 指定した額を送金する関数. soliditiyにおける通貨の基本単位はweiであることに注意
    // msg.senderに対して明示的にpayableであることを指定する必要あり
    function withDraw(uint withdraw_amount) public {
        require(withdraw_amount <= 0.01 ether);
        // transferメソッドはaddress paybale型にしか存在しないためキャストが必要になる
        payable(msg.sender).transfer(withdraw_amount);
        emit WithDraw(msg.sender, withdraw_amount);
    }

    // Mastering Etherium出版後からsolidityの文法に変更が加わっている.
    // 0.6以降はデフォルトの明示的な指定が必要となるためreceive関数
    // payable修飾子を付けて置けば、そのメソッドに対して送金された場合に
    // 送金を受け付けることができる.逆に明示的に指定しない限りコントラクトが
    // 送金を受け取ることができない.
    receive() external payable {
        emit Deposit(msg.sender, msg.value); 
    } 
}
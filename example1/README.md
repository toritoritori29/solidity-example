
# Example1: Fauset
イーサを好きなだけ引き出せる口座（蛇口）
マスタリング・イーサリアム初版を参考に作成したがsolidityのバージョンが違うため一部コードを変更

## 実行 & デプロイ方法

コンパイル
```
npx truffle compile
```

ネットワークにデプロイ. デプロイ先はtruffle.config.jsで定義されているので注意.
```
npx truffle migrate
```

## 解説
* solidity: コントラクトを記述するための言語.
* truffle:

solidityコンパイラでイーサリウムバイトコードを生成→イーサリウムネットワークにアップロードというのがデプロイの流れ.

## 参考
* https://gigster.com/blog/deploy-a-fully-tested-nft-contract-using-openzeppelin/#our-erc721-contract

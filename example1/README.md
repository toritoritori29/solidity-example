
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

ネットワークにデプロイしたコントラクトを実行する.
今回はFaucetに預けたり引き出したりできるスクリプトmain.js作成したのでそれを実行する
```
npx truffle exec main.js
```

## 解説
* solidity: コントラクトを記述するための言語.
* truffle: スマートコントラクト開発用のフレームワーク

solidityコンパイラでイーサリウムバイトコードを生成→イーサリウムネットワークにデプロイというのがざっくりとした開発の流れ.

## 参考
* https://gigster.com/blog/deploy-a-fully-tested-nft-contract-using-openzeppelin/#our-erc721-contract

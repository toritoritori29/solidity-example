

# Example2: ExampleToken
今流行のNFT. EIP721に準拠したベーシックなトークン.
個人で実装するのは骨が折れる＋一度ネットワークに上げたら修正が効かないContractで一から自分で作るのはアンチパターンということでopenzeppelinを利用.

## 実行 & デプロイ方法

コンパイル
```
npx truffle compile
```

ネットワークにデプロイ. デプロイ先はtruffle.config.jsで定義されているので注意.
```
npx truffle migrate
```

## 実行例
```
npx truffle exec main.js
```

## 解説
EIP721はNon-Fugible-Token（NFT）トークンのデファクトの仕様.
新たにNFTを発行することをMintと言う.

## 参考
1. https://www.fisco.co.jp/media/crypto/nft-mint/

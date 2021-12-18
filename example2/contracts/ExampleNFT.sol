
pragma solidity ^0.8.0;

// 参考 https://wizard.openzeppelin.com/#erc721
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract ExampleNFT is ERC721Enumerable, Ownable {
    using Counters for Counters.Counter;

    constructor()  ERC721("ExampleToken", "ET") {}
    Counters.Counter private _tokenIdCounter;

    // コントラクトの所有者にのみNFTを発行する機能を与える
    function safeMint(address to) public onlyOwner {
        // tokenIdはCounterで管理されている
        uint256 tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        _safeMint(to, tokenId);
    }

    // Burnableとは
    // Pausableとは
    // Enumerableとは
    // URI Storageとは

    // eventについては下記リンク参照
    // https://qiita.com/hakumai-iida/items/3da0252415ec24fe177b

    // event Transfer
    // NTFの所有権が転移したときに呼び出されるイベント

    // event Approval

    // event ApprovalForAll

    /* function類 */
    // function baranceOf
    // 引数で指定されたアドレスが持つNFTの数を返す

    // function ownerOf
    // 引数で指定したトークンの所有者を返す

    // function safeTranferFrom
    // NFTの所有権を_fromから_toに移転させる
    // _toがERC721TokenReceiverInterfaceを実装されている必要あり?

    // function transferFrom
    // NFTの所有権を_fromから_toに移転させる
    // _toがNFT受け入れ可能なアドレスで無い場合には送った対象のNFTが恒久的に失われる

    // function approve
    // NFTの所有権を付与する
    // approveで指定したアカウントがtranfoserFrom等を実行できるようになるイメージ

    // fucntion approveForAll

}
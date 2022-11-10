// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract NFTToken is ERC721 {
    using SafeMath for uint;

    uint32 constant FIXED_BUYING_UNIT = 1;

    uint256 public tokenId;

    /**
        @notice EMechMinted
        @dev emits when EMech token is minted
     */
    event NFTMinted(address receiverAddress, uint tokenId);


    /**@notice constructor */
    constructor() ERC721("Test NFT", "TN") {
    }

    /**
        @notice Mint token
        @dev uses _mint function
        @param _receiverAddress address of user for whome to mint NFTs
    */
    function mint(address _receiverAddress) external {
        _mint(_receiverAddress, FIXED_BUYING_UNIT);
        tokenId++;
        emit NFTMinted(_receiverAddress, tokenId.sub(1));
    }

}
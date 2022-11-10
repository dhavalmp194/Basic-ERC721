// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract NFTToken is ERC721, Ownable {
    using Strings for uint256;
    using SafeMath for uint;

    uint32 constant FIXED_BUYING_UNIT = 1;
    uint32 constant TOTAL_SUPPLY = 1000;
    
    string public baseURI;

    uint256 public tokenId;

    mapping(address => bool) public isMinted;

    /**
        @notice EMechMinted
        @dev emits when EMech token is minted
     */
    event NFTMinted(address receiverAddress, uint tokenId);


    /**@notice constructor */
    constructor() ERC721("Test NFT", "TN") {
    }

    function setBaseURI(string memory _newBaseURI) public onlyOwner{
        baseURI = _newBaseURI;
    }

    /**
        @notice Mint token
        @dev uses _mint function
        @param _receiverAddress address of user for whome to mint NFTs
    */
    function mint() external {
        require(tokenId < TOTAL_SUPPLY, "mint: Total supply reached");
        require(!isMinted[msg.sender], "mint: User already minted the NFT");
        _mint(msg.sender, FIXED_BUYING_UNIT);
        isMinted[msg.sender] = true;
        emit NFTMinted(_receiverAddress, tokenId);
        tokenId++;
    }

    function tokenURI(uint256 _tokenId)
        public
        view
        virtual
        override
        returns (string memory)
    {
        require(
          _exists(_tokenId),
          "ERC721: URI query for nonexistent token"
        );
    
        return bytes(baseURI).length > 0
            ? string(abi.encodePacked(baseURI, tokenId.toString()))
            : "";
    }
}
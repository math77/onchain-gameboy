//SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import '@openzeppelin/contracts/access/Ownable.sol';
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";


import "./CryptoMazeMetadata.sol";

import "hardhat/console.sol";

/*


      ___           ___                       ___                       ___           ___           ___           ___           ___     
     /\__\         /\  \                     /\  \                     /\  \         /\  \         /\  \         /\__\         /\__\    
    /:/  /        /::\  \         ___       /::\  \       ___         /::\  \       |::\  \       /::\  \       /::|  |       /:/ _/_   
   /:/  /        /:/\:\__\       /|  |     /:/\:\__\     /\__\       /:/\:\  \      |:|:\  \     /:/\:\  \     /:/:|  |      /:/ /\__\  
  /:/  /  ___   /:/ /:/  /      |:|  |    /:/ /:/  /    /:/  /      /:/  \:\  \   __|:|\:\  \   /:/ /::\  \   /:/|:|  |__   /:/ /:/ _/_ 
 /:/__/  /\__\ /:/_/:/__/___    |:|  |   /:/_/:/  /    /:/__/      /:/__/ \:\__\ /::::|_\:\__\ /:/_/:/\:\__\ /:/ |:| /\__\ /:/_/:/ /\__\
 \:\  \ /:/  / \:\/:::::/  /  __|:|__|   \:\/:/  /    /::\  \      \:\  \ /:/  / \:\~~\  \/__/ \:\/:/  \/__/ \/__|:|/:/  / \:\/:/ /:/  /
  \:\  /:/  /   \::/~~/~~~~  /::::\  \    \::/__/    /:/\:\  \      \:\  /:/  /   \:\  \        \::/__/          |:/:/  /   \::/_/:/  / 
   \:\/:/  /     \:\~~\      ~~~~\:\  \    \:\  \    \/__\:\  \      \:\/:/  /     \:\  \        \:\  \          |::/  /     \:\/:/  /  
    \::/  /       \:\__\          \:\__\    \:\__\        \:\__\      \::/  /       \:\__\        \:\__\         |:/  /       \::/  /   
     \/__/         \/__/           \/__/     \/__/         \/__/       \/__/         \/__/         \/__/         |/__/         \/__/    




Hey you, looking at this code... if you have ideas how I can write better solidity code, don't be 
shy and send me a DM on twitter (https://twitter.com/stargeistt). I'm still learning and collaboration is always good. 
To those who help me I promise that when we meet IRL you will get a hug and maybe I'll buy you 
a coffee! (don't worry, I'm very cool and have a super hot curly hair hahaha).


Always remember:

All we have to decide is what to do with the time that is given us. - Gandalf



THIS IS A PROOF-OF-CONCEPT EXPERIMENT. 
NO ROADMAP AND NO PROMISES.

*/

contract CryptoMaze is ERC721, ReentrancyGuard, Ownable {

    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    //MAX_SUPPLY => 3089;
    uint256 public RESERVED = 20;
    uint256 public constant MAX_PUBLIC_SUPPLY = 3069;
    uint256 public constant MAX_BY_MINT = 10;
    uint256 public constant PRICE_TOKEN = 0.005 ether;

    address private constant UKRAINE_DAO_ADDRESS = 0x633b7218644b83D57d90e7299039ebAb19698e9C;
    
    address private _metadataAddress;

    IERC20 wethContract = IERC20(0x7ceB23fD6bC0adD59E62ac25578270cFf1b9f619);


    event TokenMinted(uint256 tokenId);

    constructor(address metadataAddress) ERC721("CryptoMaze", "CMAZE") Ownable() {
        _tokenIds.increment();
        _metadataAddress = metadataAddress;
    }


    /*  
        Turn *     *    
                        *
      *
             *    and face
        *                  *
                    *
            *              * 
        *   egnarts eht *

      *     *    *

                        *      
        - David Bowie

    */


    function setMetadataAddress(address metadataAddress) external onlyOwner {
        _metadataAddress = metadataAddress;
    }


    function letTheGameBegin(uint256 amount, uint256 quantity) external nonReentrant {
        uint256 tokenId = _tokenIds.current();

        require(quantity > 0 && quantity <= MAX_BY_MINT, "Max by mint: 10 tokens");
        require(amount == PRICE_TOKEN*quantity, "MINT: Send more WETH, please.");
        require(tokenId+quantity <= MAX_PUBLIC_SUPPLY, "Oops, exceed available supply.");

        wethContract.transferFrom(msg.sender, address(this), amount);

        for (uint256 i; i < quantity; i++) {
            _safeMint(msg.sender, _tokenIds.current());
            _tokenIds.increment();
        }
        
        //emit the first tokenId minted to the user.
        emit TokenMinted(tokenId);
    }

    function tokenURI(uint256 tokenId) public view override returns (string memory) {
        return ICryptoMazeMetadata(_metadataAddress).tokenURI(tokenId);
    }

    function lastTokenId() external view returns (uint256) {
        return _tokenIds.current();
    }
    
    function giveAway(address to) external onlyOwner {
        uint256 tokenId = _tokenIds.current();

        require(RESERVED > 0, "Exceeds reserved NFT supply" );

        _safeMint(to, tokenId);

        _tokenIds.increment();
        RESERVED -= 1;
    }

    function withdraw() external nonReentrant onlyOwner {
        uint256 balance = wethContract.balanceOf(address(this));

        wethContract.transfer(UKRAINE_DAO_ADDRESS, (balance / 100)*90);
        wethContract.transfer(owner(), (balance / 100)*10);
    }
}

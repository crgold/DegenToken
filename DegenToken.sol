/*
1. Minting new tokens: The platform should be able to create new tokens and distribute them to players as rewards.
2. Transferring tokens: Players should be able to transfer their tokens to others.
3. Redeeming tokens: Players should be able to redeem their tokens for items in the in-game store.
4. Checking token balance: Players should be able to check their token balance at any time.
5. Burning tokens: Anyone should be able to burn tokens, that they own, that are no longer needed.
*/

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "hardhat/console.sol";

contract DegenToken is ERC20, Ownable, ERC20Burnable {
    constructor() ERC20("Degen", "DGN") {}

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount); // last value is for decimals
    }

    function decimals() override public pure returns (uint8) {
        return 0;
    }

    function getBalance() external view returns (uint256) {
        return this.balanceOf(msg.sender);
    }

    function transferTokens(address _receiver, uint256 _value) external {
        require(balanceOf(msg.sender) >= _value, "You do not have enough Degen Tokens");
        approve(msg.sender, _value);
        transferFrom(msg.sender, _receiver, _value);
    }

    function burnTokens(uint256 _value) external {
        require(balanceOf(msg.sender) >= _value, "You do not have enough Degen Tokens");
        burn(_value);
    }

    function showStoreItems() external view returns (string memory) {
        console.log("The following items are available for purchase:");
        console.log("Selection 1. Official Degen NFT");
        console.log("Selection 2. Degen T-Shirt");
        console.log("Selection 3. Degen OG Role");
        return "The following items are available for purchase:\nSelection 1. Official Degen NFT\nSelection 2. Official Degen NFT\nSelection 3. Official Degen NFT";
    }

    function redeemTokens(uint8 _userChoice) external payable returns (bool) {
        if (_userChoice == 1) {
            require(this.balanceOf(msg.sender) >= 100, "You do not have enough Degen Tokens");
            approve(msg.sender, 100);
            transferFrom(msg.sender, owner(), 100);
            console.log("You have redeemed for an official Degen NFT!");
            return true;
        }
        else if (_userChoice == 2) {
            require(this.balanceOf(msg.sender) >= 75, "You do not have enough Degen Tokens");
            approve(msg.sender, 75);
            transferFrom(msg.sender, owner(), 75);
            console.log("You have redeemed for an official Degen T-Shirt!");
            return true;
        }
        else if (_userChoice == 3) {
            require(this.balanceOf(msg.sender) >= 50, "You do not have enough Degen Tokens");
            approve(msg.sender, 50);
            transferFrom(msg.sender, owner(), 50);
            console.log("You have redeemed for OG status in our Degen Discord!");
            return true;
        }
        else {
            console.log("That is not a valid choice");
            return false;
        }
    }
}

# DegenToken

DegenToken is a Solidity smart contract that implements an ERC20 token called "Degen" (symbol: "DGN"). The contract provides functionality for minting new tokens, transferring tokens, redeeming tokens for in-game store items, checking token balance, and burning tokens.

## Features

1. **Minting new tokens**: The `mint` function allows the contract owner to create new tokens and distribute them to players as rewards. Only the contract owner can call this function.

2. **Transferring tokens**: The `transferTokens` function enables players to transfer their tokens to other addresses. The function requires the sender to have a sufficient balance of Degen tokens to complete the transfer.

3. **Redeeming tokens**: The `redeemTokens` function allows players to redeem their tokens for items in the in-game store. Players can choose from three available options: an official Degen NFT, a Degen T-Shirt, or OG status in the Degen Discord. The function verifies that the sender has enough tokens for the selected item before initiating the transfer to the contract owner.

4. **Checking token balance**: The `getBalance` function allows players to check their token balance at any time. It returns the token balance of the caller.

5. **Burning tokens**: The `burnTokens` function enables anyone to burn their own tokens that are no longer needed. This permanently removes the tokens from circulation.

## Usage

1. Deploy the `DegenToken` contract on the Avalanche Fuji network.

2. Call the `mint` function as the contract owner to create new tokens and distribute them to players as rewards.

3. Players can transfer their tokens to others by calling the `transferTokens` function and providing the receiver's address and the amount of tokens to transfer.

4. To redeem tokens for items in the in-game store, players should call the `redeemTokens` function and provide the selection number of the desired item. The function verifies the token balance and initiates the transfer to the contract owner if the requirements are met.

5. To check the token balance, players can call the `getBalance` function, which returns the token balance of the caller.

6. If players no longer need their tokens, they can burn them by calling the `burnTokens` function. This permanently removes the tokens from circulation.

**Note:** Ensure that the necessary dependencies are imported into the project. This code imports contracts from the OpenZeppelin library (`ERC20.sol`, `Ownable.sol`, `ERC20Burnable.sol`).

## License

This code is licensed under the MIT License.

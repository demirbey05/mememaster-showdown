// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

import { System } from "@latticexyz/world/src/System.sol";
import { AddressToUsername, IsPlayerValid, GameMetadata, UserIndexToUsername } from "../codegen/index.sol";
import { GameStatus } from "../codegen/common.sol";

error IdentitySystem__PlayerAlreadyJoined();
error IdentitySystem__WrongJoinState();
error IdentitySystem__NoRemainingSeat();

contract IdentitySystem is System {
  function addUsername(string memory userName) public {
    address sender = _msgSender();
    AddressToUsername.set(sender, userName);
  }

  function joinGame(uint256 gameID) public {
    address sender = _msgSender();
    uint32 currentUser = GameMetadata.getCurrentUser(gameID);
    uint32 limitUser = GameMetadata.getLimitUser(gameID);

    if (IsPlayerValid.getIsValid(gameID, sender)) {
      revert IdentitySystem__PlayerAlreadyJoined();
    }
    if (GameMetadata.getCurrent(gameID) != GameStatus.Waiting) {
      revert IdentitySystem__WrongJoinState();
    }
    if (limitUser == currentUser) {
      revert IdentitySystem__NoRemainingSeat();
    }
    uint256 cursor = GameMetadata.getColorCursor(gameID);
    IsPlayerValid.set(gameID, sender, true, GameMetadata.getColorCursor(gameID), gameID);
    GameMetadata.setColorCursor(gameID, cursor + 1);
    GameMetadata.setCurrentUser(gameID, currentUser + 1);
    UserIndexToUsername.set(gameID, cursor, AddressToUsername.get(sender));

    if (currentUser + 1 == limitUser) {
      GameMetadata.setCurrent(gameID, GameStatus.Generating);
      GameMetadata.setRoundNum(gameID, 1);
      GameMetadata.setLatestBlockRecord(gameID, block.number);
    }
  }
}

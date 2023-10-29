// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

import { System } from "@latticexyz/world/src/System.sol";
import { JokeUsage, GameMetadata, IsPlayerValid, StateJokes } from "../codegen/index.sol";

error JokeSystem__RoundShouldBeMore();
error JokeSystem__NoAuthorization();
error JokeSystem__NoFriendFire();
error JokeSystem__WrongToIndex();

contract JokeSystem is System {
  function _emitJoke(
    uint256 gameID,
    uint32 roundNum,
    uint256 toUserIndex,
    uint256 fromUserIndex,
    uint32 jokeIndex
  ) internal {
    bytes32 key = keccak256(abi.encodePacked(gameID, roundNum, block.number, toUserIndex, fromUserIndex));
    JokeUsage.set(key, gameID, roundNum, toUserIndex, fromUserIndex, jokeIndex);
  }

  function createFrontEndOnlyJoke(
    uint256 gameID,
    uint32 roundNum,
    uint256 toUserIndex,
    uint256 fromUserIndex,
    uint32 jokeIndex
  ) public {
    address sender = _msgSender();

    if (GameMetadata.getLimitUser(gameID) < toUserIndex) {
      revert JokeSystem__WrongToIndex();
    }
    if (IsPlayerValid.getUserIndex(gameID, sender) != fromUserIndex) {
      revert JokeSystem__NoAuthorization();
    }
    if (roundNum <= GameMetadata.getRoundNum(gameID)) {
      revert JokeSystem__RoundShouldBeMore();
    }
    if (toUserIndex == fromUserIndex) {
      revert JokeSystem__NoFriendFire();
    }

    _emitJoke(gameID, roundNum, toUserIndex, fromUserIndex, jokeIndex);
  }

  function createStateJoke(
    uint256 gameID,
    uint32 roundNum,
    uint256 toUserIndex,
    uint256 fromUserIndex,
    uint32 jokeIndex
  ) public {
    address sender = _msgSender();

    if (GameMetadata.getLimitUser(gameID) < toUserIndex) {
      revert JokeSystem__WrongToIndex();
    }
    if (IsPlayerValid.getUserIndex(gameID, sender) != fromUserIndex) {
      revert JokeSystem__NoAuthorization();
    }
    if (roundNum <= GameMetadata.getRoundNum(gameID)) {
      revert JokeSystem__RoundShouldBeMore();
    }
    if (toUserIndex == fromUserIndex) {
      revert JokeSystem__NoFriendFire();
    }
    StateJokes.set(gameID, roundNum, toUserIndex, jokeIndex, fromUserIndex);
    _emitJoke(gameID, roundNum, toUserIndex, fromUserIndex, jokeIndex);
  }
}

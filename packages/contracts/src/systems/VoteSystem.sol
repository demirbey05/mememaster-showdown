// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

import { System } from "@latticexyz/world/src/System.sol";
import { GameMetadata, StateJokes, GameMetadataData, IsPlayerValid, RoundInfo, IsVoted, ScoreBoard } from "../codegen/index.sol";
import { GameStatus } from "../codegen/common.sol";

error VoteSystem__WrongState();
error VoteSystem__NotAuthorized();
error VoteSystem__AlreadyVoted();
error VoteSystem__CannotVoteForSelf();

contract VoteSystem is System {
  function vote(uint256 gameID, uint256 color) public {
    address sender = _msgSender();
    uint256 userIndex = IsPlayerValid.getUserIndex(gameID, sender);
    uint32 roundNum = GameMetadata.getRoundNum(gameID);

    if (GameMetadata.getCurrent(gameID) != GameStatus.Voting) {
      revert VoteSystem__WrongState();
    }
    if (!IsPlayerValid.getIsValid(gameID, sender)) {
      revert VoteSystem__NotAuthorized();
    }
    if (IsVoted.get(gameID, roundNum, userIndex)) {
      revert VoteSystem__AlreadyVoted();
    }
    if (color == userIndex) {
      revert VoteSystem__CannotVoteForSelf();
    }
    uint256 jokeExist = StateJokes.get(gameID, roundNum, color, 2);
    if (jokeExist > 0) {
      color = jokeExist;
    }

    IsVoted.set(gameID, roundNum, userIndex, true);
    ScoreBoard.set(gameID, color, color, ScoreBoard.getScore(gameID, color) + 1, gameID);
    RoundInfo.setTotalVote(gameID, roundNum, RoundInfo.getTotalVote(gameID, roundNum) + 1);
  }
}

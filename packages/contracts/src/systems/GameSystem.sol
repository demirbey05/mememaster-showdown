// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

import { System } from "@latticexyz/world/src/System.sol";
import { GameMetadata, RoundInfo, ScoreBoard } from "../codegen/index.sol";
import { GameStatus } from "../codegen/common.sol";

error GameSystem__GameNotInWaitingState();
error GameSystem__GameIsNotFull();
error GameSystem__WrongState();

uint256 constant blockNumber = 30;
uint256 constant totalMemeNumber = 20;

contract GameSystem is System {
  function moveFromGeneratingToTyping(uint256 gameID) public {
    uint32 roundNum = GameMetadata.getRoundNum(gameID);

    //Generate random
    if (GameMetadata.getCurrent(gameID) != GameStatus.Generating) {
      revert GameSystem__WrongState();
    }
    //@dev same two meme can occur
    if (RoundInfo.getMemeIndex(gameID, roundNum) == 0) {
      uint256 randomNumber = (uint256(keccak256(abi.encodePacked(block.timestamp, block.difficulty))) %
        (totalMemeNumber - roundNum - 1)) + 1;
      RoundInfo.setMemeIndex(gameID, roundNum, uint32(randomNumber));
    }
    GameMetadata.setCurrent(gameID, GameStatus.Typing);
    GameMetadata.setLatestBlockRecord(gameID, block.number);
  }

  function moveFromTypingToVoting(uint256 gameID) public {
    uint32 roundNum = GameMetadata.getRoundNum(gameID);
    if (GameMetadata.getCurrent(gameID) != GameStatus.Typing) {
      revert GameSystem__WrongState();
    }
    if (
      ((block.number - GameMetadata.getLatestBlockRecord(gameID)) > blockNumber) ||
      (RoundInfo.getTotalType(gameID, roundNum) == GameMetadata.getCurrentUser(gameID))
    ) {
      GameMetadata.setCurrent(gameID, GameStatus.Voting);
      GameMetadata.setLatestBlockRecord(gameID, block.number);
    }
  }

  function moveFromVotingToNextStage(uint256 gameID) public {
    uint32 roundNum = GameMetadata.getRoundNum(gameID);
    if (GameMetadata.getCurrent(gameID) != GameStatus.Voting) {
      revert GameSystem__WrongState();
    }

    if (roundNum == GameMetadata.getLimitRound(gameID)) {
      GameMetadata.setCurrent(gameID, GameStatus.End);
      return;
    }
    if (
      ((block.number - GameMetadata.getLatestBlockRecord(gameID)) > blockNumber) ||
      (RoundInfo.getTotalVote(gameID, roundNum) == GameMetadata.getCurrentUser(gameID))
    ) {
      GameMetadata.setCurrent(gameID, GameStatus.Generating);
      GameMetadata.setRoundNum(gameID, roundNum + 1);
    }
  }

  function claimWinner(uint256 gameID) public {
    uint32 limitOfUser = GameMetadata.getLimitUser(gameID);
    if (GameMetadata.getCurrent(gameID) != GameStatus.End) {
      revert GameSystem__WrongState();
    }
    uint32 maxScore = ScoreBoard.getScore(gameID, 1);
    for (uint32 i = 2; i < limitOfUser; i++) {
      if (ScoreBoard.getScore(gameID, i) > maxScore) {
        maxScore = ScoreBoard.getScore(gameID, i);
      }
    }
    for (uint32 i = 1; i < limitOfUser; i++) {
      if (ScoreBoard.getScore(gameID, i) == maxScore) {
        GameMetadata.updateWinners(gameID, i, 1);
      }
    }
  }
}

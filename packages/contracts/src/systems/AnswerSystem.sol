// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

import { System } from "@latticexyz/world/src/System.sol";
import { GameMetadata, GameMetadataData, IsPlayerValid, Responses, RoundInfo } from "../codegen/index.sol";
import { GameStatus } from "../codegen/common.sol";

error AnswerSystem__WrongState();
error AnswerSystem__AlreadyReplied();
error AnswerSystem__NotAuthorized();

contract AnswerSystem is System {
  function submitAnswer(uint256 gameID, string memory answer) public {
    address sender = _msgSender();
    uint32 currentRound = GameMetadata.getRoundNum(gameID);
    uint256 userIndex = IsPlayerValid.getUserIndex(gameID, sender);

    if (GameMetadata.getCurrent(gameID) != GameStatus.Typing) {
      revert AnswerSystem__WrongState();
    }
    if (!IsPlayerValid.getIsValid(gameID, sender)) {
      revert AnswerSystem__NotAuthorized();
    }
    if (bytes(Responses.getResponse(gameID, currentRound, userIndex)).length != 0) {
      revert AnswerSystem__AlreadyReplied();
    }
    Responses.set(gameID, currentRound, userIndex, userIndex, currentRound, gameID, answer);
    RoundInfo.setTotalType(gameID, currentRound, RoundInfo.getTotalType(gameID, currentRound) + 1);
  }
}

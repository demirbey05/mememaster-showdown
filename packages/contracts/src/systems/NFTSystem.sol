pragma solidity >=0.8.0;

import { System } from "@latticexyz/world/src/System.sol";
import { RoundInfo, GameMetadata } from "../codegen/index.sol";
import { GameStatus } from "../codegen/common.sol";
import { totalMemeNumber } from "./GameSystem.sol";
error NFTSystem__WrongRoundNum();
error NFTSystem__WrongMemeID();
error NFTSystem__AlreadyInited();

contract NFTSystem is System {
  function changeNextMeme(uint256 gameID, uint32 roundNum, uint32 memeID) public {
    uint32 roundNumCurrent = GameMetadata.getRoundNum(gameID);

    if (roundNum < roundNumCurrent) {
      revert NFTSystem__WrongRoundNum();
    }
    if (memeID < totalMemeNumber) {
      revert NFTSystem__WrongMemeID();
    }
    if (RoundInfo.getMemeIndex(gameID, roundNum) > 0) {
      revert NFTSystem__AlreadyInited();
    }

    RoundInfo.setMemeIndex(gameID, roundNum, memeID);
  }
}

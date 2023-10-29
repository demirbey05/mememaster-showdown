// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

import { System } from "@latticexyz/world/src/System.sol";
import { GameMetadata, GameMetadataData, GameCursor } from "../codegen/index.sol";
import { GameStatus } from "../codegen/common.sol";

error GameInitSystem__GameAlreadyInitialized();
uint32 constant MAX_LIMIT_ROUND = 10;

contract GameInitSystem is System {
  function initGame(uint32 limitRound, uint32 limit) public returns (uint256) {
    uint256 cursorId = 80;
    uint256 current = GameCursor.getCursor(bytes32(cursorId));
    if (GameMetadata.getCurrent(current + 1) != GameStatus.None) {
      revert GameInitSystem__GameAlreadyInitialized();
    }
    if (limitRound > MAX_LIMIT_ROUND) {
      limitRound = MAX_LIMIT_ROUND;
    }
    uint32[] memory newArray = new uint32[](limit + 1);

    GameMetadata.set(current + 1, GameMetadataData(0, limitRound, 0, limit, GameStatus.Waiting, 1, 0, current + 1 ,newArray));
    GameCursor.setCursor(bytes32(cursorId), current + 1);
    return current + 1;
  }
}

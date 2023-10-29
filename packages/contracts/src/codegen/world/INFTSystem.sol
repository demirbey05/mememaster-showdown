// SPDX-License-Identifier: MIT
pragma solidity >=0.8.21;

/* Autogenerated file. Do not edit manually. */

/**
 * @title INFTSystem
 * @dev This interface is automatically generated from the corresponding system contract. Do not edit manually.
 */
interface INFTSystem {
  error NFTSystem__WrongRoundNum();
  error NFTSystem__WrongMemeID();
  error NFTSystem__AlreadyInited();

  function changeNextMeme(uint256 gameID, uint32 roundNum, uint32 memeID) external;
}

// SPDX-License-Identifier: MIT
pragma solidity >=0.8.21;

/* Autogenerated file. Do not edit manually. */

// Import schema type
import { SchemaType } from "@latticexyz/schema-type/src/solidity/SchemaType.sol";

// Import store internals
import { IStore } from "@latticexyz/store/src/IStore.sol";
import { StoreSwitch } from "@latticexyz/store/src/StoreSwitch.sol";
import { StoreCore } from "@latticexyz/store/src/StoreCore.sol";
import { Bytes } from "@latticexyz/store/src/Bytes.sol";
import { Memory } from "@latticexyz/store/src/Memory.sol";
import { SliceLib } from "@latticexyz/store/src/Slice.sol";
import { EncodeArray } from "@latticexyz/store/src/tightcoder/EncodeArray.sol";
import { FieldLayout, FieldLayoutLib } from "@latticexyz/store/src/FieldLayout.sol";
import { Schema, SchemaLib } from "@latticexyz/store/src/Schema.sol";
import { PackedCounter, PackedCounterLib } from "@latticexyz/store/src/PackedCounter.sol";
import { ResourceId } from "@latticexyz/store/src/ResourceId.sol";
import { RESOURCE_TABLE, RESOURCE_OFFCHAIN_TABLE } from "@latticexyz/store/src/storeResourceTypes.sol";

// Import user types
import { GameStatus } from "./../common.sol";

ResourceId constant _tableId = ResourceId.wrap(
  bytes32(abi.encodePacked(RESOURCE_TABLE, bytes14(""), bytes16("GameMetadata")))
);
ResourceId constant GameMetadataTableId = _tableId;

FieldLayout constant _fieldLayout = FieldLayout.wrap(
  0x0071080104040404012020200000000000000000000000000000000000000000
);

struct GameMetadataData {
  uint32 roundNum;
  uint32 limitRound;
  uint32 currentUser;
  uint32 limitUser;
  GameStatus current;
  uint256 colorCursor;
  uint256 latestBlockRecord;
  uint256 mirror;
  uint32[] winners;
}

library GameMetadata {
  /**
   * @notice Get the table values' field layout.
   * @return _fieldLayout The field layout for the table.
   */
  function getFieldLayout() internal pure returns (FieldLayout) {
    return _fieldLayout;
  }

  /**
   * @notice Get the table's key schema.
   * @return _keySchema The key schema for the table.
   */
  function getKeySchema() internal pure returns (Schema) {
    SchemaType[] memory _keySchema = new SchemaType[](1);
    _keySchema[0] = SchemaType.UINT256;

    return SchemaLib.encode(_keySchema);
  }

  /**
   * @notice Get the table's value schema.
   * @return _valueSchema The value schema for the table.
   */
  function getValueSchema() internal pure returns (Schema) {
    SchemaType[] memory _valueSchema = new SchemaType[](9);
    _valueSchema[0] = SchemaType.UINT32;
    _valueSchema[1] = SchemaType.UINT32;
    _valueSchema[2] = SchemaType.UINT32;
    _valueSchema[3] = SchemaType.UINT32;
    _valueSchema[4] = SchemaType.UINT8;
    _valueSchema[5] = SchemaType.UINT256;
    _valueSchema[6] = SchemaType.UINT256;
    _valueSchema[7] = SchemaType.UINT256;
    _valueSchema[8] = SchemaType.UINT32_ARRAY;

    return SchemaLib.encode(_valueSchema);
  }

  /**
   * @notice Get the table's key field names.
   * @return keyNames An array of strings with the names of key fields.
   */
  function getKeyNames() internal pure returns (string[] memory keyNames) {
    keyNames = new string[](1);
    keyNames[0] = "gameId";
  }

  /**
   * @notice Get the table's value field names.
   * @return fieldNames An array of strings with the names of value fields.
   */
  function getFieldNames() internal pure returns (string[] memory fieldNames) {
    fieldNames = new string[](9);
    fieldNames[0] = "roundNum";
    fieldNames[1] = "limitRound";
    fieldNames[2] = "currentUser";
    fieldNames[3] = "limitUser";
    fieldNames[4] = "current";
    fieldNames[5] = "colorCursor";
    fieldNames[6] = "latestBlockRecord";
    fieldNames[7] = "mirror";
    fieldNames[8] = "winners";
  }

  /**
   * @notice Register the table with its config.
   */
  function register() internal {
    StoreSwitch.registerTable(_tableId, _fieldLayout, getKeySchema(), getValueSchema(), getKeyNames(), getFieldNames());
  }

  /**
   * @notice Register the table with its config.
   */
  function _register() internal {
    StoreCore.registerTable(_tableId, _fieldLayout, getKeySchema(), getValueSchema(), getKeyNames(), getFieldNames());
  }

  /**
   * @notice Get roundNum.
   */
  function getRoundNum(uint256 gameId) internal view returns (uint32 roundNum) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(gameId));

    bytes32 _blob = StoreSwitch.getStaticField(_tableId, _keyTuple, 0, _fieldLayout);
    return (uint32(bytes4(_blob)));
  }

  /**
   * @notice Get roundNum.
   */
  function _getRoundNum(uint256 gameId) internal view returns (uint32 roundNum) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(gameId));

    bytes32 _blob = StoreCore.getStaticField(_tableId, _keyTuple, 0, _fieldLayout);
    return (uint32(bytes4(_blob)));
  }

  /**
   * @notice Set roundNum.
   */
  function setRoundNum(uint256 gameId, uint32 roundNum) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(gameId));

    StoreSwitch.setStaticField(_tableId, _keyTuple, 0, abi.encodePacked((roundNum)), _fieldLayout);
  }

  /**
   * @notice Set roundNum.
   */
  function _setRoundNum(uint256 gameId, uint32 roundNum) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(gameId));

    StoreCore.setStaticField(_tableId, _keyTuple, 0, abi.encodePacked((roundNum)), _fieldLayout);
  }

  /**
   * @notice Get limitRound.
   */
  function getLimitRound(uint256 gameId) internal view returns (uint32 limitRound) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(gameId));

    bytes32 _blob = StoreSwitch.getStaticField(_tableId, _keyTuple, 1, _fieldLayout);
    return (uint32(bytes4(_blob)));
  }

  /**
   * @notice Get limitRound.
   */
  function _getLimitRound(uint256 gameId) internal view returns (uint32 limitRound) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(gameId));

    bytes32 _blob = StoreCore.getStaticField(_tableId, _keyTuple, 1, _fieldLayout);
    return (uint32(bytes4(_blob)));
  }

  /**
   * @notice Set limitRound.
   */
  function setLimitRound(uint256 gameId, uint32 limitRound) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(gameId));

    StoreSwitch.setStaticField(_tableId, _keyTuple, 1, abi.encodePacked((limitRound)), _fieldLayout);
  }

  /**
   * @notice Set limitRound.
   */
  function _setLimitRound(uint256 gameId, uint32 limitRound) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(gameId));

    StoreCore.setStaticField(_tableId, _keyTuple, 1, abi.encodePacked((limitRound)), _fieldLayout);
  }

  /**
   * @notice Get currentUser.
   */
  function getCurrentUser(uint256 gameId) internal view returns (uint32 currentUser) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(gameId));

    bytes32 _blob = StoreSwitch.getStaticField(_tableId, _keyTuple, 2, _fieldLayout);
    return (uint32(bytes4(_blob)));
  }

  /**
   * @notice Get currentUser.
   */
  function _getCurrentUser(uint256 gameId) internal view returns (uint32 currentUser) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(gameId));

    bytes32 _blob = StoreCore.getStaticField(_tableId, _keyTuple, 2, _fieldLayout);
    return (uint32(bytes4(_blob)));
  }

  /**
   * @notice Set currentUser.
   */
  function setCurrentUser(uint256 gameId, uint32 currentUser) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(gameId));

    StoreSwitch.setStaticField(_tableId, _keyTuple, 2, abi.encodePacked((currentUser)), _fieldLayout);
  }

  /**
   * @notice Set currentUser.
   */
  function _setCurrentUser(uint256 gameId, uint32 currentUser) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(gameId));

    StoreCore.setStaticField(_tableId, _keyTuple, 2, abi.encodePacked((currentUser)), _fieldLayout);
  }

  /**
   * @notice Get limitUser.
   */
  function getLimitUser(uint256 gameId) internal view returns (uint32 limitUser) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(gameId));

    bytes32 _blob = StoreSwitch.getStaticField(_tableId, _keyTuple, 3, _fieldLayout);
    return (uint32(bytes4(_blob)));
  }

  /**
   * @notice Get limitUser.
   */
  function _getLimitUser(uint256 gameId) internal view returns (uint32 limitUser) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(gameId));

    bytes32 _blob = StoreCore.getStaticField(_tableId, _keyTuple, 3, _fieldLayout);
    return (uint32(bytes4(_blob)));
  }

  /**
   * @notice Set limitUser.
   */
  function setLimitUser(uint256 gameId, uint32 limitUser) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(gameId));

    StoreSwitch.setStaticField(_tableId, _keyTuple, 3, abi.encodePacked((limitUser)), _fieldLayout);
  }

  /**
   * @notice Set limitUser.
   */
  function _setLimitUser(uint256 gameId, uint32 limitUser) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(gameId));

    StoreCore.setStaticField(_tableId, _keyTuple, 3, abi.encodePacked((limitUser)), _fieldLayout);
  }

  /**
   * @notice Get current.
   */
  function getCurrent(uint256 gameId) internal view returns (GameStatus current) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(gameId));

    bytes32 _blob = StoreSwitch.getStaticField(_tableId, _keyTuple, 4, _fieldLayout);
    return GameStatus(uint8(bytes1(_blob)));
  }

  /**
   * @notice Get current.
   */
  function _getCurrent(uint256 gameId) internal view returns (GameStatus current) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(gameId));

    bytes32 _blob = StoreCore.getStaticField(_tableId, _keyTuple, 4, _fieldLayout);
    return GameStatus(uint8(bytes1(_blob)));
  }

  /**
   * @notice Set current.
   */
  function setCurrent(uint256 gameId, GameStatus current) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(gameId));

    StoreSwitch.setStaticField(_tableId, _keyTuple, 4, abi.encodePacked(uint8(current)), _fieldLayout);
  }

  /**
   * @notice Set current.
   */
  function _setCurrent(uint256 gameId, GameStatus current) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(gameId));

    StoreCore.setStaticField(_tableId, _keyTuple, 4, abi.encodePacked(uint8(current)), _fieldLayout);
  }

  /**
   * @notice Get colorCursor.
   */
  function getColorCursor(uint256 gameId) internal view returns (uint256 colorCursor) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(gameId));

    bytes32 _blob = StoreSwitch.getStaticField(_tableId, _keyTuple, 5, _fieldLayout);
    return (uint256(bytes32(_blob)));
  }

  /**
   * @notice Get colorCursor.
   */
  function _getColorCursor(uint256 gameId) internal view returns (uint256 colorCursor) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(gameId));

    bytes32 _blob = StoreCore.getStaticField(_tableId, _keyTuple, 5, _fieldLayout);
    return (uint256(bytes32(_blob)));
  }

  /**
   * @notice Set colorCursor.
   */
  function setColorCursor(uint256 gameId, uint256 colorCursor) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(gameId));

    StoreSwitch.setStaticField(_tableId, _keyTuple, 5, abi.encodePacked((colorCursor)), _fieldLayout);
  }

  /**
   * @notice Set colorCursor.
   */
  function _setColorCursor(uint256 gameId, uint256 colorCursor) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(gameId));

    StoreCore.setStaticField(_tableId, _keyTuple, 5, abi.encodePacked((colorCursor)), _fieldLayout);
  }

  /**
   * @notice Get latestBlockRecord.
   */
  function getLatestBlockRecord(uint256 gameId) internal view returns (uint256 latestBlockRecord) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(gameId));

    bytes32 _blob = StoreSwitch.getStaticField(_tableId, _keyTuple, 6, _fieldLayout);
    return (uint256(bytes32(_blob)));
  }

  /**
   * @notice Get latestBlockRecord.
   */
  function _getLatestBlockRecord(uint256 gameId) internal view returns (uint256 latestBlockRecord) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(gameId));

    bytes32 _blob = StoreCore.getStaticField(_tableId, _keyTuple, 6, _fieldLayout);
    return (uint256(bytes32(_blob)));
  }

  /**
   * @notice Set latestBlockRecord.
   */
  function setLatestBlockRecord(uint256 gameId, uint256 latestBlockRecord) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(gameId));

    StoreSwitch.setStaticField(_tableId, _keyTuple, 6, abi.encodePacked((latestBlockRecord)), _fieldLayout);
  }

  /**
   * @notice Set latestBlockRecord.
   */
  function _setLatestBlockRecord(uint256 gameId, uint256 latestBlockRecord) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(gameId));

    StoreCore.setStaticField(_tableId, _keyTuple, 6, abi.encodePacked((latestBlockRecord)), _fieldLayout);
  }

  /**
   * @notice Get mirror.
   */
  function getMirror(uint256 gameId) internal view returns (uint256 mirror) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(gameId));

    bytes32 _blob = StoreSwitch.getStaticField(_tableId, _keyTuple, 7, _fieldLayout);
    return (uint256(bytes32(_blob)));
  }

  /**
   * @notice Get mirror.
   */
  function _getMirror(uint256 gameId) internal view returns (uint256 mirror) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(gameId));

    bytes32 _blob = StoreCore.getStaticField(_tableId, _keyTuple, 7, _fieldLayout);
    return (uint256(bytes32(_blob)));
  }

  /**
   * @notice Set mirror.
   */
  function setMirror(uint256 gameId, uint256 mirror) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(gameId));

    StoreSwitch.setStaticField(_tableId, _keyTuple, 7, abi.encodePacked((mirror)), _fieldLayout);
  }

  /**
   * @notice Set mirror.
   */
  function _setMirror(uint256 gameId, uint256 mirror) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(gameId));

    StoreCore.setStaticField(_tableId, _keyTuple, 7, abi.encodePacked((mirror)), _fieldLayout);
  }

  /**
   * @notice Get winners.
   */
  function getWinners(uint256 gameId) internal view returns (uint32[] memory winners) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(gameId));

    bytes memory _blob = StoreSwitch.getDynamicField(_tableId, _keyTuple, 0);
    return (SliceLib.getSubslice(_blob, 0, _blob.length).decodeArray_uint32());
  }

  /**
   * @notice Get winners.
   */
  function _getWinners(uint256 gameId) internal view returns (uint32[] memory winners) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(gameId));

    bytes memory _blob = StoreCore.getDynamicField(_tableId, _keyTuple, 0);
    return (SliceLib.getSubslice(_blob, 0, _blob.length).decodeArray_uint32());
  }

  /**
   * @notice Set winners.
   */
  function setWinners(uint256 gameId, uint32[] memory winners) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(gameId));

    StoreSwitch.setDynamicField(_tableId, _keyTuple, 0, EncodeArray.encode((winners)));
  }

  /**
   * @notice Set winners.
   */
  function _setWinners(uint256 gameId, uint32[] memory winners) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(gameId));

    StoreCore.setDynamicField(_tableId, _keyTuple, 0, EncodeArray.encode((winners)));
  }

  /**
   * @notice Get the length of winners.
   */
  function lengthWinners(uint256 gameId) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(gameId));

    uint256 _byteLength = StoreSwitch.getDynamicFieldLength(_tableId, _keyTuple, 0);
    unchecked {
      return _byteLength / 4;
    }
  }

  /**
   * @notice Get the length of winners.
   */
  function _lengthWinners(uint256 gameId) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(gameId));

    uint256 _byteLength = StoreCore.getDynamicFieldLength(_tableId, _keyTuple, 0);
    unchecked {
      return _byteLength / 4;
    }
  }

  /**
   * @notice Get an item of winners.
   * @dev Reverts with Store_IndexOutOfBounds if `_index` is out of bounds for the array.
   */
  function getItemWinners(uint256 gameId, uint256 _index) internal view returns (uint32) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(gameId));

    unchecked {
      bytes memory _blob = StoreSwitch.getDynamicFieldSlice(_tableId, _keyTuple, 0, _index * 4, (_index + 1) * 4);
      return (uint32(bytes4(_blob)));
    }
  }

  /**
   * @notice Get an item of winners.
   * @dev Reverts with Store_IndexOutOfBounds if `_index` is out of bounds for the array.
   */
  function _getItemWinners(uint256 gameId, uint256 _index) internal view returns (uint32) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(gameId));

    unchecked {
      bytes memory _blob = StoreCore.getDynamicFieldSlice(_tableId, _keyTuple, 0, _index * 4, (_index + 1) * 4);
      return (uint32(bytes4(_blob)));
    }
  }

  /**
   * @notice Push an element to winners.
   */
  function pushWinners(uint256 gameId, uint32 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(gameId));

    StoreSwitch.pushToDynamicField(_tableId, _keyTuple, 0, abi.encodePacked((_element)));
  }

  /**
   * @notice Push an element to winners.
   */
  function _pushWinners(uint256 gameId, uint32 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(gameId));

    StoreCore.pushToDynamicField(_tableId, _keyTuple, 0, abi.encodePacked((_element)));
  }

  /**
   * @notice Pop an element from winners.
   */
  function popWinners(uint256 gameId) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(gameId));

    StoreSwitch.popFromDynamicField(_tableId, _keyTuple, 0, 4);
  }

  /**
   * @notice Pop an element from winners.
   */
  function _popWinners(uint256 gameId) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(gameId));

    StoreCore.popFromDynamicField(_tableId, _keyTuple, 0, 4);
  }

  /**
   * @notice Update an element of winners at `_index`.
   */
  function updateWinners(uint256 gameId, uint256 _index, uint32 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(gameId));

    unchecked {
      bytes memory _encoded = abi.encodePacked((_element));
      StoreSwitch.spliceDynamicData(_tableId, _keyTuple, 0, uint40(_index * 4), uint40(_encoded.length), _encoded);
    }
  }

  /**
   * @notice Update an element of winners at `_index`.
   */
  function _updateWinners(uint256 gameId, uint256 _index, uint32 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(gameId));

    unchecked {
      bytes memory _encoded = abi.encodePacked((_element));
      StoreCore.spliceDynamicData(_tableId, _keyTuple, 0, uint40(_index * 4), uint40(_encoded.length), _encoded);
    }
  }

  /**
   * @notice Get the full data.
   */
  function get(uint256 gameId) internal view returns (GameMetadataData memory _table) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(gameId));

    (bytes memory _staticData, PackedCounter _encodedLengths, bytes memory _dynamicData) = StoreSwitch.getRecord(
      _tableId,
      _keyTuple,
      _fieldLayout
    );
    return decode(_staticData, _encodedLengths, _dynamicData);
  }

  /**
   * @notice Get the full data.
   */
  function _get(uint256 gameId) internal view returns (GameMetadataData memory _table) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(gameId));

    (bytes memory _staticData, PackedCounter _encodedLengths, bytes memory _dynamicData) = StoreCore.getRecord(
      _tableId,
      _keyTuple,
      _fieldLayout
    );
    return decode(_staticData, _encodedLengths, _dynamicData);
  }

  /**
   * @notice Set the full data using individual values.
   */
  function set(
    uint256 gameId,
    uint32 roundNum,
    uint32 limitRound,
    uint32 currentUser,
    uint32 limitUser,
    GameStatus current,
    uint256 colorCursor,
    uint256 latestBlockRecord,
    uint256 mirror,
    uint32[] memory winners
  ) internal {
    bytes memory _staticData = encodeStatic(
      roundNum,
      limitRound,
      currentUser,
      limitUser,
      current,
      colorCursor,
      latestBlockRecord,
      mirror
    );

    PackedCounter _encodedLengths = encodeLengths(winners);
    bytes memory _dynamicData = encodeDynamic(winners);

    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(gameId));

    StoreSwitch.setRecord(_tableId, _keyTuple, _staticData, _encodedLengths, _dynamicData);
  }

  /**
   * @notice Set the full data using individual values.
   */
  function _set(
    uint256 gameId,
    uint32 roundNum,
    uint32 limitRound,
    uint32 currentUser,
    uint32 limitUser,
    GameStatus current,
    uint256 colorCursor,
    uint256 latestBlockRecord,
    uint256 mirror,
    uint32[] memory winners
  ) internal {
    bytes memory _staticData = encodeStatic(
      roundNum,
      limitRound,
      currentUser,
      limitUser,
      current,
      colorCursor,
      latestBlockRecord,
      mirror
    );

    PackedCounter _encodedLengths = encodeLengths(winners);
    bytes memory _dynamicData = encodeDynamic(winners);

    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(gameId));

    StoreCore.setRecord(_tableId, _keyTuple, _staticData, _encodedLengths, _dynamicData, _fieldLayout);
  }

  /**
   * @notice Set the full data using the data struct.
   */
  function set(uint256 gameId, GameMetadataData memory _table) internal {
    bytes memory _staticData = encodeStatic(
      _table.roundNum,
      _table.limitRound,
      _table.currentUser,
      _table.limitUser,
      _table.current,
      _table.colorCursor,
      _table.latestBlockRecord,
      _table.mirror
    );

    PackedCounter _encodedLengths = encodeLengths(_table.winners);
    bytes memory _dynamicData = encodeDynamic(_table.winners);

    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(gameId));

    StoreSwitch.setRecord(_tableId, _keyTuple, _staticData, _encodedLengths, _dynamicData);
  }

  /**
   * @notice Set the full data using the data struct.
   */
  function _set(uint256 gameId, GameMetadataData memory _table) internal {
    bytes memory _staticData = encodeStatic(
      _table.roundNum,
      _table.limitRound,
      _table.currentUser,
      _table.limitUser,
      _table.current,
      _table.colorCursor,
      _table.latestBlockRecord,
      _table.mirror
    );

    PackedCounter _encodedLengths = encodeLengths(_table.winners);
    bytes memory _dynamicData = encodeDynamic(_table.winners);

    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(gameId));

    StoreCore.setRecord(_tableId, _keyTuple, _staticData, _encodedLengths, _dynamicData, _fieldLayout);
  }

  /**
   * @notice Decode the tightly packed blob of static data using this table's field layout.
   */
  function decodeStatic(
    bytes memory _blob
  )
    internal
    pure
    returns (
      uint32 roundNum,
      uint32 limitRound,
      uint32 currentUser,
      uint32 limitUser,
      GameStatus current,
      uint256 colorCursor,
      uint256 latestBlockRecord,
      uint256 mirror
    )
  {
    roundNum = (uint32(Bytes.slice4(_blob, 0)));

    limitRound = (uint32(Bytes.slice4(_blob, 4)));

    currentUser = (uint32(Bytes.slice4(_blob, 8)));

    limitUser = (uint32(Bytes.slice4(_blob, 12)));

    current = GameStatus(uint8(Bytes.slice1(_blob, 16)));

    colorCursor = (uint256(Bytes.slice32(_blob, 17)));

    latestBlockRecord = (uint256(Bytes.slice32(_blob, 49)));

    mirror = (uint256(Bytes.slice32(_blob, 81)));
  }

  /**
   * @notice Decode the tightly packed blob of dynamic data using the encoded lengths.
   */
  function decodeDynamic(
    PackedCounter _encodedLengths,
    bytes memory _blob
  ) internal pure returns (uint32[] memory winners) {
    uint256 _start;
    uint256 _end;
    unchecked {
      _end = _encodedLengths.atIndex(0);
    }
    winners = (SliceLib.getSubslice(_blob, _start, _end).decodeArray_uint32());
  }

  /**
   * @notice Decode the tightly packed blobs using this table's field layout.
   * @param _staticData Tightly packed static fields.
   * @param _encodedLengths Encoded lengths of dynamic fields.
   * @param _dynamicData Tightly packed dynamic fields.
   */
  function decode(
    bytes memory _staticData,
    PackedCounter _encodedLengths,
    bytes memory _dynamicData
  ) internal pure returns (GameMetadataData memory _table) {
    (
      _table.roundNum,
      _table.limitRound,
      _table.currentUser,
      _table.limitUser,
      _table.current,
      _table.colorCursor,
      _table.latestBlockRecord,
      _table.mirror
    ) = decodeStatic(_staticData);

    (_table.winners) = decodeDynamic(_encodedLengths, _dynamicData);
  }

  /**
   * @notice Delete all data for given keys.
   */
  function deleteRecord(uint256 gameId) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(gameId));

    StoreSwitch.deleteRecord(_tableId, _keyTuple);
  }

  /**
   * @notice Delete all data for given keys.
   */
  function _deleteRecord(uint256 gameId) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(gameId));

    StoreCore.deleteRecord(_tableId, _keyTuple, _fieldLayout);
  }

  /**
   * @notice Tightly pack static (fixed length) data using this table's schema.
   * @return The static data, encoded into a sequence of bytes.
   */
  function encodeStatic(
    uint32 roundNum,
    uint32 limitRound,
    uint32 currentUser,
    uint32 limitUser,
    GameStatus current,
    uint256 colorCursor,
    uint256 latestBlockRecord,
    uint256 mirror
  ) internal pure returns (bytes memory) {
    return
      abi.encodePacked(roundNum, limitRound, currentUser, limitUser, current, colorCursor, latestBlockRecord, mirror);
  }

  /**
   * @notice Tightly pack dynamic data lengths using this table's schema.
   * @return _encodedLengths The lengths of the dynamic fields (packed into a single bytes32 value).
   */
  function encodeLengths(uint32[] memory winners) internal pure returns (PackedCounter _encodedLengths) {
    // Lengths are effectively checked during copy by 2**40 bytes exceeding gas limits
    unchecked {
      _encodedLengths = PackedCounterLib.pack(winners.length * 4);
    }
  }

  /**
   * @notice Tightly pack dynamic (variable length) data using this table's schema.
   * @return The dynamic data, encoded into a sequence of bytes.
   */
  function encodeDynamic(uint32[] memory winners) internal pure returns (bytes memory) {
    return abi.encodePacked(EncodeArray.encode((winners)));
  }

  /**
   * @notice Encode all of a record's fields.
   * @return The static (fixed length) data, encoded into a sequence of bytes.
   * @return The lengths of the dynamic fields (packed into a single bytes32 value).
   * @return The dyanmic (variable length) data, encoded into a sequence of bytes.
   */
  function encode(
    uint32 roundNum,
    uint32 limitRound,
    uint32 currentUser,
    uint32 limitUser,
    GameStatus current,
    uint256 colorCursor,
    uint256 latestBlockRecord,
    uint256 mirror,
    uint32[] memory winners
  ) internal pure returns (bytes memory, PackedCounter, bytes memory) {
    bytes memory _staticData = encodeStatic(
      roundNum,
      limitRound,
      currentUser,
      limitUser,
      current,
      colorCursor,
      latestBlockRecord,
      mirror
    );

    PackedCounter _encodedLengths = encodeLengths(winners);
    bytes memory _dynamicData = encodeDynamic(winners);

    return (_staticData, _encodedLengths, _dynamicData);
  }

  /**
   * @notice Encode keys as a bytes32 array using this table's field layout.
   */
  function encodeKeyTuple(uint256 gameId) internal pure returns (bytes32[] memory) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(gameId));

    return _keyTuple;
  }
}

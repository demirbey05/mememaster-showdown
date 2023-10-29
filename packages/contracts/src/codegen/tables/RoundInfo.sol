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

ResourceId constant _tableId = ResourceId.wrap(
  bytes32(abi.encodePacked(RESOURCE_TABLE, bytes14(""), bytes16("RoundInfo")))
);
ResourceId constant RoundInfoTableId = _tableId;

FieldLayout constant _fieldLayout = FieldLayout.wrap(
  0x000c030004040400000000000000000000000000000000000000000000000000
);

struct RoundInfoData {
  uint32 memeIndex;
  uint32 totalVote;
  uint32 totalType;
}

library RoundInfo {
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
    SchemaType[] memory _keySchema = new SchemaType[](2);
    _keySchema[0] = SchemaType.UINT256;
    _keySchema[1] = SchemaType.UINT32;

    return SchemaLib.encode(_keySchema);
  }

  /**
   * @notice Get the table's value schema.
   * @return _valueSchema The value schema for the table.
   */
  function getValueSchema() internal pure returns (Schema) {
    SchemaType[] memory _valueSchema = new SchemaType[](3);
    _valueSchema[0] = SchemaType.UINT32;
    _valueSchema[1] = SchemaType.UINT32;
    _valueSchema[2] = SchemaType.UINT32;

    return SchemaLib.encode(_valueSchema);
  }

  /**
   * @notice Get the table's key field names.
   * @return keyNames An array of strings with the names of key fields.
   */
  function getKeyNames() internal pure returns (string[] memory keyNames) {
    keyNames = new string[](2);
    keyNames[0] = "gameId";
    keyNames[1] = "roundNum";
  }

  /**
   * @notice Get the table's value field names.
   * @return fieldNames An array of strings with the names of value fields.
   */
  function getFieldNames() internal pure returns (string[] memory fieldNames) {
    fieldNames = new string[](3);
    fieldNames[0] = "memeIndex";
    fieldNames[1] = "totalVote";
    fieldNames[2] = "totalType";
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
   * @notice Get memeIndex.
   */
  function getMemeIndex(uint256 gameId, uint32 roundNum) internal view returns (uint32 memeIndex) {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = bytes32(uint256(gameId));
    _keyTuple[1] = bytes32(uint256(roundNum));

    bytes32 _blob = StoreSwitch.getStaticField(_tableId, _keyTuple, 0, _fieldLayout);
    return (uint32(bytes4(_blob)));
  }

  /**
   * @notice Get memeIndex.
   */
  function _getMemeIndex(uint256 gameId, uint32 roundNum) internal view returns (uint32 memeIndex) {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = bytes32(uint256(gameId));
    _keyTuple[1] = bytes32(uint256(roundNum));

    bytes32 _blob = StoreCore.getStaticField(_tableId, _keyTuple, 0, _fieldLayout);
    return (uint32(bytes4(_blob)));
  }

  /**
   * @notice Set memeIndex.
   */
  function setMemeIndex(uint256 gameId, uint32 roundNum, uint32 memeIndex) internal {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = bytes32(uint256(gameId));
    _keyTuple[1] = bytes32(uint256(roundNum));

    StoreSwitch.setStaticField(_tableId, _keyTuple, 0, abi.encodePacked((memeIndex)), _fieldLayout);
  }

  /**
   * @notice Set memeIndex.
   */
  function _setMemeIndex(uint256 gameId, uint32 roundNum, uint32 memeIndex) internal {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = bytes32(uint256(gameId));
    _keyTuple[1] = bytes32(uint256(roundNum));

    StoreCore.setStaticField(_tableId, _keyTuple, 0, abi.encodePacked((memeIndex)), _fieldLayout);
  }

  /**
   * @notice Get totalVote.
   */
  function getTotalVote(uint256 gameId, uint32 roundNum) internal view returns (uint32 totalVote) {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = bytes32(uint256(gameId));
    _keyTuple[1] = bytes32(uint256(roundNum));

    bytes32 _blob = StoreSwitch.getStaticField(_tableId, _keyTuple, 1, _fieldLayout);
    return (uint32(bytes4(_blob)));
  }

  /**
   * @notice Get totalVote.
   */
  function _getTotalVote(uint256 gameId, uint32 roundNum) internal view returns (uint32 totalVote) {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = bytes32(uint256(gameId));
    _keyTuple[1] = bytes32(uint256(roundNum));

    bytes32 _blob = StoreCore.getStaticField(_tableId, _keyTuple, 1, _fieldLayout);
    return (uint32(bytes4(_blob)));
  }

  /**
   * @notice Set totalVote.
   */
  function setTotalVote(uint256 gameId, uint32 roundNum, uint32 totalVote) internal {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = bytes32(uint256(gameId));
    _keyTuple[1] = bytes32(uint256(roundNum));

    StoreSwitch.setStaticField(_tableId, _keyTuple, 1, abi.encodePacked((totalVote)), _fieldLayout);
  }

  /**
   * @notice Set totalVote.
   */
  function _setTotalVote(uint256 gameId, uint32 roundNum, uint32 totalVote) internal {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = bytes32(uint256(gameId));
    _keyTuple[1] = bytes32(uint256(roundNum));

    StoreCore.setStaticField(_tableId, _keyTuple, 1, abi.encodePacked((totalVote)), _fieldLayout);
  }

  /**
   * @notice Get totalType.
   */
  function getTotalType(uint256 gameId, uint32 roundNum) internal view returns (uint32 totalType) {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = bytes32(uint256(gameId));
    _keyTuple[1] = bytes32(uint256(roundNum));

    bytes32 _blob = StoreSwitch.getStaticField(_tableId, _keyTuple, 2, _fieldLayout);
    return (uint32(bytes4(_blob)));
  }

  /**
   * @notice Get totalType.
   */
  function _getTotalType(uint256 gameId, uint32 roundNum) internal view returns (uint32 totalType) {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = bytes32(uint256(gameId));
    _keyTuple[1] = bytes32(uint256(roundNum));

    bytes32 _blob = StoreCore.getStaticField(_tableId, _keyTuple, 2, _fieldLayout);
    return (uint32(bytes4(_blob)));
  }

  /**
   * @notice Set totalType.
   */
  function setTotalType(uint256 gameId, uint32 roundNum, uint32 totalType) internal {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = bytes32(uint256(gameId));
    _keyTuple[1] = bytes32(uint256(roundNum));

    StoreSwitch.setStaticField(_tableId, _keyTuple, 2, abi.encodePacked((totalType)), _fieldLayout);
  }

  /**
   * @notice Set totalType.
   */
  function _setTotalType(uint256 gameId, uint32 roundNum, uint32 totalType) internal {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = bytes32(uint256(gameId));
    _keyTuple[1] = bytes32(uint256(roundNum));

    StoreCore.setStaticField(_tableId, _keyTuple, 2, abi.encodePacked((totalType)), _fieldLayout);
  }

  /**
   * @notice Get the full data.
   */
  function get(uint256 gameId, uint32 roundNum) internal view returns (RoundInfoData memory _table) {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = bytes32(uint256(gameId));
    _keyTuple[1] = bytes32(uint256(roundNum));

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
  function _get(uint256 gameId, uint32 roundNum) internal view returns (RoundInfoData memory _table) {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = bytes32(uint256(gameId));
    _keyTuple[1] = bytes32(uint256(roundNum));

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
  function set(uint256 gameId, uint32 roundNum, uint32 memeIndex, uint32 totalVote, uint32 totalType) internal {
    bytes memory _staticData = encodeStatic(memeIndex, totalVote, totalType);

    PackedCounter _encodedLengths;
    bytes memory _dynamicData;

    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = bytes32(uint256(gameId));
    _keyTuple[1] = bytes32(uint256(roundNum));

    StoreSwitch.setRecord(_tableId, _keyTuple, _staticData, _encodedLengths, _dynamicData);
  }

  /**
   * @notice Set the full data using individual values.
   */
  function _set(uint256 gameId, uint32 roundNum, uint32 memeIndex, uint32 totalVote, uint32 totalType) internal {
    bytes memory _staticData = encodeStatic(memeIndex, totalVote, totalType);

    PackedCounter _encodedLengths;
    bytes memory _dynamicData;

    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = bytes32(uint256(gameId));
    _keyTuple[1] = bytes32(uint256(roundNum));

    StoreCore.setRecord(_tableId, _keyTuple, _staticData, _encodedLengths, _dynamicData, _fieldLayout);
  }

  /**
   * @notice Set the full data using the data struct.
   */
  function set(uint256 gameId, uint32 roundNum, RoundInfoData memory _table) internal {
    bytes memory _staticData = encodeStatic(_table.memeIndex, _table.totalVote, _table.totalType);

    PackedCounter _encodedLengths;
    bytes memory _dynamicData;

    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = bytes32(uint256(gameId));
    _keyTuple[1] = bytes32(uint256(roundNum));

    StoreSwitch.setRecord(_tableId, _keyTuple, _staticData, _encodedLengths, _dynamicData);
  }

  /**
   * @notice Set the full data using the data struct.
   */
  function _set(uint256 gameId, uint32 roundNum, RoundInfoData memory _table) internal {
    bytes memory _staticData = encodeStatic(_table.memeIndex, _table.totalVote, _table.totalType);

    PackedCounter _encodedLengths;
    bytes memory _dynamicData;

    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = bytes32(uint256(gameId));
    _keyTuple[1] = bytes32(uint256(roundNum));

    StoreCore.setRecord(_tableId, _keyTuple, _staticData, _encodedLengths, _dynamicData, _fieldLayout);
  }

  /**
   * @notice Decode the tightly packed blob of static data using this table's field layout.
   */
  function decodeStatic(
    bytes memory _blob
  ) internal pure returns (uint32 memeIndex, uint32 totalVote, uint32 totalType) {
    memeIndex = (uint32(Bytes.slice4(_blob, 0)));

    totalVote = (uint32(Bytes.slice4(_blob, 4)));

    totalType = (uint32(Bytes.slice4(_blob, 8)));
  }

  /**
   * @notice Decode the tightly packed blobs using this table's field layout.
   * @param _staticData Tightly packed static fields.
   *
   *
   */
  function decode(
    bytes memory _staticData,
    PackedCounter,
    bytes memory
  ) internal pure returns (RoundInfoData memory _table) {
    (_table.memeIndex, _table.totalVote, _table.totalType) = decodeStatic(_staticData);
  }

  /**
   * @notice Delete all data for given keys.
   */
  function deleteRecord(uint256 gameId, uint32 roundNum) internal {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = bytes32(uint256(gameId));
    _keyTuple[1] = bytes32(uint256(roundNum));

    StoreSwitch.deleteRecord(_tableId, _keyTuple);
  }

  /**
   * @notice Delete all data for given keys.
   */
  function _deleteRecord(uint256 gameId, uint32 roundNum) internal {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = bytes32(uint256(gameId));
    _keyTuple[1] = bytes32(uint256(roundNum));

    StoreCore.deleteRecord(_tableId, _keyTuple, _fieldLayout);
  }

  /**
   * @notice Tightly pack static (fixed length) data using this table's schema.
   * @return The static data, encoded into a sequence of bytes.
   */
  function encodeStatic(uint32 memeIndex, uint32 totalVote, uint32 totalType) internal pure returns (bytes memory) {
    return abi.encodePacked(memeIndex, totalVote, totalType);
  }

  /**
   * @notice Encode all of a record's fields.
   * @return The static (fixed length) data, encoded into a sequence of bytes.
   * @return The lengths of the dynamic fields (packed into a single bytes32 value).
   * @return The dyanmic (variable length) data, encoded into a sequence of bytes.
   */
  function encode(
    uint32 memeIndex,
    uint32 totalVote,
    uint32 totalType
  ) internal pure returns (bytes memory, PackedCounter, bytes memory) {
    bytes memory _staticData = encodeStatic(memeIndex, totalVote, totalType);

    PackedCounter _encodedLengths;
    bytes memory _dynamicData;

    return (_staticData, _encodedLengths, _dynamicData);
  }

  /**
   * @notice Encode keys as a bytes32 array using this table's field layout.
   */
  function encodeKeyTuple(uint256 gameId, uint32 roundNum) internal pure returns (bytes32[] memory) {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = bytes32(uint256(gameId));
    _keyTuple[1] = bytes32(uint256(roundNum));

    return _keyTuple;
  }
}

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
  bytes32(abi.encodePacked(RESOURCE_TABLE, bytes14(""), bytes16("Responses")))
);
ResourceId constant ResponsesTableId = _tableId;

FieldLayout constant _fieldLayout = FieldLayout.wrap(
  0x0044030120042000000000000000000000000000000000000000000000000000
);

struct ResponsesData {
  uint256 mirror;
  uint32 mirrorRoundNum;
  uint256 mirrorGameID;
  string response;
}

library Responses {
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
    SchemaType[] memory _keySchema = new SchemaType[](3);
    _keySchema[0] = SchemaType.UINT256;
    _keySchema[1] = SchemaType.UINT32;
    _keySchema[2] = SchemaType.UINT256;

    return SchemaLib.encode(_keySchema);
  }

  /**
   * @notice Get the table's value schema.
   * @return _valueSchema The value schema for the table.
   */
  function getValueSchema() internal pure returns (Schema) {
    SchemaType[] memory _valueSchema = new SchemaType[](4);
    _valueSchema[0] = SchemaType.UINT256;
    _valueSchema[1] = SchemaType.UINT32;
    _valueSchema[2] = SchemaType.UINT256;
    _valueSchema[3] = SchemaType.STRING;

    return SchemaLib.encode(_valueSchema);
  }

  /**
   * @notice Get the table's key field names.
   * @return keyNames An array of strings with the names of key fields.
   */
  function getKeyNames() internal pure returns (string[] memory keyNames) {
    keyNames = new string[](3);
    keyNames[0] = "gameId";
    keyNames[1] = "roundNum";
    keyNames[2] = "userIndex";
  }

  /**
   * @notice Get the table's value field names.
   * @return fieldNames An array of strings with the names of value fields.
   */
  function getFieldNames() internal pure returns (string[] memory fieldNames) {
    fieldNames = new string[](4);
    fieldNames[0] = "mirror";
    fieldNames[1] = "mirrorRoundNum";
    fieldNames[2] = "mirrorGameID";
    fieldNames[3] = "response";
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
   * @notice Get mirror.
   */
  function getMirror(uint256 gameId, uint32 roundNum, uint256 userIndex) internal view returns (uint256 mirror) {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = bytes32(uint256(gameId));
    _keyTuple[1] = bytes32(uint256(roundNum));
    _keyTuple[2] = bytes32(uint256(userIndex));

    bytes32 _blob = StoreSwitch.getStaticField(_tableId, _keyTuple, 0, _fieldLayout);
    return (uint256(bytes32(_blob)));
  }

  /**
   * @notice Get mirror.
   */
  function _getMirror(uint256 gameId, uint32 roundNum, uint256 userIndex) internal view returns (uint256 mirror) {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = bytes32(uint256(gameId));
    _keyTuple[1] = bytes32(uint256(roundNum));
    _keyTuple[2] = bytes32(uint256(userIndex));

    bytes32 _blob = StoreCore.getStaticField(_tableId, _keyTuple, 0, _fieldLayout);
    return (uint256(bytes32(_blob)));
  }

  /**
   * @notice Set mirror.
   */
  function setMirror(uint256 gameId, uint32 roundNum, uint256 userIndex, uint256 mirror) internal {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = bytes32(uint256(gameId));
    _keyTuple[1] = bytes32(uint256(roundNum));
    _keyTuple[2] = bytes32(uint256(userIndex));

    StoreSwitch.setStaticField(_tableId, _keyTuple, 0, abi.encodePacked((mirror)), _fieldLayout);
  }

  /**
   * @notice Set mirror.
   */
  function _setMirror(uint256 gameId, uint32 roundNum, uint256 userIndex, uint256 mirror) internal {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = bytes32(uint256(gameId));
    _keyTuple[1] = bytes32(uint256(roundNum));
    _keyTuple[2] = bytes32(uint256(userIndex));

    StoreCore.setStaticField(_tableId, _keyTuple, 0, abi.encodePacked((mirror)), _fieldLayout);
  }

  /**
   * @notice Get mirrorRoundNum.
   */
  function getMirrorRoundNum(
    uint256 gameId,
    uint32 roundNum,
    uint256 userIndex
  ) internal view returns (uint32 mirrorRoundNum) {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = bytes32(uint256(gameId));
    _keyTuple[1] = bytes32(uint256(roundNum));
    _keyTuple[2] = bytes32(uint256(userIndex));

    bytes32 _blob = StoreSwitch.getStaticField(_tableId, _keyTuple, 1, _fieldLayout);
    return (uint32(bytes4(_blob)));
  }

  /**
   * @notice Get mirrorRoundNum.
   */
  function _getMirrorRoundNum(
    uint256 gameId,
    uint32 roundNum,
    uint256 userIndex
  ) internal view returns (uint32 mirrorRoundNum) {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = bytes32(uint256(gameId));
    _keyTuple[1] = bytes32(uint256(roundNum));
    _keyTuple[2] = bytes32(uint256(userIndex));

    bytes32 _blob = StoreCore.getStaticField(_tableId, _keyTuple, 1, _fieldLayout);
    return (uint32(bytes4(_blob)));
  }

  /**
   * @notice Set mirrorRoundNum.
   */
  function setMirrorRoundNum(uint256 gameId, uint32 roundNum, uint256 userIndex, uint32 mirrorRoundNum) internal {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = bytes32(uint256(gameId));
    _keyTuple[1] = bytes32(uint256(roundNum));
    _keyTuple[2] = bytes32(uint256(userIndex));

    StoreSwitch.setStaticField(_tableId, _keyTuple, 1, abi.encodePacked((mirrorRoundNum)), _fieldLayout);
  }

  /**
   * @notice Set mirrorRoundNum.
   */
  function _setMirrorRoundNum(uint256 gameId, uint32 roundNum, uint256 userIndex, uint32 mirrorRoundNum) internal {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = bytes32(uint256(gameId));
    _keyTuple[1] = bytes32(uint256(roundNum));
    _keyTuple[2] = bytes32(uint256(userIndex));

    StoreCore.setStaticField(_tableId, _keyTuple, 1, abi.encodePacked((mirrorRoundNum)), _fieldLayout);
  }

  /**
   * @notice Get mirrorGameID.
   */
  function getMirrorGameID(
    uint256 gameId,
    uint32 roundNum,
    uint256 userIndex
  ) internal view returns (uint256 mirrorGameID) {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = bytes32(uint256(gameId));
    _keyTuple[1] = bytes32(uint256(roundNum));
    _keyTuple[2] = bytes32(uint256(userIndex));

    bytes32 _blob = StoreSwitch.getStaticField(_tableId, _keyTuple, 2, _fieldLayout);
    return (uint256(bytes32(_blob)));
  }

  /**
   * @notice Get mirrorGameID.
   */
  function _getMirrorGameID(
    uint256 gameId,
    uint32 roundNum,
    uint256 userIndex
  ) internal view returns (uint256 mirrorGameID) {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = bytes32(uint256(gameId));
    _keyTuple[1] = bytes32(uint256(roundNum));
    _keyTuple[2] = bytes32(uint256(userIndex));

    bytes32 _blob = StoreCore.getStaticField(_tableId, _keyTuple, 2, _fieldLayout);
    return (uint256(bytes32(_blob)));
  }

  /**
   * @notice Set mirrorGameID.
   */
  function setMirrorGameID(uint256 gameId, uint32 roundNum, uint256 userIndex, uint256 mirrorGameID) internal {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = bytes32(uint256(gameId));
    _keyTuple[1] = bytes32(uint256(roundNum));
    _keyTuple[2] = bytes32(uint256(userIndex));

    StoreSwitch.setStaticField(_tableId, _keyTuple, 2, abi.encodePacked((mirrorGameID)), _fieldLayout);
  }

  /**
   * @notice Set mirrorGameID.
   */
  function _setMirrorGameID(uint256 gameId, uint32 roundNum, uint256 userIndex, uint256 mirrorGameID) internal {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = bytes32(uint256(gameId));
    _keyTuple[1] = bytes32(uint256(roundNum));
    _keyTuple[2] = bytes32(uint256(userIndex));

    StoreCore.setStaticField(_tableId, _keyTuple, 2, abi.encodePacked((mirrorGameID)), _fieldLayout);
  }

  /**
   * @notice Get response.
   */
  function getResponse(
    uint256 gameId,
    uint32 roundNum,
    uint256 userIndex
  ) internal view returns (string memory response) {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = bytes32(uint256(gameId));
    _keyTuple[1] = bytes32(uint256(roundNum));
    _keyTuple[2] = bytes32(uint256(userIndex));

    bytes memory _blob = StoreSwitch.getDynamicField(_tableId, _keyTuple, 0);
    return (string(_blob));
  }

  /**
   * @notice Get response.
   */
  function _getResponse(
    uint256 gameId,
    uint32 roundNum,
    uint256 userIndex
  ) internal view returns (string memory response) {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = bytes32(uint256(gameId));
    _keyTuple[1] = bytes32(uint256(roundNum));
    _keyTuple[2] = bytes32(uint256(userIndex));

    bytes memory _blob = StoreCore.getDynamicField(_tableId, _keyTuple, 0);
    return (string(_blob));
  }

  /**
   * @notice Set response.
   */
  function setResponse(uint256 gameId, uint32 roundNum, uint256 userIndex, string memory response) internal {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = bytes32(uint256(gameId));
    _keyTuple[1] = bytes32(uint256(roundNum));
    _keyTuple[2] = bytes32(uint256(userIndex));

    StoreSwitch.setDynamicField(_tableId, _keyTuple, 0, bytes((response)));
  }

  /**
   * @notice Set response.
   */
  function _setResponse(uint256 gameId, uint32 roundNum, uint256 userIndex, string memory response) internal {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = bytes32(uint256(gameId));
    _keyTuple[1] = bytes32(uint256(roundNum));
    _keyTuple[2] = bytes32(uint256(userIndex));

    StoreCore.setDynamicField(_tableId, _keyTuple, 0, bytes((response)));
  }

  /**
   * @notice Get the length of response.
   */
  function lengthResponse(uint256 gameId, uint32 roundNum, uint256 userIndex) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = bytes32(uint256(gameId));
    _keyTuple[1] = bytes32(uint256(roundNum));
    _keyTuple[2] = bytes32(uint256(userIndex));

    uint256 _byteLength = StoreSwitch.getDynamicFieldLength(_tableId, _keyTuple, 0);
    unchecked {
      return _byteLength / 1;
    }
  }

  /**
   * @notice Get the length of response.
   */
  function _lengthResponse(uint256 gameId, uint32 roundNum, uint256 userIndex) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = bytes32(uint256(gameId));
    _keyTuple[1] = bytes32(uint256(roundNum));
    _keyTuple[2] = bytes32(uint256(userIndex));

    uint256 _byteLength = StoreCore.getDynamicFieldLength(_tableId, _keyTuple, 0);
    unchecked {
      return _byteLength / 1;
    }
  }

  /**
   * @notice Get an item of response.
   * @dev Reverts with Store_IndexOutOfBounds if `_index` is out of bounds for the array.
   */
  function getItemResponse(
    uint256 gameId,
    uint32 roundNum,
    uint256 userIndex,
    uint256 _index
  ) internal view returns (string memory) {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = bytes32(uint256(gameId));
    _keyTuple[1] = bytes32(uint256(roundNum));
    _keyTuple[2] = bytes32(uint256(userIndex));

    unchecked {
      bytes memory _blob = StoreSwitch.getDynamicFieldSlice(_tableId, _keyTuple, 0, _index * 1, (_index + 1) * 1);
      return (string(_blob));
    }
  }

  /**
   * @notice Get an item of response.
   * @dev Reverts with Store_IndexOutOfBounds if `_index` is out of bounds for the array.
   */
  function _getItemResponse(
    uint256 gameId,
    uint32 roundNum,
    uint256 userIndex,
    uint256 _index
  ) internal view returns (string memory) {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = bytes32(uint256(gameId));
    _keyTuple[1] = bytes32(uint256(roundNum));
    _keyTuple[2] = bytes32(uint256(userIndex));

    unchecked {
      bytes memory _blob = StoreCore.getDynamicFieldSlice(_tableId, _keyTuple, 0, _index * 1, (_index + 1) * 1);
      return (string(_blob));
    }
  }

  /**
   * @notice Push a slice to response.
   */
  function pushResponse(uint256 gameId, uint32 roundNum, uint256 userIndex, string memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = bytes32(uint256(gameId));
    _keyTuple[1] = bytes32(uint256(roundNum));
    _keyTuple[2] = bytes32(uint256(userIndex));

    StoreSwitch.pushToDynamicField(_tableId, _keyTuple, 0, bytes((_slice)));
  }

  /**
   * @notice Push a slice to response.
   */
  function _pushResponse(uint256 gameId, uint32 roundNum, uint256 userIndex, string memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = bytes32(uint256(gameId));
    _keyTuple[1] = bytes32(uint256(roundNum));
    _keyTuple[2] = bytes32(uint256(userIndex));

    StoreCore.pushToDynamicField(_tableId, _keyTuple, 0, bytes((_slice)));
  }

  /**
   * @notice Pop a slice from response.
   */
  function popResponse(uint256 gameId, uint32 roundNum, uint256 userIndex) internal {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = bytes32(uint256(gameId));
    _keyTuple[1] = bytes32(uint256(roundNum));
    _keyTuple[2] = bytes32(uint256(userIndex));

    StoreSwitch.popFromDynamicField(_tableId, _keyTuple, 0, 1);
  }

  /**
   * @notice Pop a slice from response.
   */
  function _popResponse(uint256 gameId, uint32 roundNum, uint256 userIndex) internal {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = bytes32(uint256(gameId));
    _keyTuple[1] = bytes32(uint256(roundNum));
    _keyTuple[2] = bytes32(uint256(userIndex));

    StoreCore.popFromDynamicField(_tableId, _keyTuple, 0, 1);
  }

  /**
   * @notice Update a slice of response at `_index`.
   */
  function updateResponse(
    uint256 gameId,
    uint32 roundNum,
    uint256 userIndex,
    uint256 _index,
    string memory _slice
  ) internal {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = bytes32(uint256(gameId));
    _keyTuple[1] = bytes32(uint256(roundNum));
    _keyTuple[2] = bytes32(uint256(userIndex));

    unchecked {
      bytes memory _encoded = bytes((_slice));
      StoreSwitch.spliceDynamicData(_tableId, _keyTuple, 0, uint40(_index * 1), uint40(_encoded.length), _encoded);
    }
  }

  /**
   * @notice Update a slice of response at `_index`.
   */
  function _updateResponse(
    uint256 gameId,
    uint32 roundNum,
    uint256 userIndex,
    uint256 _index,
    string memory _slice
  ) internal {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = bytes32(uint256(gameId));
    _keyTuple[1] = bytes32(uint256(roundNum));
    _keyTuple[2] = bytes32(uint256(userIndex));

    unchecked {
      bytes memory _encoded = bytes((_slice));
      StoreCore.spliceDynamicData(_tableId, _keyTuple, 0, uint40(_index * 1), uint40(_encoded.length), _encoded);
    }
  }

  /**
   * @notice Get the full data.
   */
  function get(uint256 gameId, uint32 roundNum, uint256 userIndex) internal view returns (ResponsesData memory _table) {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = bytes32(uint256(gameId));
    _keyTuple[1] = bytes32(uint256(roundNum));
    _keyTuple[2] = bytes32(uint256(userIndex));

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
  function _get(
    uint256 gameId,
    uint32 roundNum,
    uint256 userIndex
  ) internal view returns (ResponsesData memory _table) {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = bytes32(uint256(gameId));
    _keyTuple[1] = bytes32(uint256(roundNum));
    _keyTuple[2] = bytes32(uint256(userIndex));

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
    uint256 userIndex,
    uint256 mirror,
    uint32 mirrorRoundNum,
    uint256 mirrorGameID,
    string memory response
  ) internal {
    bytes memory _staticData = encodeStatic(mirror, mirrorRoundNum, mirrorGameID);

    PackedCounter _encodedLengths = encodeLengths(response);
    bytes memory _dynamicData = encodeDynamic(response);

    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = bytes32(uint256(gameId));
    _keyTuple[1] = bytes32(uint256(roundNum));
    _keyTuple[2] = bytes32(uint256(userIndex));

    StoreSwitch.setRecord(_tableId, _keyTuple, _staticData, _encodedLengths, _dynamicData);
  }

  /**
   * @notice Set the full data using individual values.
   */
  function _set(
    uint256 gameId,
    uint32 roundNum,
    uint256 userIndex,
    uint256 mirror,
    uint32 mirrorRoundNum,
    uint256 mirrorGameID,
    string memory response
  ) internal {
    bytes memory _staticData = encodeStatic(mirror, mirrorRoundNum, mirrorGameID);

    PackedCounter _encodedLengths = encodeLengths(response);
    bytes memory _dynamicData = encodeDynamic(response);

    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = bytes32(uint256(gameId));
    _keyTuple[1] = bytes32(uint256(roundNum));
    _keyTuple[2] = bytes32(uint256(userIndex));

    StoreCore.setRecord(_tableId, _keyTuple, _staticData, _encodedLengths, _dynamicData, _fieldLayout);
  }

  /**
   * @notice Set the full data using the data struct.
   */
  function set(uint256 gameId, uint32 roundNum, uint256 userIndex, ResponsesData memory _table) internal {
    bytes memory _staticData = encodeStatic(_table.mirror, _table.mirrorRoundNum, _table.mirrorGameID);

    PackedCounter _encodedLengths = encodeLengths(_table.response);
    bytes memory _dynamicData = encodeDynamic(_table.response);

    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = bytes32(uint256(gameId));
    _keyTuple[1] = bytes32(uint256(roundNum));
    _keyTuple[2] = bytes32(uint256(userIndex));

    StoreSwitch.setRecord(_tableId, _keyTuple, _staticData, _encodedLengths, _dynamicData);
  }

  /**
   * @notice Set the full data using the data struct.
   */
  function _set(uint256 gameId, uint32 roundNum, uint256 userIndex, ResponsesData memory _table) internal {
    bytes memory _staticData = encodeStatic(_table.mirror, _table.mirrorRoundNum, _table.mirrorGameID);

    PackedCounter _encodedLengths = encodeLengths(_table.response);
    bytes memory _dynamicData = encodeDynamic(_table.response);

    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = bytes32(uint256(gameId));
    _keyTuple[1] = bytes32(uint256(roundNum));
    _keyTuple[2] = bytes32(uint256(userIndex));

    StoreCore.setRecord(_tableId, _keyTuple, _staticData, _encodedLengths, _dynamicData, _fieldLayout);
  }

  /**
   * @notice Decode the tightly packed blob of static data using this table's field layout.
   */
  function decodeStatic(
    bytes memory _blob
  ) internal pure returns (uint256 mirror, uint32 mirrorRoundNum, uint256 mirrorGameID) {
    mirror = (uint256(Bytes.slice32(_blob, 0)));

    mirrorRoundNum = (uint32(Bytes.slice4(_blob, 32)));

    mirrorGameID = (uint256(Bytes.slice32(_blob, 36)));
  }

  /**
   * @notice Decode the tightly packed blob of dynamic data using the encoded lengths.
   */
  function decodeDynamic(
    PackedCounter _encodedLengths,
    bytes memory _blob
  ) internal pure returns (string memory response) {
    uint256 _start;
    uint256 _end;
    unchecked {
      _end = _encodedLengths.atIndex(0);
    }
    response = (string(SliceLib.getSubslice(_blob, _start, _end).toBytes()));
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
  ) internal pure returns (ResponsesData memory _table) {
    (_table.mirror, _table.mirrorRoundNum, _table.mirrorGameID) = decodeStatic(_staticData);

    (_table.response) = decodeDynamic(_encodedLengths, _dynamicData);
  }

  /**
   * @notice Delete all data for given keys.
   */
  function deleteRecord(uint256 gameId, uint32 roundNum, uint256 userIndex) internal {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = bytes32(uint256(gameId));
    _keyTuple[1] = bytes32(uint256(roundNum));
    _keyTuple[2] = bytes32(uint256(userIndex));

    StoreSwitch.deleteRecord(_tableId, _keyTuple);
  }

  /**
   * @notice Delete all data for given keys.
   */
  function _deleteRecord(uint256 gameId, uint32 roundNum, uint256 userIndex) internal {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = bytes32(uint256(gameId));
    _keyTuple[1] = bytes32(uint256(roundNum));
    _keyTuple[2] = bytes32(uint256(userIndex));

    StoreCore.deleteRecord(_tableId, _keyTuple, _fieldLayout);
  }

  /**
   * @notice Tightly pack static (fixed length) data using this table's schema.
   * @return The static data, encoded into a sequence of bytes.
   */
  function encodeStatic(
    uint256 mirror,
    uint32 mirrorRoundNum,
    uint256 mirrorGameID
  ) internal pure returns (bytes memory) {
    return abi.encodePacked(mirror, mirrorRoundNum, mirrorGameID);
  }

  /**
   * @notice Tightly pack dynamic data lengths using this table's schema.
   * @return _encodedLengths The lengths of the dynamic fields (packed into a single bytes32 value).
   */
  function encodeLengths(string memory response) internal pure returns (PackedCounter _encodedLengths) {
    // Lengths are effectively checked during copy by 2**40 bytes exceeding gas limits
    unchecked {
      _encodedLengths = PackedCounterLib.pack(bytes(response).length);
    }
  }

  /**
   * @notice Tightly pack dynamic (variable length) data using this table's schema.
   * @return The dynamic data, encoded into a sequence of bytes.
   */
  function encodeDynamic(string memory response) internal pure returns (bytes memory) {
    return abi.encodePacked(bytes((response)));
  }

  /**
   * @notice Encode all of a record's fields.
   * @return The static (fixed length) data, encoded into a sequence of bytes.
   * @return The lengths of the dynamic fields (packed into a single bytes32 value).
   * @return The dyanmic (variable length) data, encoded into a sequence of bytes.
   */
  function encode(
    uint256 mirror,
    uint32 mirrorRoundNum,
    uint256 mirrorGameID,
    string memory response
  ) internal pure returns (bytes memory, PackedCounter, bytes memory) {
    bytes memory _staticData = encodeStatic(mirror, mirrorRoundNum, mirrorGameID);

    PackedCounter _encodedLengths = encodeLengths(response);
    bytes memory _dynamicData = encodeDynamic(response);

    return (_staticData, _encodedLengths, _dynamicData);
  }

  /**
   * @notice Encode keys as a bytes32 array using this table's field layout.
   */
  function encodeKeyTuple(uint256 gameId, uint32 roundNum, uint256 userIndex) internal pure returns (bytes32[] memory) {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = bytes32(uint256(gameId));
    _keyTuple[1] = bytes32(uint256(roundNum));
    _keyTuple[2] = bytes32(uint256(userIndex));

    return _keyTuple;
  }
}

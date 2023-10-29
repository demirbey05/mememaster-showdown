import { useMUD } from "../MUDContext"
import { getComponentValueStrict } from "@latticexyz/recs";
import { encodeEntity } from "@latticexyz/store-sync/recs";

export const getUsernameByIndex = (userIndex: number, gameID: number) => {
    const { components } = useMUD();

    return getComponentValueStrict(components.UserIndexToUsername,
        encodeEntity(components.UserIndexToUsername.metadata.keySchema, { gameID: BigInt(gameID), userIndex: BigInt(userIndex) }))!.username
}
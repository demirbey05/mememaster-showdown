import { useState, useEffect } from "react";
import { useMUD } from "../MUDContext";
import { useComponentValue } from "@latticexyz/react";
import { encodeEntity } from "@latticexyz/store-sync/recs";

export const usePlayerIsValid = (address: any, gameID: number) => {
    const { components } = useMUD();
    const [userState, setUserState] = useState<any>();
    const value = useComponentValue(components.IsPlayerValid, encodeEntity(components.IsPlayerValid.metadata.keySchema, { gameId: BigInt(gameID), userAddress: address }));

    useEffect(() => {
        if (value) {
            setUserState(value)
        }
    }, [value])

    return userState;
}
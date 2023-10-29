import { useState, useEffect } from "react";
import { useMUD } from "../MUDContext";
import { useComponentValue } from "@latticexyz/react";
import { encodeEntity } from "@latticexyz/store-sync/recs";

export const useIsUserTyped = (roundNumber: number, userIndex: number, gameID: number) => {
    const { components } = useMUD();
    const [isTyped, setIsTyped] = useState<boolean>(false);
    const value = useComponentValue(components.Responses, encodeEntity(components.Responses.metadata.keySchema, { gameId: BigInt(gameID), roundNum: roundNumber, userIndex: BigInt(userIndex) }));

    useEffect(() => {
        if (value) {
            setIsTyped(true)
        } else {
            setIsTyped(false)
        }
    }, [value])

    return isTyped;
}
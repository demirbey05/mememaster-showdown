import { useState, useEffect } from "react";
import { useMUD } from "../MUDContext";
import { useComponentValue } from "@latticexyz/react";
import { encodeEntity } from "@latticexyz/store-sync/recs";

export const useIsUserVoted = (roundNumber: number, userIndex: number, gameID: number) => {
    const { components } = useMUD();
    const [isVoted, setIsVoted] = useState<boolean>(false);
    const value = useComponentValue(components.IsVoted, encodeEntity(components.IsVoted.metadata.keySchema, { gameId: BigInt(gameID), roundNum: roundNumber, userIndex: BigInt(userIndex) }));

    useEffect(() => {
        if (value) {
            setIsVoted(value.isVoted)
        }
    }, [value])

    return isVoted;
}
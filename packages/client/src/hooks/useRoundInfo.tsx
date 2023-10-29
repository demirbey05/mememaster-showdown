import { useState, useEffect } from "react";
import { useMUD } from "../MUDContext";
import { useComponentValue } from "@latticexyz/react";
import { encodeEntity } from "@latticexyz/store-sync/recs";

export const useRoundInfo = (roundNumber: number, gameID: number) => {
    const { components } = useMUD();
    const [roundInfo, setRoundInfo] = useState<any>();
    const value = useComponentValue(components.RoundInfo, encodeEntity(components.RoundInfo.metadata.keySchema, { gameId: BigInt(gameID), roundNum: roundNumber }));

    useEffect(() => {
        if (value) {
            setRoundInfo(value)
        }
    }, [value])

    return roundInfo;
}
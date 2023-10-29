import { useState, useEffect } from "react";
import { useMUD } from "../MUDContext";
import { useComponentValue } from "@latticexyz/react";
import { encodeEntity } from "@latticexyz/store-sync/recs";

export const useGameData = (gameID: number) => {
    const { components } = useMUD();
    const [gameData, setGameData] = useState<any>();
    const value = useComponentValue(components.GameMetadata, encodeEntity(components.GameMetadata.metadata.keySchema, { gameId: BigInt(gameID) }));

    useEffect(() => {
        if (value) {
            setGameData(value)
        }
    }, [value])

    return gameData;
}
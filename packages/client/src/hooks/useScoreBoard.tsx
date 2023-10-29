import { useState, useEffect } from "react";
import { useMUD } from "../MUDContext";
import { useEntityQuery, useObservableValue } from "@latticexyz/react";
import { HasValue, getComponentValueStrict } from "@latticexyz/recs";

export const useScoreBoard = (gameID: number) => {
    const { components } = useMUD();

    const entity = useEntityQuery([
        HasValue(components.ScoreBoard, { mirrorGameId: BigInt(gameID) }),
    ]);
    const value = useObservableValue(components.ScoreBoard.update$);

    const [scores, setScores] = useState<any>();

    useEffect(() => {
        const allscores = entity.map((entityIndex) => {
            const score = getComponentValueStrict(components.ScoreBoard, entityIndex);
            return score;
        });
        setScores(allscores)
    }, [entity, value]);

    return scores;
}
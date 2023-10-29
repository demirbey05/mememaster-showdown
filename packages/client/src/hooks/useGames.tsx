import { useState, useEffect } from "react";
import { useMUD } from "../MUDContext";
import { useEntityQuery, useObservableValue } from "@latticexyz/react";
import { Has, getComponentValueStrict } from "@latticexyz/recs";

export const useGames = () => {
    const { components } = useMUD();

    const entity = useEntityQuery([
        Has(components.GameMetadata),
    ]);
    const value = useObservableValue(components.GameMetadata.update$);

    const [games, setGames] = useState<any>();

    useEffect(() => {
        const newGames = entity.map((entityIndex) => {
            const game = getComponentValueStrict(components.GameMetadata, entityIndex);
            return game;
        });
        setGames(newGames)
    }, [entity, value]);

    return games;
}
import { useMUD } from "../MUDContext"
import { useEffect, useState } from "react";
import { useEntityQuery, useObservableValue } from "@latticexyz/react";
import { HasValue, getComponentValueStrict } from "@latticexyz/recs";

export function useJokes(gameID: number) {
    const { components } = useMUD()

    const entity = useEntityQuery([
        HasValue(components.JokeUsage, { gameID: BigInt(gameID) }),
    ]);
    const value = useObservableValue(components.JokeUsage.update$);

    const [jokes, setJokes] = useState<any[]>([]);

    useEffect(() => {
        const newJokes = entity.map((entityIndex) => {
            const newJoke = getComponentValueStrict(components.JokeUsage, entityIndex);
            return newJoke;
        });

        setJokes(newJokes);
    }, [entity, value]);

    return jokes;
}
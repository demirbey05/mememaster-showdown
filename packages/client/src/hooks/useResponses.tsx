import { useState, useEffect } from "react";
import { useMUD } from "../MUDContext";
import { useEntityQuery } from "@latticexyz/react";
import { getComponentValueStrict, Has } from "@latticexyz/recs";
import { useObservableValue } from "@latticexyz/react";

export const useResponses = (gameID: number) => {
    const { components } = useMUD();

    const entity = useEntityQuery([
        Has(components.Responses),
    ]);
    const value = useObservableValue(components.Responses.update$);

    const [responses, setResponses] = useState<any>();

    useEffect(() => {
        const allResponses = entity.map((entityIndex) => {
            const response = getComponentValueStrict(components.Responses, entityIndex);
            return response;
        });
        setResponses(allResponses)
    }, [entity, value]);

    return responses;
}
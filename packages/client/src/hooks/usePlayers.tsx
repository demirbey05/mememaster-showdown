import { useMUD } from "../MUDContext";
import { useEntityQuery, useObservableValue } from "@latticexyz/react";
import { getComponentValueStrict, HasValue } from "@latticexyz/recs";
import { useState, useEffect } from "react";

export function usePlayers(gameID: number) {
    const { components } = useMUD();

    const userEntity = useEntityQuery([
        HasValue(components.IsPlayerValid, { gameID: BigInt(gameID) }),
    ]);
    const value = useObservableValue(components.IsPlayerValid.update$);

    const [userList, setUserList] = useState<any>();

    useEffect(() => {
        const userNames = userEntity.map((entityIndex) => {
            const username = getComponentValueStrict(components.IsPlayerValid, entityIndex);
            return username;
        });
        setUserList(userNames)
    }, [userEntity, value]);

    return userList;
}
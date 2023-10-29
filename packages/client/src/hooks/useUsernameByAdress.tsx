import { useState, useEffect } from "react";
import { useMUD } from "../MUDContext";
import { useComponentValue } from "@latticexyz/react";
import { encodeEntity } from "@latticexyz/store-sync/recs";

export const useUsernameByAddress = (address: any) => {
    const { components } = useMUD();
    const [username, setUsername] = useState<any>();
    const value = useComponentValue(components.AddressToUsername, encodeEntity(components.AddressToUsername.metadata.keySchema, { userAddress: address }));

    useEffect(() => {
        if (value) {
            setUsername(value.username)
        }
    }, [value])

    return username;
}
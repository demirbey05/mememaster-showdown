import { useRef } from "react";
import { getBurnerPrivateKey } from "@latticexyz/common";
import { Wallet } from "ethers";

export const getPlayerWallet = () => {
    const { current: userWallet } = useRef(new Wallet(getBurnerPrivateKey()).address)
    return userWallet;
}
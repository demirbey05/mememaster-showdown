import { useState } from "react"
import { Button, useToast } from "@chakra-ui/react"
import pepe from '../../../memes/pepe-frog.jpg'
import boyfriend from '../../../memes/distracted-boyfriend.jpg'
import drake from '../../../memes/drake-hotline-bling.jpeg'
import { FaShoppingBasket } from 'react-icons/fa'
import { useMUD } from "../../MUDContext"
import { useGameData } from "../../hooks/useGameData"
import { useGame } from "../../context/GameContext"

export const NFTMarket = () => {
    const { systemCalls } = useMUD();

    const { gameID } = useGame();
    const toast = useToast();

    const gameData = useGameData(gameID);

    const [loading, setIsLoading] = useState<boolean>(false)

    const [memeRigth, setMemeRight] = useState<boolean>(true)

    const handleRent = async (memeIndex: number) => {
        if (memeIndex && gameData) {
            setIsLoading(true)
            const tx = await systemCalls.changeNextMeme(gameID, gameData.roundNum + 1, memeIndex)

            if (tx) {
                toast({
                    title: 'Meme Change',
                    description: `Next round, your meme will be shown.`,
                    status: "loading",
                    duration: 9000,
                    isClosable: true,
                    position: "top-left"
                })
                setMemeRight(false)
            }
        }
        setIsLoading(false);
    }
    return (
        <div className="nft-market">
            <div className="col text-center">
                <div className="row mb-3">
                    <h4 >NFT Market</h4>
                </div>
                <div className="row mb-3 justify-content-center">
                    <img src={pepe} style={{ width: "150px" }} alt="pepememe" />
                    <Button
                        onClick={() => handleRent(21)}
                        isDisabled={!memeRigth}
                        isLoading={loading}
                        loadingText={"Renting..."}
                        mt={"2"}
                        width={"75%"}
                        textColor={"black"}
                        colorScheme="linkedin"
                        border={"solid"}
                        borderColor={"black"}>
                        Rent the Meme<FaShoppingBasket className="ms-2" />
                    </Button>
                </div>
                <div className="row mb-3 justify-content-center">
                    <img src={boyfriend} style={{ width: "150px" }} alt="pepememe" />
                    <Button
                        onClick={() => handleRent(22)}
                        isDisabled={!memeRigth}
                        isLoading={loading}
                        loadingText={"Renting..."}
                        mt={"2"}
                        width={"75%"}
                        textColor={"black"}
                        colorScheme="linkedin"
                        border={"solid"}
                        borderColor={"black"}>
                        Rent the Meme<FaShoppingBasket className="ms-2" />
                    </Button>
                </div>
                <div className="row justify-content-center">
                    <img src={drake} style={{ width: "150px" }} alt="pepememe" />
                    <Button
                        onClick={() => handleRent(23)}
                        isDisabled={!memeRigth}
                        isLoading={loading}
                        loadingText={"Renting..."}
                        mt={"2"}
                        width={"75%"}
                        textColor={"black"}
                        colorScheme="linkedin"
                        border={"solid"}
                        borderColor={"black"}>
                        Rent the Meme<FaShoppingBasket className="ms-2" />
                    </Button>
                </div>
            </div>
        </div>
    )
}
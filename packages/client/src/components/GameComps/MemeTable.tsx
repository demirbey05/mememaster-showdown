import { Avatar, Button, useToast } from "@chakra-ui/react"
import { getPlayerWallet } from "../../hooks/getPlayerWallet";
import { useEffect, useState } from "react";
import { useRoundInfo } from "../../hooks/useRoundInfo";
import { useGameData } from "../../hooks/useGameData";
import { usePlayers } from "../../hooks/usePlayers";
import { usePlayerIsValid } from "../../hooks/usePlayerIsValid";
import { getUsernameByIndex } from "../../hooks/getUsernameByIndex";
import { RiBlurOffFill } from 'react-icons/ri'
import { AiOutlineFastForward } from 'react-icons/ai'
import { useMUD } from "../../MUDContext";
import { useJokes } from "../../hooks/useJokes";
import sadHorn from '../../sounds/sad-horn.mp3';
import { BiSolidFaceMask } from 'react-icons/bi'
import { useGame } from "../../context/GameContext";

export const MemeTable = () => {
    const { systemCalls } = useMUD();

    const { gameID } = useGame();

    const userWallet = getPlayerWallet();
    const userState = usePlayerIsValid(userWallet, gameID)
    const gameData = useGameData(gameID);
    const roundInfo = useRoundInfo(gameData ? gameData.roundNum : 0, gameID)
    const players = usePlayers(gameID);
    const toast = useToast();
    const jokes = useJokes(gameID);

    const [users, setUsers] = useState<any[]>([])

    const [blured, setBlured] = useState<boolean>(false)

    const [blurRight, setBlurRigth] = useState<boolean>(true)
    const [fiveSecondRight, setFiveSecondRigth] = useState<boolean>(true)
    const [stealRight, setStealRight] = useState<boolean>(true)

    const [blurLoading, setBlurLoading] = useState<boolean>(false)
    const [fiveSecondLoading, setFiveSecondLoading] = useState<boolean>(false)
    const [stealLoading, setStealLoading] = useState<boolean>(false);

    const [memesData, setMemesData] = useState(null);

    useEffect(() => {
        if (jokes && gameData && userState) {
            jokes.map((joke) => {
                if (Number(joke.toUserIndex) === Number(userState.userIndex) && joke.roundNum === gameData.roundNum && joke.jokeIndex === 1) {
                    setBlured(true)
                    const audio = new Audio(sadHorn);
                    audio.volume = 0.5
                    audio.play();
                    toast({
                        title: 'Joked Usage',
                        description: `Someone is joking with you. Meme picture will be blured in this round.`,
                        status: 'info',
                        duration: 9000,
                        isClosable: true,
                        position: "top-left"
                    })
                }
            })
        }

        return () => {
            setBlured(false)
        }
    }, [jokes, userState, gameData])

    useEffect(() => {
        if (jokes && gameData && userState) {
            jokes.map((joke) => {
                if (Number(joke.toUserIndex) === Number(userState.userIndex) && joke.roundNum === gameData.roundNum && joke.jokeIndex === 2) {
                    const audio = new Audio(sadHorn);
                    audio.volume = 0.5
                    audio.play();
                    toast({
                        title: 'Joked Usage',
                        description: `Someone is joking with you. Your votes in this round are stolen.`,
                        status: 'info',
                        duration: 9000,
                        isClosable: true,
                        position: "top-left"
                    })
                }
            })
        }
    }, [jokes, userState, gameData])


    useEffect(() => {
        fetch('../../../memes.json')
            .then((response) => response.json())
            .then((data) => setMemesData(data))
            .catch((error) => console.error('Error fetching data: ', error));
    }, []);

    useEffect(() => {
        if (players && userState) {
            const filteredPlayers = players.filter((player: any) => player.userIndex !== userState.userIndex);
            setUsers(filteredPlayers);
        }
    }, [players, userState]);

    const handleBlur = async (userIndex: number) => {
        if (userIndex && userState && gameData) {
            setBlurLoading(true)
            const tx = await systemCalls.createFrontEndOnlyJoke(gameID, gameData.roundNum + 1, userIndex, userState.userIndex, 1);

            if (tx) {
                toast({
                    title: 'Joked Usage',
                    description: `Opponent's meme will blured on the next round.`,
                    status: 'success',
                    duration: 9000,
                    isClosable: true,
                    position: "top-left"
                })
                setBlurRigth(false)
            }
        }
        setBlurLoading(false)
    }

    const handleFiveSecond = async (userIndex: number) => {
        if (userIndex && userState && gameData) {
            setFiveSecondLoading(true)
            const tx = await systemCalls.createFrontEndOnlyJoke(gameID, gameData.roundNum + 1, userIndex, userState.userIndex, 3);

            if (tx) {
                toast({
                    title: 'Joked Usage',
                    description: `Opponent's input field will be disabled for five seconds on the next round.`,
                    status: 'success',
                    duration: 9000,
                    isClosable: true,
                    position: "top-left"
                })
                setFiveSecondRigth(false)
            }
        }
        setFiveSecondLoading(false)
    }

    const handleSteal = async (userIndex: number) => {
        if (userIndex && userState && gameData) {
            setStealLoading(true)
            const tx = await systemCalls.createStateJoke(gameID, gameData.roundNum + 1, userIndex, userState.userIndex, 2);

            if (tx) {
                toast({
                    title: 'Joked Usage',
                    description: `You will get opponent's votes on the next round.`,
                    status: 'success',
                    duration: 9000,
                    isClosable: true,
                    position: "top-left"
                })
                setStealRight(false)
            }
        }
        setStealLoading(false)
    }

    return (
        <>
            {
                users && users.map((user: any, key: number) => {
                    return (
                        <div className={`player${key + 1}`} key={key}>
                            <div className="row align-items-center">
                                <div className="col">
                                    <Button
                                        onClick={() => handleBlur(Number(user.userIndex))}
                                        isDisabled={!blurRight}
                                        isLoading={blurLoading}
                                        loadingText={"Bluring..."}
                                        border={"2px"}
                                        borderColor={"black"}
                                        textColor={"black"}
                                        colorScheme={"purple"}
                                        width={"100px"}>
                                        Blur
                                        <RiBlurOffFill className="ms-2" />
                                    </Button>
                                </div>
                                <div className="col">
                                    <Avatar name={getUsernameByIndex(Number(user.userIndex), gameID)} />
                                    <p className="mt-2 text-center">{getUsernameByIndex(Number(user.userIndex), gameID)}</p>
                                </div>
                                <div className="col">
                                    <Button
                                        onClick={() => handleFiveSecond(Number(user.userIndex))}
                                        isDisabled={!fiveSecondRight}
                                        isLoading={fiveSecondLoading}
                                        loadingText={"Delaying..."}
                                        border={"2px"}
                                        borderColor={"black"}
                                        textColor={"black"}
                                        colorScheme={"yellow"}
                                        width={"100px"}>
                                        5 s
                                        <AiOutlineFastForward className="ms-2" />
                                    </Button>
                                </div>
                            </div>
                            <div className="row align-items-center">
                                <div className="col">
                                    <Button
                                        onClick={() => handleSteal(Number(user.userIndex))}
                                        isDisabled={!stealRight}
                                        isLoading={stealLoading}
                                        loadingText={"Stealing..."}
                                        border={"2px"}
                                        borderColor={"black"}
                                        textColor={"black"}
                                        colorScheme={"pink"}
                                        width={"100px"}>
                                        Steal
                                        <BiSolidFaceMask className="ms-2" />
                                    </Button>
                                </div>
                            </div>
                        </div>
                    )
                })
            }
            <div className="meme-card">
                {
                    memesData && roundInfo &&
                    <img
                        style={{ aspectRatio: "1 / 1", filter: blured ? "blur(4px)" : "none" }}
                        width="250px"
                        height="250px"
                        src={memesData.memes[roundInfo.memeIndex - 1].url}
                        alt={`Meme ${roundInfo.memeIndex - 1}`}
                    />
                }
            </div>
        </>
    )
}
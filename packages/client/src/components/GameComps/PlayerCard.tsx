import { Avatar, Button, useToast } from "@chakra-ui/react"
import { getPlayerWallet } from "../../hooks/getPlayerWallet"
import { useUsernameByAddress } from "../../hooks/useUsernameByAdress";
import { useMUD } from "../../MUDContext";
import { useState, useEffect } from "react";
import { useGameData } from "../../hooks/useGameData";
import { useIsUserTyped } from "../../hooks/useIsUserTyped";
import { usePlayerIsValid } from "../../hooks/usePlayerIsValid";
import badumtss from '../../sounds/ba-dum-tss.mp3';
import { GiCardJoker } from 'react-icons/gi'
import { useJokes } from "../../hooks/useJokes";
import { useGame } from "../../context/GameContext";
import { BackToMenu } from "./BackToMenu";

export const PlayerCard = () => {
    const { systemCalls } = useMUD();

    const { gameID } = useGame();

    const userWallet = getPlayerWallet();
    const username = useUsernameByAddress(userWallet);
    const gameData = useGameData(gameID)
    const userState = usePlayerIsValid(userWallet, gameID)
    const isUserTyped = useIsUserTyped(gameData ? gameData.roundNum : 0, userState ? userState.userIndex : 0, gameID);
    const jokes = useJokes(gameID);
    const toast = useToast();

    const [inputDelayed, setInputDelayed] = useState<boolean>(false)

    const [timer, setTimer] = useState<number>(5)

    const [answer, setAnswer] = useState<string>("");
    const [loading, setLoading] = useState<boolean>(false)

    const [playedBaDumTss, setPlayedBaDumTss] = useState<boolean>(false);

    useEffect(() => {
        if (playedBaDumTss) {
            const audio = new Audio(badumtss);
            audio.volume = 0.5
            audio.play();
        }
    }, [playedBaDumTss])

    useEffect(() => {
        let interval: NodeJS.Timeout;

        if (jokes && gameData && userState) {
            jokes.forEach((joke) => {
                if (
                    Number(joke.toUserIndex) === Number(userState.userIndex) &&
                    joke.roundNum === gameData.roundNum &&
                    joke.jokeIndex === 3
                ) {
                    setTimer(5);
                    interval = setInterval(() => {
                        setTimer((prevTimer: any) => {
                            if (prevTimer === 0) {
                                setInputDelayed(true);
                                clearInterval(interval);
                            } else {
                                return prevTimer - 1;
                            }
                        });
                    }, 1000);
                    toast({
                        title: 'Joked Usage',
                        description: `Someone is joking with you. Your input field will be disabled in 5 seconds. Hurry upppp!`,
                        status: 'info',
                        duration: 9000,
                        isClosable: true,
                        position: "top-left"
                    });
                }
            });
        }

        return () => {
            setInputDelayed(false);
            if (interval) {
                clearInterval(interval);
            }
        };
    }, [jokes, gameData, userState]);

    const handleAnswer = async () => {
        if (answer.length > 0) {
            setLoading(true)
            const tx = await systemCalls.sumbitAnswer(answer, gameID);

            if (tx) {
                setAnswer("")
                document.getElementById("answer")!.value = "";
            }
        }
        setLoading(false)
    }
    return (
        <>
            <div className="me">
                <Avatar name={username} />
                <p className="mt-2">{username}</p>
                <BackToMenu />
            </div>

            <div className="meme-input-box">
                <div className="me-4 border border-black rounded-circle p-4">{timer}</div>
                <textarea
                    id="answer"
                    disabled={inputDelayed}
                    onChange={(e) => setAnswer(e.target.value)}
                    className="meme-input"
                    placeholder="Answer..." />
                <Button
                    onClick={() => {
                        setPlayedBaDumTss(true)
                        handleAnswer()
                    }}
                    textColor={"black"}
                    border={"2px"}
                    isLoading={loading}
                    loadingText={"Sending..."}
                    isDisabled={isUserTyped || gameData && gameData.current < 2}
                    colorScheme="linkedin"
                    ms={"5"}>
                    Send Meme<GiCardJoker className="ms-2" />
                </Button>
            </div>
        </>
    )
}
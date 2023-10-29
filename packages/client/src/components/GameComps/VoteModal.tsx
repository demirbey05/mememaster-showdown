import { Button } from "@chakra-ui/react"
import { useState, useEffect } from "react"
import { useGameData } from "../../hooks/useGameData";
import { useResponses } from "../../hooks/useResponses";
import { useMUD } from "../../MUDContext";
import { usePlayerIsValid } from "../../hooks/usePlayerIsValid";
import { getPlayerWallet } from "../../hooks/getPlayerWallet";
import { useIsUserVoted } from "../../hooks/useIsUserVoted";
import { useRoundInfo } from "../../hooks/useRoundInfo";
import cricket from '../../sounds/cricket.mp3';
import { MdHowToVote } from 'react-icons/md'
import { useGame } from "../../context/GameContext";

export const VoteModal = () => {
    const { systemCalls } = useMUD();
    const [isLoading, setIsLoading] = useState(false)

    const { gameID } = useGame();

    const gameData = useGameData(gameID);
    const responses = useResponses(gameID);
    const userWallet = getPlayerWallet();
    const userState = usePlayerIsValid(userWallet, gameID);
    const roundInfo = useRoundInfo(gameData ? gameData.roundNum : 0, gameID)
    const isVoted = useIsUserVoted(gameData ? gameData.roundNum : 0, userState ? userState.userIndex : 0, gameID)

    const [memesData, setMemesData] = useState(null);

    const [playedCricket, setPlayedCricket] = useState<boolean>(false);

    useEffect(() => {
        if (playedCricket) {
            const audio = new Audio(cricket);
            audio.volume = 0.5
            audio.play();
        }
    }, [playedCricket])

    useEffect(() => {
        fetch('../../../memes.json')
            .then((response) => response.json())
            .then((data) => setMemesData(data))
            .catch((error) => console.error('Error fetching data: ', error));
    }, []);

    const handleVote = async (userIndex: number) => {
        if (userIndex) {
            setIsLoading(true)
            await systemCalls.vote(userIndex, gameID)
        }
        setIsLoading(false)
    }

    return (
        <div className="voting-modal-overlay">
            <div className="voting-modal-container">
                <div className="voting-modal">
                    <div className="col-8">
                        <div className="row d-flex justify-content-evenly mb-3 border-bottom w-25">
                            <h4>Meme Voting</h4>
                        </div>
                        {
                            gameData && userState && responses && responses
                                .filter((response: any) => Number(response.mirror) !== Number(userState.userIndex) && Number(response.mirrorRoundNum) === gameData.roundNum)
                                .map((response: any, key: number) => {
                                    return (
                                        <div className="row d-flex justify-content-start align-items-center mb-3" key={key}>
                                            <div className="col-6 border p-3">
                                                <p>{response.response}</p>
                                            </div>
                                            <div className="col-2">
                                                <Button
                                                    isLoading={isLoading}
                                                    isDisabled={isVoted}
                                                    colorScheme={"linkedin"}
                                                    textColor={"black"}
                                                    onClick={() => {
                                                        handleVote(Number(response.mirror))
                                                        setPlayedCricket(true)
                                                    }}>
                                                    Vote<MdHowToVote className="ms-2" />
                                                </Button>
                                            </div>
                                        </div>
                                    )
                                })
                        }
                    </div>
                    <div className="col-4 d-flex align-items-center">
                        {
                            memesData && roundInfo &&
                            <img
                                style={{ aspectRatio: "1 / 1" }}
                                width={"300px"}
                                height={"300px"}
                                src={memesData.memes[roundInfo.memeIndex - 1].url}
                                alt={`Meme ${roundInfo.memeIndex - 1}`} />
                        }
                    </div>
                </div>
            </div>
        </div>
    )
}
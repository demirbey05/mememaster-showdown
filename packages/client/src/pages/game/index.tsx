import { useState, useEffect } from "react"
import { useMUD } from "../../MUDContext"
import { MemeTable } from "../../components/GameComps/MemeTable"
import { NFTMarket } from "../../components/GameComps/NFTMarket"
import { PlayerCard } from "../../components/GameComps/PlayerCard"
import { ScoreTable } from "../../components/GameComps/ScoreTable"
import { VoteModal } from "../../components/GameComps/VoteModal"
import { usePlayerIsValid } from "../../hooks/usePlayerIsValid"
import { getPlayerWallet } from "../../hooks/getPlayerWallet"
import { useGameData } from "../../hooks/useGameData"
import { useRoundInfo } from "../../hooks/useRoundInfo"
import { WinnerTable } from "../../components/GameComps/WinnerTable"
import airhorn from '../../sounds/airhorn.mp3';
import { useGame } from "../../context/GameContext"

export const Game = () => {
    const { systemCalls } = useMUD();

    const { gameID } = useGame();

    const userWallet = getPlayerWallet();
    const userState = usePlayerIsValid(userWallet, gameID);
    const gameData = useGameData(gameID);
    const roundInfo = useRoundInfo(gameData ? gameData.roundNum : 0, gameID)

    const [playedAirhorn, setPlayedAirhorn] = useState<boolean>(false);

    useEffect(() => {
        if (gameData && gameData.roundNum === 1 && !playedAirhorn) {
            const audio = new Audio(airhorn);
            audio.volume = 0.1
            audio.play();
            setPlayedAirhorn(true);
        }
    }, [gameData, playedAirhorn]);

    useEffect(() => {
        if (userState && Number(userState.userIndex) === 4 && gameData && gameData.current === 2) {
            (async () => {
                await systemCalls.moveFromGeneratingToTyping(gameID);
            })();
        }
    }, [userState, gameData]);

    useEffect(() => {
        if (roundInfo && roundInfo.totalType === 4 && userState && Number(userState.userIndex) === 4 && gameData && gameData.current === 3) {
            (async () => {
                await systemCalls.moveFromTypingToVoting(gameID);
            })();
        }
    }, [roundInfo, gameData])

    useEffect(() => {
        if (roundInfo && roundInfo.totalVote === 4 && userState && Number(userState.userIndex) === 4 && gameData && gameData.current === 4) {
            (async () => {
                await systemCalls.moveFromVotingToNextStage(gameID);
            })();
        }
    }, [roundInfo, gameData])

    useEffect(() => {
        if (gameData && gameData.current === 5 && userState && Number(userState.userIndex) === 4) {
            (async () => {
                await systemCalls.claimWinner(gameID);
            })();
        }
    }, [gameData, userState, roundInfo])

    return (
        <div className="game-body">
            <ScoreTable />
            <MemeTable />
            <PlayerCard />
            <NFTMarket />
            {gameData && gameData.current === 5 && <WinnerTable />}
            {gameData && gameData.current === 4 && <VoteModal />}
        </div>
    )
}
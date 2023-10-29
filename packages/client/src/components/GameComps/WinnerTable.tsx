import { useEffect } from "react";
import { useGameData } from "../../hooks/useGameData"
import { getUsernameByIndex } from "../../hooks/getUsernameByIndex";
import { getPlayerWallet } from "../../hooks/getPlayerWallet";
import { usePlayerIsValid } from "../../hooks/usePlayerIsValid";
import golfClap from '../../sounds/golfclap.mp3';
import { useGame } from "../../context/GameContext";

export const WinnerTable = () => {
    const { gameID } = useGame();

    const gameData = useGameData(gameID);
    const userWallet = getPlayerWallet();
    const userState = usePlayerIsValid(userWallet, gameID);

    useEffect(() => {
        if (gameData && userState && gameData.winners[userState.userIndex] === 1) {
            const audio = new Audio(golfClap);
            audio.volume = 0.1
            audio.loop = false
            audio.play();
        }
    }, [gameData, userState])
    return (
        <div className="winner-table ">
            <div className="col text-center">
                <div className="row mb-3 border-bottom border-success">
                    <h4 className="text-success">Winners</h4>
                </div>
                {
                    gameData &&
                    <>
                        {gameData.winners[1] === 1 && <h5 className="text-success" >{getUsernameByIndex(1, gameID)}</h5>}
                        {gameData.winners[2] === 1 && <h5 className="text-success" >{getUsernameByIndex(2, gameID)}</h5>}
                        {gameData.winners[3] === 1 && <h5 className="text-success" >{getUsernameByIndex(3, gameID)}</h5>}
                        {gameData.winners[4] === 1 && <h5 className="text-success" >{getUsernameByIndex(4, gameID)}</h5>}
                    </>
                }
            </div>
        </div>
    )
}
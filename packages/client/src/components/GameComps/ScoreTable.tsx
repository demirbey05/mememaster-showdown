import { useGameData } from "../../hooks/useGameData";
import { useScoreBoard } from "../../hooks/useScoreBoard";
import { getUsernameByIndex } from "../../hooks/getUsernameByIndex";
import { useGame } from "../../context/GameContext";

export const ScoreTable = () => {
    const { gameID } = useGame();

    const stages = ["None", "Waiting for Players", "Meme Generating", "Meme Typing", "Meme Voting", "End"]
    const gameData = useGameData(gameID);
    const scores = useScoreBoard(gameID);

    return (
        <div className="score-table">
            <h4 className="text-center mt-2">Score Table</h4>
            <div className="row p-2">
                {
                    scores && scores.map((data: any, key: number) => {
                        return (
                            <div className="col text-center border-end border-black" key={key}>
                                <p className="d-block">{getUsernameByIndex(Number(data.mirror), gameID)}</p>
                                <h5 className="d-block">{data.score}</h5>
                            </div>
                        )
                    })
                }
                {
                    gameData &&
                    <>
                        <div className="col text-center text-success">
                            <p className="d-block">Round</p>
                            <h5 className="d-block">{gameData.roundNum} / {gameData.limitRound}</h5>
                        </div>
                        <div className="col text-center border-start border-black text-danger">
                            <p className="d-block">Stage</p>
                            <h5 className="d-block">{stages[gameData.current]}</h5>
                        </div>
                    </>
                }
            </div>
        </div>
    )
}
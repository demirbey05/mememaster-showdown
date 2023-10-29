import { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { Box, Button } from '@chakra-ui/react'
import { useMUD } from '../../MUDContext'
import { useGame } from '../../context/GameContext';
import { usePlayerIsValid } from '../../hooks/usePlayerIsValid';
import { getPlayerWallet } from '../../hooks/getPlayerWallet';
import { useGameData } from '../../hooks/useGameData';

export const JoinGameModal = ({ setJoinGameOpen }: { setJoinGameOpen: (value: boolean) => void }) => {
    const { systemCalls } = useMUD();
    const { gameID, setGameID } = useGame();
    const userWallet = getPlayerWallet();
    const userState = usePlayerIsValid(userWallet, gameID);
    const gameData = useGameData(gameID)

    const [loading, setIsLoading] = useState<boolean>(false);

    const navigate = useNavigate();

    const handleJoinGame = async () => {
        setIsLoading(true)

        if (userState && (userState.isValid === true || userState.isValid === false)) {
            navigate(`/game/${gameID}`);
        } else {
            const tx = await systemCalls.joinGame(gameID);
            if (tx) {
                const interval = setInterval(() => {
                    clearInterval(interval);
                    navigate(`/game/${gameID}`);
                }, 1000);
            }
        }
    }
    return (
        <div className="create-game-modal-overlay">
            <div className="create-game-container">
                <Box p={"10"} borderColor={"teal"} borderWidth={"3px"} borderRadius={"10px"} backgroundColor={"blue.200"}>
                    <Box p={"5"} mb={"2"} border={"1px"} borderRadius={"10px"} >
                        <div className='row d-flex justify-content-center mb-2'>
                            <h3 className='text-center'>Click "Join Game" button to join game.</h3>
                            <Button
                                onClick={handleJoinGame}
                                width={"25%"}
                                isLoading={loading}
                                loadingText={"Creating..."}
                                mt={"3"}
                                textColor={"black"}
                                border={"2px"}
                                borderColor={"black"}
                                colorScheme='whatsapp'>
                                Join Game
                            </Button>
                            <Button
                                onClick={() => {
                                    setGameID(0)
                                    setJoinGameOpen(false)
                                }}
                                isLoading={loading}
                                width={"25%"}
                                mt={"3"}
                                textColor={"black"}
                                border={"2px"}
                                borderColor={"black"}
                                colorScheme='red'>
                                Back to Menu
                            </Button>
                        </div>
                    </Box>
                </Box>
            </div>
        </div>
    )
}
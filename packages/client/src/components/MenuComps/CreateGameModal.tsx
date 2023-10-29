import { useState } from 'react';
import { Box, Button } from '@chakra-ui/react'
import { useMUD } from '../../MUDContext'
import { useGame } from '../../context/GameContext';

export const CreateGameModal = ({ setCreateModalOpen, setJoinGameOpen }: { setCreateModalOpen: (value: boolean) => void, setJoinGameOpen: (value: boolean) => void }) => {
    const { systemCalls } = useMUD();
    const { setGameID } = useGame();

    const [loading, setIsLoading] = useState<boolean>(false);

    const handleCreateGame = async () => {
        setIsLoading(true)
        const tx = await systemCalls.initGame();
        if (tx) {
            setGameID(Number(tx.result))
            setCreateModalOpen(false)
            setJoinGameOpen(true)
        }
        setIsLoading(false)
    }
    return (
        <div className="create-game-modal-overlay">
            <div className="create-game-container">
                <Box p={"10"} borderColor={"teal"} borderWidth={"3px"} borderRadius={"10px"} backgroundColor={"blue.200"}>
                    <Box p={"5"} mb={"2"} border={"1px"} borderRadius={"10px"} >
                        <div className='row d-flex justify-content-center mb-2'>
                            <h3 className='text-center'>You are going to create a new game. Are you joking?</h3>
                            <Button
                                onClick={handleCreateGame}
                                width={"25%"}
                                isLoading={loading}
                                loadingText={"Creating..."}
                                mt={"3"}
                                textColor={"black"}
                                border={"2px"}
                                borderColor={"black"}
                                colorScheme='whatsapp'>
                                I am not joking
                            </Button>
                            <Button
                                onClick={() => setCreateModalOpen(false)}
                                isLoading={loading}
                                width={"25%"}
                                mt={"3"}
                                textColor={"black"}
                                border={"2px"}
                                borderColor={"black"}
                                colorScheme='red'>
                                I was joking
                            </Button>
                        </div>
                    </Box>
                </Box>
            </div>
        </div>
    )
}
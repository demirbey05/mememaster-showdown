import {
    Table,
    Thead,
    Tbody,
    Tr,
    Th,
    Td,
    TableContainer,
    Button,
} from '@chakra-ui/react'
import { getPlayerWallet } from '../../hooks/getPlayerWallet'
import { useUsernameByAddress } from '../../hooks/useUsernameByAdress';
import { FaArrowRight } from 'react-icons/fa'
import { useGames } from '../../hooks/useGames';
import { useGame } from '../../context/GameContext';

export const GameList = ({ setJoinGameOpen }: { setJoinGameOpen: (value: boolean) => void }) => {
    const { setGameID } = useGame();
    const userWallet = getPlayerWallet();
    const username = useUsernameByAddress(userWallet);
    const gameList = useGames();

    return (
        <TableContainer
            borderColor={"teal"}
            borderWidth={"3px"}
            borderRadius={"10px"}
            textColor={"black"}
            backgroundColor={"blue.200"}
            overflowY={"auto"}
            height={"342px"}
            width={"75%"}>
            <Table variant='simple'>
                <Thead zIndex={"10"} backgroundColor={"blue.400"} position="sticky" top={0}>
                    <Tr>
                        <Th>Current Round</Th>
                        <Th>Round Limit</Th>
                        <Th>Players</Th>
                        <Th>Join</Th>
                    </Tr>
                </Thead>
                <Tbody>
                    {gameList && gameList.map((game: any, key: number) => {
                        return (
                            <Tr key={key}>
                                <Td>{game.roundNum}</Td>
                                <Td>8</Td>
                                <Td>{game.currentUser} / 4</Td>
                                <Td>
                                    {
                                        username &&
                                        <Button
                                            onClick={() => {
                                                setJoinGameOpen(true)
                                                setGameID(Number(game.mirror))
                                            }}
                                            border={"2px"}
                                            textColor={"black"}
                                            borderColor={"black"}
                                            mt={"3"}
                                            colorScheme='teal'>
                                            Join Game
                                            <FaArrowRight className='ms-2' />
                                        </Button>
                                    }
                                </Td>
                            </Tr>
                        )
                    })}
                </Tbody>
            </Table>
        </TableContainer>
    )
}
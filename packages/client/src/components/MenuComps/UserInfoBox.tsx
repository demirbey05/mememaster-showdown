import { useState, useEffect } from "react";
import { Center, Box, Badge, Button, Input, Progress } from '@chakra-ui/react'
import { getPlayerWallet } from "../../hooks/getPlayerWallet";
import { useUsernameByAddress } from "../../hooks/useUsernameByAdress";
import { useSyncProgress } from "../../hooks/useSyncProgress";
import { useMUD } from "../../MUDContext";
import { MdOutlineAssignmentTurnedIn } from "react-icons/md"
import { FaPlusCircle } from 'react-icons/fa'

export const UserInfoBox = ({ setCreateModalOpen }: { setCreateModalOpen: (value: boolean) => void }) => {
    const { systemCalls } = useMUD();

    const userWallet = getPlayerWallet();
    const username = useUsernameByAddress(userWallet);
    const progress = useSyncProgress();

    const [myUsername, setMyUsername] = useState<string>("");
    const [loading, setLoading] = useState<boolean>(false);
    const [disabled, setDisabled] = useState<boolean>(true);

    useEffect(() => {
        const length = myUsername.length;
        if (length > 2 && length < 33) {
            setDisabled(false)
        } else {
            setDisabled(true)
        }
    }, [myUsername])

    const handleUsername = async () => {
        if (!username) {
            setLoading(true)
            await systemCalls.addUsername(myUsername);
        }
        setLoading(false)
    }

    return (
        <Box p={"10"} borderColor={"teal"} borderWidth={"3px"} borderRadius={"10px"} backgroundColor={"blue.200"} width={"75%"}>
            {
                progress && progress.step === "live" ?
                    <>
                        <Box p={"5"} mb={"2"} border={"1px"} borderRadius={"10px"} >
                            <div className='row d-flex justify-content-center mb-2'>
                                <Badge p={"2"} textAlign={"center"} borderRadius='full' colorScheme='teal' width={"50%"}>
                                    Wallet
                                </Badge>
                            </div>
                            <div className='row d-flex justify-content-center mb-3'>
                                <Box
                                    textAlign={"center"}
                                    fontWeight={"bold"}
                                    fontSize={"lg"}
                                >
                                    {userWallet}
                                </Box>
                            </div>
                            <div className='row d-flex justify-content-center mb-2'>
                                <Badge p={"2"} textAlign={"center"} borderRadius='full' colorScheme='teal' width={"50%"}>
                                    Username
                                </Badge>
                            </div>
                            <div className='row d-flex justify-content-center'>
                                {
                                    username ?
                                        <Box
                                            textAlign={"center"}
                                            fontWeight={"bold"}
                                            fontSize={"lg"}
                                        >
                                            {username}
                                        </Box> :
                                        <Center>
                                            <Input
                                                onChange={(e) => setMyUsername(e.target.value)}
                                                variant={"outline"}
                                                borderColor={"black"}
                                                width={"50%"}
                                                placeholder='Min 3 - Max 32 Char' />
                                            <Button
                                                border={"2px"}
                                                textColor={"black"}
                                                isLoading={loading}
                                                isDisabled={disabled}
                                                onClick={handleUsername}
                                                loadingText={"Assigning"}
                                                colorScheme='teal'
                                                ms={"2"}>
                                                Assign<MdOutlineAssignmentTurnedIn className="ms-2" />
                                            </Button>
                                        </Center>
                                }
                            </div>
                        </Box>
                        <Center>
                            <Button
                                onClick={() => setCreateModalOpen(true)}
                                border={"2px"}
                                isDisabled={!username}
                                textColor={"black"}
                                loadingText={"Assigning"}
                                colorScheme='teal'
                                ms={"2"}>
                                Create Game
                                <FaPlusCircle className="ms-2" />
                            </Button>
                        </Center>
                    </> :
                    <>
                        <ProgressBar />
                        <ProgressInfo />
                    </>
            }
        </Box>
    )
}

const ProgressBar = () => {
    const progress = useSyncProgress();
    return (
        <Progress colorScheme="linkedin"
            borderRadius={"25px"}
            width={"350px"}
            height='32px'
            hasStripe
            isAnimated
            value={progress ? progress.percentage * 100 : 0} />
    )
}

const ProgressInfo = () => {
    const progress = useSyncProgress();
    return (
        <>
            <p className="text-white text-center mt-3 display-6 text-danger-emphasis">
                {progress ? (progress.percentage !== 100 ? progress.percentage * 100 : 100) : 0}%
            </p>
            <p className="text-white text-center display-6 text-danger-emphasis">
                {progress ? progress.message : "Fetching data from blockchain"}...
            </p>
        </>
    )
}
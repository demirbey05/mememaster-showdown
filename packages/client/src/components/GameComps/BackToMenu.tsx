import { Button } from "@chakra-ui/react"
import { IoArrowBackCircleOutline } from 'react-icons/io5'
import { useNavigate } from "react-router-dom"
import { useGame } from "../../context/GameContext";

export const BackToMenu = () => {
    const navigate = useNavigate();
    const { setGameID } = useGame();

    const handleBack = () => {
        navigate("/");
        setGameID(0)
    }
    return (
        <Button
            border={"2px"}
            borderColor={"black"}
            colorScheme="linkedin"
            textColor={"black"}
            onClick={handleBack}>
            Menu<IoArrowBackCircleOutline className="ms-2" />
        </Button>
    )
}
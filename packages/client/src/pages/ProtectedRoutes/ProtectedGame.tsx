import { Outlet } from 'react-router-dom';
import { Navigate } from 'react-router-dom';
import { useGame } from '../../context/GameContext';

export const ProtectedGame = ({ isUserValid, progress }: { isUserValid: boolean | undefined, progress: any }) => {
    const { gameID } = useGame();

    if (progress && progress.step !== "live") {
        return <Navigate to="/" />
    }

    if (gameID <= 0) {
        return <Navigate to="/" />
    }

    return <Outlet />
}
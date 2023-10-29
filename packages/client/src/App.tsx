import { BrowserRouter, Route, Routes } from "react-router-dom";
import { Menu } from "./pages/menu";
import { Game } from "./pages/game";
import { ProtectedGame } from "./pages/ProtectedRoutes/ProtectedGame";
import { useSyncProgress } from "./hooks/useSyncProgress";
import { getPlayerWallet } from "./hooks/getPlayerWallet";
import { usePlayerIsValid } from "./hooks/usePlayerIsValid";
import { useGame } from "./context/GameContext";

export const App = () => {
  const { gameID } = useGame();
  const progress = useSyncProgress();
  const userWallet = getPlayerWallet();
  const isValid = usePlayerIsValid(userWallet, gameID);
  return (
    <BrowserRouter>
      <Routes>
        <Route element={<ProtectedGame progress={progress} isUserValid={isValid && isValid.isValid} />}>
          <Route element={<Game />} path="/game/:gameID" />
        </Route>
        <Route element={<Menu />} path="/" />
      </Routes>
    </BrowserRouter >
  );
};

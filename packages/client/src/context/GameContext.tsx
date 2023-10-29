import { useState, useContext, createContext, ReactNode } from "react";

type GameContextType = {
    gameID: number;
    setGameID: (value: any) => void;
};

const GameContext = createContext<GameContextType>({
    gameID: 0,
    setGameID: () => { }
});

const GameProvider: React.FC<{ children: ReactNode }> = ({ children, }: { children: ReactNode; }) => {
    const [gameID, setGameID] = useState<number>(0);

    const results: GameContextType = {
        gameID,
        setGameID
    };

    return (
        <GameContext.Provider value={results}>
            {children}
        </GameContext.Provider>
    );
};

const useGame = () => useContext(GameContext);

export { GameProvider, useGame };
import { SetupNetworkResult } from "./setupNetwork";
export type SystemCalls = ReturnType<typeof createSystemCalls>;

export function createSystemCalls({
  worldContract,
  waitForTransaction,
}: SetupNetworkResult) {
  const initGame = async () => {
    try {
      const txSimulated = await worldContract.simulate.initGame([8, 4]);
      const tx = await worldContract.write.initGame([8, 4]);
      await waitForTransaction(tx);
      return txSimulated;
    } catch (e) {
      console.log(e);
      return null;
    }
  };

  const addUsername = async (username: string) => {
    try {
      const tx = await worldContract.write.addUsername([username]);
      await waitForTransaction(tx);
      return tx;
    } catch (e) {
      console.log(e);
      return null;
    }
  };

  const joinGame = async (gameID: number) => {
    try {
      const tx = await worldContract.write.joinGame([BigInt(gameID)]);
      await waitForTransaction(tx);
      return tx;
    } catch (e) {
      console.log(e);
      return null;
    }
  };

  const moveFromTypingToVoting = async (gameID: number) => {
    try {
      const tx = await worldContract.write.moveFromTypingToVoting([
        BigInt(gameID),
      ]);
      await waitForTransaction(tx);
      return tx;
    } catch (e) {
      console.log(e);
      return null;
    }
  };

  const moveFromVotingToNextStage = async (gameID: number) => {
    try {
      const tx = await worldContract.write.moveFromVotingToNextStage([
        BigInt(gameID),
      ]);
      await waitForTransaction(tx);
      return tx;
    } catch (e) {
      console.log(e);
      return null;
    }
  };

  const moveFromGeneratingToTyping = async (gameID: number) => {
    try {
      const tx = await worldContract.write.moveFromGeneratingToTyping([
        BigInt(gameID),
      ]);
      await waitForTransaction(tx);
      return tx;
    } catch (e) {
      console.log(e);
      return null;
    }
  };

  const sumbitAnswer = async (answer: string, gameID: number) => {
    try {
      const tx = await worldContract.write.submitAnswer([
        BigInt(gameID),
        answer,
      ]);
      await waitForTransaction(tx);
      return tx;
    } catch (e) {
      console.log(e);
      return null;
    }
  };

  const vote = async (userIndex: number, gameID: number) => {
    try {
      const tx = await worldContract.write.vote([
        BigInt(gameID),
        BigInt(userIndex),
      ]);
      await waitForTransaction(tx);
      return tx;
    } catch (e) {
      console.log(e);
      return null;
    }
  };

  const claimWinner = async (gameID: number) => {
    try {
      const tx = await worldContract.write.claimWinner([BigInt(gameID)]);
      await waitForTransaction(tx);
      return tx;
    } catch (e) {
      console.log(e);
      return null;
    }
  };

  const createStateJoke = async (
    gameID: number,
    roundNumb: number,
    toUserIndex: number,
    fromUserIndex: number,
    jokeType: number
  ) => {
    try {
      const tx = await worldContract.write.createStateJoke([
        BigInt(gameID),
        roundNumb,
        BigInt(toUserIndex),
        BigInt(fromUserIndex),
        jokeType,
      ]);
      await waitForTransaction(tx);
      return tx;
    } catch (e) {
      console.log(e);
      return null;
    }
  };

  const createFrontEndOnlyJoke = async (
    gameID: number,
    roundNumb: number,
    toUserIndex: number,
    fromUserIndex: number,
    jokeType: number
  ) => {
    try {
      const tx = await worldContract.write.createFrontEndOnlyJoke([
        BigInt(gameID),
        roundNumb,
        BigInt(toUserIndex),
        BigInt(fromUserIndex),
        jokeType,
      ]);
      await waitForTransaction(tx);
      return tx;
    } catch (e) {
      console.log(e);
      return null;
    }
  };

  const changeNextMeme = async (
    gameID: number,
    roundNumb: number,
    memeIndex: number
  ) => {
    try {
      const tx = await worldContract.write.changeNextMeme([
        BigInt(gameID),
        roundNumb,
        memeIndex,
      ]);
      await waitForTransaction(tx);
      return tx;
    } catch (e) {
      console.log(e);
      return null;
    }
  };

  return {
    initGame,
    addUsername,
    joinGame,
    moveFromTypingToVoting,
    moveFromVotingToNextStage,
    moveFromGeneratingToTyping,
    sumbitAnswer,
    vote,
    claimWinner,
    createStateJoke,
    createFrontEndOnlyJoke,
    changeNextMeme,
  };
}

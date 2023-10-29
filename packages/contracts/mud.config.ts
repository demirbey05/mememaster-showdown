import { mudConfig } from "@latticexyz/world/register";

export default mudConfig({
  tables: {
    AddressToUsername: {
      keySchema: {
        userAddress:"address",
      },
      valueSchema:{
        username:"string"
      }
    },
    UserIndexToUsername:{
      keySchema:{
        gameID:"uint256",
        userIndex:"uint256"
      },
      valueSchema:{
        username:"string",
      }
    },
    StateJokes:{
      keySchema:{
        gameID:"uint256",
        roundNum:"uint32",
        toIndex:"uint256",
        jokeType:"uint32"
    },
    valueSchema:{
      fromIndex:"uint256",
    }
  },
    GameMetadata:{
      keySchema:{
        gameId:"uint256"
      },
      valueSchema:{
        roundNum: "uint32",
        limitRound:"uint32",
        currentUser:"uint32",
        limitUser:"uint32",
        current:"GameStatus",
        colorCursor:"uint256",
        latestBlockRecord:"uint256",
        mirror:"uint256",
        winners:"uint32[]",
        
        
      }
    },
    GameCursor:{
      valueSchema:{
        cursor:"uint256",
      }
    },
    IsPlayerValid:{
      keySchema:{
        gameId:"uint256",
        userAddress:"address"
      },
      valueSchema:{
        isValid:"bool",
        userIndex:"uint256",
        gameID:"uint256",
      }
    },
    IsVoted :{
      keySchema:{
        gameId:"uint256",
        roundNum:"uint32",
        userIndex:"uint256"
      },
      valueSchema:{
        isVoted:"bool"
      }
    },
    RoundInfo:{
      keySchema:{
        gameId:"uint256",
        roundNum:"uint32"
      },
      valueSchema:{
        memeIndex:"uint32",
        totalVote:"uint32",
        totalType:"uint32",
        
      }
    },
    Responses : {
      keySchema:{
        gameId:"uint256",
        roundNum:"uint32",
        userIndex:"uint256"
      },
      valueSchema:{
        mirror :"uint256",
        mirrorRoundNum:"uint32",
        mirrorGameID:"uint256",
        response:"string",
        
      }
    },
    ScoreBoard :{
      keySchema:{
        gameId:"uint256",
        userIndex:"uint256"
      },
      valueSchema:{
        mirror:"uint256",
        score:"uint32",
        mirrorGameId:"uint256",
      }
    },
    JokeUsage:{
      valueSchema:{
        gameID:"uint256",
        roundNum:"uint32",
        toUserIndex:"uint256",
        fromUserIndex:"uint256",
        jokeIndex:"uint32",
      },
      offchainOnly:true
    }
  },
  enums:{
    GameStatus:["None","Waiting","Generating","Typing","Voting","End"],
  },
});

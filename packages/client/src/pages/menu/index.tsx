import { useState } from "react";
import { GameList } from "../../components/MenuComps/GameList";
import { MenuHeader } from "../../components/MenuComps/MenuHeader";
import { UserInfoBox } from "../../components/MenuComps/UserInfoBox";
import { CreateGameModal } from "../../components/MenuComps/CreateGameModal";
import { JoinGameModal } from "../../components/MenuComps/JoinGameModal";

export const Menu = () => {
    const [createModalOpen, setCreateModalOpen] = useState<boolean>(false);
    const [joinGameOpen, setJoinGameOpen] = useState<boolean>(false)
    return (
        <div className="menu-body">
            <MenuHeader />
            <div className="row w-100 mt-5 p-5">
                <div className="col d-flex justify-content-center">
                    <UserInfoBox setCreateModalOpen={setCreateModalOpen} />
                </div>
                <div className="col d-flex justify-content-center">
                    <GameList setJoinGameOpen={setJoinGameOpen} />
                </div>
            </div>
            {createModalOpen && <CreateGameModal setCreateModalOpen={setCreateModalOpen} setJoinGameOpen={setJoinGameOpen} />}
            {joinGameOpen && <JoinGameModal setJoinGameOpen={setJoinGameOpen} />}
        </div>
    )
}
require("PGStateMachine")

function Definitions()
    ServiceRate = 1.0
    FighterType = "TIE_Fighter_Squadron"
    BomberType = "TIE_Bomber_Squadron"
    FighterCount = 2
    BomberCount = 1
end

function On_Enter_State()
    if not TestValid(Object) then
        ScriptExit()
        return
    end

    SpawnSquadrons(Object)
end

function SpawnSquadrons(parent_ship)
    local position = parent_ship.Get_Position()
    local owner = parent_ship.Get_Owner()

    for i = 1, FighterCount do
        Spawn_Unit(FighterType, position, owner)
    end

    for i = 1, BomberCount do
        Spawn_Unit(BomberType, position, owner)
    end
end

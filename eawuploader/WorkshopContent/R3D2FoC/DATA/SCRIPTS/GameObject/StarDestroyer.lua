-- ReserveFighterSpawner.lua
require("PGStateMachine")

function Definitions()
    ServiceRate = 1

    MaxReserves = 6  -- Total number of replacement squadrons
    SpawnCooldown = 10  -- Cooldown time between spawns in seconds
    ReplacementDelay = 5

    FighterReserve = MaxReserves
    ActiveSquadrons = {}
    LastSpawnTime = 0

    UnitOwner = nil
end

function OnEnter()
    if not Object then return end

    UnitOwner = Object.Get_Owner()
    SpawnInitialSquadrons()
end

function SpawnInitialSquadrons()
    local fighter_types = GetFactionFighters(UnitOwner)
    for _, fighter in pairs(fighter_types.Initial) do
        SpawnSquadron(fighter)
    end
end

function GetFactionFighters(faction)
    local faction_name = tostring(faction.Get_Faction_Name())

    if faction_name == "ERIADU" then
        return {
            Initial = {"TIE_Fighter_Squadron", "TIE_Interceptor_Squadron"},
            Replacement = {"TIE_Fighter_Squadron"}
        }
    elseif faction_name == "REBEL" then
        return {
            Initial = {"X-Wing_Squadron", "Y-Wing_Squadron"},
            Replacement = {"X-Wing_Squadron"}
        }
    elseif faction_name == "UNDERWORLD" then
        return {
            Initial = {"Rihkxyrk_Squadron", "Kihraxz_Squadron"},
            Replacement = {"Rihkxyrk_Squadron"}
        }
    else
        return {
            Initial = {"Z-95_Headhunter_Squadron"},
            Replacement = {"Z-95_Headhunter_Squadron"}
        }
    end
end

function SpawnSquadron(squadron_type)
    local position = Object.Get_Position()
    local squadron = Spawn_Unit(squadron_type, position, UnitOwner)

    if squadron and squadron[1] then
        table.insert(ActiveSquadrons, squadron[1])
    end
end

function ReplaceDestroyedSquadrons()
    local current_time = GetCurrentTime()
    local faction_data = GetFactionFighters(UnitOwner)

    for i = #ActiveSquadrons, 1, -1 do
        if not TestValid(ActiveSquadrons[i]) then
            table.remove(ActiveSquadrons, i)
            if FighterReserve > 0 and (current_time - LastSpawnTime >= SpawnCooldown) then
                SpawnSquadron(faction_data.Replacement[1])
                FighterReserve = FighterReserve - 1
                LastSpawnTime = current_time
            end
        end
    end
end

function Game_Update()
    ReplaceDestroyedSquadrons()
end

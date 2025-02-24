require("deepcore/std/class")
require("eawx-util/StoryUtil")
CONSTANTS = ModContentLoader.get("GameConstants")
require("deepcore/crossplot/crossplot")

OptionsHandler = class()

function OptionsHandler:new(galactic_conquest, human_player)
    self.galactic_conquest = galactic_conquest
    self.human_player = human_player
    self.ai_on = false
    self.cruel_on = false

    self.isFotR = Find_Object_Type("fotr")

    GlobalValue.Set("CRUEL_ON", 0)

    self.galactic_conquest = galactic_conquest

    crossplot:subscribe("INITIALIZE_AI", self.activate_ai, self)

    self.production_finished_event = galactic_conquest.Events.GalacticProductionFinished
    self.production_finished_event:attach_listener(self.on_construction_finished, self)

end

function OptionsHandler:on_construction_finished(planet, game_object_type_name)
    --Logger:trace("entering OptionsHandler:on_construction_finished")
    if game_object_type_name == "OPTION_CRUEL_ON" then 
        self:activate_cruel()
    elseif game_object_type_name == "OPTION_CRUEL_OFF" then 
        self:deactivate_cruel()
    elseif game_object_type_name == "OPTION_CANON_UNITS" then 
        self:canon_units()
	elseif game_object_type_name == "OPTION_FS_UNITS" then 
        self:fs_units()
    end

end

function OptionsHandler:activate_ai()
    --Logger:trace("entering OptionsHandler:activate_ai")
    if self.ai_on == false then
        
        if self.isFotR then
            for _, faction in pairs(CONSTANTS.ALL_FACTIONS_NOT_NEUTRAL) do
                local faction_object = Find_Player(faction)
                if faction_object ~= Find_Player("local") then
                    local faction_name = faction_object.Get_Faction_Name()
                    if faction_name == "REBEL" then
                        local ai_type = CONSTANTS.ALL_FACTIONS_AI_CIS[string.upper(faction)]
                        StoryUtil.ChangeAIPlayer(faction_name, ai_type)
                    else
                        local ai_type = CONSTANTS.ALL_FACTIONS_AI[string.upper(faction)]
                        StoryUtil.ChangeAIPlayer(faction_name, ai_type)
                    end
                end
            end
            Sleep(0.1) --Some FOTR historical GCs CTD for CIS player w/o this. ~Mord
        else
            for _, faction in pairs(CONSTANTS.ALL_FACTIONS_NOT_NEUTRAL) do
                local faction_object = Find_Player(faction)
                if faction_object ~= Find_Player("local") then
                    local faction_name = faction_object.Get_Faction_Name()
                    local ai_type = CONSTANTS.ALL_FACTIONS_AI[string.upper(faction)]
                    StoryUtil.ChangeAIPlayer(faction_name, ai_type)
                end
            end
        end
        self.ai_on = true
        self.human_player.Lock_Tech(Find_Object_Type("OPTION_CRUEL_OFF"))
        self.human_player.Unlock_Tech(Find_Object_Type("OPTION_CRUEL_ON"))
    end
end

function OptionsHandler:activate_cruel()
    --Logger:trace("entering OptionsHandler:update")
    if self.cruel_on == false then

        GlobalValue.Set("CRUEL_ON", 1)

        if self.isFotR then
            for _, faction in pairs(CONSTANTS.ALL_FACTIONS_NOT_NEUTRAL) do
                local faction_object = Find_Player(faction)
                if faction_object ~= Find_Player("local") then
                    local faction_name = faction_object.Get_Faction_Name()
                    if faction_name == "REBEL" then
                        local ai_type = CONSTANTS.ALL_FACTIONS_CRUEL_AI_CIS[string.upper(faction)]
                        StoryUtil.ChangeAIPlayer(faction_name, ai_type)
                    else
                        local ai_type = CONSTANTS.ALL_FACTIONS_CRUEL_AI[string.upper(faction)]
                        StoryUtil.ChangeAIPlayer(faction_name, ai_type)
                    end
                end
            end
        else
            for _, faction in pairs(CONSTANTS.ALL_FACTIONS_NOT_NEUTRAL) do
                local faction_object = Find_Player(faction)
                if faction_object ~= Find_Player("local") then
                    local faction_name = faction_object.Get_Faction_Name()
                    local ai_type = CONSTANTS.ALL_FACTIONS_CRUEL_AI[string.upper(faction)]
                    StoryUtil.ChangeAIPlayer(faction_name, ai_type)
                end
            end
        end

        self.human_player.Lock_Tech(Find_Object_Type("OPTION_CRUEL_ON"))
        self.human_player.Unlock_Tech(Find_Object_Type("OPTION_CRUEL_OFF"))

        self.cruel_on = true
    end
end

function OptionsHandler:deactivate_cruel()
    --Logger:trace("entering OptionsHandler:update")
    if self.cruel_on == true then

        GlobalValue.Set("CRUEL_ON", 0)
        if self.isFotR then
            for _, faction in pairs(CONSTANTS.ALL_FACTIONS_NOT_NEUTRAL) do
                local faction_object = Find_Player(faction)
                if faction_object ~= Find_Player("local") then
                    local faction_name = faction_object.Get_Faction_Name()
                    if faction_name == "REBEL" then
                        local ai_type = CONSTANTS.ALL_FACTIONS_AI_CIS[string.upper(faction)]
                        StoryUtil.ChangeAIPlayer(faction_name, ai_type)
                    else
                        local ai_type = CONSTANTS.ALL_FACTIONS_AI[string.upper(faction)]
                        StoryUtil.ChangeAIPlayer(faction_name, ai_type)
                    end
                end
            end
        else
            for _, faction in pairs(CONSTANTS.ALL_FACTIONS_NOT_NEUTRAL) do
                local faction_object = Find_Player(faction)
                if faction_object ~= Find_Player("local") then
                    local faction_name = faction_object.Get_Faction_Name()
                    local ai_type = CONSTANTS.ALL_FACTIONS_AI[string.upper(faction)]
                    StoryUtil.ChangeAIPlayer(faction_name, ai_type)
                end
            end
        end
        self.human_player.Lock_Tech(Find_Object_Type("OPTION_CRUEL_OFF"))
        self.human_player.Unlock_Tech(Find_Object_Type("OPTION_CRUEL_ON"))

        self.cruel_on = false
    end
end

function OptionsHandler:canon_units()
    --Logger:trace("entering OptionsHandler:canon_units")

    UnitUtil.SetLockList("REBEL", {
        "MC75",
        "Starhawk_MK1"})
	crossplot:publish("NR_CANON_ADMIRALS")
end

function OptionsHandler:fs_units()
    --Logger:trace("entering OptionsHandler:fs_units")

    UnitUtil.SetLockList("EMPIRE", {
        "Impellor", "Compellor"})
end


return OptionsHandler
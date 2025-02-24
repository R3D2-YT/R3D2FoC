--**************************************************************************************************
--*    _______ __                                                                                  *
--*   |_     _|  |--.----.---.-.--.--.--.-----.-----.                                              *
--*     |   | |     |   _|  _  |  |  |  |     |__ --|                                              *
--*     |___| |__|__|__| |___._|________|__|__|_____|                                              *
--*    ______                                                                                      *
--*   |   __ \.-----.--.--.-----.-----.-----.-----.                                                *
--*   |      <|  -__|  |  |  -__|     |  _  |  -__|                                                *
--*   |___|__||_____|\___/|_____|__|__|___  |_____|                                                *
--*                                   |_____|                                                      *
--*                                                                                                *
--*                                                                                                *
--*       File:              AbstractResourceManager.lua                                           *
--*       File Created:      Sunday, 23rd February 2020 08:26                                      *
--*       Author:            [TR] Corey                                                            *
--*       Last Modified:     Sunday, 23rd February 2020 10:22                                      *
--*       Modified By:       [TR] Corey                                                            *
--*       Copyright:         Thrawns Revenge Development Team                                      *
--*       License:           This code may not be used without the author's explicit permission    *
--**************************************************************************************************
require("pgevents")
require("pgbase")
require("deepcore/std/class")
require("deepcore/std/Observable")
require("eawx-std/HelperDialogue")
StoryUtil = require("eawx-util/StoryUtil")
CONSTANTS = ModContentLoader.get("GameConstants")

---@class AbstractResourceManager
AbstractResourceManager = class()

---@param gc GalacticConquest
---@param dummy_lifecycle_handler KeyDummyLifeCycleHandler
---@param resource_manager LockBasedResourceManager
function AbstractResourceManager:new(gc, dummy_lifecycle_handler, resource_manager)
    self.plot = Get_Story_Plot("Conquests\\Player_Agnostic_Plot.xml")

    GlobalValue.Set("FIGHTER_PILOTS", 100)

    self.galactic_conquest = gc
    self.human_player = gc.HumanPlayer 

    self.computer_player = Find_Player("Empire")
    if self.computer_player == self.human_player then
        self.computer_player = Find_Player("Rebel")
    end

    self.human_player_name = self.human_player.Get_Name()
    self.dummy_lifecycle_handler = dummy_lifecycle_handler
    self.resource_manager = resource_manager
    self.AllPlanets = FindPlanet.Get_All_Planets()

    self.id = string.lower(GlobalValue.Get("MOD_ID"))
    self.DevastatorTable ={"KLEV_FRIGATE_DEVASTATOR", "KLEV_CAPITAL_DEVASTATOR", "WORLD_DEVASTATOR_FRIGATE", "WORLD_DEVASTATOR_CAPITAL"}

    self.ShipCrewIncome = 0
    self.ShipCrewIncomeDisplay = "TEXT_RESOURCE_" .. tostring(self.ShipCrewIncome)

    self.InfrastructureScore = 0
    self.InfrastructureScoreEffect = {}
    self.InfrastructureScoreEffectOld = {}

    self.extension_bonus = 10
    self.open_slots = 0
    self.total_slots = 0
    self.open_slot_percentage = 0 

    self.UpkeepCost = 0
    self.NetIncome = 0
    self.SmugglingIncome = 0
    self.Initialized = false

    gc.Events.PlanetOwnerChanged:attach_listener(self.on_planet_owner_changed, self)
    gc.Events.GalacticProductionFinished:attach_listener(self.on_production_finished, self)
    gc.Events.TacticalBattleEnded:attach_listener(self.on_battle_end, self)
   
    crossplot:subscribe("UPDATE_RESOURCES", self.UpdateDisplay, self)
    crossplot:subscribe("SMUGGLING_INCOME", self.on_smuggling_changed, self)

    self.abstract_changed_event = Observable()
    self.infrastructure_event = Observable()

end

function AbstractResourceManager:update()
    --Logger:trace("entering AbstractResourceManager:update")

    self:shipcrews()  
    self:determine_infrastructure_score()
    self:charge_upkeep()
    self:apply_infrastructure_effect()
    self:check_upkeep()
end

function AbstractResourceManager:on_planet_owner_changed(planet, new_owner_name, old_owner_name)
    --Logger:trace("entering AbstractResourceManager:on_planet_owner_changed")
    if new_owner_name ~= self.human_player_name and old_owner_name ~= self.human_player_name then
        return
    end

    self:check_upkeep()
end

function AbstractResourceManager:on_production_finished(planet, game_object_type_name)
    --Logger:trace("entering AbstractResourceManager:on_production_finished")
    if planet:get_owner() ~= self.human_player then
        return
    end

    self:check_upkeep()
end

function AbstractResourceManager:on_battle_end(mode)
    --Logger:trace("entering AbstractResourceManager:on_battle_end")
    self:check_upkeep()
end

function AbstractResourceManager:check_upkeep()
    --Logger:trace("entering AbstractResourceManager:check_upkeep")

    self.UpkeepCost = tonumber(Dirty_Floor(EvaluatePerception("Total_Maintenance", self.human_player))) - (10 * EvaluatePerception("LightFactory_Count", self.human_player)) - (20 * EvaluatePerception("HeavyFactory_Count", self.human_player)) - (30 * EvaluatePerception("AdvFactory_Count", self.human_player))
    if self.UpkeepCost < 0 then
        self.UpkeepCost = 0
    end
    self.NetIncome = tonumber(Dirty_Floor(EvaluatePerception("Current_Income", self.human_player) - self.UpkeepCost + self.SmugglingIncome))

    GlobalValue.Set("HUMAN_CURRENT_NET_INCOME",self.NetIncome)

    self.abstract_changed_event:notify(self.UpkeepCost, self.InfrastructureScore, self.NetIncome, self.SmugglingIncome)
end

function AbstractResourceManager:determine_infrastructure_score()
    self.extension_bonus = 10
    self.open_slots = 0
    self.total_slots = 0
    self.InfrastructureScore = 0

    for _, planet in pairs(self.AllPlanets) do
        if planet.Get_Owner() == self.human_player then

            self.extension_bonus = self.extension_bonus - 2

            self.total_slots = self.total_slots + EvaluatePerception("Total_Slots", self.human_player, planet)

            self.open_slots = self.open_slots + EvaluatePerception("Open_Slots", self.human_player, planet)

            self.InfrastructureScore = self.InfrastructureScore + EvaluatePerception("Infrastructure_Score", self.human_player, planet)

           
        end
    end
    self.open_slot_percentage = tonumber(Dirty_Floor((self.open_slots / self.total_slots) * 100))

    self.InfrastructureScore = self.InfrastructureScore + self.extension_bonus

    GlobalValue.Set("CURRENT_INFRASTRUCTURE", self.InfrastructureScore)
    GlobalValue.Set("OPEN_INFRASTRUCTURE_SLOTS", self.open_slots)
end

function AbstractResourceManager:apply_infrastructure_effect()
    if self.InfrastructureScoreEffect ~= nil then
        self.dummy_lifecycle_handler:remove_from_dummy_set(self.human_player, self.InfrastructureScoreEffect)
    end

    local resource_effect_table = {
        {INFRASTRUCTURE_DEFICIT_SMALL = 1},
        {INFRASTRUCTURE_DEFICIT_SEVERE = 1},
        {INFRASTRUCTURE_SURPLUS = 1}
    }
    self.InfrastructureScoreEffectOld = self.InfrastructureScoreEffect

    if self.InfrastructureScore < 0 and self.InfrastructureScore > -30 then
        self.InfrastructureScoreEffect = resource_effect_table[1] 
        if self.InfrastructureScoreEffect ~= self.InfrastructureScoreEffectOld then
            self.infrastructure_event:notify("deficit") 
        end
    elseif self.InfrastructureScore <= -30 then
        self.InfrastructureScoreEffect = resource_effect_table[2]
        if self.InfrastructureScoreEffect ~= self.InfrastructureScoreEffectOld then
            self.infrastructure_event:notify("deficit") 
        end
    elseif self.open_slot_percentage < 5 then
        self.InfrastructureScoreEffect = resource_effect_table[3]
        if self.InfrastructureScoreEffect ~= self.InfrastructureScoreEffectOld then
            self.infrastructure_event:notify("surplus") 
        end
    else
        self.InfrastructureScoreEffect = {} 
    end

    if self.InfrastructureScoreEffect ~= nil then
        self.dummy_lifecycle_handler:add_to_dummy_set(self.human_player, self.InfrastructureScoreEffect) 
    end
end

function AbstractResourceManager:shipcrews()
    --Logger:trace("entering AbstractResourceManager:shipcrews")

    self.ShipCrewIncome = (10 * EvaluatePerception("NavalAcademy_Count", self.human_player)) + (30 * EvaluatePerception("CloningFacility_Count", self.human_player))

    if self.human_player == Find_Player("Rebel") then
        local chief_of_state = GlobalValue.Get("ChiefOfState")
        if chief_of_state ==  "DUMMY_CHIEFOFSTATE_MOTHMA" then
            self.ShipCrewIncome = tonumber(Dirty_Floor(self.ShipCrewIncome * 1.15))
        end
    end

    self.ShipCrewIncomeDisplay = "Ship Crews Per Cycle: " .. tostring(self.ShipCrewIncome)
    
    self.resource_manager:add_resources(self.ShipCrewIncome)
end

function AbstractResourceManager:charge_upkeep()
    if self.Initialized == true then
        if self.UpkeepCost > EvaluatePerception("Current_Credits", self.human_player) then
            self.InfrastructureScore = self.InfrastructureScore - 50
        end

        self.human_player.Give_Money(-1 * self.UpkeepCost)

        local cruel_on = GlobalValue.Get("CRUEL_ON")
        local difficulty = self.computer_player.Get_Difficulty()

        for _, faction_name in pairs(CONSTANTS.PLAYABLE_FACTIONS) do
            local player = Find_Player(faction_name)
            if player ~= self.human_player then
                local ai_credits = tonumber(Dirty_Floor(EvaluatePerception("Current_Credits", player)))
                local ai_revenue = EvaluatePerception("Current_Income", player)

                local ai_maintenance = tonumber(Dirty_Floor(EvaluatePerception("Total_Maintenance", player)))
                local ai_net_income = ai_revenue - ai_maintenance 

                --there are 2 safety rails here:
                local ai_upkeep_to_pay = 0
                --1. on Easy mode, when an AI's net income exceeds 150% human net income, upkeep costs are used to cap it
                if difficulty == "Easy" and cruel_on == 0 and ai_net_income > ( 1.5 * self.NetIncome) then
                    ai_upkeep_to_pay = ai_net_income - (1.5 * self.NetIncome)
                --2. else when an AI is short on cash *and* its maintenance exceeds 50% of revenue, upkeep is capped at 50% of revenue
                elseif ai_credits < 10000 and (0.5 * ai_revenue) < ai_maintenance then 
                    ai_upkeep_to_pay = 0.5 * ai_revenue
                else 
                    ai_upkeep_to_pay = ai_maintenance
                end

                player.Give_Money(-1 * ai_upkeep_to_pay)
            end
        end
    end
    self.Initialized = true
end

function AbstractResourceManager:on_smuggling_changed(smuggling_income)
    --Logger:trace("entering LockBasedResourceManager:on_smuggling_changed")
    self.SmugglingIncome = smuggling_income
    self:check_upkeep()
end

function AbstractResourceManager:UpdateDisplay()
    --Logger:trace("entering AbstractResourceManager:UpdateDisplay")
   
    local resource_display_event = self.plot.Get_Event("Resource_Display")

    resource_display_event.Clear_Dialog_Text()
    resource_display_event.Add_Dialog_Text("TEXT_RESOURCES_OVERVIEW")
    resource_display_event.Add_Dialog_Text("TEXT_RESOURCES_OVERVIEW_1")
    resource_display_event.Add_Dialog_Text("TEXT_RESOURCES_OVERVIEW_2")
    resource_display_event.Add_Dialog_Text("TEXT_RESOURCES_OVERVIEW_3")
    resource_display_event.Add_Dialog_Text("TEXT_RESOURCES_OVERVIEW_4")
    resource_display_event.Add_Dialog_Text("TEXT_RESOURCES_OVERVIEW_5")

    resource_display_event.Add_Dialog_Text("TEXT_NONE")

    if self.id == "icw" then
        if Find_Player("Empire").Is_Human() or Find_Player("Pentastar").Is_Human() or Find_Player("Eriadu_Authority").Is_Human() or Find_Player("Zsinj_Empire").Is_Human() or Find_Player("Greater_Maldrood").Is_Human() then
            for _, devastator in pairs(self.DevastatorTable) do
                local devastator_object = Find_First_Object(devastator)
                if devastator_object then
                    resource_display_event.Add_Dialog_Text("TEXT_RESOURCES_OVERVIEW_TEMPORARY")
                    resource_display_event.Add_Dialog_Text("TEXT_RESOURCES_OVERVIEW_6")
                    resource_display_event.Add_Dialog_Text("TEXT_NONE")
                    resource_display_event.Add_Dialog_Text("TEXT_DOCUMENTATION_BODY_SEPARATOR")
                    resource_display_event.Add_Dialog_Text("STAT_WORLD_DEVASTATOR_MATERIALS_NAME")
                    resource_display_event.Add_Dialog_Text("TEXT_DOCUMENTATION_SEPARATOR_MEDIUM")
                    resource_display_event.Add_Dialog_Text("STAT_WORLD_DEVASTATOR_MATERIALS_DESCRIPTION_1")
                    resource_display_event.Add_Dialog_Text("STAT_WORLD_DEVASTATOR_MATERIALS_DESCRIPTION_2")
                    resource_display_event.Add_Dialog_Text("TEXT_NONE")
                    resource_display_event.Add_Dialog_Text("Active World Devastator Materials Collected: " .. tostring(GlobalValue.Get(devastator)))
                    resource_display_event.Add_Dialog_Text("TEXT_NONE")
                end
            end
        end
    end

    resource_display_event.Add_Dialog_Text("TEXT_DOCUMENTATION_BODY_SEPARATOR")
    resource_display_event.Add_Dialog_Text("STAT_SHIPCREWS_NAME")
    resource_display_event.Add_Dialog_Text("TEXT_DOCUMENTATION_SEPARATOR_MEDIUM")
    resource_display_event.Add_Dialog_Text("STAT_SHIPCREWS_DESCRIPTION") 
    resource_display_event.Add_Dialog_Text(self.ShipCrewIncomeDisplay)

    resource_display_event.Add_Dialog_Text("TEXT_NONE")

    resource_display_event.Add_Dialog_Text("TEXT_DOCUMENTATION_BODY_SEPARATOR")

    resource_display_event.Add_Dialog_Text("STAT_INFRASTRUCTURE_NAME")
    resource_display_event.Add_Dialog_Text("TEXT_DOCUMENTATION_SEPARATOR_MEDIUM")
    resource_display_event.Add_Dialog_Text("STAT_INFRASTRUCTURE_DESCRIPTION") 
    resource_display_event.Add_Dialog_Text("TEXT_DOCUMENTATION_BODY_SEPARATOR")
    resource_display_event.Add_Dialog_Text("STAT_INFRASTRUCTURE_SCORE", self.InfrastructureScore)
    resource_display_event.Add_Dialog_Text("STAT_INFRASTRUCTURE_PERCENT", self.open_slot_percentage)
    resource_display_event.Add_Dialog_Text("STAT_INFRASTRUCTURE_EXTENSION", self.extension_bonus)
    resource_display_event.Add_Dialog_Text("TEXT_DOCUMENTATION_BODY_SEPARATOR")
    resource_display_event.Add_Dialog_Text("TEXT_NONE")
    resource_display_event.Add_Dialog_Text("STAT_INFRASTRUCTURE_FACTORS")
    resource_display_event.Add_Dialog_Text("TEXT_DOCUMENTATION_BODY_SEPARATOR")
    resource_display_event.Add_Dialog_Text("STAT_INFRASTRUCTURE_BASE")
    resource_display_event.Add_Dialog_Text("STAT_INFRASTRUCTURE_CONTROL")
    resource_display_event.Add_Dialog_Text("STAT_INFRASTRUCTURE_EMPTY_SLOTS")
    resource_display_event.Add_Dialog_Text("STAT_INFRASTRUCTURE_FILLED_SLOTS")
    resource_display_event.Add_Dialog_Text("STAT_INFRASTRUCTURE_CORPORATION")
    resource_display_event.Add_Dialog_Text("STAT_INFRASTRUCTURE_STRUCTURE")
    resource_display_event.Add_Dialog_Text("TEXT_NONE")
    resource_display_event.Add_Dialog_Text("STAT_INFRASTRUCTURE_EFFECTS")
    resource_display_event.Add_Dialog_Text("TEXT_DOCUMENTATION_BODY_SEPARATOR")
    resource_display_event.Add_Dialog_Text("STAT_INFRASTRUCTURE_NEGATIVE_1")
    resource_display_event.Add_Dialog_Text("STAT_INFRASTRUCTURE_NEGATIVE_2")
    resource_display_event.Add_Dialog_Text("STAT_INFRASTRUCTURE_POSITIVE")

    resource_display_event.Add_Dialog_Text("TEXT_NONE")

    resource_display_event.Add_Dialog_Text("TEXT_DOCUMENTATION_BODY_SEPARATOR")

    resource_display_event.Add_Dialog_Text("STAT_UPKEEP_NAME")
    resource_display_event.Add_Dialog_Text("TEXT_DOCUMENTATION_SEPARATOR_MEDIUM")
    resource_display_event.Add_Dialog_Text("STAT_UPKEEP_DESCRIPTION") 
    resource_display_event.Add_Dialog_Text("TEXT_DOCUMENTATION_BODY_SEPARATOR")
    resource_display_event.Add_Dialog_Text("STAT_UPKEEP_TOTAL", self.UpkeepCost)
    resource_display_event.Add_Dialog_Text("STAT_NET_CREDITS", self.NetIncome)
    resource_display_event.Add_Dialog_Text("TEXT_DOCUMENTATION_BODY_SEPARATOR")
    resource_display_event.Add_Dialog_Text("TEXT_NONE")

    Story_Event("RESOURCE_DISPLAY")
end

return AbstractResourceManager
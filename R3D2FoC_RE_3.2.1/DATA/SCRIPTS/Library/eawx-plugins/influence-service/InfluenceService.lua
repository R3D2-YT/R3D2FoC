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
--*       File:              InfluenceService.lua                                                  *
--*       File Created:      Sunday, 23rd February 2020 08:26                                      *
--*       Author:            [TR] Pox                                                              *
--*       Last Modified:     Sunday, 23rd February 2020 10:22                                      *
--*       Modified By:       [TR] Pox                                                              *
--*       Copyright:         Thrawns Revenge Development Team                                      *
--*       License:           This code may not be used without the author's explicit permission    *
--**************************************************************************************************
require("PGSpawnUnits")

require("deepcore/std/class")
ModContentLoader.get("influence-policy/InfluencePolicyRepository")

---@class InfluenceService
InfluenceService = class()

---@param human_player PlayerObject
---@param planets table<string, Planet>
---@param dummy_lifecycle_handler KeyDummyLifeCycleHandler
---@param revolt_manager RevoltManager
---@param blockade_attrition BlockadeAttrition
function InfluenceService:new(human_player, planets, dummy_lifecycle_handler, revolt_manager, blockade_attrition)
    self.human_player = human_player
    self.planets = {}
    self.dummy_lifecycle_handler = dummy_lifecycle_handler
    self.revolt_manager = revolt_manager
    self.blockade_attrition = blockade_attrition

    self.planets_in_crisis = 0

    self.influence_modifier = 0
    self.ai_difficulty_modifier = 0

    self.isRev = Find_Object_Type("rev")
    self.isFotR = Find_Object_Type("fotr")
    self.isTR = Find_Object_Type("icw")

    local computer_player = nil
    local p_rebel = Find_Player("Rebel")
    if human_player == p_rebel then
        computer_player = Find_Player("Empire")
    else
        computer_player = p_rebel
    end
	
    self.ai_difficulty_modifier = 2
    if computer_player.Get_Difficulty() == "Easy" then
        self.ai_difficulty_modifier = 1
    elseif computer_player.Get_Difficulty() == "Hard" then
        self.ai_difficulty_modifier = 3
    end	
	
    for _, planet in pairs(planets) do
        self.planets[planet] = {
            __current_influence_dummies = {},
            weeksControlled = 0,
            ownerInfluence = 0,
            oldInfluence = 0,
            unrestLevel = 0,
            is_locked = false,
            taxationLevel = 0,
            blockadeModifier = 0,
            weeksBlockaded = 0,
            crisis_level = 0,
            oldOwner = nil,
            newOwner = nil,
            name = planet:get_readable_name()
        }
    end

    crossplot:subscribe("LOCK_PLANET", self.set_planet_lock, self)

    self.influence_unrest_growing = Observable()
    self.influence_revolt_occured = Observable()
end

---@param planet Planet
function InfluenceService:get_influence_for_planet(planet)
    --Logger:trace("entering InfluenceService:get_influence_for_planet")
    return self.planets[planet].ownerInfluence
end

function InfluenceService:set_planet_lock(planet_name, locked)
    --Logger:trace("entering InfluenceService:set_planet_lock")

    for planet, stats in pairs(self.planets) do
        if string.upper(stats.name) == string.upper(planet_name) then
            if locked == 1 then
                stats.is_locked = true
                planet:get_game_object().Attach_Particle_Effect("Locked_Planet") 
            else
                stats.is_locked = false
            end

            break
        end
    end

end

function InfluenceService:get_unrest_for_planet(planet)
    --Logger:trace("entering InfluenceService:get_unrest_for_planet")
    return self.planets[planet].unrestLevel
end

function InfluenceService:get_tax_for_planet(planet)
    --Logger:trace("entering InfluenceService:get_tax_for_planet")
    local planet_stats = self.planets[planet]
    planet_stats.taxationLevel = EvaluatePerception("Tax_Level", self.human_player, planet:get_game_object())
    return self.planets[planet].taxationLevel
end

---@param planet Planet
function InfluenceService:update(planet)
    --Logger:trace("entering InfluenceService:update")
    local planet_stats = self.planets[planet]

    planet_stats.newOwner = planet:get_owner()

    if planet:get_owner() == Find_Player("Neutral") then
        return
    elseif planet:get_owner() == Find_Player("Warlords")  then
        planet_stats.ownerInfluence = 10
    else
        planet_stats.ownerInfluence = 5
        planet_stats.taxationLevel = EvaluatePerception("Tax_Level", self.human_player, planet:get_game_object())

        if planet_stats.newOwner == planet_stats.oldOwner then
            planet_stats.weeksControlled = planet_stats.weeksControlled + 1
            if planet_stats.unrestLevel == 3 then
                if planet:get_owner() == Find_Player("local") then
                    self.influence_revolt_occured:notify(planet)
                end
                self.revolt_manager:planetary_revolt(planet)
                planet_stats.weeksControlled = 0
                planet_stats.unrestLevel = 0
            end
        else
            -- if planet_stats.crisis_level < 0 then
            --     planet_stats.crisis_level = 0
            --     self.planets_in_crisis = self.planets_in_crisis - 1
            -- end
    
            planet_stats.weeksControlled = 0
            planet_stats.unrestLevel = 0
        end

        if planet_stats.weeksControlled > 2 then
            self.influence_modifier = EvaluatePerception("Influence_Modifier", self.human_player, planet:get_game_object())
        else
            self.influence_modifier = EvaluatePerception("Influence_Modifier_NewCapture", self.human_player, planet:get_game_object())
        end

        if EvaluatePerception("Blockaded", planet:get_owner(), planet:get_game_object()) > 0 then
            if planet_stats.weeksBlockaded >= 1 then
                self.blockade_attrition:attrition(planet)
            end
            planet_stats.weeksBlockaded = planet_stats.weeksBlockaded + 1
            if GameRandom(1, 100) < 20 then
                if EvaluatePerception("Ground_Base_Level", self.human_player, planet:get_game_object()) < 4 then
                    planet_stats.blockadeModifier = planet_stats.blockadeModifier + 1
                end
            end
        else
            planet_stats.blockadeModifier = 0
            planet_stats.weeksBlockaded = 0
        end

        --self:apply_week_controlled_influence(planet_stats)

        planet_stats.ownerInfluence = planet_stats.ownerInfluence + self.influence_modifier - planet_stats.blockadeModifier -- planet_stats.crisis_level

        local planetary_influence_policy =
            InfluencePolicyRepository[string.lower(planet:get_name())] or InfluencePolicyRepository.DEFAULT

        planet_stats.ownerInfluence = planet_stats.ownerInfluence + planetary_influence_policy(planet) 

        if planet:get_owner() ~= Find_Player("local")  then
            planet_stats.ownerInfluence = planet_stats.ownerInfluence + self.ai_difficulty_modifier
        end

        if planet_stats.ownerInfluence <= 1 then
            planet_stats.unrestLevel = planet_stats.unrestLevel + 1
            if planet:get_owner() == Find_Player("local") then
                self.influence_unrest_growing:notify(planet, planet_stats.unrestLevel)
            end
        elseif planet_stats.ownerInfluence == 2 then
            if GameRandom(1, 100) > 50 then
                planet_stats.unrestLevel = planet_stats.unrestLevel + 1
                if planet:get_owner() == Find_Player("local") then
                    self.influence_unrest_growing:notify(planet, planet_stats.unrestLevel)
                end
            end
        elseif planet_stats.ownerInfluence == 3 then
            if GameRandom(1, 100) > 66 then
                planet_stats.unrestLevel = planet_stats.unrestLevel + 1
                if planet:get_owner() == Find_Player("local") then
                    self.influence_unrest_growing:notify(planet, planet_stats.unrestLevel)
                end
            end
        elseif planet_stats.ownerInfluence >= 6 then
            planet_stats.unrestLevel = planet_stats.unrestLevel - 1
        end
        self:normalize_influence(planet_stats)
   
    end

    planet_stats.oldOwner = planet:get_owner()

    self:attach_particle(planet, planet_stats)
    self:apply_loyalty_modifiers(planet)

    planet_stats.oldInfluence = planet_stats.ownerInfluence
end

---@private
---@param planet_stats table<string, any>
function InfluenceService:apply_week_controlled_influence(planet_stats)
    if planet_stats.newOwner == planet_stats.oldOwner then
        planet_stats.weeksControlled = planet_stats.weeksControlled + 1
    else
        planet_stats.weeksControlled = 0
    end

    for i = 10, 50, 20 do
        if planet_stats.weeksControlled < i then
            break
        end

        planet_stats.ownerInfluence = planet_stats.ownerInfluence + 1
    end
end

function InfluenceService:attach_particle(planet, planet_stats)
    if planet:get_owner() ~= Find_Player("Neutral") then
        planet:get_game_object().Attach_Particle_Effect("Display_Influence_" .. tostring(planet_stats.ownerInfluence))
        if planet_stats.unrestLevel <= 3 and planet_stats.unrestLevel >= 1 then
            planet:get_game_object().Attach_Particle_Effect("Display_Unrest_" .. tostring(planet_stats.unrestLevel))
        end

        if planet_stats.is_locked then 
            planet:get_game_object().Attach_Particle_Effect("Locked_Planet") 
        end
        
        if self.isRev then
            if planet:get_owner() == Find_Player("Empire") then 
                planet:get_game_object().Attach_Particle_Effect("Old_Republic_Allies") 
            elseif planet:get_owner() == Find_Player("Rebel") then 
                planet:get_game_object().Attach_Particle_Effect("Sith_Allies") 
            elseif planet:get_owner() == Find_Player("Underworld") then 
                planet:get_game_object().Attach_Particle_Effect("Mando_Allies") 
            elseif planet:get_owner() == Find_Player("Hutt_Cartels") then 
                planet:get_game_object().Attach_Particle_Effect("Hutt_Allies") 
            end
        end

        if self.isFotR then
            if planet:get_owner() == Find_Player("Empire") then 
                planet:get_game_object().Attach_Particle_Effect("Republic_Allies") 
            elseif planet:get_owner() == Find_Player("Sector_Forces") then 
                planet:get_game_object().Attach_Particle_Effect("Republic_Allies") 
            elseif planet:get_owner() == Find_Player("Hutt_Cartels") then 
                planet:get_game_object().Attach_Particle_Effect("Hutt_Allies") 
            elseif planet:get_owner() == Find_Player("Mandalorians") then 
                planet:get_game_object().Attach_Particle_Effect("Mando_Allies") 
            end
        end
        
        if self.isTR then
            if planet:get_owner() == Find_Player("Empire") then 
                planet:get_game_object().Attach_Particle_Effect("IR_Allies") 
            elseif planet:get_owner() == Find_Player("Eriadu_Authority") then 
                planet:get_game_object().Attach_Particle_Effect("EA_Allies") 
            elseif planet:get_owner() == Find_Player("Greater_Maldrood") then 
                planet:get_game_object().Attach_Particle_Effect("GM_Allies") 
            elseif planet:get_owner() == Find_Player("Zsinj_Empire") then 
                planet:get_game_object().Attach_Particle_Effect("ZE_Allies") 
            elseif planet:get_owner() == Find_Player("Pentastar") then 
                planet:get_game_object().Attach_Particle_Effect("PA_Allies") 
            elseif planet:get_owner() == Find_Player("Rebel") then 
                planet:get_game_object().Attach_Particle_Effect("NR_Allies") 
            elseif planet:get_owner() == Find_Player("EmpireoftheHand") then 
                planet:get_game_object().Attach_Particle_Effect("EotH_Allies") 
            elseif planet:get_owner() == Find_Player("Chiss") then 
                planet:get_game_object().Attach_Particle_Effect("Chiss_Allies") 
            elseif planet:get_owner() == Find_Player("Corporate_Sector") then 
                planet:get_game_object().Attach_Particle_Effect("CSA_Allies") 
            elseif planet:get_owner() == Find_Player("Hapes_Consortium") then 
                planet:get_game_object().Attach_Particle_Effect("HC_Allies") 
            elseif planet:get_owner() == Find_Player("Yevetha") then 
                planet:get_game_object().Attach_Particle_Effect("DL_Allies") 
            elseif planet:get_owner() == Find_Player("Corellia") then 
                planet:get_game_object().Attach_Particle_Effect("Corellia_Allies") 
            elseif planet:get_owner() == Find_Player("SsiRuuvi_Imperium") then 
                planet:get_game_object().Attach_Particle_Effect("Ssi_Allies") 
            elseif planet:get_owner() == Find_Player("Killik_Hives") then 
                planet:get_game_object().Attach_Particle_Effect("Killik_Allies") 
            elseif planet:get_owner() == Find_Player("Hutt_Cartels") then 
                planet:get_game_object().Attach_Particle_Effect("Hutt_Allies") 
            elseif planet:get_owner() == Find_Player("Mandalorians") then 
                planet:get_game_object().Attach_Particle_Effect("Mando_Allies") 
            end
        end
    end
end

---@private
---@param planet Planet
function InfluenceService:apply_loyalty_modifiers(planet)
    local planet_stats = self.planets[planet]
    if planet_stats.oldInfluence == planet_stats.ownerInfluence then
        return
    end

    local influence_structure_table = {
        {INFLUENCE_ONE = 1},
        {INFLUENCE_TWO = 1},
        {INFLUENCE_THREE = 1},
        {INFLUENCE_FOUR = 1},
        {INFLUENCE_FIVE = 1},
        {INFLUENCE_SIX = 1},
        {INFLUENCE_SEVEN = 1},
        {INFLUENCE_EIGHT = 1},
        {INFLUENCE_NINE = 1},
        {INFLUENCE_TEN = 1}
    }

    self.dummy_lifecycle_handler:remove_from_dummy_set(planet, planet_stats.__current_influence_dummies)
    
    planet_stats.__current_influence_dummies = influence_structure_table[planet_stats.ownerInfluence]
    self.dummy_lifecycle_handler:add_to_dummy_set(planet, planet_stats.__current_influence_dummies)
end

---@private
---@param planet_stats table<string, any>
function InfluenceService:normalize_influence(planet_stats)
    if planet_stats.ownerInfluence > 10 then
        planet_stats.ownerInfluence = 10
    end

    if planet_stats.ownerInfluence <= 0 then
        planet_stats.ownerInfluence = 1
    end

    if planet_stats.unrestLevel > 3 then
        planet_stats.unrestLevel = 3
    end

    if planet_stats.unrestLevel <= 0 then
        planet_stats.unrestLevel = 0
    end
end


require("deepcore/crossplot/crossplot")
CONSTANTS = ModContentLoader.get("GameConstants")

StoryUtil = {
    __important = true,
    PlayerAgnosticPlots = {
        Galactic = "Conquests\\Player_Agnostic_Plot.xml",
        Space = "Conquests\\Tactical_Raids.XML",
		Land = "Conquests\\GroundTactical\\Tactical_GroundBattles.XML"
    },
	-- Global Events
	ShowTextEventName = "Show_Screen_Text",
	ShowTextNotificationName = "SHOW_SCREEN_TEXT",

	GenericSpeechEventName = "Template_Generic_Speech",
	GenericSpeechNotificationName = "GENERIC_SPEECH",

	CinematicSpeechEventName = "Template_Cinematic_Speech",
	CinematicSpeechNotificationName = "CINEMATIC_SPEECH",

	MultimediaEventName = "Template_Multimedia",
	MultimediaNotificationName = "MULTIMEDIA",

    LockControlsEventName = "Lock_All_Controls",
	LockControlsNotificationName = "LOCK_ALL_CONTROLS",

    UnlockControlsEventName = "Unlock_All_Controls",
	UnlockControlsNotificationName = "UNLOCK_ALL_CONTROLS",

	GenericEventName = "Template_Generic_Event",
	GenericEventNotificationName = "GENERIC_EVENT",

	SetTechLevelEventName = "Template_Set_Tech_Level",
	SetTechLevelNotificationName = "SET_TECH_LEVEL",

	ChangeAIEventName = "Template_Switch_Control",
	ChangeAINotificationName = "SWITCH_CONTROL",

	PositionCameraEventName = "Template_Position_Camera",
	PositionCameraNotificationName = "POSITION_CAMERA",

	DeclareVictoryEventName = "Template_Victory_Event",
	DeclareVictoryNotificationName = "DECLARE_VICTORY",

	LinkTacticalEventName = "Template_Link_Tactical",
	LinkTacticalNotificationName = "LINK_TACTICAL",

	LoadCampaignEventName = "Template_Load_Campaign",
	LoadCampaignNotificationName = "CAMPAIGN_LOADING",

	NewAbilityEventName = "Template_New_Ability",
	NewPowerNotificationName = "NEW_ABILITY",

	RemoveAbilityEventName = "Template_Remove_Ability",
	RemoveAbilityNotificationName = "REMOVE_ABILITY",


	-- Galactic Events
	SetTacticalMapEventName = "Template_Set_Tactical_Map",
	SetTacticalMapNotificationName = "SET_TACTICAL_MAP",

	LockPlanetEventName = "Template_Lock_Planet",
	LockPlanetNotificationName = "SET_PLANET_RESTRICTED",

	RestrictAutoresolveEventName = "Template_Restrict_Autoresolve",
	RestrictAutoresolveNotificationName = "RESTRICT_AUTORESOLVE",

	EnableInvasionEventName = "Template_Enable_Invasion",
	EnableInvasionNotificationName = "ENABLE_INVASION",

	FlashPlanetEventName = "Template_Flash_Planet",
	FlashPlanetNotificationName = "FLASH_PLANET_GUI",

	GalacticGoalCompleteEventName = "Template_Goal_Complete",
	GalacticGoalCompleteNotificationName = "STORY_GOAL_COMPLETED",

	GalacticGoalRemoveEventName = "Template_Goal_Removed",
	GalacticGoalRemoveNotificationName = "REMOVE_STORY_GOAL",

	RevealPlanetEventName = "Template_Reveal_Planet",
	RevealPlanetNotificationName = "REVEAL_PLANET",


	-- Tactical Events
	AIActivationEventName = "Template_AI_Activation",
	AIActivationNotificationName = "AI_ACTIVATION",

	DisableRetreatEventName = "Template_Disable_Retreat",
	DisableRetreatNotificationName = "DISABLE_RETREAT",

	VictoryAllowanceEventName = "Template_Victory_Allowance",
	VictoryAllowanceNotificationName = "VICTORY_ALLOWANCE",

	ReinforcementHandlerEventName = "Template_Reinforcement_Handler",
	ReinforcementHandlerNotificationName = "DISABLE_REINFORCEMENTS",

	HideAutoresolveEventName = "Template_Hide_Autoresolve",
	HideAutoresolveNotificationName = "HIDE_AUTORESOLVE",

	ObjectiveCleanUpEventName = "Template_Objective_Clean_Up",
	ObjectiveCleanUpNotificationName = "OBJECTIVE_CLEAN_UP",

	ObjectiveCompleteEventName = "Template_Objective_Complete",
	ObjectiveCompleteNotificationName = "OBJECTIVE_COMPLETE",

	ObjectiveUpdateEventName = "Template_Objective_Update",
	ObjectiveUpdateNotificationName = "OBJECTIVE_UPDATE",

	ObjectiveFailedEventName = "Template_Objective_Failed",
	ObjectiveFailedNotificationName = "OBJECTIVE_FAILED",

	ObjectiveRemoveEventName = "Template_Objective_Remove",
	ObjectiveRemoveNotificationName = "REMOVE_OBJECTIVE",

	ObjectiveNewEventName = "Template_Objective_New",
	ObjectiveNewNotificationName = "ADD_OBJECTIVE",
}

-- Global Events
function StoryUtil.GetPlayerAgnosticPlot()
    local plotName = StoryUtil.PlayerAgnosticPlots[Get_Game_Mode()]
    return Get_Story_Plot(plotName)
end

function StoryUtil.ShowScreenText(textId, time, var, color, teletype)
    if type(textId) ~= "string" then
        return
    end

    local plot = StoryUtil.GetPlayerAgnosticPlot()

    if not plot then
        return
    end

    local screenTextEvent = plot.Get_Event(StoryUtil.ShowTextEventName)

    if not screenTextEvent then
        return
    end

    local colorString = ""
    if color then
        colorString = color.r .. " " .. color.g .. " " .. color.b
    end

    if not var then
        var = ""
    end

    local use_teletype = 1
    if teletype == false then
        use_teletype = 0
    end

    screenTextEvent.Set_Reward_Parameter(0, textId)
    screenTextEvent.Set_Reward_Parameter(1, tostring(time))
    screenTextEvent.Set_Reward_Parameter(2, var)
    screenTextEvent.Set_Reward_Parameter(3, "")
    screenTextEvent.Set_Reward_Parameter(4, use_teletype)
    screenTextEvent.Set_Reward_Parameter(5, colorString)
    Story_Event(StoryUtil.ShowTextNotificationName)
end

function StoryUtil.RemoveScreenText(textId)
    if type(textId) ~= "string" then
        return
    end

    local plot = StoryUtil.GetPlayerAgnosticPlot()

    if not plot then
        return
    end

    local screenTextEvent = plot.Get_Event(StoryUtil.ShowTextEventName)

    if not screenTextEvent then
        return
    end

    screenTextEvent.Set_Reward_Parameter(0, textId)
    screenTextEvent.Set_Reward_Parameter(3, "remove")
    Story_Event(StoryUtil.ShowTextNotificationName)
end

function StoryUtil.Multimedia(textId, time, speech_name, movie_name, int, faction, color)
    local plot = StoryUtil.GetPlayerAgnosticPlot()

    if not plot then
        return
    end

    if faction ~= nil then
        if Find_Player("local") ~= Find_Player(faction) then
            return
        end
    end

    local multimediaEvent = plot.Get_Event(StoryUtil.MultimediaEventName)

    if not multimediaEvent then
        return
    end

    local colorString = ""
    if color then
        colorString = color.r .. " " .. color.g .. " " .. color.b
    end

    if speech_name == nil then
        speech_name = ""
    end

    if movie_name == nil then
        movie_name = ""
    end
    
    multimediaEvent.Set_Reward_Parameter(0, textId)
    multimediaEvent.Set_Reward_Parameter(1, tostring(time))
    multimediaEvent.Set_Reward_Parameter(5, colorString)
    multimediaEvent.Set_Reward_Parameter(7, speech_name)
    multimediaEvent.Set_Reward_Parameter(8, movie_name)
    multimediaEvent.Set_Reward_Parameter(9, tostring(int))
    Story_Event(StoryUtil.MultimediaNotificationName)
end

function StoryUtil.LockAllControls()
    local plot = StoryUtil.GetPlayerAgnosticPlot()

    if not plot then
        return
    end

    local lockControlsEvent = plot.Get_Event(StoryUtil.LockControlsEventName)

    if not lockControlsEvent then
        return
    end

    Story_Event(StoryUtil.LockControlsNotificationName)
end

function StoryUtil.UnlockAllControls()
    local plot = StoryUtil.GetPlayerAgnosticPlot()

    if not plot then
        return
    end

    local unlockControlsEvent = plot.Get_Event(StoryUtil.UnlockControlsEventName)

    if not unlockControlsEvent then
        return
    end

    Story_Event(StoryUtil.UnlockControlsNotificationName)
end

function StoryUtil.GetGenericEvent()
    local plot = StoryUtil.GetPlayerAgnosticPlot()

    if not plot then
        return nil
    end

    return plot.Get_Event(StoryUtil.GenericEventName)
end

function StoryUtil.TriggerGenericEvent()
    Story_Event(StoryUtil.GenericEventNotificationName)
end

function StoryUtil.ResetGenericEvent()
    local plot = StoryUtil.GetPlayerAgnosticPlot()

    if not plot then
        return
    end

    local genericEvent = plot.Get_Event(StoryUtil.GenericEventName)

    if not genericEvent then
        return
    end

    genericEvent.Set_Reward_Type("")
    genericEvent.Set_Reward_Parameter(0, "")
    genericEvent.Set_Reward_Parameter(1, "")
    genericEvent.Set_Reward_Parameter(2, "")
    genericEvent.Set_Reward_Parameter(3, "")
    genericEvent.Set_Reward_Parameter(4, "")
    genericEvent.Set_Reward_Parameter(5, "")
    genericEvent.Set_Reward_Parameter(6, "")
    genericEvent.Set_Reward_Parameter(7, "")
    genericEvent.Set_Reward_Parameter(8, "")
    genericEvent.Set_Reward_Parameter(9, "")
    genericEvent.Set_Reward_Parameter(10, "")
    genericEvent.Set_Reward_Parameter(11, "")
    genericEvent.Set_Reward_Parameter(12, "")
end

function StoryUtil.SetTechLevel(player, level)
    local plot = StoryUtil.GetPlayerAgnosticPlot()

    local player_name = player.Get_Faction_Name()

    if not plot then
        return
    end

    local setTechLevelEvent = plot.Get_Event(StoryUtil.SetTechLevelEventName)

    if not setTechLevelEvent then
        return
    end

    if player_name == "Rebel" then
        level = level - 1
    end

    setTechLevelEvent.Set_Reward_Parameter(0, player_name)
    setTechLevelEvent.Set_Reward_Parameter(1, level)
    Story_Event(StoryUtil.SetTechLevelNotificationName)
end

function StoryUtil.ChangeAIPlayer(player, ai_type)
    local plot = StoryUtil.GetPlayerAgnosticPlot()

    local player_name = player

    if not plot then
        return
    end

    local aiChangeEvent = plot.Get_Event(StoryUtil.ChangeAIEventName)

    if not aiChangeEvent then
        return
    end

    aiChangeEvent.Set_Reward_Parameter(0, player_name)
    aiChangeEvent.Set_Reward_Parameter(1, ai_type)
    Story_Event(StoryUtil.ChangeAINotificationName)
end

function StoryUtil.DeclareVictory(player, play_victory_text)
    local plot = StoryUtil.GetPlayerAgnosticPlot()
    local player_name = nil
    if type(player) == "string" then
        player_name = player
    else
        player_name = player.Get_Faction_Name()
    end

    if not plot then
        return
    end

    local victoryEvent = plot.Get_Event(StoryUtil.DeclareVictoryEventName)

    if not victoryEvent then
        return
    end

    local use_victory_text = 0
    if play_victory_text == false then
        use_victory_text = 1
    end

	Resume_Mode_Based_Music()

    victoryEvent.Set_Reward_Parameter(0, player_name)
    victoryEvent.Set_Reward_Parameter(1, use_victory_text)
    Story_Event(StoryUtil.DeclareVictoryNotificationName)
end

function StoryUtil.TriggerScriptedBattle(missionId, planet, layer, attacker, defender, is_sandbox, faction_tag, unique_tag)
    local plot = StoryUtil.GetPlayerAgnosticPlot()

    local linkTacticalEvent = plot.Get_Event(StoryUtil.LinkTacticalEventName)

    if not linkTacticalEvent then
        return
    end

	if is_sandbox then
		is_sandbox = 1
	elseif not is_sandbox then
		is_sandbox = 0
	end

	map_name = "_FOTG_"..layer.."_"..missionId..".TED"

	if faction_tag ~= nil then
		map_name = "_FOTG_"..layer.."_"..missionId.."_"..faction_tag..".TED"
	end

	if unique_tag ~= nil then
		map_name = "_FOTG_"..layer.."_"..unique_tag.."_"..missionId..".TED"
	end

	battle_plot = "StoryEvents/Plot_"..missionId..".XML"

    linkTacticalEvent.Set_Reward_Parameter(0, planet)
    linkTacticalEvent.Set_Reward_Parameter(1, layer)
    linkTacticalEvent.Set_Reward_Parameter(2, attacker)
    linkTacticalEvent.Set_Reward_Parameter(3, map_name)
    linkTacticalEvent.Set_Reward_Parameter(4, defender)
    linkTacticalEvent.Set_Reward_Parameter(6, battle_plot)
    linkTacticalEvent.Set_Reward_Parameter(7, is_sandbox)
    linkTacticalEvent.Set_Reward_Parameter(8, 0)
    linkTacticalEvent.Set_Reward_Parameter(9, 1)
    linkTacticalEvent.Set_Reward_Parameter(10, 1)
    linkTacticalEvent.Set_Reward_Parameter(11, "RETREAT_PLAYER")
    linkTacticalEvent.Set_Reward_Parameter(12, 0)
    linkTacticalEvent.Set_Reward_Parameter(13, 1)
    Story_Event(StoryUtil.LinkTacticalNotificationName)
end

function StoryUtil.LoadCampaign(campaign, player_index)
    local plot = StoryUtil.GetPlayerAgnosticPlot()

    if not plot then
        return
    end

    local loadCampaignEvent = plot.Get_Event(StoryUtil.LoadCampaignEventName)

    if not loadCampaignEvent then
        return
    end

    loadCampaignEvent.Set_Reward_Parameter(0, campaign)
    loadCampaignEvent.Set_Reward_Parameter(1, player_index)
    Story_Event(StoryUtil.LoadCampaignNotificationName)
end

function StoryUtil.ValidGlobalValue(val)
    return val and val ~= ""
end

function StoryUtil.GetDifficulty()
	local ai_player = nil
	local difficulty = nil

	if Find_Player("Rebel").Is_Human() then
		ai_player = Find_Player("Empire")
	end
	if Find_Player("Empire").Is_Human() then
		ai_player = Find_Player("Rebel")
	end

	if ai_player.Get_Difficulty() == "Easy" then
		difficulty = "EASY"
	elseif ai_player.Get_Difficulty() == "Hard" then
		difficulty = "HARD"
	else
		difficulty = "NORMAL"
	end	

	return difficulty
end


-- Galactic Events
function StoryUtil.CheckFriendlyPlanet(planet, player, count_neutral_as_friendly)
	if EvaluatePerception("Enemy_Present", player, planet) > 0 then
		return false
	end

	local owner = planet.Get_Owner()

	if owner == player then
		return true
	end

	if count_neutral_as_friendly then
		if owner == Find_Player("Neutral") then
			return true
		end
	end
	
	return false
end

function StoryUtil.SetPlanetRestricted(planet, status)
    local plot = StoryUtil.GetPlayerAgnosticPlot()

    if not plot then
        return
    end

    local lockPlanetEvent = plot.Get_Event(StoryUtil.LockPlanetEventName)

    if not lockPlanetEvent then
        return
    end

    crossplot:publish("LOCK_PLANET", planet, status)

    lockPlanetEvent.Set_Reward_Parameter(0, planet)
    lockPlanetEvent.Set_Reward_Parameter(1, status)
    Story_Event(StoryUtil.LockPlanetNotificationName)
end

function StoryUtil.FindFriendlyPlanet(player, preferCapital)
    if type(player) == "string" then
        player = Find_Player(player)
    end

    local playerFactionName = player.Get_Faction_Name()

    local allPlanets = FindPlanet.Get_All_Planets()

    local random = 0
    local planet = nil

    local factionCapitalStructure = nil
    local factionCapitalInstance = nil
    local factionCapitalLocation = nil

	if preferCapital then	
		if CONSTANTS.ALL_FACTIONS_CAPITALS[playerFactionName] then
			factionCapitalStructure = CONSTANTS.ALL_FACTIONS_CAPITALS[playerFactionName].STRUCTURE
			if factionCapitalStructure then
				factionCapitalInstance = Find_First_Object(factionCapitalStructure)
				if factionCapitalInstance then
					factionCapitalLocation = factionCapitalInstance.Get_Planet_Location()
					if factionCapitalLocation then
						if factionCapitalLocation.Get_Owner() == player and EvaluatePerception("Enemy_Present", player, factionCapitalLocation) == 0 then
							return factionCapitalLocation
						end
					end
				end
			end
		end    	
	end

    while table.getn(allPlanets) > 0 do
        random = GameRandom.Free_Random(1, table.getn(allPlanets))
        planet = allPlanets[random]
        table.remove(allPlanets, random)

        if StoryUtil.CheckFriendlyPlanet(planet, player) then
            return planet
        end
    end

    return nil
end

function StoryUtil.FindEnemyPlanet(player)
    if type(player) == "string" then
        player = Find_Player(player)
    end

    local allPlanets = FindPlanet.Get_All_Planets()

    local random = 0
    local planet = nil

    while table.getn(allPlanets) > 0 do
        random = GameRandom.Free_Random(1, table.getn(allPlanets))
        planet = allPlanets[random]
        table.remove(allPlanets, random)

        if EvaluatePerception("Is_Owned_By_Enemy", player, planet) == 1 then
            if EvaluatePerception("Enemy_Present", planet.Get_Owner(), planet) == 0 then
                return planet
            end        
        end
    end

    return nil
end

function StoryUtil.FindTargetPlanet(player, must_be_connected_to_player, allow_fortress_worlds, amount, active_enemy_only)
    if amount == 0 then
        return nil
    end

    if active_enemy_only == true then
        enemy_perception = "Is_Owned_By_Active_Enemy"
    else
        enemy_perception = "Is_Owned_By_Enemy"
    end

    if type(player) == "string" then
        player = Find_Player(player)
    end

    local target_planet_list = {}
    local allPlanets = FindPlanet.Get_All_Planets()

    for _,planet in pairs(allPlanets) do
        local planet_owner = planet.Get_Owner()
        if planet_owner ~= Find_Player("Neutral") then
            local owner_check = EvaluatePerception(enemy_perception, player, planet)
            local priority_check = EvaluatePerception("Priority_Target", player, planet)
            local not_blockaded_check = EvaluatePerception("Starbase_Present", player, planet)
    
            if not_blockaded_check == 0 and EvaluatePerception("Enemy_Present", planet_owner, planet) == 0 then 
                not_blockaded_check = 1
            end

            if owner_check == 1 and priority_check == 0 and not_blockaded_check == 1 then
                if must_be_connected_to_player ~= true or EvaluatePerception("Is_Connected_To_Me", player, planet) == 1 then
                    if allow_fortress_worlds == true or EvaluatePerception("Is_Important_Planet", player, planet) == 0 then
                        table.insert(target_planet_list, planet)
                    end
                end
            end
        end
    end

    if table.getn(target_planet_list) == 0 then
        for _,planet in pairs(allPlanets) do
            local planet_owner = planet.Get_Owner()
            if planet_owner ~= Find_Player("Neutral") then
                local owner_check = EvaluatePerception(enemy_perception, player, planet)
                local priority_check = EvaluatePerception("Priority_Target", player, planet)
                local not_blockaded_check = EvaluatePerception("Starbase_Present", planet_owner, planet)
                
                if not_blockaded_check == 0 and EvaluatePerception("Enemy_Present", planet_owner, planet) == 0 then 
                    not_blockaded_check = 1
                end
            
                if owner_check == 1 and priority_check == 0 and not_blockaded_check == 1 then
                    table.insert(target_planet_list, planet)
                end
            end
        end
    end

    local planet_count = table.getn(target_planet_list)

    if planet_count == 0 then
        return nil
    end

    if amount > planet_count then
        amount = planet_count
    end

    if amount > 5 then
        amount = 5
    end

    local random = 0
    local new_target = nil
    local target01 = nil
    local target02 = nil
    local target03 = nil
    local target04 = nil
    local target05 = nil

    repeat
        random = GameRandom.Free_Random(1, planet_count)
        new_target = target_planet_list[random]
        table.remove(target_planet_list, random)
        
        if target01 == nil then
            target01 = new_target
        elseif target02 == nil then
            target02 = new_target
        elseif target03 == nil then
            target03 = new_target
        elseif target04 == nil then
            target04 = new_target
        else
            target05 = new_target
        end
        
        planet_count = planet_count - 1
        amount = amount - 1
    until amount == 0
    
    if target05 ~= nil then
        return target01,target02,target03,target04,target05
    elseif target04 ~= nil then 
        return target01,target02,target03,target04
    elseif target03 ~= nil then 
        return target01,target02,target03
    elseif target02 ~= nil then 
        return target01,target02
    else
        return target01
    end
end

function StoryUtil.SpawnAtSafePlanet(planet_name, player, spawn_location_table, spawn_list, ai_use_set, allow_neutral)
    local player_string = player
    if type(player) == "string" then
        player = Find_Player(player)
    end

    player_string = player.Get_Faction_Name()

    if spawn_location_table[planet_name] then
        local start_planet = FindPlanet(planet_name)

        if allow_neutral == nil then
            allow_neutral = true
        end

        if not StoryUtil.CheckFriendlyPlanet(start_planet, player, allow_neutral) then
            if player == Find_Player("Warlords") or player == Find_Player("Independent_Forces") then
                return nil
            else
                start_planet = StoryUtil.FindFriendlyPlanet(player, true)
            end
        end

        local ai_use = true
        if ai_use_set == false then
            ai_use = false
        end

        if start_planet then
            SpawnList(spawn_list, start_planet, player, ai_use, false)
            return start_planet
        else
            DebugMessage(
                "%s -- No spawn planet could be found as alternative for %s!",
                tostring(Script),
                tostring(planet_name)
            )
            return nil
        end
    else
        local start_planet = StoryUtil.FindFriendlyPlanet(player, true)
        
        local ai_use = true
        if ai_use_set == false then
            ai_use = false
        end

        if start_planet then
            SpawnList(spawn_list, start_planet, player, ai_use, false)
            return start_planet
        else
            DebugMessage(
                "%s -- No spawn planet could be found as alternative for %s!",
                tostring(Script),
                tostring(planet_name)
            )
            return nil
        end
    end
end

function StoryUtil.GetSafePlanetTable()
    local Active_Planets = {}
    local all_planets = FindPlanet.Get_All_Planets()

    for _, planet in pairs(all_planets) do
        local name = planet.Get_Type().Get_Name()
        Active_Planets[name] = true
    end

    return Active_Planets
end

function StoryUtil.RevealPlanet(planet, status)
    local plot = StoryUtil.GetPlayerAgnosticPlot()

    if not plot then
        return
    end

    local revealPlanetEvent = plot.Get_Event(StoryUtil.RevealPlanetEventName)

    if not revealPlanetEvent then
        return
    end

	status_index = 1
	if status == false then
		status_index = 0
	end

    revealPlanetEvent.Set_Reward_Parameter(0, planet)
    revealPlanetEvent.Set_Reward_Parameter(1, status_index)
    Story_Event(StoryUtil.RevealPlanetNotificationName)
end


function StoryUtil.SetTacticalMap(map_name, layer, map_owner)
    local plot = StoryUtil.GetPlayerAgnosticPlot()

    if not plot then
        return
    end

    local setTacticalMapEvent = plot.Get_Event(StoryUtil.SetTacticalMapEventName)

    if not setTacticalMapEvent then
        return
    end

	local map_owner_name = map_owner.Get_Faction_Name()

    setTacticalMapEvent.Set_Reward_Parameter(0, map_name)
    setTacticalMapEvent.Set_Reward_Parameter(1, layer)
    setTacticalMapEvent.Set_Reward_Parameter(1, map_owner_name)
    Story_Event(StoryUtil.SetTacticalMapNotificationName)
end

return StoryUtil

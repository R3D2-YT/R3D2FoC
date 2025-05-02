require("PGStoryMode")
require("deepcore/crossplot/crossplot")
require("deepcore/std/class")
require("eawx-util/PopulatePlanetUtilities")
require("UnitSpawnerTables")
StoryUtil = require("eawx-util/StoryUtil")

function Definitions()

    DebugMessage("%s -- In Definitions", tostring(Script))
    StoryModeEvents = {
		Universal_Story_Start = Spawn_Starting_Forces,
		Rancor_Base_Check = Delete_Old
	}
	
end		

function Spawn_Starting_Forces(message)
    if message == OnEnter then
		
--		dead_planet = FindPlanet("Despayre")
--		if dead_planet ~= nil then
--			Destroy_Planet("Despayre")
--		end
	
		p_newrep = Find_Player("Rebel")
		p_empire = Find_Player("Empire")
		p_rep = Find_Player("Republic")
		p_cis = Find_Player("Confederacy")
		p_mando = Find_Player("Mandalorians")
		p_player = Find_Player("Player")
		

		if p_newrep.Is_Human() then
			Story_Event("ENABLE_BRANCH_NEWREP_FLAG")
		elseif p_empire.Is_Human() then
			Story_Event("ENABLE_BRANCH_EMPIRE_FLAG")
		elseif p_rep.Is_Human() then
			Story_Event("ENABLE_BRANCH_REP_FLAG")
		elseif p_cis.Is_Human() then
			Story_Event("ENABLE_BRANCH_CIS_FLAG")
		elseif p_mando.Is_Human() then
			Story_Event("ENABLE_BRANCH_MANDO_FLAG")
		elseif p_player.Is_Human() then
			Story_Event("ENABLE_BRANCH_PLAYER_FLAG")
		end
	

		--Randomly spawn units at all planets owned by neutral or hostile
		--Probably want some screen text to tell the player the game is loading still
		local p_independent = Find_Player("Player")
		local p_neutral = Find_Player("Neutral")
		local planet = nil
		local scaled_combat_power = 7500
		
		for _, planet in pairs(FindPlanet.Get_All_Planets()) do	
			if planet.Get_Owner() == (p_neutral or p_independent) then	
				scaled_combat_power = 7500 * EvaluatePerception("GenericPlanetValue", p_independent, planet) * (1.5 - EvaluatePerception("Is_Connected_To_Player", p_independent, planet))
				ChangePlanetOwnerAndPopulate(planet, p_independent, scaled_combat_power, "RANDOM", true)
			end
		end
	end
end

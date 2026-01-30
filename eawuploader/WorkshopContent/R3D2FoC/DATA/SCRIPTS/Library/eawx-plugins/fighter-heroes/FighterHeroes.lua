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
--*       File:              FighterHeroes.lua                                                     *
--*       File Created:      Monday, 24th February 2020 02:19                                      *
--*       Author:            [TR] Jorritkarwehr                                                    *
--*       Last Modified:     Friday, 9th April 2023 21:16                                          *
--*       Modified By:       [TR] Jorritkarwehr                                                    *
--*       Copyright:         Thrawns Revenge Development Team                                      *
--*       License:           This code may not be used without the author's explicit permission    *
--**************************************************************************************************

require("deepcore/std/class")
require("SetFighterResearch")
StoryUtil = require("eawx-util/StoryUtil")
require("eawx-events/GenericPopup")

FighterHeroes = class()

function FighterHeroes:new(gc)
    --galactic_conquest class
    gc.Events.GalacticProductionFinished:attach_listener(self.on_production_finished, self)
	local heroes = Get_Hero_Entries()
	for index, entry in pairs(heroes) do
		local Ok_to_init = true
		if entry.NoPlayerInit ~= nil and entry.Faction ~= nil then
			if Find_Player(entry.Faction) == Find_Player("local") then
				Ok_to_init = false
			end
		end
		if entry.NoInit == nil and Ok_to_init then
			Set_Fighter_Hero(entry.Hero_Squadron, entry.Options[1].Locations[1])
		end
	end
	
	crossplot:subscribe("FIGHTER_SELECTED_OPTION", self.FighterPick, self)
end

function FighterHeroes:on_production_finished(planet, object_type_name)
    --Logger:trace("entering FighterHeroes:on_production_finished")
	
    local hero_entry = Get_Hero_Entries(object_type_name)
	
	if hero_entry ~= nil then
		local Object = Find_First_Object(object_type_name)
		
		local options = {}
		local no_options = true
		
		for option, alternates in pairs(hero_entry.Options) do
			for index, obj in pairs(alternates.Locations) do
				checkObject = Find_First_Object(obj)
				if TestValid(checkObject) then
					if checkObject.Get_Owner() == Object.Get_Owner() then
						table.insert(options,alternates[1])
						no_options = false
					end
				end
			end
		end
		
		if no_options then
			local host = Get_Fighter_Hero(hero_entry.Hero_Squadron)
			if host == nil then
				StoryUtil.ShowScreenText("No assignment options available.", 5, nil, {r = 244, g = 0, b = 0})
			else
				StoryUtil.ShowScreenText("No assignment options found available. Currently assigned to %s.", 5, host, {r = 244, g = 0, b = 0})
			end
		else
			table.insert(options,"CANCEL")
		
			GenericPopup(StoryUtil.GetSafePlanetTable(),
					"FIGHTER_SELECTOR", options, { },
					{ }, { },
					{ }, { },
					{ }, { },
					"FIGHTER_SELECTED_OPTION", object_type_name, hero_entry.PopupHeader
					)
		end
		Object.Despawn()
	end
end

function FighterHeroes:FighterPick(choice, library)
	local hero_entry = Get_Hero_Entries(library)
	
	local tag = string.gsub(choice, "FIGHTER_SELECTOR_", "")
	
	if hero_entry ~= nil then
		if tag == "CANCEL" then
			local host = Get_Fighter_Hero(hero_entry.Hero_Squadron)
			if host == nil then
				StoryUtil.ShowScreenText("Not currently assigned.", 5)
			else
				StoryUtil.ShowScreenText("Currently assigned to %s.", 5, host)
			end
		else
			for option, alternates in pairs(hero_entry.Options) do
				if alternates[1] == tag then
					for index, obj in pairs(alternates.Locations) do
						checkObject = Find_First_Object(obj)
						if TestValid(checkObject) then
							Set_Fighter_Hero(hero_entry.Hero_Squadron,obj)
							StoryUtil.ShowScreenText("Assigned to %s", 5, obj)
						end
					end
				end
			end
		end
	end

end
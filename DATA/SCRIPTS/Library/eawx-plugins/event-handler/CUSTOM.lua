require("deepcore/std/class")
require("eawx-events/GenericResearch")
require("eawx-events/GenericSwap")
require("eawx-events/GenericConquer")
require("eawx-events/GenericPopup")
StoryUtil = require("eawx-util/StoryUtil")


---@class EventManager
EventManager = class()

function EventManager:new(galactic_conquest, human_player, planets)
    self.galactic_conquest = galactic_conquest
    self.human_player = human_player
    self.planets = planets
    self.starting_era = nil


	self.LocationPick = false
	
	self.LocationType = ""
	self.RosterType = ""
	self.EnemyType = ""
	self.StartType = ""
	
	crossplot:subscribe("START_LOCATION_PICK", self.RosterPick, self)
	crossplot:subscribe("ROSTER_PICK", self.SFPick, self)
	crossplot:subscribe("STARTING_SIZE_PICK", self.PlanetModifierPick, self)
end

function EventManager:update()
    
	self.current_time = GetCurrentTime()
	if (self.current_time >= 12) and (self.LocationPick == false) then
		self.LocationPick = true
		GenericPopup(StoryUtil.GetSafePlanetTable(),
					"CUSTOM_GC", {"PICK_LOCATION", "PICK_ENEMY_LOCATION", "PICK_EVERYWHERE"}, { },
					{ }, { },
					{ }, { },
					{ }, { },
					"START_LOCATION_PICK"
					)
	end

end

function EventManager:RosterPick(choice)
	self.LocationType = choice
	if choice ~= "CUSTOM_GC_FIXED_LOCATION" then
		GenericPopup(StoryUtil.GetSafePlanetTable(),
					"CUSTOM_GC", {"STANDARD_ROSTER", "CUSTOM_ROSTER_ENABLE", "CUSTOM_ROSTER"}, { },
					{ }, { },
					{ }, { },
					{ }, { },
					"ROSTER_PICK"
					)
	end
end

function EventManager:SFPick(choice)	
	self.RosterType = choice
	GenericPopup(StoryUtil.GetSafePlanetTable(),
					"CUSTOM_GC", {"FTGU", "SMALL_START", "FULL_START"}, { },
					{ }, { },
					{ }, { },
					{ }, { },
					"STARTING_SIZE_PICK"
					)
end

function EventManager:PlanetModifierPick(choice)
	if choice ~= "CUSTOM_GC_FTGU" and self.LocationType ~= "CUSTOM_GC_PICK_EVERYWHERE" then
		GenericPopup(StoryUtil.GetSafePlanetTable(),
					"CUSTOM_GC", {"EQUAL", "PLAYER_EXTRA", "PLAYER_HALF", "PLAYER_FTGU_EXTREME"}, { },
					{ }, { },
					{ }, { },
					{ }, { },
					"PLANET_MODIFIER_PICK"
					)
	end
end

return EventManager

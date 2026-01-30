require("deepcore/std/class")
require("eawx-events/GenericResearch")
require("eawx-events/GenericSwap")
require("eawx-events/GenericConquer")
require("eawx-events/GenericPopup")
require("eawx-events/FelChildren")
require("eawx-events/TerrikUpgrade")
require("eawx-events/PentastarTalks")
StoryUtil = require("eawx-util/StoryUtil")


---@class EventManager
EventManager = class()

function EventManager:new(galactic_conquest, human_player, planets)
    self.galactic_conquest = galactic_conquest
    self.human_player = human_player
    self.planets = planets
    self.starting_era = nil

    self.KashyyykConquer = GenericConquer(self.galactic_conquest,
        "CONQUER_KASHYYYK",
        "KASHYYYK", {"Greater_Maldrood"},
        {"Syn_Silooth"}, false, "Syn_Loop")

    self.CentaresConquer = GenericConquer(self.galactic_conquest,
        "CONQUER_CENTARES",
        "CENTARES", {"Zsinj_Empire"},
        {"Selit_Team"}, false)
		
	self.MandaloreConquerEmpire = GenericConquer(self.galactic_conquest,
        "CONQUER_MANDALORE_EMPIRE",
        "MANDALORE", {"Empire", "Greater_Maldrood", "Eriadu_Authority", "Pentastar", "Zsinj_Empire"},
        {"Lorka_Gedyc_Team"}, false, "Boba_Fett_Loop")
		
	self.MandaloreConquerNR = GenericConquer(self.galactic_conquest,
        "CONQUER_MANDALORE_NR",
        "MANDALORE", {"Rebel"},
        {"Fenn_Shysa_Team"}, false, "Boba_Fett_Loop")

    self.NzothConquer = GenericConquer(self.galactic_conquest,
        "CONQUER_NZOTH",
        "NZOTH", {},
        {"EX_F"}, false)

    self.FelChildren = FelChildren(self.galactic_conquest)

    self.VentureUpgrade = VentureUpgrade(self.galactic_conquest)

    self.PentastarTalks = PentastarTalks(self.galactic_conquest)
    self.PentastarTalksFulfilled = false
    -- self.RedBaronFired = false
end

function EventManager:update()
    
    self.current_time = GetCurrentTime()
    if (self.current_time >= 5) and (self.starting_era == nil) then   
        self.starting_era = GlobalValue.Get("CURRENT_ERA")  
    elseif (self.current_time >= 80) and (self.PentastarTalksFulfilled == false) then
        if self.starting_era == 1 then      
            self.PentastarTalks:fulfill()
            self.PentastarTalksFulfilled = true
        end
	-- elseif (self.current_time >= 2) and (self.RedBaronFired == false) then
		-- -- GC, planets
		-- -- Tag, Options, Planets
		-- -- Player_List_Input, Spawn_List_Input,
		-- --	Show_Holocron_List_Input, Movie_Name_List_Input,
		-- --	Unlock_List_Input, Lock_List_Input,
		-- --	Event_Enabled_List_Input, Tactical_Upgrades_List_Input,
		-- --	Xml_Events_List_Input
		-- self.Active_Planets = StoryUtil.GetSafePlanetTable()
		-- self.RedBaron = GenericPopup(self.galactic_conquest, self.Active_Planets,
			-- "THE_RED_BARON", {"EXECUTE", "EXILE", "INDOCTRINATE"}, {"CORUSCANT", "ANAXES", "CARIDA"},
			-- {"EMPIRE", "EMPIRE", "EMPIRE"}, {{"Pestage_Team"},{"Ysanne_Isard_Team"},{"Thrawn_Chimaera"}},
			-- Show_Holocron_List_Input, Movie_Name_List_Input,
			-- Unlock_List_Input, Lock_List_Input,
			-- Event_Enabled_List_Input, Tactical_Upgrades_List_Input,
			-- Xml_Events_List_Input)
		-- self.RedBaronFired = true
    end

end

return EventManager

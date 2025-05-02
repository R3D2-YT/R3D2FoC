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
--*       File:              BoardingListener.lua                                                  *
--*       File Created:      Monday, 2nd March 2020 13:51                                          *
--*       Author:            [TR] Corey                                                            *
--*       Last Modified:     Tuesday, 5th May 2020 01:41                                           *
--*       Modified By:       [TR] Corey                                                            *
--*       Copyright:         Thrawns Revenge Development Team                                      *
--*       License:           This code may not be used without the author's explicit permission    *
--**************************************************************************************************

require("deepcore/std/class")
require("eawx-util/GalacticUtil")
StoryUtil = require("eawx-util/StoryUtil")

---@class VictoryHandler
VictoryHandler = class()

function VictoryHandler:new(gc)
    self.player = Find_Player("local")
    self.player_name = self.player.Get_Faction_Name()

    local Active_Planets = StoryUtil.GetSafePlanetTable()
    self.Shipyard_Planets = {}

    for planet, active in pairs(Active_Planets) do
        if active == true then
            if EvaluatePerception("Max_Shipyard_Level", self.player, FindPlanet(planet)) >= 3 then
                table.insert(self.Shipyard_Planets, planet)
            end
        end
    end

    gc.Events.PlanetOwnerChanged:attach_listener(self.on_planet_owner_changed, self)
    gc.Events.GalacticProductionFinished:attach_listener(self.on_production_finished, self)

    self.victory_handler_shipyards_available = Observable()
end

function VictoryHandler:on_planet_owner_changed(planet, new_owner_name, old_owner_name)
    --Logger:trace("entering VictoryHandler:on_planet_owner_changed")
    if new_owner_name == self.player_name then
        local unowned_shipyards = 0
		
        --this is a kludge until we set up a locked planet handler ~Mord
        local current_era = GlobalValue.Get("CURRENT_ERA")
        for _, planet_name in pairs(self.Shipyard_Planets) do
            if current_era < 4 and planet_name == "BYSS" then
            elseif current_era < 6 and planet_name == "THE_MAW" then 
            elseif current_era < 7 and planet_name == "NZOTH" then 
            elseif FindPlanet(planet_name).Get_Owner() == self.player then
            else
                unowned_shipyards = unowned_shipyards + 1	
            end
        end
        if unowned_shipyards == 0 then
            self.victory_handler_shipyards_available:notify(self.player_name)

            UnitUtil.SetLockList(self.player_name, {
                "Shipyard_Victory_Object"
            })
        end
    end
end

function VictoryHandler:on_production_finished(planet, game_object_type_name)
    DebugMessage("In VictoryHandler:on_production_finished")
    if game_object_type_name ~= "SHIPYARD_VICTORY_OBJECT" then
        return
    end
    --Logger:trace("entering VictoryHandler:on_production_finished")

    StoryUtil.DeclareVictory(self.player, true)
end

return VictoryHandler

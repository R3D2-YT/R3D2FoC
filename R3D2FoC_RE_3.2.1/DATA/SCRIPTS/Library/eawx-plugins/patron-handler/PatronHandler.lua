require("deepcore/std/class")
require("eawx-util/StoryUtil")
CONSTANTS = ModContentLoader.get("GameConstants")
require("deepcore/crossplot/crossplot")

PatronHandler = class()

function PatronHandler:new(galactic_conquest, human_player)
    self.galactic_conquest = galactic_conquest
    self.human_player = human_player

    self.galactic_conquest = galactic_conquest
    self.patron_playthrough = false
    self.initial_swaps = false

    if self.patron_playthrough == true then
        self.patron_list = require("PatronList")
        GlobalValue.Set("PATRON_PLAYTHROUGH", true)
        
        galactic_conquest.Events.GalacticProductionFinished:attach_listener(self.on_construction_finished, self)
        galactic_conquest.Events.GalacticProductionStarted:attach_listener(self.on_production_queued, self)

        crossplot:subscribe("PATRON_KILLED", self.patron_killed, self)
        crossplot:subscribe("UPDATE_GOVERNMENT", self.patron_swaps, self)
    end
end

function PatronHandler:update()
    --Logger:trace("entering PatronHandler:update")
    if self.patron_playthrough == true then
        for unit, data in pairs(self.patron_list) do
            if data.existing == false then
                if TestValid(Find_Object_Type(unit)) then
                    self.patron_list[unit].existing = true
                end
            end
        end
    end
end

function PatronHandler:on_production_queued(planet, game_object_type_name)
    --Logger:trace("entering PatronHandler:on_construction_finished")
    if planet:get_owner() == self.human_player then
        local number = 0
        for unit, data in pairs(self.patron_list) do
            if data.unit_name == game_object_type_name and data.deaths < 3 and data.alive == false and data.existing == true then
                number = number + 1
            end
        end
        if number > 0 then
        StoryUtil.ShowScreenText("Patrons in category:"..tostring(number), 10)
        end
    end
end

function PatronHandler:on_construction_finished(planet, game_object_type_name)
    --Logger:trace("entering PatronHandler:on_construction_finished")
    if planet:get_owner() == self.human_player then
        local planet_object = planet:get_game_object()
        for unit, data in pairs(self.patron_list) do
            if data.unit_name == game_object_type_name and data.deaths < 3 and data.alive == false and data.existing == true then
                local unit_to_replace = nil
                local allUnitInstances = Find_All_Objects_Of_Type(self.human_player, game_object_type_name) or {}
                for i, unitInstance in pairs(allUnitInstances) do
                    if TestValid(unitInstance) then
                        local unitPlanet = unitInstance.Get_Planet_Location()
                        if unitPlanet == planet_object then
                            unit_to_replace = unitInstance
                            break
                        end
                    end
                end
                if unit_to_replace ~= nil then
                    UnitUtil.ReplaceAtLocation(unit_to_replace, unit)
                    self.patron_list[unit].alive = true
                    StoryUtil.ShowScreenText("TEXT_COREY_PATRON_SWAP", 10, Find_Object_Type(unit))
                    break
                end
            end
        end
    end

end

function PatronHandler:patron_killed(object_name, owner_name)
    --Logger:trace("entering PatronHandler:on_construction_finished")
    if self.patron_list[object_name] then
        self.patron_list[object_name].alive = false
        self.patron_list[object_name].deaths = self.patron_list[object_name].deaths + 1
    end
end

return PatronHandler